	nop
	nop
L_main_27 : 
	addi	r2 r0 30
	addi	r3 r0 5
	call	L_fib_10
	call	min_caml_print_int
	jump	L_end_24
L_fib_10 : 
	subi	r2 r2 2
	addi	r4 r0 1
	bne	r3 r4 L_else_25
	addi	r3 r0 0
	jump	L_endif_26
L_else_25 : 
	addi	r4 r0 1
	sub	r4 r3 r4
	store	r3 r2 0
	add	r3 r0 r4
	call	L_fib_10
	addi	r4 r0 2
	load	r5 r2 0
	sub	r4 r5 r4
	store	r3 r2 1
	add	r3 r0 r4
	call	L_fib_10
	load	r4 r2 1
	add	r3 r4 r3
L_endif_26 : 
	addi	r2 r2 2
	return
L_end_24 : 
	