	.data
	.globl	camlGlobals__data_begin
camlGlobals__data_begin:
	.text
	.globl	camlGlobals__code_begin
camlGlobals__code_begin:
	.data
	.long	30720
	.globl	camlGlobals
camlGlobals:
	.space	120
	.data
	.long	2301
camlGlobals__1:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__2:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__3:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__4:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__5:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__6:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__7:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__8:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__9:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__10:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__11:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__12:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__13:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__14:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__15:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__16:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__17:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__18:
	.long	0x0, 0x41cdcd65
	.data
	.long	2301
camlGlobals__19:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__20:
	.long	0x0, 0x406fe000
	.data
	.long	2301
camlGlobals__21:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__22:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__23:
	.long	0x0, 0x0
	.data
	.long	2301
camlGlobals__24:
	.long	0x0, 0x0
	.text
	.align	16
	.globl	camlGlobals__entry
camlGlobals__entry:
	subl	$8, %esp
.L100:
	pushl	$1
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L101:
	addl	$8, %esp
	movl	%eax, camlGlobals
	pushl	$camlGlobals__24
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L102:
	addl	$8, %esp
	movl	%eax, %ebx
	movl	$48, %eax
	call	caml_allocN
.L103:
	leal	4(%eax), %eax
	movl	$11264, -4(%eax)
	movl	$1, (%eax)
	movl	$1, 4(%eax)
	movl	$1, 8(%eax)
	movl	$1, 12(%eax)
	movl	%ebx, 16(%eax)
	movl	%ebx, 20(%eax)
	movl	$1, 24(%eax)
	movl	%ebx, 28(%eax)
	movl	%ebx, 32(%eax)
	movl	%ebx, 36(%eax)
	movl	%ebx, 40(%eax)
	pushl	%eax
	pushl	$121
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L104:
	addl	$8, %esp
	movl	%eax, camlGlobals + 4
	pushl	$camlGlobals__23
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L105:
	addl	$8, %esp
	movl	%eax, camlGlobals + 8
	pushl	$camlGlobals__22
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L106:
	addl	$8, %esp
	movl	%eax, camlGlobals + 12
	pushl	$camlGlobals__21
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L107:
	addl	$8, %esp
	movl	%eax, camlGlobals + 16
	pushl	$camlGlobals__20
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L108:
	addl	$8, %esp
	movl	%eax, camlGlobals + 20
	pushl	$-1
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L109:
	addl	$8, %esp
	pushl	%eax
	pushl	$101
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L110:
	addl	$8, %esp
	movl	%eax, camlGlobals + 24
	movl	camlGlobals + 24, %ebx
	movl	-4(%ebx), %eax
	shrl	$9, %eax
	cmpl	$1, %eax
	jbe	.L111
	movl	(%ebx), %eax
	pushl	%eax
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L112:
	addl	$8, %esp
	pushl	%eax
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L113:
	addl	$8, %esp
	movl	%eax, camlGlobals + 28
	pushl	$camlGlobals__19
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L114:
	addl	$8, %esp
	movl	%eax, camlGlobals + 32
	pushl	$1
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L115:
	addl	$8, %esp
	movl	%eax, camlGlobals + 36
	pushl	$camlGlobals__18
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L116:
	addl	$8, %esp
	movl	%eax, camlGlobals + 40
	pushl	$camlGlobals__17
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L117:
	addl	$8, %esp
	movl	%eax, camlGlobals + 44
	pushl	$1
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L118:
	addl	$8, %esp
	movl	%eax, camlGlobals + 48
	pushl	$camlGlobals__16
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L119:
	addl	$8, %esp
	movl	%eax, camlGlobals + 52
	pushl	$camlGlobals__15
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L120:
	addl	$8, %esp
	movl	%eax, camlGlobals + 56
	pushl	$camlGlobals__14
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L121:
	addl	$8, %esp
	movl	%eax, camlGlobals + 60
	pushl	$camlGlobals__13
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L122:
	addl	$8, %esp
	movl	%eax, camlGlobals + 64
	pushl	$1
	pushl	$5
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L123:
	addl	$8, %esp
	movl	%eax, camlGlobals + 68
	pushl	$1
	pushl	$5
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L124:
	addl	$8, %esp
	movl	%eax, camlGlobals + 72
	pushl	$camlGlobals__12
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L125:
	addl	$8, %esp
	movl	%eax, camlGlobals + 76
	pushl	$camlGlobals__11
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L126:
	addl	$8, %esp
	movl	%eax, camlGlobals + 80
	pushl	$camlGlobals__10
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L127:
	addl	$8, %esp
	movl	%eax, camlGlobals + 84
	pushl	$camlGlobals__9
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L128:
	addl	$8, %esp
	movl	%eax, camlGlobals + 88
	pushl	$camlGlobals__8
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L129:
	addl	$8, %esp
	movl	%eax, camlGlobals + 92
	pushl	$camlGlobals__7
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L130:
	addl	$8, %esp
	movl	%eax, camlGlobals + 96
	pushl	$camlGlobals__6
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L131:
	addl	$8, %esp
	movl	%eax, camlGlobals + 100
	pushl	$camlGlobals__5
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L132:
	addl	$8, %esp
	movl	%eax, 0(%esp)
	pushl	%eax
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L133:
	addl	$8, %esp
	movl	%eax, %ecx
	call	caml_alloc2
