let rec fib a b c =
  if a = 0 then b else
    fib (a - 1) c (b + c) in
  print_int (fib 0 0 1)
