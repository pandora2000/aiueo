open Printf

type closure = { entry : Id.l; actual_fv : Id.t list }
type t = (* クロージャ変換後の式 (caml2html: closure_t) *)
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mul of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | MakeCls of (Id.t * Type.t) * closure * t
  | AppCls of Id.t * Id.t list
  | AppDir of Id.l * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtTuple of Id.t
  | ExtArray of Id.l
type fundef = { name : Id.l * Type.t;
		args : (Id.t * Type.t) list;
		formal_fv : (Id.t * Type.t) list;
		body : t }
type prog = Prog of fundef list * t

let rec fv = function
  | Unit | Int(_) | Float(_) | ExtArray(_) | ExtTuple(_) -> S.empty
  | Neg(x) | FNeg(x) -> S.singleton x
  | Add(x, y) | Sub(x, y) | FAdd(x, y) | Mul(x, y)
  | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
  | IfEq(x, y, e1, e2)| IfLE(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, t), e1, e2) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x) -> S.singleton x
  | MakeCls((x, t), { entry = l; actual_fv = ys }, e) -> S.remove x (S.union (S.of_list ys) (fv e))
  | AppCls(x, ys) -> S.of_list (x :: ys)
  | AppDir(_, xs) | Tuple(xs) -> S.of_list xs
  | LetTuple(xts, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xts)))
  | Put(x, y, z) -> S.of_list [x; y; z]

let toplevel : fundef list ref = ref []

