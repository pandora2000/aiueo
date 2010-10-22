let rec vm n i x y p =
  if n = 0 then p
  else
    vm (n - 1) (i + 1) x y (p +. x.(i) *. y.(i)) in
let a = create_array 6 0.0 in
let b = create_array 6 0.0 in
  a.(0) <- 2.0;
  a.(1) <- 3.0;
  a.(2) <- 4.0;
  a.(3) <- 5.0;
  a.(4) <- 6.0;
  a.(5) <- 7.0;
  b.(0) <- 2.0;
  b.(1) <- 3.0;
  b.(2) <- 4.0;
  b.(3) <- 5.0;
  b.(4) <- 6.0;
  b.(5) <- 7.0;
  print_int (vm 10 0 a b 0.0)
