open Printf

let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
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

      
let memhp = 170000
let memsp = 4095
let memext = 4096
let memin = 6144
let memout = 8192(*memoutの値はmemout+1で初期化*)
let floffset = 0

let extlist =
  [
    (*記述がなければすべて0で初期化*)
    "screen", 0;(*3*)
    "screenz_dir", 3;(*3*)
    "screenx_dir", 6;(*3*)
    "screeny_dir", 9;(*3*)
    "viewpoint", 12;(*3*)
    "light", 15;(*3*)
    "intersection_point", 18;(*3*)
    "intersected_object_id", 19;(*1*)
    "nvector", 22;(*3*)
    "texture_color", 25;(*3*)
    "diffuse_ray", 28;(*3*)
    "rgb", 31;(*3*)
    "image_size", 34;(*2*)
    "image_center", 36;(*2*)
    "scan_pitch", 38;(*1*)
    "startp", 39;(*3*)
    "startp_fast", 42;(*3*)
    "ptrace_dirvec", 45;(*3*)
    "n_objects", 48;(*1*)
    "solver_dist", 49;(*1*)
    "intsec_rectside", 50;(*1*)
    "n_reflections", 51;(*1*)
    "dirvecs", 52;(*多分なんで初期化してもOK*)(*5*)
    "beam", 57;(*255.0*)(*1*)
    "tmin", 58;(*1000000000.0*)(*1*)
    "or_net", 59;(*長さ1のint配列,その配列は-1で初期化*)(*中身は60で60は-1に*)
    "and_net", 61;(*長さ1のint配列,その配列は-1で初期化*)(*中身は直後で-1に*)
    "reflections", 161;(*長さ3のタプル*)
    "light_dirvec", 881;(*全体がタプル,第1要素は長さ3の配列(0),第2要素は長さ60の配列*)
    (*dummyはfloat配列(0, 0, 0, 0, dummy, dummy, false, dummy, dummy, dummy, dummy)*)
    "objects", 946;
  ]

let lexbuf outchan a = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
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
  let al = (List.map (fun (x, y) -> ("min_caml_" ^ x, y)) extlist) in
    (*    Syntax.print_prog stdout a;*)
  let b = Typing.f al a in
  let c = KNormal.f b in
  let d = Alpha.f c in
  let e = iter !limit d in
  let f = Closure.f e in
  let g = Virtual.f memin memout memext al f in
  let h = RegAlloc.f g in
  let i = Emit.f memext memout memsp memhp floffset h in
  let j = Emit.string_of_binary i in
    (*
      Closure.print_prog stdout f
      KNormal.print_prog stdout e;
      Asm.print_prog stdout g;
    *)
    
      output_string stdout (prep (Emit.string_of_alist i));
      print_newline ();
    
    
      output_string stdout j;
      (*
      print_newline ();
	output_string stdout (sprintf "%d\n"
      *)
    ()
    (*
let string s = lexbuf stdout (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)
    *)
    (*
let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
  let inchan = open_in f in
  let outchan = stdout in
    try
      lexbuf outchan (Lexing.from_channel inchan);
      close_in inchan;
      close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)
    *)
      
let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
  let files = ref [] in
    Arg.parse
      [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
       ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
      (fun s -> files := !files @ [s])
      ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
	 Printf.sprintf
	 "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
    let p = List.map (fun x -> 
			let inchan = open_in (x ^ ".ml") in
			let a = Parser.exp Lexer.token (Lexing.from_channel inchan) in
			  close_in inchan; a) !files in
    let q = List.fold_right (fun b a ->
			       if a = Syntax.Unit then b
			       else Syntax.addexp b a) p Syntax.Unit in
      lexbuf stdout q
      
