exception Error of Syntax.t * Type.t * Type.t
val extenv : Type.t M.t ref
val f : (Id.t * int) list -> Syntax.t -> Syntax.t
