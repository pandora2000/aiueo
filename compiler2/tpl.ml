let rec fib x =
  let (n, a, b) = x in
    if n = 0 then a else fib (n - 1, b, a + b) in
  print_int (fib (7, 0, 1))

