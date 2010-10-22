(* compile with `ocamlc [opts...] unix.cma Uartsmpl.ml' *)
open Unix

type parity_type = ODD | EVEN | NOPARITY
type flowctl_type = XON | NOFLOW
let set_params fd baud bytelen parity stopbits flowctl =
  let attr = tcgetattr fd in
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

let _ =
  let uartport = openfile "/dev/ttyUSB0" [O_WRONLY] 0 in
  let _ = set_params uartport 9600 8 NOPARITY 1 NOFLOW in
  let cnl = out_channel_of_descr uartport in
  let cnl = out_channel_of_descr stdout in
  let inc = in_channel_of_descr stdin in
  let rec send_uart () =
    let line = input_line inc in
    let byte3 = get_each_byte line 0 in
    let byte2 = get_each_byte line 2 in
    let byte1 = get_each_byte line 4 in
    let byte0 = get_each_byte line 6 in
      output_byte cnl byte3; flush cnl;
      output_byte cnl byte2; flush cnl;
      output_byte cnl byte1; flush cnl;
      output_byte cnl byte0; flush cnl;
      send_uart ()
  in
    try
      send_uart ()
    with x ->
      close_in inc;
      close_out cnl;
      raise x
