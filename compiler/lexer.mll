{
(* lexerが利用する変数、関数、型などの定義 *)
open Parser
open Type
open Syntax

}

(* 正規表現の略記 *)
let space = [' ' '\t' '\r']
let nl = '\n'
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']

rule token = parse
| space+
    { token lexbuf }
| nl
	{ incr line_num; char_num := (Lexing.lexeme_end lexbuf) + 1; token lexbuf }
| "(*"
    { comment lexbuf; (* ネストしたコメントのためのトリック *)
      token lexbuf }
| '('
    { LPAREN }
| ')'
    { RPAREN }
| "true"
    { BOOL(true) }
| "false"
    { BOOL(false) }
| "not"
    { NOT }
| digit+ (* 整数を字句解析するルール (caml2html: lexer_int) *)
    { INT(int_of_string (Lexing.lexeme lexbuf)) }
| digit+ ('.' digit*)? (['e' 'E'] ['+' '-']? digit+)?
    { FLOAT(float_of_string (Lexing.lexeme lexbuf)) }
| '-' (* -.より後回しにしなくても良い? 最長一致? *)
    { MINUS }
| '+' (* +.より後回しにしなくても良い? 最長一致? *)
    { PLUS }
| "-."
    { MINUS_DOT }
| "+."
	{ PLUS_DOT }
| "*"
	    { AST }
| "*."
    { AST_DOT }
| "/"
    { SLASH }
| "/."
    { SLASH_DOT }
| '='
    { EQUAL }
| "<>"
    { LESS_GREATER }
| "<="
    { LESS_EQUAL }
| ">="
    { GREATER_EQUAL }
| '<'
    { LESS }
| '>'
    { GREATER }
| "if"
    { IF }
| "then"
    { THEN }
| "else"
    { ELSE }
| "let"
    { LET }
| "in"
    { IN }
| "rec"
    { REC }
| ','
    { COMMA }
| '_'
    { IDENT(Id.gentmp Type.Unit) }
| "create_array" (* [XX] ad hoc *)
	{ ARRAY_CREATE }
| "float_of_int" (* [XX] ad hoc *)
	    { FLOAT_OF_INT }
| "floor" (* [XX] ad hoc *)
	    { FLOOR }
| '.'
    { DOT }
| "<-"
    { LESS_MINUS }
| ';'
    { SEMICOLON }
| eof
    { EOF}
| lower (digit|lower|upper|'_')* (* 他の「予約語」より後でないといけない *)
	{ IDENT(Lexing.lexeme lexbuf) }
| _
    { failwith
	(Printf.sprintf "unknown token %s near lines %d, characters %d"
	   (Lexing.lexeme lexbuf)
	   !line_num
	   ((Lexing.lexeme_start lexbuf) - !char_num + 2)
	) }
and comment = parse
| "*)"
    { () }
| "(*"
    { comment lexbuf;
      comment lexbuf }
| eof
    { Format.eprintf "warning: unterminated comment@." }
| _
    { comment lexbuf }
