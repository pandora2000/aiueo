
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
  let dpi = 6.283185307179586476925286766 in
  let pi = 3.1415926535897932384626433832 in
    if pi < x then sin (x -. dpi)
    else if -. pi > x then sin (x +. dpi)
    else 
      let pio4 = 0.78539816339744830961566084 in
      let pio2 = 1.57079632679489661923132169 in
      let pi3o4 = 2.3561944901923449288469825 in
	if x > 0.0 then
	  if x <= pio4 then psin x
	  else if x <= pi3o4 then pcos (x -. pio2)
	  else psin (pi -. x) 
	else
	  if x >= -. pio4 then psin x
	  else if x >= -. pi3o4 then -. pcos (pio2 +. x)
	  else -. psin (pi +. x)  in
let rec cos x =
  let dpi = 6.283185307179586476925286766 in
  let pi = 3.1415926535897932384626433832 in
    if pi < x then cos (x -. dpi)
    else if -. pi > x then cos (x +. dpi)
    else 
      let pio4 = 0.78539816339744830961566084 in
      let pio2 = 1.57079632679489661923132169 in
      let pi3o4 = 2.3561944901923449288469825 in
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
  let d = 1.0 +. x2 in
  let d2 = d *. d in
  let d3 = d2 *. d in
  let d4 = d2 *. d2 in
  let d5 = d2 *. d3 in
  let d6 = d3 *. d3 in
  let x3 = x *. x2 in
  let x5 = x2 *. x3 in
  let x7 = x2 *. x5 in
  let x9 = x2 *. x7 in
  let x11 = x2 *. x9 in
    0.8080808080808080808080 *. x11 /. d6 +. 0.761904761904761904761904 *. x9 /. d5
    +. 0.6857142857142857142857 *. x7 /. d4 +. 0.5333333333333333333333333 *. x5 /. d3
    +. 0.6666666666666666666666 *. x3 /. d2 +. x /. d in
let rec isqrt a x n =
  if n = 0 then x else isqrt a (x *. (3.0 -. a *. x *. x) /. 2.0) (n - 1) in
let rec sqrt a = a *. (isqrt a
			 (if a <= 1.0 then 1.0 else 1.0 /. a)
			 15) in
  ()
