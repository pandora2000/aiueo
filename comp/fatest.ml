let rec vm x y = x.(0) *. y.(0) in
let a = create_array 1 0.0 in
let b = create_array 1 0.0 in
  a.(0) <- 2.0;
  b.(0) <- 3.0;
  print_int (vm a b)
