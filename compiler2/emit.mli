
type a = { nm : string; ac : int; a1 : string;
	   mutable a2 : string; mutable a3 : string; mutable index : int }

val f : bool -> int -> int -> int -> int -> int -> int -> Asm.prog -> (a list) * (float list)
val string_of_alist : (a list) * (float list) -> string
(*val string_of_binary : (a list) * (float list) -> string*)
val string_of_flist : (a list) * (float list) -> string
