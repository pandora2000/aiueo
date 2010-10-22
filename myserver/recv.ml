(* compile with `ocamlc [opts...] unix.cma Uartsmpl.ml' *)
open Unix

type parity_type = ODD | EVEN | NOPARITY
type flowctl_type = XON | NOFLOW
let set_params fd baud bytelen parity stopbits flowctl=
  let attr=tcgetattr fd in
    begin
      attr.c_obaud<-baud;
      attr.c_ibaud<-baud;
      attr.c_csize<-bytelen;
      attr.c_ignbrk<-true;
      attr.c_brkint<-false;
      attr.c_parmrk<-false;
      attr.c_istrip<-false;
      attr.c_inlcr<-false;
      attr.c_igncr<-false;
      attr.c_icrnl<-false;
      attr.c_opost<-false;
      attr.c_cread<-true;
      attr.c_hupcl<-false;
      attr.c_clocal<-true;
      attr.c_isig<-false;
      attr.c_icanon<-false;
      attr.c_noflsh<-false;
      attr.c_echo<-false;
      attr.c_echonl<-false;
      begin
	match parity with
	  | ODD -> begin
	      attr.c_parodd<-true;
	      attr.c_parenb<-true;
	      attr.c_inpck<-true
	    end
	  | EVEN -> begin
	      attr.c_parodd<-false;
	      attr.c_parenb<-true;
	      attr.c_inpck<-true
	    end
	  | NOPARITY -> begin
	      attr.c_parenb<-false;
	      attr.c_inpck<-false
	    end
      end;
      attr.c_cstopb<-stopbits;
      begin
	match flowctl with
	  | XON -> begin
	      attr.c_ixon<-true;
	      attr.c_ixoff<-true
	    end
	  | NOFLOW -> begin
	      attr.c_ixon<-false;
	      attr.c_ixoff<-false
	    end
      end;
      tcsetattr fd TCSADRAIN attr
    end

let hex_of_byte num =
  let digit0 = num land 0x0f in
  let digit1 = (num lsr 4) land 0x0f in
  let digit0_chr = String.get "0123456789ABCDEF" digit0 in
  let digit1_chr = String.get "0123456789ABCDEF" digit1 in
  let lst_chr = [digit1_chr; digit0_chr] in
    String.concat "" (List.map (fun ch -> String.make 1 ch) lst_chr)

      
let hexl_of_Int32 num =
  List.map Int32.to_int [Int32.shift_right_logical num 24;
			 Int32.logand (Int32.shift_right_logical num 16) (Int32.of_int 0xff);
			 Int32.logand (Int32.shift_right_logical num 8) (Int32.of_int 0xff);
			 Int32.logand num (Int32.of_int 0xff)]
    

let get_sld_data cnl = List.map Int32.of_int [1;1;1;1;1;12;2;2;2;4]

let send_byte cnl x = output_byte cnl x
let send_one cnl x = List.iter (fun y -> send_byte cnl y) (hexl_of_Int32 x)
let send_sld_data cnl data = List.iter (fun x -> send_one cnl x) data

let _ =
  (*
  let iuartport = openfile "/dev/ttyUSB0" [O_WRONLY] 0 in
  let ouartport = openfile "/dev/ttyUSB0" [O_RDONLY] 0 in
  let _ = set_params iuartport 9600 8 NOPARITY 1 NOFLOW in
    let _ = set_params ouartport 9600 8 NOPARITY 1 NOFLOW in
  *)
    (*  let icnl = in_channel_of_descr iuartport in*)
  let icnl = in_channel_of_descr stdin in
    (*  let ocnl = out_channel_of_descr ouartport in*)
  let ocnl = out_channel_of_descr stdout in
  let sldcnl = open_in "test.sld" in
  let slddata = get_sld_data sldcnl in
    try
      while (int_of_char (input_char icnl)) = 0xaa do () done;
      send_sld_data ocnl slddata;
      while true do print_char (input_char icnl) done
    with x ->
      close_in icnl;
      close_in sldcnl;
      close_out ocnl;
      raise x
