let _ =
  let ocnl = open_out "testin" in
  let icnl = open_in "result.ppm" in
    output_byte ocnl 0xaa;
    try
      while true do
	output_byte ocnl (input_byte icnl)
      done
    with _ ->
      close_in icnl;
      close_out ocnl
