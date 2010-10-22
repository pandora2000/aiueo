
type a = { nm : string; ac : int; a1 : string;
	   mutable a2 : string; mutable a3 : string; mutable index : int }

val f : out_channel -> out_channel -> bool -> int -> int -> int -> int -> int -> int -> Asm.prog -> unit
val string_of_alist : (a list) * (float list) -> string
(*val string_of_binary : (a list) * (float list) -> string*)
val string_of_flist : (a list) * (float list) -> string
