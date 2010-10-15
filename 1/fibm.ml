let rec fib n =
  if n = 0 then
    0 else
      if
	n
	= 1
      else
	1
      else
	fib
	  (n - 1) + fib (n - 2) in
  print_int (fib 4)
