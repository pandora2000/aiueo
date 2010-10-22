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

let hex_of_int num = 
  let digit0 = num land 0x0f in
  let digit1 = (num lsr 4) land 0x0f in
  let digit0_chr = String.get "0123456789ABCDEF" digit0 in
  let digit1_chr = String.get "0123456789ABCDEF" digit1 in
  let lst_chr = [digit1_chr; digit0_chr] in
    String.concat "" (List.map (fun ch -> String.make 1 ch) lst_chr)

let int_of_hex chr =
  let cd = Char.code chr in
    if cd <= 57 then 
      (cd-48)
    else
      (cd-55)

let get_each_byte line n =
    let l = int_of_hex (String.get line n) in
    let r = int_of_hex (String.get line (n+1)) in
      (l lsl 4) lor r

let rec send_hex_data in_cnl out_cnl =
  let line = input_line in_cnl in 
  let byte3 = get_each_byte line 0 in
  let byte2 = get_each_byte line 2 in
  let byte1 = get_each_byte line 4 in
  let byte0 = get_each_byte line 6 in
    output_byte out_cnl byte3; flush out_cnl;  
    output_byte out_cnl byte2; flush out_cnl;
    output_byte out_cnl byte1; flush out_cnl;  
    output_byte out_cnl byte0; flush out_cnl;
    send_uart ()

let send_sld_data in_cnl out_cnl =
  let num = String.create 5 in
  let rec send_all_data () =
    let rec send_data index =
      let char = input_char in_cnl in
      let code = Char.code char in
	if code = 46 || (48 <= code && code <= 57) then
	  (String.set index char; send_data (index+1))
	else if index > 0 then
	  output_byte out_cnl (int_of_string (String.sub num 0 (index-1))) 
	else
	  send_data index
    in send_data 0
  in send_all_data () 
    

let send_data sendfile sendcnl sendfunc =
  let port = openfile sendfile [O_RDONLY] 0 in
  let cnl  = in_channel_of_descr port in
    try 
      sendfunc cnl sendcnl 
    with x -> 
      close_in cnl; raise x 

let _=
  let wr_port = openfile "/dev/ttyUSB0" [O_WRONLY] 0 in
  let rd_port = openfile "/dev/ttyUSB0" [O_RDONLY] 0 in
  let _= set_params wr_port 9600 8 NOPARITY 1 NOFLOW in
  let _= set_params rd_port 9600 8 NOPARITY 1 NOFLOW in
  let wr_cnl = out_channel_of_descr wr_port in
  let rd_cnl = in_channel_of_descr rd_port in
  let _ = send_data Sys.argv.(1) wr_cnl send_hex_data in
  let _ = send_data Sys.argv.(2) wr_cnl send_hex_data in
  let _ = send_data Sys.argv.(3) wr_cnl send_sld_data in
  let rec monitor_uart _=
    let newint0 = int_of_char (input_char cnl) in 
    let newhex0 = hex_of_int newint0 in
      print_endline newhex0;  
      monitor_uart () in
    try
      monitor_uart ()
    with x->
      close_in cnl;
      raise x
