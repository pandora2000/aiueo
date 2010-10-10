open Asm
open Printf


let memhp = ref 8192
let memsp = ref 4095
let floffset = ref 0



let ltostr (Id.L x) = x


(*TODO:シャッフル命令数かかるからその辺も含めてもっと一杯レジスタ使って最適化*)  
(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
    (* find acyclic moves *)
    match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
      | [], [] -> []
      | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
	  (y, sw) :: (x, y) :: shuffle sw (List.map
					     (function
						| (y', z) when y = y' -> (sw, z)
						| yz -> yz)
					     xys)
      | xys, acyc -> acyc @ shuffle sw xys

(*nameだとかぶっちゃってエラー起きる*)
type a = { nm : string; ac : int; a1 : string;
	   mutable a2 : string; mutable a3 : string; mutable index : int }

let opcode_of x =
  match x with
    | "nop" -> 0b000000 | "add" -> 0b000001 | "sub" -> 0b000010
    | "mul" -> 0b000011 | "and" -> 0b000100 | "or" -> 0b000101
    | "nor" -> 0b000110 | "xor" -> 0b000111| "addi" -> 0b001001
    | "subi" -> 0b001010 | "muli" -> 0b001011 | "andi" -> 0b001100
    | "ori" -> 0b001101 | "nori" -> 0b001110 | "xori" -> 0b001111
    | "fadd" -> 0b010000 | "fsub" -> 0b010001| "fmul" -> 0b010010
    | "finv" -> 0b010011 | "fsqrt" -> 0b010100 | "fdiv" -> 0b010101
    | "load" -> 0b011000 | "store" -> 0b011001 | "fload" -> 0b011010
    | "fstore" -> 0b011011 | "beq" -> 0b100000 | "bne" -> 0b100001
    | "bgt" -> 0b100010 | "blt" -> 0b100011 | "fbeq" -> 0b100100
    | "fbne" -> 0b100101 | "fbgt" -> 0b100110 | "fblt" -> 0b100111
    | "jump" -> 0b110000 | "call" -> 0b110100 | "return" -> 0b111000 | _ -> raise Exit

let finst0 n =
  { nm = n; ac = 0; a1 = ""; a2 = ""; a3 = ""; index = 0 }
let finst1 n a =
  { nm = n; ac = 1; a1 = a; a2 = ""; a3 = ""; index = 0 }
    (*let finst2 n a b =
      let i = !inst_index in
      incr inst_index;
      { nm = n; ac = 2; a1 = a; a2 = b; a3 = ""; index = i }*)
let finst3 n a b c =
  { nm = n; ac = 3; a1 = a; a2 = b; a3 = c; index = 0 }
let flabel n =
  { nm = n; ac = - 1; a1 = ""; a2 = ""; a3 = ""; index = 0 }
    
let call_args ys zs =
  (*yrsは本来あるべきレジスタと今のレジスタのペア*)
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, [])
      ys in
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
    (List.map
       (fun (y, r) -> finst3 "add" r zreg y)
       (shuffle swreg yrs)) @
      (List.map
	 (fun (z, fr) -> finst3 "fadd" fr fzreg z)
	 (shuffle fswreg zfrs))

let lstring_of_vinst x = String.lowercase (string_of_vinst x)
  
let rec h c tl tli e ret =
  let nontail_seq_of_if s x y z w =
    (*相対jumpの距離について*)
    let el = Id.genid "else" in
    let en = Id.genid "endif" in
      (*実際はtlはfalseだが*)
      [finst3 s x y el] @
	(g c tl tli z) @
	[finst1 "jump" en] @
	[flabel el] @
	(g c tl tli w) @
	[flabel en] in
  let tail_seq_of_if s x y z w =
    let el = Id.genid "else" in
      [finst3 s x y el] @
	(g c tl tli z) @
	[flabel el] @
	(g c tl tli w) in
  let stp y =
    let ((a, _), b) = List.find (fun ((_, x), _) -> x = y) c in (a, b) in
  let n = lstring_of_vinst e in
    (
      match e with
	| Nop -> if tl then tli else []
	    (*zreg最適化*)
	| Add(x, y) | Sub(x, y) | Mul(x, y)
	| Or(x, y) | Xor(x, y) | Nor(x, y) | And(x, y)
	| Fadd(x, y) | Fsub(x, y) | Fmul(x, y)
	| Fdiv(x, y) | Finv(x, y) | Fsqrt(x, y) ->
	    [finst3 n ret x y]
	    @ (if tl then tli else [])
	| Addi(x, y) | Subi(x, y) | Muli(x, y)
	| Ori(x, y) | Xori(x, y) | Nori(x, y) | Andi(x, y) 
	| Load(x, y) | Fload(x, y) ->
	    [finst3 n ret x (string_of_int y)]
	    @ (if tl then tli else [])
	| Store(x, y, z) | Fstore(x, y, z) ->
	    [finst3 n x y (string_of_int z)]
	    @ (if tl then tli else [])
	| Save(x, y) ->
	    let (a, _) = stp y in
	      [finst3 (if List.mem x allregs then "store" else "fstore")
		 x spreg (string_of_int a)]
	      @ (if tl then tli else [])
	| Restore x ->
	    let (a, b) = stp x in
	      [finst3 (if b.[0] = '%' && b.[1] = 'r' then "load" else "fload")
		 ret spreg (string_of_int a)]
	      @ (if tl then tli else [])
		(*ifはもっと最適化できる今はifだと分岐しない方は結局jump最後にして後続命令にもどる。*)
		(*WATCH:TODO:それをifごとに倍にしていけばいい(メモリ的にやばいかな？)*)
	| IfEq(x, y, z, w) ->
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| IfGE(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| IfLE(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| IfFEq(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| IfFLE(x, y, z, w) ->
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| CallCls _ -> raise Exit
	| CallDir(Id.L x, y, z) ->
	    (call_args y z) @
	      [if tl then finst1 "jump" x else finst1 "call" x]
    )
and g c tl tli =
  function
    | Ans(x) ->
	h c tl tli x regs.(0)
    | Let((x, t), exp, e) ->
	(h c false tli exp x) @ (g c tl tli e)

(*Saveを数える*)
let get_saves ret e =
  let rec scs ret y = function
    | Save(k, x) when not (List.exists (fun ((_, z), _) -> x = z) y) ->
	((List.length y, x), k) :: y
    | IfEq(x, u, z, w) | IfGE(x, u, z, w) | IfLE(x, u, z, w) 
    | IfFLE(x, u, z, w) | IfFEq(x, u, z, w) ->
	sub ret (sub ret y z) w
    | _ -> y
  and sub ret l = function
    | Ans(x) -> scs ret l x
    | Let((_, y), z, w) -> sub ret (scs y l z) w in
    sub ret [] e

exception Exit2

let f (Prog (fl, fundefs, e)) =
  let en = Id.genid "end" in
  let p = get_saves Type.Unit e in
  let n = !memsp - (List.length p) in
  let fli = Array.of_list fl in
  let ret =
    List.flatten
      [[finst0 "nop"; finst0 "nop"];
       [flabel (Id.genid "main");
	finst3 "addi" spreg zreg (string_of_int n);
	finst3 "addi" hpreg zreg (string_of_int !memhp)];
       g p false [] e;
       [finst1 "jump" en];
       (List.flatten (List.map (fun x ->
				  let p = get_saves x.ret x.body in
				  let ni = List.length p in
				  let n = string_of_int ni in
				    List.flatten
				      [
					[flabel (ltostr x.name)];
					(if ni = 0 then [] else [finst3 "subi" spreg spreg n]);
					g p true
					  (List.flatten [(if ni = 0 then []
							  else [finst3 "addi" spreg spreg n]);
							 [finst0 "return"]])
					  x.body
				      ])
			fundefs));
       [flabel en; finst3 "add" "%r3" zreg "%r3"; finst1 "jump" en]] in
    (*浮動小数点の割り当て*)
  let ret =
    List.map (fun x ->
		if x.nm = "fload" && not (is_reg x.a2) then
		  try
		    for i = 0 to Array.length fli - 1 do
		      if (match fli.(i) with (Id.L y, _) -> y) = x.a2 then
			(x.a2 <- zreg; x.a3 <- string_of_int (i + !floffset); raise Exit)
		    done; x
		  with Exit -> x
		else x) ret in
    (ret, List.map (fun (_, x) -> x) fl)

let string_of_a x =
  if x.ac = - 1 then
    sprintf "%s :" x.nm
  else if x.ac = 0 then
    sprintf "\t%s" x.nm
  else if x.ac = 1 then
    sprintf "\t%s\t%s" x.nm x.a1
      (*  else if x.ac = 2 then
	  sprintf "\t%s\t%s %s" x.nm x.a1 x.a2*)
  else 
    sprintf "\t%s\t%s %s %s" x.nm x.a1 x.a2 x.a3

let string_of_alist (x, _) =
  sprintf "%s\n"
    (String.concat "\n"
       (List.map (fun y -> string_of_a y) x))

let get_label_index y name =
  (List.find (fun x -> x.nm = name && x.ac = - 1) y).index

let string_of_bi_a x l =
  (*  print_endline (string_of_int (get_label_index l "L_fib_11"));
      print_endline x.nm;*)
  let p = 
    if x.ac = - 1 then ""
    else if x.ac = 0 then
      let y = opcode_of x.nm in
	sprintf "%02X000000\n" (y lsl 2)
    else if x.ac = 1 then
      try
	let y = opcode_of x.nm in
	let z = get_label_index l x.a1 in
	  sprintf "%02X%06X\n" ((y lsl 2) lor (z lsr 24)) (z land 0xffffff)
      with Not_found ->
	match x.a1 with
	  | "min_caml_print_int" -> ""
	  | _ -> ""
    else
      let y = opcode_of x.nm in
      let z = int_of_reg x.a1 in
      let w = int_of_reg x.a2 in
      let u =
	if is_reg x.a3 then (int_of_reg x.a3) lsl 11
	else if x.a3.[0] = '-' ||
	  x.a3.[0] = '0' || x.a3.[0] = '1' ||
	  x.a3.[0] = '2' || x.a3.[0] = '3' ||
	  x.a3.[0] = '4' || x.a3.[0] = '5' ||
	  x.a3.[0] = '6' || x.a3.[0] = '7' ||
	  x.a3.[0] = '8' || x.a3.[0] = '9' then
	    (int_of_string x.a3) land 0xffff
	else ((get_label_index l x.a3) - x.index) land 0xffff in
	sprintf "%04X%04X\n" ((y lsl 10) lor (z lsl 5) lor w) u in
    (*    print_endline p;*)
    p

let string_of_binary (x, _) =
  let i = ref 0 in
    List.iter (fun y ->
		 if y.ac = - 1 || (y.nm = "call" &&
		     (
		       try
			 ignore (get_label_index x y.a1); false
		       with Not_found -> true
		     ))
		 then
		   y.index <- !i
		 else 
		   let p = !i in incr i; y.index <- p) x;
    String.concat ""
      ((List.map (fun y -> string_of_bi_a y x) x) @
	 ["00000000\n"; "00000000\n"; "00000000\n"; "00000000\n"; "FFFFFFFF\n"])

let string_of_flist (_, x) =
  (*  print_endline (string_of_int (List.length x));*)
  sprintf "%s\n"
    (String.concat "\n"
       (List.map (fun y -> Int32.format "%08X" (Int32.bits_of_float y)) x))
    (*
      let string_of_external_funcs (x, _) =
    *)
