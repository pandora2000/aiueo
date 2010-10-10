let rec fib x =
  let (n, a, b) = x in
    if n.(1) = 0 then a else fib (n, b, a + b) in
let p = Array.create 4 0 in
  p.(1) <- 4;
  print_int (fib (p, 0, 1))
  
