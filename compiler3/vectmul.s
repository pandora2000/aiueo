	nop
	nop
L_main_140 : 
	addi	r2 r0 4094
	addi	r3 r0 17000
	muli	r3 r3 10
	addi	r4 r0 8193
	store	r4 r0 8192
	addi	r4 r0 10
	addi	r5 r0 1
	call	min_caml_create_array
	addi	r5 r0 10
	addi	r6 r0 0
	store	r4 r2 0
	add	r4 r0 r5
	add	r5 r0 r6
	call	min_caml_create_array
	addi	r4 r0 0
	addi	r5 r0 2
	load	r6 r2 0
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 1
	addi	r5 r0 3
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 2
	addi	r5 r0 4
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 3
	addi	r5 r0 5
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 4
	addi	r5 r0 6
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 5
	addi	r5 r0 7
	add	r4 r6 r4
	store	r5 r4 0
	addi	r4 r0 0
	addi	r5 r0 2
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 1
	addi	r5 r0 3
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 2
	addi	r5 r0 4
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 3
	addi	r5 r0 5
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 4
	addi	r5 r0 6
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 5
	addi	r5 r0 7
	add	r4 r7 r4
	store	r5 r4 0
	addi	r4 r0 10
	addi	r5 r0 0
	addi	r8 r0 0
	call	L_vm_42
	call	min_caml_print_int
	jump	L_end_134
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
	bne	r5 r0 L_else_137
	return
L_else_137 : 
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
	bne	r5 r0 L_else_138
	return
L_else_138 : 
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
L_vm_42 : 
	addi	r9 r0 0
	bne	r4 r9 L_else_139
	add	r4 r0 r8
	return
L_else_139 : 
	addi	r9 r0 1
	sub	r4 r4 r9
	addi	r9 r0 1
	add	r9 r5 r9
	add	r10 r6 r5
	load	r10 r10 0
	add	r5 r7 r5
	load	r5 r5 0
	mul	r5 r10 r5
	add	r8 r8 r5
	add	r5 r0 r9
	jump	L_vm_42
L_end_134 : 
	store	r4 r0 4095
