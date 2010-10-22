	nop
	nop
L_main_48 :
	addi	r2 r0 4095
	addi	r3 r0 17000
	muli	r3 r3 10
	addi	r4 r0 8193
	store	r4 r0 8192
	addi	r4 r0 10
	call	L_fib_11
	call	min_caml_print_int
	jump	L_end_41
min_caml_print_int :
	load	r5 r0 8192
	addi	r6 r5 1
	store	r6 r0 8192
	store	r4 r5 0
	return
min_caml_read_int :
	load	r4 r0 6144
	addi	r5 r4 1
	store	r5 r0 6144
	load	r4 r4 0
	return
min_caml_read_float :
	load	r4 r0 6144
	addi	r5 r4 1
	store	r5 r0 6144
	fload	r4 r4 0
	return
min_caml_init_array :
	store	r6 r4 0
	subi	r5 r5 1
	bne	r5 r0 L_else_44
	return
L_else_44 :
	addi	r4 r4 1
	jump	min_caml_init_array
min_caml_create_array :
	subi	r2 r2 1
	add	r6 r0 r3
	add	r3 r3 r4
	store	r6 r2 0
	add	r1 r0 r6
	add	r6 r0 r5
	add	r5 r0 r4
	add	r4 r0 r1
	call	min_caml_init_array
	load	r4 r2 0
	add	r4 r0 r4
	addi	r2 r2 1
	return
min_caml_init_float_array :
	fstore	f2 r4 0
	subi	r5 r5 1
	bne	r5 r0 L_else_45
	return
L_else_45 :
	addi	r4 r4 1
	jump	min_caml_init_float_array
min_caml_create_float_array :
	subi	r2 r2 1
	add	r5 r0 r3
	add	r3 r3 r4
	store	r5 r2 0
	add	r1 r0 r5
	add	r5 r0 r4
	add	r4 r0 r1
	call	min_caml_init_float_array
	load	r4 r2 0
	add	r4 r0 r4
	addi	r2 r2 1
	return
L_fib_11 :
	subi	r2 r2 2
	addi	r5 r0 0
	bne	r4 r5 L_else_46
	addi	r4 r0 0
	addi	r2 r2 2
	return
L_else_46 :
	addi	r5 r0 1
	bne	r4 r5 L_else_47
	addi	r4 r0 1
	addi	r2 r2 2
	return
L_else_47 :
	addi	r5 r0 1
	sub	r5 r4 r5
	store	r4 r2 0
	add	r4 r0 r5
	call	L_fib_11
	addi	r5 r0 2
	load	r6 r2 0
	sub	r5 r6 r5
	store	r4 r2 1
	add	r4 r0 r5
	call	L_fib_11
	load	r5 r2 1
	add	r4 r5 r4
	addi	r2 r2 2
	return
L_end_41 :
	store	r4 r0 4095
