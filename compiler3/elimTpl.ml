




let f x = ()(*
  match x with
  | Unit
  | Int _
  | Float _ 
  | Neg _
  | Add _
  | Sub _
  | FNeg _
  | FAdd _
  | FSub _
  | FMul _
  | FDiv _
  | IfEq of Id.t * Id.t * t * t 
  | IfLE of Id.t * Id.t * t * t 
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of Id.t * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtArray of Id.t
  | ExtFunApp of Id.t * Id.t list

  
	    *)
