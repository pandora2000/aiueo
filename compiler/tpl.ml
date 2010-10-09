let rec fib x =
  let (n, a, b) = x in
    if n.(1) = 0 then a else fib (n, b, a + b) in
  print_int (fib (p, 0, 1))
  
