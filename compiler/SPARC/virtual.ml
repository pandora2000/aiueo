(* translation into SPARC assembly with infinite number of virtual registers *)

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

(*
  let rec g env = function (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
  | Closure.Unit -> Ans(Nop)
  | Closure.Int(i) -> Ans(Set(i))
  | Closure.Float(d) ->
  let l =
  try
(* すでに定数テーブルにあったら再利用 *)
  let (l, _) = List.find (fun (_, d') -> d = d') !data in
  l
  with Not_found ->
  let l = Id.L(Id.genid "l") in
  data := (l, d) :: !data;
  l in
  let x = Id.genid "l" in
  Let((x, Type.Int), SetL(l), Ans(LdDF(x, C(0))))
  | Closure.Neg(x) -> Ans(Neg(x))
  | Closure.Add(x, y) -> Ans(Add(x, V(y)))
  | Closure.Sub(x, y) -> Ans(Sub(x, V(y)))
  | Closure.FNeg(x) -> Ans(FNegD(x))
  | Closure.FAdd(x, y) -> Ans(FAddD(x, y))
  | Closure.FSub(x, y) -> Ans(FSubD(x, y))
  | Closure.FMul(x, y) -> Ans(FMulD(x, y))
  | Closure.FDiv(x, y) -> Ans(FDivD(x, y))
  | Closure.IfEq(x, y, e1, e2) ->
  (match M.find x env with
  | Type.Bool | Type.Int -> Ans(IfEq(x, V(y), g env e1, g env e2))
  | Type.Float -> Ans(IfFEq(x, y, g env e1, g env e2))
  | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLE(x, y, e1, e2) ->
  (match M.find x env with
  | Type.Bool | Type.Int -> Ans(IfLE(x, V(y), g env e1, g env e2))
  | Type.Float -> Ans(IfFLE(x, y, g env e1, g env e2))
  | _ -> failwith "inequality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
  let e1' = g env e1 in
  let e2' = g (M.add x t1 env) e2 in
  concat e1' (x, t1) e2'
  | Closure.Var(x) ->
  (match M.find x env with
  | Type.Unit -> Ans(Nop)
  | Type.Float -> Ans(FMovD(x))
  | _ -> Ans(Mov(x)))
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
  | Closure.AppDir(Id.L(x), ys) ->
  let (int, float) = separate (List.map (fun y -> (y, M.find y env)) ys) in
  Ans(CallDir(Id.L(x), int, float))
  | Closure.Tuple(xs) -> (* 組の生成 (caml2html: virtual_tuple) *)
  let y = Id.genid "t" in
  let (offset, store) =
  expand
  (List.map (fun x -> (x, M.find x env)) xs)
  (0, Ans(Mov(y)))
  (fun x offset store -> seq(StDF(x, y, C(offset)), store))
  (fun x _ offset store -> seq(St(x, y, C(offset)), store)) in
  Let((y, Type.Tuple(List.map (fun x -> M.find x env) xs)), Mov(reg_hp),
  Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
  store))
  | Closure.LetTuple(xts, y, e2) ->
  let s = Closure.fv e2 in
  let (offset, load) =
  expand
  xts
  (0, g (M.add_list xts env) e2)
  (fun x offset load ->
  if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
  fletd(x, LdDF(y, C(offset)), load))
  (fun x t offset load ->
  if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
  Let((x, t), Ld(y, C(offset)), load)) in
  load
  | Closure.Get(x, y) -> (* 配列の読み出し (caml2html: virtual_get) *)
  let offset = Id.genid "o" in
  (match M.find x env with
  | Type.Array(Type.Unit) -> Ans(Nop)
  | Type.Array(Type.Float) ->
  Let((offset, Type.Int), SLL(y, C(3)),
  Ans(LdDF(x, V(offset))))
  | Type.Array(_) ->
  Let((offset, Type.Int), SLL(y, C(2)),
  Ans(Ld(x, V(offset))))
  | _ -> assert false)
  | Closure.Put(x, y, z) ->
  let offset = Id.genid "o" in
  (match M.find x env with
  | Type.Array(Type.Unit) -> Ans(Nop)
  | Type.Array(Type.Float) ->
  Let((offset, Type.Int), SLL(y, C(3)),
  Ans(StDF(z, x, V(offset))))
  | Type.Array(_) ->
  Let((offset, Type.Int), SLL(y, C(2)),
  Ans(St(z, x, V(offset))))
  | _ -> assert false)
  | Closure.ExtArray(Id.L(x)) -> Ans(SetL(Id.L("min_caml_" ^ x)))
*)
let rec g env = function (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
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
  | Closure.FNeg(x) -> Ans(Fsub(fzreg, x))
  | Closure.FAdd(x, y) -> Ans(Fadd(x, y))
  | Closure.FSub(x, y) -> Ans(Fsub(x, y))
  | Closure.FMul(x, y) -> Ans(Fmul(x, y))
  | Closure.FDiv(x, y) -> Ans(Fdiv(x, y))
  | Closure.IfEq(x, y, e1, e2) ->
      (match M.find x env with
	 | Type.Bool | Type.Int -> Ans(IfEq(x, y, g env e1, g env e2))
	 | Type.Float -> Ans(IfFEq(x, y, g env e1, g env e2))
	 | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLE(x, y, e1, e2) ->
      (match M.find x env with
	 | Type.Bool | Type.Int -> Ans(IfLE(x, y, g env e1, g env e2))
	 | Type.Float -> Ans(IfFLE(x, y, g env e1, g env e2))
	 | _ -> failwith "inequality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
      let e1' = g env e1 in
      let e2' = g (M.add x t1 env) e2 in
	concat e1' (x, t1) e2'
  | Closure.Var(x) ->
      (match M.find x env with
	 | Type.Unit -> Ans(Nop)
	 | Type.Float -> Ans(Fadd(fzreg, x))
	 | _ -> Ans(Add(zreg, x)))
	(*ここは実際作られない*)
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
  | Closure.MakeCls _ | Closure.AppCls _ -> raise Exit
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
	  (0, g (M.add_list xts env) e2)
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
	       (*WATCH:たとえばディスプレースメントをレジスタで出来ればこの辺が速くなる*)
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
  | Closure.ExtArray(Id.L(x)) -> Ans(Add(zreg, "min_caml_" ^ x))
      
(* 関数の仮想マシンコード生成 (caml2html: virtual_h) *)
(*TODO:ここは何をやってるのか？*)
let h { Closure.name = (Id.L(x), t); Closure.args = yts;
	Closure.formal_fv = zts; Closure.body = e } = 
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (0, g (M.add x t (M.add_list yts (M.add_list zts M.empty))) e)
      (*渡された引数を受け取ってるLetを重ねて*)
      (fun z offset load -> fletd(z, Fload(zreg, offset), load))
      (fun z t offset load -> Let((z, t), Load(zreg, offset), load)) in
    match t with
      | Type.Fun(_, t2) ->
	  { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
      | _ -> assert false
	  
(* プログラム全体の仮想マシンコード生成 (caml2html: virtual_f) *)
let f (Closure.Prog(fundefs, e)) =
  data := [];
  let fundefs = List.map h fundefs in
  let e = g M.empty e in
    Prog(!data, fundefs, e)
