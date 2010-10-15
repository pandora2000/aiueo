main :
	addi	r2 r0 0
	addi	r3 r0 0
	addi	r4 r0 1
	call	L_fib_9
	call	min_caml_print_int
	jump	L_End_22
L_fib_9 :
	addi	r5 r0 0
	bne	r2 r5 L_Else_23
	add	r2 r0 r3
	jump	L_Endif_24
L_Else_23 :
	addi	r5 r0 1
	sub	r2 r2 r5
	add	r3 r3 r4
	add	r1 r0 r4
	add	r4 r0 r3
	add	r3 r0 r1
	call	L_fib_9
L_Endif_24 :
	return
L_End_22 :
