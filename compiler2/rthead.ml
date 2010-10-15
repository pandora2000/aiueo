
let rec fiszero x = if x = 0.0 then true else false in
let rec fispos x = if x > 0.0 then true else false in
let rec fisneg x = if x < 0.0 then true else false in
let rec fabs x = if x < 0.0 then -. x else x in
  (*flessこれであってるよね？*)
let rec fless x y = if x < y then true else false in
let rec fhalf x = x /. 2.0 in
let rec fneg x = -. x in
let rec fsqr x = x *. x in
  (*TODO:誤差の見積り必要*)
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
    +. 0.00833333333333333322 *. x5 -. 0.166666666666666657 *. x3 +. x in
let rec pcos x =
  let x2 = x *. x in
  let x4 = x2 *. x2 in
  let x6 = x4 *. x2 in
  let x8 = x6 *. x2 in
  let x10 = x8 *. x2 in
  let x12 = x10 *. x2 in
    2.08767569878681e-09 *. x12 -. 2.75573192239858883e-07 *. x10
    +. 2.48015873015873e-05 *. x8 -. 0.00138888888888888894 *. x6
    +. 0.0416666666666666644 *. x4 -. 0.5 *. x2 +. 1.0 in
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
      else -. psin (pi +. x)  in
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
      else -. pcos (pi +. x) in
let rec atan x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  let x9 = x7 *. x2 in
  let x11 = x9 *. x2 in
  let x13 = x11 *. x2 in
    0.0769230769230769273 *. x13 -. 0.0909090909090909116 *. x11
    +. 0.111111111111111105 *. x9 -. 0.142857142857142849 *. x7
    +. 0.2 *. x5 -. 0.333333333333333315 *. x3 +. x in
  (*
    let rec sqrt a =
    let x = 1.0 in
    let h = 1.0 -. a *. x *. x in
    x *. (1.0 +. h *. (0.5 +. h *. (0.375 +. h
    *. (0.3125 +. h *. (0.2734375 +. h *. 0.24609375))))) in
  *)
let rec isqrt a x n =
  if n = 0 then x else isqrt a (x *. (3.0 -. a *. x *. x) /. 2.0) (n - 1) in
let rec sqrt a = a *. (isqrt a 1.0 10) in
  ()
    (*
      read_float
      read_int
      print_int
      int_of_float
      float_of_int
    *)

