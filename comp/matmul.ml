
let rec subinit x p =
  let n = 10 in
    if p = n then x else (x.(p) <- create_array n 0.0; subinit x (p + 1)) in
let rec init x = subinit x 0 in
let rec sssmatmul x y z i j k =
  let n = 10 in
    if j = n then () else
      (z.(i).(k) <- z.(i).(k) +. x.(i).(j) *. y.(j).(k);
       sssmatmul x y z i (j + 1) k) in
let rec ssmatmul x y z i k =
  let n = 10 in
    if k = n then () else
      (sssmatmul x y z i 0 k; ssmatmul x y z i (k + 1)) in
let rec smatmul x y z i =
  let n = 10 in
    if i = n then () else
      (ssmatmul x y z i 0; smatmul x y z (i + 1)) in
let rec matmul x y z = smatmul x y z 0 in
let rec fid x = x +. 0.0 in
let n = 10 in
let dummy = create_array n 0.0 in
let a = create_array n dummy in
let b = create_array n dummy in
let c = create_array n dummy in
let a = init a in
let b = init b in
let c = init c in
  a.(0).(0) <- 1.0;
  a.(0).(1) <- 0.0;
  a.(0).(2) <- 0.0;
  a.(1).(0) <- 0.0;
  a.(1).(1) <- 2.0;
  a.(1).(2) <- 0.0;
  a.(2).(0) <- 0.0;
  a.(2).(1) <- 0.0;
  a.(2).(2) <- 3.0;
  b.(0).(0) <- 1.0;
  b.(0).(1) <- 0.0;
  b.(0).(2) <- 0.0;
  b.(1).(0) <- 0.0;
  b.(1).(1) <- 2.0;
  b.(1).(2) <- 0.0;
  b.(2).(0) <- 0.0;
  b.(2).(1) <- 0.0;
  b.(2).(2) <- 3.0;
  matmul a b c;
  fid c.(2).(2)
