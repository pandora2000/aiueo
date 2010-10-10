
open Printf
open Asm

let data = ref [] (* 浮動小数点数の定数テーブル (caml2html: virtual_data) *)

(*intとfloatに分類*)
let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
       match t with
	 | Type.Unit -> acc
	 | Type.Float -> addf acc x
	 | _ -> addi acc x t)
    ini
    xts
    
let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))
    
(*classifyしてアドレスとのタプルをつくってる*)
(*ini : int * *)
let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
       (offset + 1, addf x offset acc))
    (fun (offset, acc) x t ->
       (offset + 1, addi x t offset acc))

exception NoExtArray of string
exception NoExtTuple of string

exception Exit3

let rec g al env = function (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
  | Closure.Unit -> Ans(Nop)
      (*TODO:即値のサイズ計算*)
  | Closure.Int(i) -> Ans(Addi(zreg, i))
  | Closure.Float(d) ->
      let l =
	try
	  (* すでに定数テーブルにあったら再利用 *)
	  let (l, _) = List.find (fun (_, d') -> d = d') !data in
	    l
	with Not_found ->
	  let l = Id.L(Id.genid2 "fd") in
	    data := (l, d) :: !data;
	    l in
	(match l with Id.L x ->
	   (*ここはハードウェアと相談*)
	   (*メモリにあらかじめ入れておくことに*)
	   Ans(Fload(x, 0)))
	  (*Let((x, Type.Int), SetL(l), Ans(LdDF(x, C(0))))*)
  | Closure.Neg(x) -> Ans(Sub(zreg, x))
  | Closure.Add(x, y) -> Ans(Add(x, y))
  | Closure.Sub(x, y) -> Ans(Sub(x, y))
  | Closure.Mul(x, y) -> Ans(Mul(x, y))
  | Closure.FNeg(x) -> Ans(Fsub(fzreg, x))
  | Closure.FAdd(x, y) -> Ans(Fadd(x, y))
  | Closure.FSub(x, y) -> Ans(Fsub(x, y))
  | Closure.FMul(x, y) -> Ans(Fmul(x, y))
  | Closure.FDiv(x, y) -> Ans(Fdiv(x, y))
  | Closure.IfEq(x, y, e1, e2) ->
      (match M.find x env with
	 | Type.Bool | Type.Int -> Ans(IfEq(x, y, g al env e1, g al env e2))
	 | Type.Float -> Ans(IfFEq(x, y, g al env e1, g al env e2))
	 | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLE(x, y, e1, e2) ->
      (match M.find x env with
	 | Type.Bool | Type.Int -> Ans(IfLE(x, y, g al env e1, g al env e2))
	 | Type.Float -> Ans(IfFLE(x, y, g al env e1, g al env e2))
	 | _ -> failwith "inequality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
      let e1' = g al env e1 in
      let e2' = g al (M.add x t1 env) e2 in
	concat e1' (x, t1) e2'
  | Closure.Var(x) ->
      (match M.find x env with
	 | Type.Unit -> Ans(Nop)
	 | Type.Float -> Ans(Fadd(fzreg, x))
	 | _ -> Ans(Add(zreg, x)))
	(*ここは実際作られない本当？TODO:*)
	(*
	  | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_fv = ys }, e2) -> (* クロージャの生成 (caml2html: virtual_makecls) *)
	(* Closureのアドレスをセットしてから、自由変数の値をストア *)
	  let e2' = g (M.add x t env) e2 in
	  let offset, store_fv =
	  expand
	  (List.map (fun y -> (y, M.find y env)) ys)
	  (4, e2')
	  (fun y offset store_fv -> seq(StDF(y, x, C(offset)), store_fv))
	  (fun y _ offset store_fv -> seq(St(y, x, C(offset)), store_fv)) in
	  Let((x, t), Mov(reg_hp),
	  Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
	  let z = Id.genid "l" in
	  Let((z, Type.Int), SetL(l),
	  seq(St(z, x, C(0)),
	  store_fv))))
	  | Closure.AppCls(x, ys) ->
	  let (int, float) = separate (List.map (fun y -> (y, M.find y env)) ys) in
	  Ans(CallCls(x, int, float))
	*)
  | Closure.MakeCls _ | Closure.AppCls _ -> raise Exit3
  | Closure.AppDir(Id.L(x), ys) ->
      (*引数をint listとfloat listに分けてるだけ*)
      let (int, float) = separate (List.map (fun y -> (y, M.find y env)) ys) in
	Ans(CallDir(Id.L(x), int, float))
	  (*ここまで*)
	  (*tupleの方針:K正規化後の段階でタプルを全部平坦にして、その後関数適用における
	    タプルも全部展開する*)
	  
  | Closure.Tuple(xs) -> (* 組の生成 (caml2html: virtual_tuple) *)
      let y = Id.genid "tpl" in
      let (offset, store) =
	expand
	  (List.map (fun x -> (x, M.find x env)) xs)
	  (0, Ans(Add(zreg, y)))
	  (fun x offset store -> seq(Fstore(x, y, offset), store))
	  (fun x _ offset store -> seq(Store(x, y, offset), store)) in
	Let((y, Type.Tuple(List.map (fun x -> M.find x env) xs)), Add(zreg, hpreg),
	    Let((hpreg, Type.Int), Addi(hpreg, offset),
		store))
  | Closure.LetTuple(xts, y, e2) ->
      let s = Closure.fv e2 in
      let (offset, load) =
	expand
	  xts
	  (0, g al (M.add_list xts env) e2)
	  (fun x offset load ->
	     if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
	       fletd(x, Fload(y, offset), load))
	  (fun x t offset load ->
	     if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
	       Let((x, t), Load(y, offset), load)) in
	load
  | Closure.Get(x, y) -> (* 配列の読み出し (caml2html: virtual_get) *)
      let offset = Id.genid "get" in
	(match M.find x env with
	   | Type.Array(Type.Unit) -> Ans(Nop)
	   | Type.Array(Type.Float) ->
	       (*TODO:WATCH:たとえばディスプレースメントをレジスタで出来ればこの辺が速くなる*)
	       Let((offset, Type.Int), Add(x, y),
		   Ans(Fload(offset, 0)))
	   | Type.Array(_) ->
	       Let((offset, Type.Int), Add(x, y),
		   Ans(Load(offset, 0)))
	   | _ -> assert false)
  | Closure.Put(x, y, z) ->
      let offset = Id.genid "put" in
	(match M.find x env with
	   | Type.Array(Type.Unit) -> Ans(Nop)
	   | Type.Array(Type.Float) ->
	       Let((offset, Type.Int), Add(x, y),
		   Ans(Fstore(z, offset, 0)))
	   | Type.Array(_) ->
	       Let((offset, Type.Int), Add(x, y),
		   Ans(Store(z, offset, 0)))
	   | _ -> assert false)
	  (*TODO:*)
  | Closure.ExtArray(Id.L(x)) ->
      let y = "min_caml_" ^ x in
	(
	  try
	    let p = List.assoc y al in
	      Ans(Addi(zreg, p))
		(*一時的にNOPに*)
	  with Not_found -> raise (NoExtArray y)
	)
	  (*タプル最適化の時大丈夫かな*)
  | Closure.ExtTuple(x) ->
      let y = "min_caml_" ^ x in
	(
	  try
	    let p = List.assoc y al in
	      Ans(Addi(zreg, p))
		(*一時的にNOPに*)
	  with Not_found -> raise (NoExtTuple y)
	)
	  
(* 関数の仮想マシンコード生成 (caml2html: virtual_h) *)
(*TODO:ここは何をやってるのか？*)
let h al { Closure.name = (Id.L(x), t); Closure.args = yts;
	   Closure.formal_fv = zts; Closure.body = e } = 
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (0, g al (M.add x t (M.add_list yts (M.add_list zts M.empty))) e)
      (*渡された引数を受け取ってるLetを重ねて*)
      (fun z offset load -> fletd(z, Fload(zreg, offset), load))
      (fun z t offset load -> Let((z, t), Load(zreg, offset), load)) in
    match t with
      | Type.Fun(_, t2) ->
	  { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
      | _ -> assert false

(*
  type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
*)
(*TODO:もっと早い段階で埋め込んだ方が早いと思うがとりあえず*)
	  
let cafi =
  let ar = Id.genid "ar" and num = Id.genid "num" and init = Id.genid "init" in
  let nnum = Id.genid "num" and nar = Id.genid "ar" in
    { name = Id.L "min_caml_init_float_array"; args = [ar; num]; fargs = [init];
      body =
	Let((Id.gentmp Type.Unit, Type.Unit), Fstore(init, ar, 0),
	    Let((nnum, Type.Int), Subi(num, 1),
		Ans(IfEq(nnum, zreg, Ans(Nop),
			 Let((nar, Type.Array(Type.Float)), Addi(ar, 1),
			     Ans(CallDir(Id.L "min_caml_init_float_array", [nar; nnum], [init]
					)))))));
      ret = Type.Unit }
      
let caf =
  let ar = Id.genid "ar" and num = Id.genid "num" and init = Id.genid "init" in
    { name = Id.L "min_caml_create_float_array"; args = [num]; fargs = [init];
      body =
	(Let((ar, Type.Array(Type.Float)), Add(zreg, hpreg),
	     Let((hpreg, Type.Int), Add(hpreg, num),
		 Let((Id.gentmp Type.Unit, Type.Unit),
		     CallDir(Id.L "min_caml_init_float_array", [ar; num], [init]),
		     (*TODO:ここで指定するとアセンブラではロードの直後となって無駄*)
		     (*これはemitで簡単に解消できそう*)
		     Ans(Add(zreg, ar))))));
      ret = Type.Array(Type.Float) }
      
let cai =
  let ar = Id.genid "ar" and num = Id.genid "num" and init = Id.genid "init" in
  let nnum = Id.genid "num" and nar = Id.genid "ar" in
    { name = Id.L "min_caml_init_array"; args = [ar; num; init]; fargs = [];
      body =
	Let((Id.gentmp Type.Unit, Type.Unit), Store(init, ar, 0),
	    Let((nnum, Type.Int), Subi(num, 1),
		Ans(IfEq(nnum, zreg, Ans(Nop),
			 Let((nar, Type.Array(Type.Int)), Addi(ar, 1),
			     Ans(CallDir(Id.L "min_caml_init_array", [nar; nnum; init], []
					)))))));
      ret = Type.Unit }
      
let ca =
  let ar = Id.genid "ar" and num = Id.genid "num" and init = Id.genid "init" in
    { name = Id.L "min_caml_create_array"; args = [num; init]; fargs = [];
      body =
	(Let((ar, Type.Array(Type.Int)), Add(zreg, hpreg),
	     Let((hpreg, Type.Int), Add(hpreg, num),
		 Let((Id.gentmp Type.Unit, Type.Unit),
		     CallDir(Id.L "min_caml_init_array", [ar; num; init], []),
		     Ans(Add(zreg, ar))))));
      ret = Type.Array(Type.Int) }
      
      
(* プログラム全体の仮想マシンコード生成 (caml2html: virtual_f) *)
let f memext al (Closure.Prog(fundefs, e)) =
  data := [];
  let al =
    List.map (fun (x, y) -> (x, y + memext)) al in
  let fundefs =
    cai :: ca :: cafi :: caf :: (List.map (h al) fundefs) in
  let e = g al M.empty e in
    Prog(!data, fundefs, e)
      
