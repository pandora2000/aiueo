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
    +. 0.6666666666666666666666 *. x3 /. d2 +. x /. d;;


let atan x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x3 *. x2 in
  let x7 = x5 *. x2 in
  let x9 = x7 *. x2 in
  let x11 = x9 *. x2 in
  let x13 = x11 *. x2 in
    0.0769230769230769273 *. x13 -. 0.0909090909090909116 *. x11
    +. 0.111111111111111105 *. x9 -. 0.142857142857142849 *. x7
    +. 0.2 *. x5 -. 0.333333333333333315 *. x3 +. x;;
