open Asm
open Printf

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

exception UnknownInstruction

(*TODO:いろいろ追加*)
let opcode_of x =
  match x with
    | "foi" -> 0b010110 | "floor" -> 0b111111(*仮*)
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
    | "jump" -> 0b110000 | "call" -> 0b110100 | "return" -> 0b111000
    | _ -> raise UnknownInstruction

(*相対jumpの距離について*)
(*TODO:a1,a3が数字の時値が範囲内にあるか確かめる*)
let finst0 n =
  { nm = n; ac = 0; a1 = ""; a2 = ""; a3 = ""; index = 0 }
let finst1 n a =
  { nm = n; ac = 1; a1 = a; a2 = ""; a3 = ""; index = 0 }
let finst2 n a b =
  { nm = n; ac = 2; a1 = a; a2 = b; a3 = ""; index = 0 }
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

exception Exit7

let lstring_of_vinst x = String.lowercase (string_of_vinst x)
  
let rec h c tl tli e ret rett =
  let nontail_seq_of_if s x y z w =
    let el = Id.genid "else" in
    let en = Id.genid "endif" in
      (*実際はtlはfalseだが*)
      [finst3 s x y el] @
	(g c tl tli rett z) @
	[finst1 "jump" en] @
	[flabel el] @
	(g c tl tli rett w) @
	[flabel en] in
  let tail_seq_of_if s x y z w =
    let el = Id.genid "else" in
      [finst3 s x y el] @
	(g c tl tli rett z) @
	[flabel el] @
	(g c tl tli rett w) in
  let stp y =
    let ((a, _), b) = List.find (fun ((_, x), _) -> x = y) c in (a, b) in
  let n = lstring_of_vinst e in
  let reti = [finst0 "return"] in
    (
      match e with
	| Nop -> if tl then tli @ reti else []
	    (*zreg最適化*)
	| Floor(x) | Float_of_int(x) ->
	    [finst2 n ret x]
	    @ (if tl then tli @ reti else [])
	| Add(x, y) | Sub(x, y) | Mul(x, y)
	| Or(x, y) | Xor(x, y) | Nor(x, y) | And(x, y)
	| Fadd(x, y) | Fsub(x, y) | Fmul(x, y)
	| Fdiv(x, y) | Finv(x, y) | Fsqrt(x, y) ->
	    [finst3 n ret x y]
	    @ (if tl then tli @ reti else [])
	| Addi(x, y) | Subi(x, y) | Muli(x, y)
	| Ori(x, y) | Xori(x, y) | Nori(x, y) | Andi(x, y) 
	| Load(x, y) | Fload(x, y) ->
	    [finst3 n ret x (string_of_int y)]
	    @ (if tl then tli @ reti else [])
	| Store(x, y, z) | Fstore(x, y, z) ->
	    [finst3 n x y (string_of_int z)]
	    @ (if tl then tli @ reti else [])
	| Save(x, y) ->
	    let (a, _) = stp y in
	      [finst3 (if List.mem x allregs then "store" else "fstore")
		 x spreg (string_of_int a)]
	      @ (if tl then tli @ reti else [])
	| Restore x ->
	    let (a, b) = stp x in
	      [finst3 (if b.[0] = '%' && b.[1] = 'r' then "load" else "fload")
		 ret spreg (string_of_int a)]
	      @ (if tl then tli @ reti else [])
		(*ifはもっと最適化できる今はifだと分岐しない方は結局jump最後にして後続命令にもどる。*)
		(*WATCH:TODO:それをifごとに倍にしていけばいい(メモリ的にやばいかな？)*)
	| IfEq(x, y, z, w) ->
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bne" x y z w 
	| IfGE(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "blt" x y z w 
	| IfLE(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "bgt" x y z w 
	| IfFEq(x, y, z, w) -> 
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "fbne" x y z w 
	| IfFLE(x, y, z, w) ->
	    (if tl then tail_seq_of_if else nontail_seq_of_if) "fbgt" x y z w 
	| CallCls _ -> raise Exit
	| CallDir(Id.L x, y, z) ->
	    let (p, q) =
	      match rett with
		| Type.Unit -> (true, "")
		| Type.Float -> if ret = fregs.(0) then (true, "") else (false, fregs.(0))
		| _ -> if ret = regs.(0) then (true, "") else (false, regs.(0)) in
	      if p then 
		(call_args y z) @ (if tl then tli @ [finst1 "jump" x] else [finst1 "call" x])
	      else
		(call_args y z) @ (if tl then tli @ [finst1 "jump" x]
				   else [finst1 "call" x;
					 match rett with
					   | Type.Float -> finst3 "fadd" ret fzreg q
					   | _ -> finst3 "add" ret zreg q
					])
    )
and g c tl tli rett =
  function
    | Ans(x) ->
	let ret = 
	  match rett with
	    | Type.Float -> fregs.(0)
	    | _ -> regs.(0) in
	  h c tl tli x ret rett
    | Let((x, t), exp, e) ->
	(h c false tli exp x t) @ (g c tl tli rett e)

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

type t = Int of int | Float of float

let f memext memin memout memsp memhp floffset (Prog (fl, fundefs, e)) =
  let en = Id.genid "end" in
  let p = get_saves Type.Unit e in
  let n = memsp - (List.length p) in
  let fid255 = Id.genid "fid255" in
  let fid10_0 = Id.genid "fid10_0" in
    (*入力データ用*)
  let mil =
    [
      Float 0.0; Float 0.0; Float 0.0;
      Float 0.0; Float 30.0; Float 1.0;
      Float 0.0; Float 0.0; Float 255.0;
      Int 0; Int 1; Int 2; Int 0;
      Float 40.0; Float 10.0; Float 40.0; Float 0.0; Float (-.40.0); Float 0.0;
      Float 1.0; Float 0.2; Float 64.0;
      Float 255.0; Float 255.0; Float 0.0;
      Int 4; Int 3; Int 1; Int 0;
      Float 30.0; Float 30.0; Float 30.0; Float 0.0;
      Float 0.0; Float 0.0; Float 1.0; Float 1.0;
      Float 255.0; Float 255.0; Float 255.0; Float 255.0;
      Int (-1); Int 0; Int (-1); Int 1;
      Int (-1); Int (-1); Int 99; Int 0;
      Int 1; Int (-1); Int (-1)
    ] in
    (*入力データにそれぞれラベルをつける*)
  let mill = List.map (fun x -> (Id.L (Id.genid "in"), x)) mil in
  let milf =
    List.fold_right (fun b a ->
		       match b with
			 | (_, Int _) -> a
			 | (x, Float y) -> (x, y) :: a
		    ) mill [] in
  let fli = Array.of_list (fl @ [(Id.L fid255, 255.0);
				 (Id.L fid10_0, 1000000000.0)]
			     (*入力データ用*)
			   @ milf) in
  let mill = Array.of_list mill in
  let mil =
    List.flatten
      (Array.to_list
	 (Array.mapi
	    (fun i x ->
	       let mi = i + memin + 1 in
	       match x with
		 | Int y -> 
		     [finst3 "addi" regs.(0) zreg (string_of_int y);
		      finst3 "store" regs.(0) zreg (string_of_int mi)]
		 | Float _ ->
		     match fst mill.(i) with Id.L z ->
		       [finst3 "fload" fregs.(0) z "0";
			finst3 "fstore" fregs.(0) zreg (string_of_int mi)]
	    ) (Array.of_list mil))) in
  let ear = Array.make 1006 0 in
  let ear = 
    Array.mapi
      (fun i x ->
	 if i <= 56 then (0, 0)
	 else if i = 57 then (1, 0)
	 else if i = 58 then (2, 0)
	 else if i = 59 then (0, 60)
	 else if i = 60 then (0, -1)
	 else if i <= 110 then (0, i + 50)
	 else if i <= 160 then (0, -1)
	 else if i <= 340 then (0, (i - 161) * 3 + 341)
	 else if i <= 880 then (0, 0)
	 else if i = 881 then (0, 883)
	 else if i = 882 then (0, 886)
	 else if i <= 945 then (0, 0)
	 else if i <= 1005 then (0, (i - 946) * 11 + 1006)
	 else raise Exit) ear in
  let ear =
    List.flatten
      (Array.to_list
	 (Array.mapi
	    (fun i (x, y) ->
	       let i = i + memext in
		 if x = 0 then
		   if y = 0 then [finst3 "store" zreg zreg (string_of_int i)]
		   else 
		     [finst3 "addi" regs.(0) zreg (string_of_int y);
		      finst3 "store" regs.(0) zreg (string_of_int i)]
		 else if x = 1 then [finst3 "fload" fregs.(0) fid255 "0";
				     finst3 "fstore" fregs.(0) zreg (string_of_int i)]
		 else if x = 2 then [finst3 "fload" fregs.(0) fid10_0 "0";
				     finst3 "fstore" fregs.(0) zreg (string_of_int i)]
		 else raise Exit) ear))
  in
  let ret =
    List.flatten
      [[finst0 "nop"; finst0 "nop"];
       [flabel (Id.genid "main");
	(*スタックポインタ初期化*)
	finst3 "addi" spreg zreg (string_of_int n);
	(*ヒープポインタ初期化*)
	(*memhpは大きいのでとりあえずTODO:*)
	finst3 "addi" hpreg zreg (string_of_int (memhp / 10));
	finst3 "muli" hpreg hpreg (string_of_int 10);
	(*出力データポインタ初期化*)
	finst3 "addi" regs.(0) zreg (string_of_int (memout + 1));
	finst3 "store" regs.(0) zreg (string_of_int memout);
       ];
       (*入力データポインタ初期化*)
       [
	 finst3 "addi" regs.(0) zreg (string_of_int (memin + 1));
	 finst3 "store" regs.(0) zreg (string_of_int memin)
       ];
       (*入力データは実際は埋め込まれてる*)       
       (*入力データ埋め込み*)
       mil;
       (*外部変数領域初期化*)
       ear;
       g p false [] Type.Unit e;
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
					  (if ni = 0 then [] else [finst3 "addi" spreg spreg n])
					  x.ret x.body
				      ])
			fundefs));
       (*jikki*)
       (*
	 [
	 flabel en;
	 finst3 "add" regs.(0) zreg regs.(0);
	 finst1 "jump" en
	 ]
       *)
       (*simulator*)
       [
	 flabel en;
	 finst3 "store" regs.(0) zreg (string_of_int memsp);
       ]
      ]
  in
    (*浮動小数点の割り当て*)
  let ret =
    List.map (fun x ->
		if x.nm = "fload" && not (is_reg x.a2) then
		  try
		    for i = 0 to Array.length fli - 1 do
		      if (match fli.(i) with (Id.L y, _) -> y) = x.a2 then
			(x.a2 <- zreg; x.a3 <- string_of_int (i + floffset); raise Exit)
		    done; x
		  with Exit -> x
		else x) ret in
    (ret, List.map (fun (_, x) -> x) fl)

