(* type inference/reconstruction *)

open Syntax

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t

exception Type_check_error of string

let extenv = ref M.empty

(* for pretty printing (and type normalization) *)
let rec deref_typ = function (* 型変数を中身でおきかえる関数 (caml2html: typing_deref) *)
  | Type.Fun(t1s, t2) -> Type.Fun(List.map deref_typ t1s, deref_typ t2)
  | Type.Tuple(ts) -> Type.Tuple(List.map deref_typ ts)
  | Type.Array(t) -> Type.Array(deref_typ t)
  | Type.Var({ contents = None } as r) ->
      Format.eprintf "uninstantiated type variable detected; assuming int@.";
      r := Some(Type.Int);
      Type.Int
  | Type.Var({ contents = Some(t) } as r) ->
      let t' = deref_typ t in
      r := Some(t');
      t'
  | t -> t
let rec deref_id_typ (x, t) = (x, deref_typ t)
let rec deref_term = function
  | Info(_, e) -> deref_term e
  | Not(e) -> Not(deref_term e)
  | Neg(e) -> Neg(deref_term e)
  | Add(e1, e2) -> Add(deref_term e1, deref_term e2)
  | Sub(e1, e2) -> Sub(deref_term e1, deref_term e2)
  | Mul(e1, e2) -> Mul(deref_term e1, deref_term e2)
  | Div(e1, e2) -> Div(deref_term e1, deref_term e2)
  | Eq(e1, e2) -> Eq(deref_term e1, deref_term e2)
  | LE(e1, e2) -> LE(deref_term e1, deref_term e2)
  | FNeg(e) -> FNeg(deref_term e)
  | FAdd(e1, e2) -> FAdd(deref_term e1, deref_term e2)
  | FSub(e1, e2) -> FSub(deref_term e1, deref_term e2)
  | FMul(e1, e2) -> FMul(deref_term e1, deref_term e2)
  | FDiv(e1, e2) -> FDiv(deref_term e1, deref_term e2)
  | Floor(e) -> Floor(deref_term e)
  | Float_of_int(e) -> Float_of_int(deref_term e)
  | Pc(e) -> Pc(deref_term e)
  | Pf(e) -> Pf(deref_term e)
  | Ri(e) -> Ri(deref_term e)
  | Rf(e) -> Rf(deref_term e)
  | If(e1, e2, e3) -> If(deref_term e1, deref_term e2, deref_term e3)
  | Let(xt, e1, e2) -> Let(deref_id_typ xt, deref_term e1, deref_term e2)
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      LetRec({ name = deref_id_typ xt;
	       args = List.map deref_id_typ yts;
	       body = deref_term e1 },
	     deref_term e2)
  | App(e, es) -> App(deref_term e, List.map deref_term es)
  | Tuple(es) -> Tuple(List.map deref_term es)
  | LetTuple(xts, e1, e2) -> LetTuple(List.map deref_id_typ xts, deref_term e1, deref_term e2)
  | Array(e1, e2) -> Array(deref_term e1, deref_term e2)
  | Get(e1, e2) -> Get(deref_term e1, deref_term e2)
  | Put(e1, e2, e3) -> Put(deref_term e1, deref_term e2, deref_term e3)
  | e -> e

let rec occur r1 = function (* occur check (caml2html: typing_occur) *)
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

let rec unify t1 t2 = (* 型が合うように、型変数への代入をする (caml2html: typing_unify) *)
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument("List.iter2") -> raise (Unify(t1, t2)));
      unify t1' t2'
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument("List.iter2") -> raise (Unify(t1, t2)))
  | Type.Array(t1), Type.Array(t2) -> unify t1 t2
  | Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
  | Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
  | _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
  | Type.Var({ contents = None } as r1), _ -> (* 一方が未定義の型変数の場合 (caml2html: typing_undef) *)
      if occur r1 t2 then raise (Unify(t1, t2));
      r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
      if occur r2 t1 then raise (Unify(t1, t2));
      r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

let dummy = { ln = - 1; cn = - 1 }

let tr e x y z w =
  try
    y z w
  with _ ->
    print_prog stdout e;
    raise (Type_check_error (Printf.sprintf "lines %d" x.ln))
    

