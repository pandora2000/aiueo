open Printf
  
type lpos = { ln : int; cn : int }

type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
  | Info of lpos * t
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
  | Mul of t * t
  | FNeg of t
  | FAdd of t * t
  | FSub of t * t
  | FMul of t * t
  | FDiv of t * t
  | Eq of t * t
  | LE of t * t
  | If of t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

  (*TODO:initialize*)
let line_num = ref 1
  
let char_num = ref (- 1)
  
let pos n = { ln = !line_num; cn = (Parsing.symbol_start n) - !char_num }
  
let ltostr (Id.L x) = x
  
let rec sop level e =
  let nl = level + 1 in
  let nsop = sop nl in
  let psol l s = sprintf "%s%s" (String.make l ' ') s in
  let sol = psol level in
    (*
      | LetRec of fundef * t
      and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }
    *)
  let tostr = function
    | Info _ -> "Info"
    | Unit -> "Unit" | Int _ -> "Int" | Float _ -> "Float" | Bool _ -> "Bool"
    | Mul _ -> "Mul"
    | Neg _ -> "Neg" | Add _ -> "Add" | Sub _ -> "Sub" | FNeg _ -> "FNeg"
    | FAdd _ -> "FAdd" | FSub _ -> "FSub" | FMul _ -> "FMul" | FDiv _ -> "FDiv"
    | Array _ -> "Array" | If _ -> "If" | Let _ -> "Let" | Var _ -> "Var"
    | LE _ -> "LE" | Eq _ -> "Eq" | Not _ -> "Not"
    | Tuple _ -> "Tuple" | LetTuple _ -> "LetTuple" | Get _ -> "Get"
    | Put _ -> "Put" | App _ -> "App"
    | LetRec _ -> "LetRec" in
  let str = tostr e in
    match e with
      | Info (_, x) -> sop level x
      | Unit -> sol (sprintf "%s\n" str)
      | Bool x -> sol (sprintf "%s(%B)\n" str x)
      | Int x -> sol (sprintf "%s(%d)\n" str x)
      | Float x -> sol (sprintf "%s(%f)\n" str x)
      | Var x -> sol (sprintf "%s(%s)\n" str x)
      | Neg x | FNeg x | Not x ->
	  sol (sprintf "%s\n%s" str (nsop x))
      | Add (x, y) | Sub (x, y) | FAdd (x, y) | FSub (x, y) | LE (x, y) | Eq (x, y)
      | FMul (x, y) | FDiv (x, y) | Get (x, y) | Array (x, y) | Mul (x, y) ->
	  sol (sprintf "%s\n%s%s" str (nsop x) (nsop y))
      | Put (x, y, z) -> sol (sprintf "%s\n%s%s%s" str (nsop x) (nsop y) (nsop z))
      | If (x, y, z) ->
	  sol (sprintf "%s\n%s%s\n%s%s\n%s" str (nsop x) (sol "Then")
		 (nsop y) (sol "Else") (nsop z))
      | Let ((x, y), z, w) ->
	  sol (sprintf "%s(%s : %s)\n%s%s\n%s"
		 str x (Type.string_of_t y) (nsop z) (sol "In") (nsop w))
      | LetRec ({ name = (x, y); args = z; body = w}, u) ->
	  sol (sprintf "%s(%s : %s, (%s))\n%s%s\n%s"
		 str x (Type.string_of_t y)
		 (String.concat ", "
		    (List.map (fun (a, b) -> sprintf "%s : %s" a (Type.string_of_t b)) z))
		 (nsop w) (sol "In") (nsop u))
      | Tuple x ->
	  sol (sprintf "%s\n%s" str (String.concat "" (List.map (fun y -> nsop y) x)))
      | LetTuple (x, y, z) ->
	  sol (sprintf "%s(%s)\n%s%s" str
		 (String.concat ", "
		    (List.map (fun (a, b) -> sprintf "%s : %s" a (Type.string_of_t b)) x))
		 (nsop y) (nsop z))
      | App (x, y) ->
	  sol (sprintf "%s\n%s%s\n%s" str (nsop x) (sol "By")
		 (String.concat "" (List.map (fun y -> nsop y) y)))
	    
let print_prog outchan e =
  output_string outchan (sop 0 e)

    

let rec addexp b a =
  match b with
  | Info (x, y) -> Info (x, addexp y a)
  | Unit 
  | Bool _
  | Int _
  | Float _
  | Not _
  | Neg _
  | Add _
  | Sub _
  | Mul _
  | FNeg _
  | FAdd _
  | FSub _
  | FMul _
  | FDiv _
  | Eq _
  | LE _
  | If _
  | Let _
  | Var _
  | App _
  | Tuple _
  | LetTuple _
  | Array _
  | Get _
  | Put _ -> a
  | LetRec (x, y) -> LetRec (x, addexp y a)
