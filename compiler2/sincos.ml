open Printf

let rec psin x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  let x9 = x7 *. x2 in
  let x11 = x9 *. x2 in
  let x13 = x11 *. x2 in
    1.60590437852430377e-10 *. x13 -. 2.50521083854417202e-08 *. x11
    +. 2.75573192239858925e-06 *. x9 -. 0.000198412698412698413 *. x7
    +. 0.00833333333333333322 *. x5 -. 0.166666666666666657 *. x3 +. x;;
let rec pcos x =
  let x2 = x *. x in
  let x4 = x2 *. x2 in
  let x6 = x4 *. x2 in
  let x8 = x4 *. x4 in
  let x10 = x6 *. x4 in
  let x12 = x6 *. x6 in
  let x14 = x8 *. x6 in
    2.08767569878681e-09 *. x12 -. 2.75573192239858883e-07 *. x10
    +. 2.48015873015873e-05 *. x8 -. 0.00138888888888888894 *. x6
    +. 0.0416666666666666644 *. x4 -. 0.5 *. x2 +. 1.0;;
  (*-pi~piと仮定TODO:*)
let rec sin x =
  let pio4 = 0.78539816339744830961566084 in
  let pio2 = 1.57079632679489661923132169 in
  let pi3o4 = 2.3561944901923449288469825 in
  let pi = 3.1415926535897932384626433832 in
    if x > 0.0 then
      if x <= pio4 then psin x
      else if x <= pi3o4 then pcos (x -. pio2)
      else psin (pi -. x) 
    else
      if x >= -. pio4 then psin x
      else if x >= -. pi3o4 then -. pcos (pio2 +. x)
      else -. psin (pi +. x);;
let rec cos x =
  let pio4 = 0.78539816339744830961566084 in
  let pio2 = 1.57079632679489661923132169 in
  let pi3o4 = 2.3561944901923449288469825 in
  let pi = 3.1415926535897932384626433832 in
    if x > 0.0 then
      if x <= pio4 then pcos x
      else if x <= pi3o4 then -. psin (x -. pio2)
      else -. pcos (pi -. x) 
    else
      if x >= -. pio4 then pcos x
      else if x >= -. pi3o4 then psin (x +. pio2)
      else -. pcos (pi +. x);;
let pi = 3.1415926535897932384626433832;;
  for i = 0 to 1000000 do
    let x = Random.float pi in
    let a = Pervasives.sin x in
    let b = sin x in
    let y = a -. b in
      if Pervasives.abs_float y > 1.0e-10 then
	printf "%f\t%f\n" a b
  done
	