.L134:
	leal	4(%eax), %ebx
	movl	$2048, -4(%ebx)
	movl	0(%esp), %eax
	movl	%eax, (%ebx)
	movl	%ecx, 4(%ebx)
	pushl	%ebx
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L135:
	addl	$8, %esp
	pushl	%eax
	pushl	$11
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L136:
	addl	$8, %esp
	movl	%eax, camlGlobals + 104
	pushl	$camlGlobals__4
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L137:
	addl	$8, %esp
	movl	%eax, 0(%esp)
	pushl	$camlGlobals__3
	pushl	$7
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L138:
	addl	$8, %esp
	movl	%eax, 4(%esp)
	movl	0(%esp), %eax
	pushl	%eax
	pushl	$121
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L139:
	addl	$8, %esp
	movl	%eax, %ecx
	call	caml_alloc2
.L140:
	leal	4(%eax), %ebx
	movl	$2048, -4(%ebx)
	movl	4(%esp), %eax
	movl	%eax, (%ebx)
	movl	%ecx, 4(%ebx)
	movl	%ebx, camlGlobals + 108
	pushl	$camlGlobals__2
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L141:
	addl	$8, %esp
	movl	%eax, 0(%esp)
	pushl	%eax
	pushl	$1
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L142:
	addl	$8, %esp
	movl	%eax, %ecx
	movl	$28, %eax
	call	caml_allocN
.L143:
	leal	4(%eax), %ebx
	movl	$2048, -4(%ebx)
	movl	0(%esp), %eax
	movl	%eax, (%ebx)
	movl	%ecx, 4(%ebx)
	leal	12(%ebx), %eax
	movl	$3072, -4(%eax)
	movl	$1, (%eax)
	movl	%ebx, 4(%eax)
	movl	$camlGlobals__1, 8(%eax)
	pushl	%eax
	pushl	$361
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L144:
	addl	$8, %esp
	movl	%eax, camlGlobals + 112
	pushl	$1
	pushl	$3
	movl	$caml_make_vect, %eax
	call	caml_c_call
.L145:
	addl	$8, %esp
	movl	%eax, camlGlobals + 116
	movl	$1, %eax
	addl	$8, %esp
	ret
.L111:	call	caml_ml_array_bound_error
	.type	camlGlobals__entry,@function
	.size	camlGlobals__entry,.-camlGlobals__entry
	.data
	.text
	.globl	camlGlobals__code_end
camlGlobals__code_end:
	.data
	.globl	camlGlobals__data_end
camlGlobals__data_end:
	.long	0
	.globl	camlGlobals__frametable
camlGlobals__frametable:
	.long	44
	.long	.L145
	.word	20
	.word	0
	.align	4
	.long	.L144
	.word	20
	.word	0
	.align	4
	.long	.L143
	.word	12
	.word	2
	.word	0
	.word	5
	.align	4
	.long	.L142
	.word	20
	.word	1
	.word	8
	.align	4
	.long	.L141
	.word	20
	.word	0
	.align	4
	.long	.L140
	.word	12
	.word	2
	.word	4
	.word	5
	.align	4
	.long	.L139
	.word	20
	.word	1
	.word	12
	.align	4
	.long	.L138
	.word	20
	.word	1
	.word	8
	.align	4
	.long	.L137
	.word	20
	.word	0
	.align	4
	.long	.L136
	.word	20
	.word	0
	.align	4
	.long	.L135
	.word	20
	.word	0
	.align	4
	.long	.L134
	.word	12
	.word	2
	.word	0
	.word	5
	.align	4
	.long	.L133
	.word	20
	.word	1
	.word	8
	.align	4
	.long	.L132
	.word	20
	.word	0
	.align	4
	.long	.L131
	.word	20
	.word	0
	.align	4
	.long	.L130
	.word	20
	.word	0
	.align	4
	.long	.L129
	.word	20
	.word	0
	.align	4
	.long	.L128
	.word	20
	.word	0
	.align	4
	.long	.L127
	.word	20
	.word	0
	.align	4
	.long	.L126
	.word	20
	.word	0
	.align	4
	.long	.L125
	.word	20
	.word	0
	.align	4
	.long	.L124
	.word	20
	.word	0
	.align	4
	.long	.L123
	.word	20
	.word	0
	.align	4
	.long	.L122
	.word	20
	.word	0
	.align	4
	.long	.L121
	.word	20
	.word	0
	.align	4
	.long	.L120
	.word	20
	.word	0
	.align	4
	.long	.L119
	.word	20
	.word	0
	.align	4
	.long	.L118
	.word	20
	.word	0
	.align	4
	.long	.L117
	.word	20
	.word	0
	.align	4
	.long	.L116
	.word	20
	.word	0
	.align	4
	.long	.L115
	.word	20
	.word	0
	.align	4
	.long	.L114
	.word	20
	.word	0
	.align	4
	.long	.L113
	.word	20
	.word	0
	.align	4
	.long	.L112
	.word	20
	.word	0
	.align	4
	.long	.L110
	.word	20
	.word	0
	.align	4
	.long	.L109
	.word	20
	.word	0
	.align	4
	.long	.L108
	.word	20
	.word	0
	.align	4
	.long	.L107
	.word	20
	.word	0
	.align	4
	.long	.L106
	.word	20
	.word	0
	.align	4
	.long	.L105
	.word	20
	.word	0
	.align	4
	.long	.L104
	.word	20
	.word	0
	.align	4
	.long	.L103
	.word	12
	.word	1
	.word	3
	.align	4
	.long	.L102
	.word	20
	.word	0
	.align	4
	.long	.L101
	.word	20
	.word	0
	.align	4

	.section .note.GNU-stack,"",%progbits
