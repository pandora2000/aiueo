open Printf

let rec isqrt a x n =
  if n = 0 then x else isqrt a (x *. (3.0 -. a *. x *. x) /. 2.0) (n - 1);;
let rec sqrt a = a *. (isqrt a
			 (if a <= 1.0 then 1.0 else 1.0 /. a)
			 15) in
  
  for i = 0 to 10 do
    let x = Random.float 1.0e+3 in
    let a = Pervasives.sqrt x in
    let b = sqrt x in
    let y = Pervasives.abs_float (a -. b) in
      if y > 1.0e-10 then
	printf "%f\t%f\t%f\n" x a b
  done
	