let rec g al info env e = (* 型推論ルーチン (caml2html: typing_g) *)
  try
    match e with
      | Info (x, y) -> g al x env y
    | Unit -> Type.Unit
    | Bool(_) -> Type.Bool
    | Int(_) -> Type.Int
    | Float(_) -> Type.Float
    | Not(e) ->
	tr e info unify Type.Bool (g al dummy env e);
	Type.Bool
    | Pc e -> tr e info unify Type.Int (g al dummy env e); Type.Unit
    | Pf e -> tr e info unify Type.Float (g al dummy env e); Type.Unit
    | Ri e -> tr e info unify Type.Unit (g al dummy env e); Type.Int
    | Rf e -> tr e info unify Type.Unit (g al dummy env e); Type.Float
    | Neg(e) ->
	tr e info unify Type.Int (g al dummy env e);
	Type.Int
    | Float_of_int(e) ->
	tr e info unify Type.Int (g al dummy env e);
	Type.Float
    | Add(e1, e2) | Sub(e1, e2) | Mul(e1, e2) | Div(e1, e2) ->
	tr e info unify Type.Int (g al dummy env e1);
	tr e info unify Type.Int (g al dummy env e2);
	Type.Int
    | FNeg(e) | Floor(e) ->
	tr e info unify Type.Float (g al dummy env e);
	Type.Float
    | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
	tr e info unify Type.Float (g al dummy env e1);
	tr e info unify Type.Float (g al dummy env e2);
	Type.Float
    | Eq(e1, e2) | LE(e1, e2) ->
	tr e info unify (g al dummy env e1) (g al dummy env e2);
	Type.Bool
    | If(e1, e2, e3) ->
	tr e info unify (g al dummy env e1) Type.Bool;
	let t2 = g al dummy env e2 in
	let t3 = g al dummy env e3 in
	tr e info unify t2 t3;
	t2
    | Let((x, t), e1, e2) -> (* letの型推論 (caml2html: typing_let) *)
	(*このunifyが失敗することはない*)
	unify t (g al dummy env e1);
	g al dummy (M.add x t env) e2
    | Var(x) when M.mem x env -> M.find x env (* 変数の型推論 (caml2html: typing_var) *)
    | Var(x) when M.mem x !extenv -> M.find x !extenv
    | Var(x) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
	if List.mem_assoc ("min_caml_" ^ x) al then
	  Format.eprintf "free variable %s assumed as external array@." x
	else 
	  Format.eprintf "free variable %s assumed as external function@." x;
	let t = Type.gentyp () in
	extenv := M.add x t !extenv;
	t
    | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> (* let recの型推論 (caml2html: typing_letrec) *)
	let env = M.add x t env in
	tr e info unify t (Type.Fun(List.map snd yts, g al dummy (M.add_list yts env) e1));
	g al dummy env e2
    | App(e, es) -> (* 関数適用の型推論 (caml2html: typing_app) *)
	let t = Type.gentyp () in
	tr e info unify (g al dummy env e) (Type.Fun(List.map (g al dummy env) es, t));
	t
    | Tuple(es) -> Type.Tuple(List.map (g al dummy env) es)
    | LetTuple(xts, e1, e2) ->
	tr e info unify (Type.Tuple(List.map snd xts)) (g al dummy env e1);
	g al dummy (M.add_list xts env) e2
    | Array(e1, e2) -> (* must be a primitive for "polymorphic" typing al *)
	tr e info unify (g al dummy env e1) Type.Int;
	Type.Array(g al dummy env e2)
    | Get(e1, e2) ->
	let t = Type.gentyp () in
	tr e info unify (Type.Array(t)) (g al dummy env e1);
	tr e info unify Type.Int (g al dummy env e2);
	t
    | Put(e1, e2, e3) ->
	let t = g al dummy env e3 in
	tr e info unify (Type.Array(t)) (g al dummy env e1);
	tr e info unify Type.Int (g al dummy env e2);
	Type.Unit
  with Unify(t1, t2) -> raise (Error(deref_term e, deref_typ t1, deref_typ t2))

exception Fatal_error1

let f al e =
  extenv := M.empty;
(*
  (match deref_typ (g M.empty e) with
  | Type.Unit -> ()
  | _ -> Format.eprintf "warning: final result does not have type unit@.");
*)
  (try unify (Type.Var (ref None)) (g al dummy M.empty e)
  with Unify _ -> raise Fatal_error1);
  extenv := M.map deref_typ !extenv;
  deref_term e
