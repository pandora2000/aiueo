let rec fact x = if x = 1 then 1 else (x + (fact (x - 1))) in
  (print_int 3;
   print_int 4;)
