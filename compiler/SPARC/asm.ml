(* SPARC assembly with a few virtual instructions *)

open Printf


type id_or_imm = V of Id.t | C of int
type t = (* 命令の列 (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* 一つ一つの命令に対応する式 (caml2html: sparcasm_exp) *)
  | Nop
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mul of Id.t * Id.t
  | And of Id.t * Id.t
  | Or of Id.t * Id.t
  | Nor of Id.t * Id.t
  | Xor of Id.t * Id.t
  | Addi of Id.t * int
  | Subi of Id.t * int
  | Muli of Id.t * int
  | Andi of Id.t * int
  | Ori of Id.t * int
  | Nori of Id.t * int
  | Xori of Id.t * int
  | Fadd of Id.t * Id.t
  | Fsub of Id.t * Id.t
  | Fmul of Id.t * Id.t
  | Finv of Id.t * Id.t
  | Fsqrt of Id.t * Id.t
  | Fdiv of Id.t * Id.t
  | Float_of_int of Id.t
  | Floor of Id.t
  | Load of Id.t * int
  | Store of Id.t * Id.t * int
  | Fload of Id.t * int
  | Fstore of Id.t * Id.t * int
      (* virtual instructions *)
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
  | IfGE of Id.t * Id.t * t * t (* 左右対称ではないので必要 *)
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
      (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 (caml2html: sparcasm_save) *)
  | Restore of Id.t (* スタック変数から値を復元 (caml2html: sparcasm_restore) *)
      
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
    (* プログラム全体 = 浮動小数点数テーブル + トップレベル関数 + メインの式 (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let ltostr (Id.L x) = x

let ii_tostr = function
  | V x -> x
  | C x -> string_of_int x
      
let string_of_vinst = function
  | Floor _ -> "Floor" | Float_of_int _ -> "Foi"
  | Nop -> "Nop" | Add _ -> "Add" | Sub _ -> "Sub" | Mul _ -> "Mul"
  | And _ -> "And" | Or _ -> "Or" | Nor _ -> "Nor" | Xor _ -> "Xor"
  | Addi _ -> "Addi" | Subi _ -> "Subi" | Muli _ -> "Muli" | Andi _ -> "Andi"
  | Ori _ -> "Ori" | Nori _ -> "Nori" | Xori _ -> "Xori" | Fadd _ -> "Fadd"
  | Fsub _ -> "Fsub" | Fmul _ -> "Fmul" | Finv _ -> "Finv" | Fsqrt _ -> "Fsqrt"
  | Fdiv _ -> "Fdiv" | Load _ -> "Load" | Store _ ->  "Store" | Fload _ -> "Fload"
  | Fstore _ ->  "Fstore" | IfEq _ -> "IfEq" | IfLE _ -> "IfLE" | IfGE _ -> "IfGE"
  | IfFEq _ -> "IfEFq" | IfFLE _ -> "IfFLE" | CallCls _ -> "CallCls" | CallDir _ -> "CallDir"
  | Save _ -> "Save" | Restore _ -> "Restore"
  
let rec soe level e =
  let nl = level + 1 in
  let i = String.make level ' ' in
  let son = string_of_vinst in
    match e with
      | Nop -> sprintf "%s%s\n" i (son e)
      | Floor(x) | Float_of_int(x) -> 
	  sprintf "%s%s(%s)\n" i (son e) x
      | Add (x, y) | Sub (x, y) | Mul (x, y) | And (x, y) | Or (x, y)
      | Nor (x, y) | Xor (x, y) | Fadd (x, y) | Fsub (x, y)
      | Fmul (x, y) | Finv (x, y) | Fsqrt (x, y) | Fdiv (x, y) ->
	  sprintf "%s%s(%s, %s)\n" i (son e) x y
      | Addi (x, y) | Subi (x, y) | Muli (x, y) | Andi (x, y)
      | Ori (x, y) | Nori (x, y) | Xori (x, y) | Load (x, y)
      | Fload (x, y) ->
	  sprintf "%s%s(%s, %d)\n" i (son e) x y
      | Store (x, y, z) | Fstore (x, y, z) ->
	  sprintf "%s%s(%s, %s, %d)\n" i (son e) x y z
      | IfEq (x, y, z, w) | IfLE (x, y, z, w) | IfGE (x, y, z, w) ->
	  sprintf "%s%s(%s, %s)\n%s%sElse\n%s" i (son e) x y (sop nl z) i (sop nl w)
      | IfFEq (x, y, z, w) | IfFLE (x, y, z, w) ->
	  sprintf "%s%s(%s, %s)\n%s%sElse\n%s" i (son e) x y (sop nl z) i (sop nl w)
      | CallCls _ -> raise Exit
      | CallDir (x, y, z) ->
	  sprintf "%s%s(%s, [%s], [%s])\n" i (son e) (ltostr x)
	    (String.concat ", " y) (String.concat ", " z)
      | Save (x, y) -> sprintf "%s%s(%s, %s)\n" i (son e) x y
      | Restore x -> sprintf "%s%s(%s)\n" i (son e) x
and sop level e =
  let i = String.make level ' ' in
  let nl = level + 1 in
    match e with
      | Ans x ->
	  sprintf "%sRet <-\n%s" i (soe nl x)
      | Let ((x, _), z, w) ->
	  sprintf "%s%s <-\n%s%s" i x (soe nl z) (sop level w)
	    
let print_prog outchan (Prog (fl, l, e)) =
  output_string outchan (sprintf "%s\n" (string_of_int (List.length fl)));
  List.iter (fun x ->
	       output_string outchan (sprintf "%s:\n" (ltostr x.name));
	       output_string outchan (sop 1 x.body)) l;
  output_string outchan "main:\n";
  output_string outchan (sop 1 e)

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
  (*なにもせずにLetで並列実行*)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)
  (*
    let regs = (* Array.init 16 (fun i -> Printf.sprintf "%%r%d" i) *)
    [| "%i2"; "%i3"; "%i4"; "%i5";
    "%l0"; "%l1"; "%l2"; "%l3"; "%l4"; "%l5"; "%l6"; "%l7";
    "%o0"; "%o1"; "%o2"; "%o3"; "%o4"; "%o5" |]*)
  
let regs =  Array.init 29 (fun i -> Printf.sprintf "%%r%d" (i + 4))
let fregs = Array.init 30 (fun i -> Printf.sprintf "%%f%d" (i + 2))
let allregs = Array.to_list regs
let allfregs = Array.to_list fregs
let zreg = "%r0"
let fzreg = "%f0"
let swreg = "%r1"
let fswreg = "%f1"
let spreg = "%r2"
let hpreg = "%r3"

let int_of_reg x =
  int_of_string (String.sub x 2 ((String.length x) - 2))
  
let is_reg x = (x.[0] = '%')
  
  (* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

      
let rec fv_exp = function
  | Nop | Restore _ -> []
  | Save(x, _) | Floor(x) | Float_of_int(x) -> [x]
  | Add(y, z) | Sub(y, z) | Mul(y, z) | And(y, z) 
  | Or(y, z) | Nor(y, z) | Xor(y, z) | Fadd(y, z) 
  | Fsub(y, z) | Fmul(y, z) | Finv(y, z) | Fsqrt(y, z)
  | Fdiv(y, z) | Store(y, z, _) | Fstore(y, z, _) ->
      [y; z]
  | Addi(y, _) | Subi(y, _) | Muli(y, _) | Andi(y, _)
  | Ori(y, _) | Nori(y, _) | Xori(y, _) | Load(y, _) | Fload(y, _) ->
      [y]
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) | IfGE(x, y, e1, e2) ->
      x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) ->
      x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

(*tであるe1をxtに入れてe2をつなげる*)
(*Ansならそのままつなげる*)
(*LetならAnsまで降下する*)
let rec concat e1 xt e2 =
  match e1 with
    | Ans(exp) -> Let(xt, exp, e2)
    | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

	
let align i = (if i mod 8 = 0 then i else i + 4)
