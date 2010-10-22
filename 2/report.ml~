(*次のコードをα変換した後、K正規化をする*)
(*K正規化の簡単な最適化を行っている*)

let rec x x =
  let x =
    let x = x - -x
    in x -
	 (let x = -x in x - -x)
  in x - -x
in
let x = x 125 in
  x - -x

(*let rec x xとした場合、の中身の式で使用されるxは引数のものである。
  よって引数と同じものを表すものだけ変数名を変更すると*)

let rec x a =
  let x =
    let x = a - -a
    in x -
	 (let x = -x in x - -x)
  in x - -x
in
let x = x 125 in
  x - -x

(*次に関数内の一番外側のxの束縛*)

    
let rec x a =
  let b =
    let x = a - -a
    in x -
	 (let x = -x in x - -x)
  in b - -b
in
let x = x 125 in
  x - -x

(*次にその内側のxの束縛*)
    
let rec x a =
  let b =
    let c = a - -a
    in c -
	 (let x = -c in x - -x)
  in b - -b
in
let x = x 125 in
  x - -x

(*次にその下のx*)
    
let rec x a =
  let b =
    let c = a - -a
    in c -
	 (let d = -c in d - -d)
  in b - -b
in
let x = x 125 in
  x - -x

(*次に関数x*)
    
let rec e a =
  let b =
    let c = a - -a
    in c -
	 (let d = -c in d - -d)
  in b - -b
in
let x = e 125 in
  x - -x

(*次に最後のx*)
    
let rec e a =
  let b =
    let c = a - -a
    in c -
	 (let d = -c in d - -d)
  in b - -b
in
let f = e 125 in
  f - -f

(*K正規化*)
(*簡単な最適化をやっている。*)
    
let rec e a =
  let b =
    let g = -a in
    let c = a - g in
    let h =
      let d = -c in
      let i = -d in
	d - i in
      c - h in
  let j = -b in
    b - j in
let f = e 125 in
let k = -f in
  f - k

(*A正規化*)

(*dを外側へ*)
    
let rec e a =
  let b =
    let g = -a in
    let c = a - g in
    let d = -c in
    let h =
      let i = -d in
	d - i in
      c - h in
  let j = -b in
    b - j in
let f = e 125 in
let k = -f in
  f - k

(*iを外側へ*)

let rec e a =
  let b =
    let g = -a in
    let c = a - g in
    let d = -c in
    let i = -d in
    let h = d - i in
      c - h in
  let j = -b in
    b - j in
let f = e 125 in
let k = -f in
  f - k

(*g, c, d, i, hを外側へ*)

let rec e a =
  let g = -a in
  let c = a - g in
  let d = -c in
  let i = -d in
  let h = d - i in
  let b = c - h in
  let j = -b in
    b - j in
let f = e 125 in
let k = -f in
  f - k

(*インライン化の際に、α変換を行わないとプログラムの意味が変わる例*)
(*ただし、元のプログラムは正しくα変換されているとする*)
    

(*α変換されていなければ*)

let z = 3 in
let rec f x =
  z + x in
let z = 1 in
  f z;;

let rec f x =
  let z = 3 in
    z + x in
let z = 1 in
  f z;;

(*などの例がある。このような状況がα変換後に達成されるようなプログラムを考える*)
(*後者の例の展開されることで新たにzが束縛される点に注目する。*)
(*zの束縛を被らせるには、再帰的な呼び出しのインライン展開をすればよい*)
(*逆に再帰的ではないところで展開しても、束縛がかぶることはない*)

let rec f x y =
  let z = y in
    if y = 0 then z + x else f z 0 in
  f 1 1;;

(*このようなプログラムだと、f z 0を展開すると*)

let rec f x y =
  let z = y in
    if y = 0 then z + x else
      let z = 0 in
	if 0 = 0 then z + z else f z 0 in
  f 1 1;;

(*となって実行結果が変わる*)


(*インライン化・定数畳み込みを交互に繰り返す最適化で、
  プログラムのサイズは増えないが、回数制限がないと止まらない例*)
(*但し、最適化せずに実行すると正常に停止するとする*)

(*インライン化も定数畳み込みもできない。あるいはやっても同じになる場合、停止したとみなす*)

(*入力が完全に与えられている場合、定数畳み込みによる計算→関数適用に突き当たる
  →インライン展開のようにすれば（つまり、引数が全て定数の場合のみインライン展開する）
  これはプログラムを実際に実行しているのと変わりはない。
  なので、入力が完全に与えられている場合でこのような例はない。*)

(*以下では、与えられればどのような入力でも停止する関数で、
  関数の中身のみの最適化を行った場合、最適化が停止しない例を考える*)

(*インライン展開で増えて、定数畳み込みで減る。これを繰り返すようなプログラムを考える*)

(*定数畳み込みは局所的に見て分かることは全部やる*)
(*例えば、*)
if 0 = 0 then 0 else 1;;
(*は1になるし*)
if x mod 2 = 0 then 0
else if x mod 2 = 1 then 1
else 2;;
(*は*)
if x mod 2 = 0 then 0 else 1;;
(*になる*)

(*定数畳み込みは局所的に分かることは全部計算するとする。
  「局所的に」とは、関数適用を掘り下げてまで推測することは無いというような意味。*)
(*例えば、下の関数で、この関数は全ての値に対し0を返すから、let f x = 0にするというのはやらない。*)

let rec f x =
  if x > 0 then 0 else f (x + 1);;

(*この関数は全ての入力に対して停止し、インライン展開により*)

let rec f x =
  if x > 0 then 0 else
    if (x + 1) > 0 then 0 else f ((x + 1) + 1);;

(*となり、定数畳み込みでx > 0ならx + 1 > 0であることを用いて*)

let rec f x =
  if (x + 1) > 0 then 0 else f (x + 2);;

(*となってコード量は増えずに無限に最適化は繰り返される。*)

