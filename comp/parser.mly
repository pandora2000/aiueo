%{
  (* parserが利用する変数、関数、型などの定義 *)
  open Syntax
  open Lexing
    
  let addtyp x = (x, Type.gentyp ())

%}

/* 字句を表すデータ型の定義 (caml2html: parser_token) */
%token <bool> BOOL
%token <int> INT
%token <float> FLOAT
%token  NOT
%token  MINUS
%token  PLUS
%token  MINUS_DOT
%token  PLUS_DOT
%token AST
%token  AST_DOT
%token  SLASH_DOT
%token  EQUAL
%token  LESS_GREATER
%token  LESS_EQUAL
%token  GREATER_EQUAL
%token   LESS
%token   GREATER
%token   IF
%token   THEN
%token   ELSE
%token <Id.t> IDENT
%token   LET
%token   IN
%token   REC
%token   COMMA
%token   ARRAY_CREATE
%token   DOT
%token   LESS_MINUS
%token   SEMICOLON
%token   LPAREN
%token   RPAREN
%token  EOF
%token FLOAT_OF_INT
%token FLOOR
%token SLASH
%token PC PF RI RF
  
  

/* 優先順位とassociativityの定義（低い方から高い方へ） (caml2html: parser_prior) */
%right prec_let
%right SEMICOLON
%right prec_if
%right LESS_MINUS
%left COMMA
%left EQUAL LESS_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS PLUS_DOT MINUS_DOT
%left AST_DOT SLASH_DOT AST SLASH
%right prec_unary_minus
%left prec_app
%left DOT

/* 開始記号の定義 */
%type <Syntax.t> exp
%start exp

%%

  simple_exp: /* 括弧をつけなくても関数の引数になれる式 (caml2html: parser_simple) */
| LPAREN exp RPAREN
      { $2 }
| LPAREN RPAREN
	  { Unit }
| BOOL
	      { Bool($1) }
| INT
		  { Int($1) }
| FLOAT
		      { Float($1) }
| IDENT
 			  { Var($1) }
| simple_exp DOT LPAREN exp RPAREN
			      {
				let p = Parsing.rhs_start_pos 2 in
				  Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Get($1, $4)) }

			      exp: /* 一般の式 (caml2html: parser_exp) */
| simple_exp
				  { $1 }
| NOT exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Not($2)) }
| MINUS exp
%prec prec_unary_minus
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, match $2 with
	   | Float(f) -> Float(-.f) (* -1.23などは型エラーではないので別扱い *)
	   | e -> Neg(e)) }
| exp PLUS exp /* 足し算を構文解析するルール (caml2html: parser_add) */
    {
      let p = Parsing.rhs_start_pos 2 in
	Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Add($1, $3)) }
| exp MINUS exp
	{
	  let p = Parsing.rhs_start_pos 2 in
	    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Sub($1, $3)) }
| exp EQUAL exp
	    {
	      let p = Parsing.rhs_start_pos 2 in
		Info({ln = p.pos_lnum; cn=0 }, Eq($1, $3)) }
| exp LESS_GREATER exp
		{
		  let p = Parsing.rhs_start_pos 2 in
		    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Not(Eq($1, $3))) }
| exp LESS exp
		    {
		      let p = Parsing.rhs_start_pos 2 in
			Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Not(LE($3, $1))) }
| exp GREATER exp
			{
			  let p = Parsing.rhs_start_pos 2 in
			    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Not(LE($1, $3))) }
| exp LESS_EQUAL exp
			    {
			      let p = Parsing.rhs_start_pos 2 in
				Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, LE($1, $3)) }
| exp GREATER_EQUAL exp
				{
				  let p = Parsing.rhs_start_pos 2 in
				    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, LE($3, $1)) }
| IF exp THEN exp ELSE exp
%prec prec_if
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, If($2, $4, $6)) }
| MINUS_DOT exp
%prec prec_unary_minus
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, FNeg($2)) }
| exp PLUS_DOT exp
    {
      let p = Parsing.rhs_start_pos 2 in
	Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, FAdd($1, $3)) }
| exp MINUS_DOT exp
	{
	  let p = Parsing.rhs_start_pos 2 in
	    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, FSub($1, $3)) }
| exp AST exp
	    {
	      let p = Parsing.rhs_start_pos 2 in
		Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Mul($1, $3)) }
| exp SLASH exp
	    {
	      let p = Parsing.rhs_start_pos 2 in
		Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Div($1, $3)) }
| exp AST_DOT exp
	    {
	      let p = Parsing.rhs_start_pos 2 in
		Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, FMul($1, $3)) }
| exp SLASH_DOT exp
		{
		  let p = Parsing.rhs_start_pos 2 in
		    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, FDiv($1, $3)) }
| LET IDENT EQUAL exp IN exp
%prec prec_let
{ Let(addtyp $2, $4, $6) }
| LET REC fundef IN exp
%prec prec_let
{
  let p = Parsing.rhs_start_pos 3 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol }, LetRec($3, $5)) }
| exp actual_args
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, App($1, $2)) }
| elems
    { Tuple($1) }
| LET LPAREN pat RPAREN EQUAL exp IN exp
	{
	  let p = Parsing.rhs_start_pos 1 in
	    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, LetTuple($3, $6, $8)) }
| simple_exp DOT LPAREN exp RPAREN LESS_MINUS exp
	    {
	      let p = Parsing.rhs_start_pos 6 in
		Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Put($1, $4, $7)) }
| exp SEMICOLON
		{ $1 }
| exp SEMICOLON exp SEMICOLON
		{ Let((Id.gentmp Type.Unit, Type.Unit), $1, $3) }
| exp SEMICOLON exp 
		    { Let((Id.gentmp Type.Unit, Type.Unit), $1, $3) }
| ARRAY_CREATE simple_exp simple_exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Array($2, $3)) }
| FLOAT_OF_INT exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Float_of_int($2)) }
| FLOOR exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Floor($2)) }
| PC exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Pc($2)) }
| PF exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Pf($2)) }
| RI exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Ri($2)) }
| RF exp
%prec prec_app
{
  let p = Parsing.rhs_start_pos 1 in
    Info({ln = p.pos_lnum; cn=p.pos_cnum - p.pos_bol}, Rf($2)) }
| error
    {
      failwith
	(Printf.sprintf "parse error near lines %d, characters %d"
	   !line_num
	   (Parsing.symbol_start () - !char_num + 2) )
    }

    fundef:
| IDENT formal_args EQUAL exp
	{ { name = addtyp $1; args = $2; body = $4 } }

	formal_args:
| IDENT formal_args
	    { addtyp $1 :: $2 }
| IDENT
		{ [addtyp $1] }

		actual_args:
| actual_args simple_exp
%prec prec_app
{ $1 @ [$2] }
| simple_exp
%prec prec_app
{ [$1] }

elems:
| elems COMMA exp
    { $1 @ [$3] }
| exp COMMA exp
	{ [$1; $3] }

	pat:
| pat COMMA IDENT
	    { $1 @ [addtyp $3] }
| IDENT COMMA IDENT
		{ [addtyp $1; addtyp $3] }
