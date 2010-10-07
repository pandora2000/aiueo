open Asm
open Printf


let ltostr (Id.L x) = x
  (*
    external gethi : float -> int32 = "gethi"
    external getlo : float -> int32 = "getlo"
  (*    
    let stackset = ref S.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
    let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)
    let save x =
    stackset := S.add x !stackset;
    if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
    let savef x =
    stackset := S.add x !stackset;
    if not (List.mem x !stackmap) then
    (let pad =
    if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
    stackmap := !stackmap @ pad @ [x; x])
    let locate x =
    let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
    loc !stackmap
    let offset x = 4 * List.hd (locate x)
    let stacksize () = align ((List.length !stackmap + 1) * 4)
  *)    
    let pp_id_or_imm = function
    | V(x) -> x
    | C(i) -> string_of_int i
  *)
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
	  (*
	    type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
	    let rec g oc = function (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
	    | dest, Ans(exp) -> g' oc (dest, exp)
	    | dest, Let((x, t), exp, e) ->
	    g' oc (NonTail(x), exp);
	    g oc (dest, e)
	    and g' oc = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
	  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
	    | NonTail(_), Nop -> ()
	    | NonTail(x), Add(p, y) when x = y && p = zreg -> ()
	    | NonTail(x), Fadd(fp, y) when x = y && fp = fzreg -> ()
	    | NonTail(x), Add(y, z') -> Printf.fprintf oc "\tadd\t%s %s %s\n" x y z'
	    | NonTail(x), Sub(y, z') -> Printf.fprintf oc "\tsub\t%s %s %s\n" x y z'
	    | NonTail(x), Mul(y, z') -> Printf.fprintf oc "\tmul\t%s %s %s\n" x y z'
	    | NonTail(x), Fadd(y, z') -> Printf.fprintf oc "\tfadd\t%s %s %s\n" x y z'
	    | NonTail(x), Fsub(y, z') -> Printf.fprintf oc "\tfsub\t%s %s %s\n" x y z'
	    | NonTail(x), Fmul(y, z') -> Printf.fprintf oc "\tfmul\t%s %s %s\n" x y z'
	    | NonTail(x), Load(y, z') -> Printf.fprintf oc "\tload\t%s %s %s\n" x y (string_of_int z')
	    | NonTail(_), Store(x, y, z') -> Printf.fprintf oc "\tstore\t%s %s %s\n" x y (string_of_int z')
	    | NonTail(x), Fload(y, z') -> Printf.fprintf oc "\tfload\t%s %s %s\n" x y (string_of_int z')
	    | NonTail(_), Fstore(x, y, z') -> Printf.fprintf oc "\tfstore\t%s %s %s\n" x y (string_of_int z')
	  (* 末尾だったら計算結果を第一レジスタにセットしてret (caml2html: emit_tailret) *)
	    | Tail, (Nop | Store _ | Fstore _ | Save _ as exp) ->
	    g' oc (NonTail(Id.gentmp Type.Unit), exp);
	    Printf.fprintf oc "\treturn\n"
	    | Tail, (Add _ | Sub _ | Load _ as exp) ->
	    g' oc (NonTail(regs.(0)), exp);
	    Printf.fprintf oc "\treturn\n"
	    | Tail, (Fadd _ | Fsub _ | Fmul _ | Fdiv _ | Fload _  as exp) ->
	    g' oc (NonTail(fregs.(0)), exp);
	    Printf.fprintf oc "\treturn\n"
	  (* 退避の仮想命令の実装 (caml2html: emit_save) *)(*このセクションはまだ*)
	    | NonTail(_), Save(x, y) when List.mem x allregs && not (S.mem y !stackset) ->
	    save y;
	    Printf.fprintf oc "\tstore\t%s %s %d\n" x reg_sp (offset y)
	    | NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
	    savef y;
	    Printf.fprintf oc "\tstd\t%s, [%s + %d]\n" x reg_sp (offset y)
	    | NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
	  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
	    | NonTail(x), Restore(y) when List.mem x allregs ->
	    Printf.fprintf oc "\tld\t[%s + %d], %s\n" reg_sp (offset y) x
	    | NonTail(x), Restore(y) ->
	    assert (List.mem x allfregs);
	    Printf.fprintf oc "\tldd\t[%s + %d], %s\n" reg_sp (offset y) x
	    
	    | Tail, (Restore(x) as exp) ->
	    (match locate x with
	    | [i] -> g' oc (NonTail(regs.(0)), exp)
	    | [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp)
	    | _ -> assert false);
	    Printf.fprintf oc "\treturn\n"
	  (*If関連はまだ*)
	    | Tail, IfEq(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_tail_if oc e1 e2 "be" "bne"
	    | Tail, IfLE(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_tail_if oc e1 e2 "ble" "bg"
	    | Tail, IfGE(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_tail_if oc e1 e2 "bge" "bl"
	    | Tail, IfFEq(x, y, e1, e2) ->
	    Printf.fprintf oc "\tfcmpd\t%s, %s\n" x y;
	    Printf.fprintf oc "\tnop\n";
	    g'_tail_if oc e1 e2 "fbe" "fbne"
	    | Tail, IfFLE(x, y, e1, e2) ->
	    Printf.fprintf oc "\tfcmpd\t%s, %s\n" x y;
	    Printf.fprintf oc "\tnop\n";
	    g'_tail_if oc e1 e2 "fble" "fbg"
	    | NonTail(z), IfEq(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_non_tail_if oc (NonTail(z)) e1 e2 "be" "bne"
	    | NonTail(z), IfLE(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bg"
	    | NonTail(z), IfGE(x, y', e1, e2) ->
	    Printf.fprintf oc "\tcmp\t%s, %s\n" x (pp_id_or_imm y');
	    g'_non_tail_if oc (NonTail(z)) e1 e2 "bge" "bl"
	    | NonTail(z), IfFEq(x, y, e1, e2) ->
	    Printf.fprintf oc "\tfcmpd\t%s, %s\n" x y;
	    Printf.fprintf oc "\tnop\n";
	    g'_non_tail_if oc (NonTail(z)) e1 e2 "fbe" "fbne"
	    | NonTail(z), IfFLE(x, y, e1, e2) ->
	    Printf.fprintf oc "\tfcmpd\t%s, %s\n" x y;
	    Printf.fprintf oc "\tnop\n";
	    g'_non_tail_if oc (NonTail(z)) e1 e2 "fble" "fbg"
	  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
	    | Tail, CallCls(_, _, _) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
	    raise Exit
	    | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
	    g'_args oc [] ys zs;
	    Printf.fprintf oc "\tjump\t%s\n" x
	    | NonTail(_), CallCls(_, _, _) ->
	    raise Exit
	    | NonTail(a), CallDir(Id.L(x), ys, zs) ->
	    g'_args oc [] ys zs;
	    Printf.fprintf oc "\tcall\t%s\n" x;
	    if List.mem a allregs && a <> regs.(0) then
	    Printf.fprintf oc "\tadd\t%%r0 %s %s\n" regs.(0) a
	    else if List.mem a allfregs && a <> fregs.(0) then
	    Printf.fprintf oc "\tfadd\t%%f0 %s %s\n" fregs.(0) a
	    
	    and g'_tail_if oc e1 e2 b bn =
	    let b_else = Id.genid (b ^ "_else") in
	    Printf.fprintf oc "\t%s\t%s\n" bn b_else;
	    Printf.fprintf oc "\tnop\n";
	    let stackset_back = !stackset in
	    g oc (Tail, e1);
	    Printf.fprintf oc "%s:\n" b_else;
	    stackset := stackset_back;
	    g oc (Tail, e2)
	    and g'_non_tail_if oc dest e1 e2 b bn =
	    let b_else = Id.genid (b ^ "_else") in
	    let b_cont = Id.genid (b ^ "_cont") in
	    Printf.fprintf oc "\t%s\t%s\n" bn b_else;
	    Printf.fprintf oc "\tnop\n";
	    let stackset_back = !stackset in
	    g oc (dest, e1);
	    let stackset1 = !stackset in
	    Printf.fprintf oc "\tb\t%s\n" b_cont;
	    Printf.fprintf oc "\tnop\n";
	    Printf.fprintf oc "%s:\n" b_else;
	    stackset := stackset_back;
	    g oc (dest, e2);
	    Printf.fprintf oc "%s:\n" b_cont;
	    let stackset2 = !stackset in
	    stackset := S.inter stackset1 stackset2
	  *)
	  
(*
  
  let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

  let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc ".section\t\".rodata\"\n";
  Printf.fprintf oc ".align\t8\n";
  List.iter
  (fun (Id.L(x), d) ->
  Printf.fprintf oc "%s:\t! %f\n" x d;
  Printf.fprintf oc "\t.long\t0x%lx\n" (gethi d);
  Printf.fprintf oc "\t.long\t0x%lx\n" (getlo d))
  data;
  Printf.fprintf oc ".section\t\".text\"\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc ".global\tmin_caml_start\n";
  Printf.fprintf oc "min_caml_start:\n";
  Printf.fprintf oc "\tsave\t%%sp, -112, %%sp\n"; (* from gcc; why 112? *)
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail("%g0"), e);
  Printf.fprintf oc "\tret\n";
  Printf.fprintf oc "\trestore\n"


*)	    


type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)

let finst0 name =
  sprintf "\t%s\n" name
let finst1 name a =
  sprintf "\t%s\t%s\n" name a
let finst2 name a b =
  sprintf "\t%s\t%s %s\n" name a b
let finst3 name a b c =
  sprintf "\t%s\t%s %s %s\n" name a b c
let flabel name =
  sprintf "%s :\n" name
    
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
    (String.concat "" (List.map
			 (fun (y, r) -> finst3 "add" r zreg y)
			 (shuffle swreg yrs))) ^
      (String.concat "" (List.map
			   (fun (z, fr) -> finst3 "fadd" fr fzreg z)
			   (shuffle fswreg zfrs)))
      
let rec h e ret =
  match e with
      (*zreg最適化*)
    | Add(x, y) -> finst3 "add" ret x y 
    | Sub(x, y) -> finst3 "sub" ret x y
    | Addi(x, y) -> finst3 "addi" ret x (string_of_int y)
    | IfEq(x, y, z, w) ->
	(*相対jumpの距離について*)
	let el = Id.genid "Else" in
	let en = Id.genid "Endif" in
	  (finst3 "bne" x y el) ^
	    (g z) ^
	    (finst1 "jump" en) ^
	    (flabel el) ^
	    (g w) ^
	    (flabel en)
    | CallDir(Id.L x, y, z) ->
	(call_args y z) ^
	(finst1 "call" x)
and g = function
  | Ans(x) -> h x regs.(0)
  | Let((x, t), exp, e) ->
      (h exp x) ^ (g e)

let f (Prog (_, fundefs, e)) =
  let en = Id.genid "End" in
    sprintf "%s%s%s%s%s"
      (flabel "main") (g e) (finst1 "jump" en)
      (String.concat "" (List.map (fun x ->
				     sprintf "%s%s%s"
				       (flabel (ltostr x.name))
				       (g x.body)
				       (finst0 "return")) fundefs))
      (flabel en)


      

