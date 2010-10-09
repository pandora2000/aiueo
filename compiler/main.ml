let limit = ref 1000

let rec iter n e = (* ��Ŭ�������򤯤꤫���� (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
    let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
      if e = e' then e else
	iter (n - 1) e'

let prep s =
  let r = ref "" in
    for i = 0 to String.length s - 1 do
      if s.[i] = '%' then () else r := !r ^ (String.make 1 s.[i])
    done; !r

let lexbuf outchan l = (* �Хåե��򥳥�ѥ��뤷�ƥ����ͥ�ؽ��Ϥ��� (caml2html: main_lexbuf) *)
  (*  Id.counter := 0;
      Typing.extenv := M.empty;
      let p = Emit.f
      (RegAlloc.f
      (Virtual.f
      (Closure.f
      (iter !limit
      (Alpha.f
      (KNormal.f
      (Typing.f
      (Parser.exp Lexer.token l)))))))) in
      output_string stdout (prep (Emit.string_of_alist p));
      print_newline ();
      output_string stdout (Emit.string_of_flist p);
      print_newline ();
      output_string stdout (Emit.string_of_binary p)
  *)			    
  

  Id.counter := 0;
  Typing.extenv := M.empty;
  let a = Parser.exp Lexer.token l in
  let b = Typing.f a in
  let c = KNormal.f b in
  let d = Alpha.f c in
  let e = iter !limit d in
  let f = Closure.f e in
  let g = Virtual.f f in
    KNormal.print_prog stdout c
      
let string s = lexbuf stdout (Lexing.from_string s) (* ʸ����򥳥�ѥ��뤷��ɸ����Ϥ�ɽ������ (caml2html: main_string) *)

let file f = (* �ե�����򥳥�ѥ��뤷�ƥե�����˽��Ϥ��� (caml2html: main_file) *)
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
    try
      lexbuf outchan (Lexing.from_channel inchan);
      close_in inchan;
      close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let () = (* �������饳��ѥ���μ¹Ԥ����Ϥ���� (caml2html: main_entry) *)
  let files = ref [] in
    Arg.parse
      [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
       ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
      (fun s -> files := !files @ [s])
      ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
	 Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
    List.iter
      (fun f -> ignore (file f))
      !files
