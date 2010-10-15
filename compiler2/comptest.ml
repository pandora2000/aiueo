let p = create_array 3 1.0 in
  p.(0) <- 1.0;
  p.(1) <- 2.0;
  p.(2) <- 1.0;
  if p.(0) < p.(1) then print_int 777 else print_int 222;
  if p.(0) <= p.(1) then print_int 777 else print_int 222;
  if p.(0) > p.(1) then print_int 777 else print_int 222;
  if p.(0) >= p.(1) then print_int 777 else print_int 222;
  if p.(0) <> p.(1) then print_int 777 else print_int 222;
  if p.(0) = p.(1) then print_int 777 else print_int 222;
  if p.(0) < p.(2) then print_int 777 else print_int 222;
  if p.(0) <= p.(2) then print_int 777 else print_int 222;
  if p.(0) > p.(2) then print_int 777 else print_int 222;
  if p.(0) >= p.(2) then print_int 777 else print_int 222;
  if p.(0) <> p.(2) then print_int 777 else print_int 222;
  if p.(0) = p.(2) then print_int 777 else print_int 222