let rec g env known = function (* クロージャ変換ルーチン本体 (caml2html: closure_g) *)
  | KNormal.Unit -> Unit
  | KNormal.Int(i) -> Int(i)
  | KNormal.Float(d) -> Float(d)
  | KNormal.Neg(x) -> Neg(x)
  | KNormal.Add(x, y) -> Add(x, y)
  | KNormal.Sub(x, y) -> Sub(x, y)
  | KNormal.Mul(x, y) -> Mul(x, y)
  | KNormal.FNeg(x) -> FNeg(x)
  | KNormal.FAdd(x, y) -> FAdd(x, y)
  | KNormal.FSub(x, y) -> FSub(x, y)
  | KNormal.FMul(x, y) -> FMul(x, y)
  | KNormal.FDiv(x, y) -> FDiv(x, y)
  | KNormal.IfEq(x, y, e1, e2) -> IfEq(x, y, g env known e1, g env known e2)
  | KNormal.IfLE(x, y, e1, e2) -> IfLE(x, y, g env known e1, g env known e2)
  | KNormal.Let((x, t), e1, e2) -> Let((x, t), g env known e1, g (M.add x t env) known e2)
  | KNormal.Var(x) -> Var(x)
  | KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2) -> (* 関数定義の場合 (caml2html: closure_letrec) *)
      (* 関数定義let rec x y1 ... yn = e1 in e2の場合は、
	 xに自由変数がない(closureを介さずdirectに呼び出せる)
	 と仮定し、knownに追加してe1をクロージャ変換してみる *)
      let toplevel_backup = !toplevel in
      let env' = M.add x t env in
      let known' = S.add x known in
      let e1' = g (M.add_list yts env') known' e1 in
	(* 本当に自由変数がなかったか、変換結果e1'を確認する *)
	(* 注意: e1'にx自身が変数として出現する場合はclosureが必要!
           (thanks to nuevo-namasute and azounoman; test/cls-bug2.ml参照) *)
      let zs = S.diff (fv e1') (S.of_list (List.map fst yts)) in
      let known', e1' =
	if S.is_empty zs then known', e1' else
	  (* 駄目だったら状態(toplevelの値)を戻して、クロージャ変換をやり直す *)
	  (Format.eprintf "free variable(s) %s found in function %s@." (Id.pp_list (S.elements zs)) x;
	   Format.eprintf "function %s cannot be directly applied in fact@." x;
	   toplevel := toplevel_backup;
	   let e1' = g (M.add_list yts env') known e1 in
	     known, e1') in
      let zs = S.elements (S.diff (fv e1') (S.add x (S.of_list (List.map fst yts)))) in (* 自由変数のリスト *)
      let zts = List.map (fun z -> (z, M.find z env')) zs in (* ここで自由変数zの型を引くために引数envが必要 *)
	toplevel := { name = (Id.L(x), t); args = yts; formal_fv = zts; body = e1' } :: !toplevel; (* トップレベル関数を追加 *)
	let e2' = g env' known' e2 in
	  if S.mem x (fv e2') then (* xが変数としてe2'に出現するか *)
	    MakeCls((x, t), { entry = Id.L(x); actual_fv = zs }, e2') (* 出現していたら削除しない *)
	  else
	    (Format.eprintf "eliminating closure(s) %s@." x;
	     e2') (* 出現しなければMakeClsを削除 *)
  | KNormal.App(x, ys) when S.mem x known -> (* 関数適用の場合 (caml2html: closure_app) *)
      Format.eprintf "directly applying %s@." x;
      AppDir(Id.L(x), ys)
  | KNormal.App(f, xs) -> AppCls(f, xs)
  | KNormal.Tuple(xs) -> Tuple(xs)
  | KNormal.LetTuple(xts, y, e) -> LetTuple(xts, y, g (M.add_list xts env) known e)
  | KNormal.Get(x, y) -> Get(x, y)
  | KNormal.Put(x, y, z) -> Put(x, y, z)
  | KNormal.ExtArray(x) -> ExtArray(Id.L(x))
  | KNormal.ExtTuple(x) -> ExtTuple(x)
  | KNormal.ExtFunApp(x, ys) -> AppDir(Id.L("min_caml_" ^ x), ys)

exception Exit

let flat_if (Prog (l, e)) =
  let rec efi e =
    match e with
      | MakeCls _
      | AppCls _ -> raise Exit
      | Unit 
      | Int _
      | Float _
      | Neg _
      | Add _
      | Sub _
      | Mul _
      | FNeg _
      | FAdd _
      | FSub _
      | FMul _
      | FDiv _
      | Var _
      | Get _
      | Put _
      | AppDir _
      | Tuple _
      | LetTuple _
      | ExtTuple _
      | ExtArray _ -> e
      | IfEq (x, y, z, w) -> IfEq (x, y, efi z, efi w)
      | IfLE (x, y, z, w) -> IfLE (x, y, efi z, efi w)
      | Let (x, z, w) ->
	  (match z with
	     | IfEq (a, b, c, d) ->
		 IfEq (a, b, efi (Let (x, c, w)), efi (Let (x, d, w)))
	     | IfLE (a, b, c, d) ->
		 IfLE (a, b, efi (Let (x, c, w)), efi (Let (x, d, w)))
	     | _ -> Let (x, z, efi w))
  in
    Prog (List.map (fun x ->
		      { name = x.name; args = x.args; formal_fv = x.formal_fv;
			body = efi x.body }) l, efi e)

let f e =
  toplevel := [];
  let e' = g M.empty S.empty e in
    Prog(List.rev !toplevel, e')
    

let ltostr (Id.L x) = x

let num = ref 0

exception Exit2
  
let rec sop level e =
  incr num;
  let nl = level + 1 in
  let nsop = sop nl in
  let psol l s = sprintf "%s%s" (String.make l ' ') s in
  let sol = psol level in
  let tostr = function
    | Mul _ -> "Mul" | ExtTuple _ -> "ExtTuple"
    | Float _ -> "Float" | Int _ -> "Int" | Unit -> "Unit"
    | Neg _ -> "Neg" | Add _ -> "Add" | Sub _ -> "Sub" | FNeg _ -> "FNeg"
    | FAdd _ -> "FAdd" | FSub _ -> "FSub" | FMul _ -> "FMul" | FDiv _ -> "FDiv"
    | IfEq _ -> "IfEq" | IfLE _ -> "IfLE" | Let _ -> "Let" | Var _ -> "Var"
    | Tuple _ -> "Tuple" | LetTuple _ -> "LetTuple" | Get _ -> "Get"
    | Put _ -> "Put" | ExtArray _ -> "ExtArray" | MakeCls _ -> "MakeCls"
    | AppCls _ -> "AppCls" | AppDir _ -> "AppDir" in
    match e with
      | Unit -> sol "Unit\n"
      | Int x -> sol (sprintf "Int(%d)\n" x)
      | Float x -> sol (sprintf "Float(%f)\n" x)
      | Neg x | FNeg x | Var x | ExtArray Id.L x | ExtTuple x ->
	  sol (sprintf "%s(%s)\n" (tostr e) x)
      | Add (x, y) | Sub (x, y) | FAdd (x, y) | FSub (x, y) | Mul (x, y)
      | FMul (x, y) | FDiv (x, y) | Get (x, y) -> sol (sprintf "%s(%s, %s)\n" (tostr e) x y)
      | Put (x, y, z) -> sol (sprintf "%s(%s, %s, %s)\n" (tostr e) x y z)
      | IfEq (x, y, z, w) | IfLE (x, y, z, w) ->
	  sol (sprintf "%s(%s, %s)\n%s%s\n%s" (tostr e) x y (nsop z) (sol "Else") (nsop w))
      | Let ((x, y), z, w) ->
	  sol (sprintf "%s(%s : %s)\n%s%s\n%s"
		 (tostr e) x (Type.string_of_t y) (nsop z) (sol "In") (nsop w))
      | Tuple x ->
	  sol (sprintf "%s(%s)\n" (tostr e) (String.concat ", " x))
      | LetTuple (x, y, z) ->
	  sol (sprintf "%s((%s), %s)\n%s" (tostr e)
		 (String.concat ", "
		    (List.map (fun (a, b) -> sprintf "%s : %s" a (Type.string_of_t b)) x))
		 y (nsop z))
	    (*
      | MakeCls ((x, y), z, w) ->
	  
	  sol (sprintf "%s(%s : %s, (%s, (%s)))\n%s"
		 (tostr e) x (Type.string_of_t y) (ltostr z.entry)
		 (String.concat ", " z.actual_fv) (nsop w))
      | AppCls (x, y) ->
	      sol (sprintf "%s(%s, (%s))\n" (tostr e) x (String.concat ", " y))
	    *)
      | MakeCls _ | AppCls _ -> raise Exit2
      | AppDir (Id.L x, y) ->
	  sol (sprintf "%s(%s, (%s))\n" (tostr e) x (String.concat ", " y))
	    
let print_prog outchan (Prog (l, e)) =
  num := 0;
  output_string outchan
    (sprintf "%s\n"
       (String.concat ""
	  (List.map
	     (fun x ->
		sprintf "%s\n%s" (ltostr (fst x.name)) (sop 0 x.body)
	     ) l)));
  output_string outchan (sop 0 e);
  output_string outchan (sprintf "%d\n" !num)

    