let string_of_a x =
  if x.ac = - 1 then
    sprintf "%s : " x.nm
  else if x.ac = 0 then
    sprintf "\t%s" x.nm
  else if x.ac = 1 then
    sprintf "\t%s\t%s" x.nm x.a1
      (*  else if x.ac = 2 then
	  sprintf "\t%s\t%s %s" x.nm x.a1 x.a2*)
  else if x.ac = 2 then
    sprintf "\t%s\t%s %s" x.nm x.a1 x.a2
  else 
    sprintf "\t%s\t%s %s %s" x.nm x.a1 x.a2 x.a3

let string_of_alist (x, _) =
  sprintf "%s\n"
    (String.concat "\n"
       (List.map (fun y -> string_of_a y) x))

let get_label_index y name =
  (List.find (fun x -> x.nm = name && x.ac = - 1) y).index

exception ImValueOverflow
exception Exit5
exception Exit6

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
	  | _ -> raise Exit6
    else if x.ac = 2 then
      let y = opcode_of x.nm in
      let z = int_of_reg x.a1 in
      let w = int_of_reg x.a2 in
	sprintf "%04X0000\n" ((y lsl 10) lor (z lsl 5) lor w)
    else if x.ac = 3 then
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
	    int_of_string x.a3
	else (get_label_index l x.a3) - x.index in
	if u < (- 32768) || u > 32767 then raise ImValueOverflow
	else
	  sprintf "%04X%04X\n" ((y lsl 10) lor (z lsl 5) lor w) (u land 0xffff)
    else raise Exit5 in
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
