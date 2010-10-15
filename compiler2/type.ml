type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let rec string_of_t = function
  | Unit -> "Unit"
  | Bool -> "Bool"
  | Int -> "Int"
  | Float -> "Float"
  | Fun (x, y) -> Printf.sprintf "Fun(%s -> %s)"
      (String.concat " * " (List.map string_of_t x)) (string_of_t y)
  | Tuple x -> Printf.sprintf "Tuple(%s)" (String.concat ", " (List.map string_of_t x))
  | Array x -> Printf.sprintf "Array(%s)" (string_of_t x)
  | Var x -> match !x with
      | Some x -> Printf.sprintf "Var(%s)" (string_of_t x)
      | None -> "Var(None)"

let gentyp () = Var(ref None) (* 新しい型変数を作る *)
