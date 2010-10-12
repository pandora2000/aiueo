	nop
	nop
L_main_8578 : 
	addi	r2 r0 4095
	addi	r3 r0 17000
	muli	r3 r3 10
	addi	r4 r0 8193
	store	r4 r0 8192
	addi	r4 r0 6145
	store	r4 r0 6144
	addi	r4 r0 128
	addi	r5 r0 128
	call	L_rt_2944
	addi	r4 r0 0
	jump	L_end_8272
min_caml_print_float : 
	load	r4 r0 8192
	addi	r5 r4 1
	store	r5 r0 8192
	fstore	f2 r4 0
	return
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
	fload	f2 r4 0
	return
min_caml_init_float_array : 
	bne	r5 r0 L_else_8276
	return
L_else_8276 : 
	fstore	f2 r4 0
	subi	r5 r5 1
	addi	r4 r4 1
	jump	min_caml_init_float_array
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
min_caml_init_array : 
	bne	r5 r0 L_else_8277
	return
L_else_8277 : 
	store	r6 r4 0
	subi	r5 r5 1
	addi	r4 r4 1
	jump	min_caml_init_array
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
L_fiszero_2427 : 
	fload	f3 r0 54
	fbne	f2 f3 L_else_8278
	addi	r4 r0 1
	return
L_else_8278 : 
	addi	r4 r0 0
	return
L_fispos_2429 : 
	fload	f3 r0 54
	fbgt	f2 f3 L_else_8279
	addi	r4 r0 0
	return
L_else_8279 : 
	addi	r4 r0 1
	return
L_fisneg_2431 : 
	fload	f3 r0 54
	fbgt	f3 f2 L_else_8280
	addi	r4 r0 0
	return
L_else_8280 : 
	addi	r4 r0 1
	return
L_fabs_2433 : 
	fload	f3 r0 54
	fbgt	f3 f2 L_else_8281
	fadd	f2 f0 f2
	return
L_else_8281 : 
	fsub	f2 f0 f2
	return
L_fless_2435 : 
	fbgt	f3 f2 L_else_8282
	addi	r4 r0 0
	return
L_else_8282 : 
	addi	r4 r0 1
	return
L_fhalf_2438 : 
	fload	f3 r0 53
	fdiv	f2 f2 f3
	return
L_fneg_2440 : 
	fsub	f2 f0 f2
	return
L_fsqr_2442 : 
	fmul	f2 f2 f2
	return
L_psin_2444 : 
	fmul	f3 f2 f2
	fmul	f4 f2 f3
	fmul	f5 f4 f3
	fmul	f6 f5 f3
	fmul	f7 f6 f3
	fmul	f8 f7 f3
	fmul	f3 f8 f3
	fload	f9 r0 52
	fmul	f3 f9 f3
	fload	f9 r0 51
	fmul	f8 f9 f8
	fsub	f3 f3 f8
	fload	f8 r0 50
	fmul	f7 f8 f7
	fadd	f3 f3 f7
	fload	f7 r0 49
	fmul	f6 f7 f6
	fsub	f3 f3 f6
	fload	f6 r0 48
	fmul	f5 f6 f5
	fadd	f3 f3 f5
	fload	f5 r0 47
	fmul	f4 f5 f4
	fsub	f3 f3 f4
	fadd	f2 f3 f2
	return
L_pcos_2446 : 
	fmul	f2 f2 f2
	fmul	f3 f2 f2
	fmul	f4 f3 f2
	fmul	f5 f4 f2
	fmul	f6 f5 f2
	fmul	f7 f6 f2
	fload	f8 r0 46
	fmul	f7 f8 f7
	fload	f8 r0 45
	fmul	f6 f8 f6
	fsub	f6 f7 f6
	fload	f7 r0 44
	fmul	f5 f7 f5
	fadd	f5 f6 f5
	fload	f6 r0 43
	fmul	f4 f6 f4
	fsub	f4 f5 f4
	fload	f5 r0 42
	fmul	f3 f5 f3
	fadd	f3 f4 f3
	fload	f4 r0 41
	fmul	f2 f4 f2
	fsub	f2 f3 f2
	fload	f3 r0 40
	fadd	f2 f2 f3
	return
L_sin_2448 : 
	fload	f3 r0 39
	fload	f4 r0 38
	fload	f5 r0 37
	fload	f6 r0 36
	fload	f7 r0 54
	fbgt	f2 f7 L_else_8283
	fload	f3 r0 35
	fbgt	f3 f2 L_else_8286
	jump	L_psin_2444
L_else_8286 : 
	fload	f3 r0 34
	fbgt	f3 f2 L_else_8287
	fadd	f2 f4 f2
	call	L_pcos_2446
	fsub	f2 f0 f2
	return
L_else_8287 : 
	fadd	f2 f6 f2
	call	L_psin_2444
	fsub	f2 f0 f2
	return
L_else_8283 : 
	fbgt	f2 f3 L_else_8284
	jump	L_psin_2444
L_else_8284 : 
	fbgt	f2 f5 L_else_8285
	fsub	f2 f2 f4
	jump	L_pcos_2446
L_else_8285 : 
	fsub	f2 f6 f2
	jump	L_psin_2444
L_cos_2450 : 
	fload	f3 r0 39
	fload	f4 r0 38
	fload	f5 r0 37
	fload	f6 r0 36
	fload	f7 r0 54
	fbgt	f2 f7 L_else_8288
	fload	f3 r0 35
	fbgt	f3 f2 L_else_8291
	jump	L_pcos_2446
L_else_8291 : 
	fload	f3 r0 34
	fbgt	f3 f2 L_else_8292
	fadd	f2 f2 f4
	jump	L_psin_2444
L_else_8292 : 
	fadd	f2 f6 f2
	call	L_pcos_2446
	fsub	f2 f0 f2
	return
L_else_8288 : 
	fbgt	f2 f3 L_else_8289
	jump	L_pcos_2446
L_else_8289 : 
	fbgt	f2 f5 L_else_8290
	fsub	f2 f2 f4
	call	L_psin_2444
	fsub	f2 f0 f2
	return
L_else_8290 : 
	fsub	f2 f6 f2
	call	L_pcos_2446
	fsub	f2 f0 f2
	return
L_atan_2452 : 
	fmul	f3 f2 f2
	fmul	f4 f2 f3
	fmul	f5 f4 f3
	fmul	f6 f5 f3
	fmul	f7 f6 f3
	fmul	f8 f7 f3
	fmul	f3 f8 f3
	fload	f9 r0 33
	fmul	f3 f9 f3
	fload	f9 r0 32
	fmul	f8 f9 f8
	fsub	f3 f3 f8
	fload	f8 r0 31
	fmul	f7 f8 f7
	fadd	f3 f3 f7
	fload	f7 r0 30
	fmul	f6 f7 f6
	fsub	f3 f3 f6
	fload	f6 r0 29
	fmul	f5 f6 f5
	fadd	f3 f3 f5
	fload	f5 r0 28
	fmul	f4 f5 f4
	fsub	f3 f3 f4
	fadd	f2 f3 f2
	return
L_isqrt_2454 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8293
	fadd	f2 f0 f3
	return
L_else_8293 : 
	fload	f4 r0 27
	fmul	f5 f2 f3
	fmul	f5 f5 f3
	fsub	f4 f4 f5
	fmul	f3 f3 f4
	fload	f4 r0 53
	fdiv	f3 f3 f4
	addi	r5 r0 1
	sub	r4 r4 r5
	jump	L_isqrt_2454
L_sqrt_2458 : 
	subi	r2 r2 1
	fload	f3 r0 40
	addi	r4 r0 10
	fstore	f2 r2 0
	call	L_isqrt_2454
	fload	f3 r2 0
	fmul	f2 f3 f2
	addi	r2 r2 1
	return
L_xor_2460 : 
	addi	r6 r0 0
	bne	r4 r6 L_else_8294
	add	r4 r0 r5
	return
L_else_8294 : 
	addi	r4 r0 0
	bne	r5 r4 L_else_8295
	addi	r4 r0 1
	return
L_else_8295 : 
	addi	r4 r0 0
	return
L_sgn_2463 : 
	subi	r2 r2 1
	fstore	f2 r2 0
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8296
	fload	f2 r2 0
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8297
	fload	f2 r0 26
	addi	r2 r2 1
	return
L_else_8297 : 
	fload	f2 r0 40
	addi	r2 r2 1
	return
L_else_8296 : 
	fload	f2 r0 54
	addi	r2 r2 1
	return
L_fneg_cond_2465 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8298
	jump	L_fneg_2440
L_else_8298 : 
	fadd	f2 f0 f2
	return
L_add_mod5_2468 : 
	add	r4 r4 r5
	addi	r5 r0 5
	bgt	r5 r4 L_else_8299
	addi	r5 r0 5
	sub	r4 r4 r5
	return
L_else_8299 : 
	add	r4 r0 r4
	return
L_vecset_2471 : 
	addi	r5 r0 0
	add	r5 r4 r5
	fstore	f2 r5 0
	addi	r5 r0 1
	add	r5 r4 r5
	fstore	f3 r5 0
	addi	r5 r0 2
	add	r4 r4 r5
	fstore	f4 r4 0
	return
L_vecfill_2476 : 
	addi	r5 r0 0
	add	r5 r4 r5
	fstore	f2 r5 0
	addi	r5 r0 1
	add	r5 r4 r5
	fstore	f2 r5 0
	addi	r5 r0 2
	add	r4 r4 r5
	fstore	f2 r4 0
	return
L_vecbzero_2479 : 
	fload	f2 r0 54
	jump	L_vecfill_2476
L_veccpy_2481 : 
	addi	r6 r0 0
	addi	r7 r0 0
	add	r7 r5 r7
	fload	f2 r7 0
	add	r6 r4 r6
	fstore	f2 r6 0
	addi	r6 r0 1
	addi	r7 r0 1
	add	r7 r5 r7
	fload	f2 r7 0
	add	r6 r4 r6
	fstore	f2 r6 0
	addi	r6 r0 2
	addi	r7 r0 2
	add	r5 r5 r7
	fload	f2 r5 0
	add	r4 r4 r6
	fstore	f2 r4 0
	return
L_vecunit_sgn_2489 : 
	subi	r2 r2 5
	addi	r6 r0 0
	add	r6 r4 r6
	fload	f2 r6 0
	store	r5 r2 0
	store	r4 r2 1
	call	L_fsqr_2442
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	store	r5 r2 1
	fstore	f2 r2 2
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 2
	fadd	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	store	r5 r2 1
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 3
	fadd	f2 f3 f2
	call	L_sqrt_2458
	fstore	f2 r2 4
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8300
	addi	r4 r0 0
	load	r5 r2 0
	bne	r5 r4 L_else_8302
	fload	f2 r0 40
	fload	f3 r2 4
	fdiv	f2 f2 f3
	jump	L_endif_8303
L_else_8302 : 
	fload	f2 r0 26
	fload	f3 r2 4
	fdiv	f2 f2 f3
L_endif_8303 : 
	jump	L_endif_8301
L_else_8300 : 
	fload	f2 r0 40
L_endif_8301 : 
	addi	r4 r0 0
	addi	r5 r0 0
	load	r6 r2 1
	add	r5 r6 r5
	fload	f3 r5 0
	fmul	f3 f3 f2
	add	r4 r6 r4
	fstore	f3 r4 0
	addi	r4 r0 1
	addi	r5 r0 1
	add	r5 r6 r5
	fload	f3 r5 0
	fmul	f3 f3 f2
	add	r4 r6 r4
	fstore	f3 r4 0
	addi	r4 r0 2
	addi	r5 r0 2
	add	r5 r6 r5
	fload	f3 r5 0
	fmul	f2 f3 f2
	add	r4 r6 r4
	fstore	f2 r4 0
	addi	r2 r2 5
	return
L_veciprod_2492 : 
	addi	r6 r0 0
	add	r6 r4 r6
	fload	f2 r6 0
	addi	r6 r0 0
	add	r6 r5 r6
	fload	f3 r6 0
	fmul	f2 f2 f3
	addi	r6 r0 1
	add	r6 r4 r6
	fload	f3 r6 0
	addi	r6 r0 1
	add	r6 r5 r6
	fload	f4 r6 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r6 r0 2
	add	r4 r4 r6
	fload	f3 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f4 r4 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	return
L_veciprod2_2495 : 
	addi	r5 r0 0
	add	r5 r4 r5
	fload	f5 r5 0
	fmul	f2 f5 f2
	addi	r5 r0 1
	add	r5 r4 r5
	fload	f5 r5 0
	fmul	f3 f5 f3
	fadd	f2 f2 f3
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f3 r4 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	return
L_vecaccum_2500 : 
	addi	r6 r0 0
	addi	r7 r0 0
	add	r7 r4 r7
	fload	f3 r7 0
	addi	r7 r0 0
	add	r7 r5 r7
	fload	f4 r7 0
	fmul	f4 f2 f4
	fadd	f3 f3 f4
	add	r6 r4 r6
	fstore	f3 r6 0
	addi	r6 r0 1
	addi	r7 r0 1
	add	r7 r4 r7
	fload	f3 r7 0
	addi	r7 r0 1
	add	r7 r5 r7
	fload	f4 r7 0
	fmul	f4 f2 f4
	fadd	f3 f3 f4
	add	r6 r4 r6
	fstore	f3 r6 0
	addi	r6 r0 2
	addi	r7 r0 2
	add	r7 r4 r7
	fload	f3 r7 0
	addi	r7 r0 2
	add	r5 r5 r7
	fload	f4 r5 0
	fmul	f2 f2 f4
	fadd	f2 f3 f2
	add	r4 r4 r6
	fstore	f2 r4 0
	return
L_vecadd_2504 : 
	addi	r6 r0 0
	addi	r7 r0 0
	add	r7 r4 r7
	fload	f2 r7 0
	addi	r7 r0 0
	add	r7 r5 r7
	fload	f3 r7 0
	fadd	f2 f2 f3
	add	r6 r4 r6
	fstore	f2 r6 0
	addi	r6 r0 1
	addi	r7 r0 1
	add	r7 r4 r7
	fload	f2 r7 0
	addi	r7 r0 1
	add	r7 r5 r7
	fload	f3 r7 0
	fadd	f2 f2 f3
	add	r6 r4 r6
	fstore	f2 r6 0
	addi	r6 r0 2
	addi	r7 r0 2
	add	r7 r4 r7
	fload	f2 r7 0
	addi	r7 r0 2
	add	r5 r5 r7
	fload	f3 r5 0
	fadd	f2 f2 f3
	add	r4 r4 r6
	fstore	f2 r4 0
	return
L_vecscale_2510 : 
	addi	r5 r0 0
	addi	r6 r0 0
	add	r6 r4 r6
	fload	f3 r6 0
	fmul	f3 f3 f2
	add	r5 r4 r5
	fstore	f3 r5 0
	addi	r5 r0 1
	addi	r6 r0 1
	add	r6 r4 r6
	fload	f3 r6 0
	fmul	f3 f3 f2
	add	r5 r4 r5
	fstore	f3 r5 0
	addi	r5 r0 2
	addi	r6 r0 2
	add	r6 r4 r6
	fload	f3 r6 0
	fmul	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	return
L_vecaccumv_2513 : 
	addi	r7 r0 0
	addi	r8 r0 0
	add	r8 r4 r8
	fload	f2 r8 0
	addi	r8 r0 0
	add	r8 r5 r8
	fload	f3 r8 0
	addi	r8 r0 0
	add	r8 r6 r8
	fload	f4 r8 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	add	r7 r4 r7
	fstore	f2 r7 0
	addi	r7 r0 1
	addi	r8 r0 1
	add	r8 r4 r8
	fload	f2 r8 0
	addi	r8 r0 1
	add	r8 r5 r8
	fload	f3 r8 0
	addi	r8 r0 1
	add	r8 r6 r8
	fload	f4 r8 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	add	r7 r4 r7
	fstore	f2 r7 0
	addi	r7 r0 2
	addi	r8 r0 2
	add	r8 r4 r8
	fload	f2 r8 0
	addi	r8 r0 2
	add	r5 r5 r8
	fload	f3 r5 0
	addi	r5 r0 2
	add	r5 r6 r5
	fload	f4 r5 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	add	r4 r4 r7
	fstore	f2 r4 0
	return
L_o_texturetype_2517 : 
	load	r4 r4 0
	add	r4 r0 r4
	return
L_o_form_2519 : 
	load	r4 r4 1
	add	r4 r0 r4
	return
L_o_reflectiontype_2521 : 
	load	r4 r4 2
	add	r4 r0 r4
	return
L_o_isinvert_2523 : 
	load	r4 r4 6
	add	r4 r0 r4
	return
L_o_isrot_2525 : 
	load	r4 r4 3
	add	r4 r0 r4
	return
L_o_param_a_2527 : 
	load	r4 r4 4
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_b_2529 : 
	load	r4 r4 4
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_c_2531 : 
	load	r4 r4 4
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_abc_2533 : 
	load	r4 r4 4
	add	r4 r0 r4
	return
L_o_param_x_2535 : 
	load	r4 r4 5
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_y_2537 : 
	load	r4 r4 5
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_z_2539 : 
	load	r4 r4 5
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_diffuse_2541 : 
	load	r4 r4 7
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_hilight_2543 : 
	load	r4 r4 7
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_color_red_2545 : 
	load	r4 r4 8
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_color_green_2547 : 
	load	r4 r4 8
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_color_blue_2549 : 
	load	r4 r4 8
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_r1_2551 : 
	load	r4 r4 9
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_r2_2553 : 
	load	r4 r4 9
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_r3_2555 : 
	load	r4 r4 9
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r4 0
	return
L_o_param_ctbl_2557 : 
	load	r4 r4 10
	add	r4 r0 r4
	return
L_p_rgb_2559 : 
	load	r4 r4 0
	add	r4 r0 r4
	return
L_p_intersection_points_2561 : 
	load	r4 r4 1
	add	r4 r0 r4
	return
L_p_surface_ids_2563 : 
	load	r4 r4 2
	add	r4 r0 r4
	return
L_p_calc_diffuse_2565 : 
	load	r4 r4 3
	add	r4 r0 r4
	return
L_p_energy_2567 : 
	load	r4 r4 4
	add	r4 r0 r4
	return
L_p_received_ray_20percent_2569 : 
	load	r4 r4 5
	add	r4 r0 r4
	return
L_p_group_id_2571 : 
	load	r4 r4 6
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	return
L_p_set_group_id_2573 : 
	load	r4 r4 6
	addi	r6 r0 0
	add	r4 r4 r6
	store	r5 r4 0
	return
L_p_nvectors_2576 : 
	load	r4 r4 7
	add	r4 r0 r4
	return
L_d_vec_2578 : 
	load	r4 r4 0
	add	r4 r0 r4
	return
L_d_const_2580 : 
	load	r4 r4 1
	add	r4 r0 r4
	return
L_r_surface_id_2582 : 
	load	r4 r4 0
	add	r4 r0 r4
	return
L_r_dvec_2584 : 
	load	r4 r4 1
	add	r4 r0 r4
	return
L_r_bright_2586 : 
	fload	f2 r4 2
	fadd	f2 f0 f2
	return
L_rad_2588 : 
	fload	f3 r0 25
	fmul	f2 f2 f3
	return
L_read_screen_settings_2590 : 
	subi	r2 r2 20
	addi	r4 r0 4096
	addi	r5 r0 0
	store	r5 r2 0
	store	r4 r2 1
	call	min_caml_read_float
	load	r4 r2 0
	load	r5 r2 1
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4096
	addi	r5 r0 1
	store	r5 r2 2
	store	r4 r2 3
	call	min_caml_read_float
	load	r4 r2 2
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4096
	addi	r5 r0 2
	store	r5 r2 4
	store	r4 r2 5
	call	min_caml_read_float
	load	r4 r2 4
	load	r5 r2 5
	add	r4 r5 r4
	fstore	f2 r4 0
	call	min_caml_read_float
	call	L_rad_2588
	fstore	f2 r2 6
	call	L_cos_2450
	fload	f3 r2 6
	fstore	f2 r2 7
	fadd	f2 f0 f3
	call	L_sin_2448
	fstore	f2 r2 8
	call	min_caml_read_float
	call	L_rad_2588
	fstore	f2 r2 9
	call	L_cos_2450
	fload	f3 r2 9
	fstore	f2 r2 10
	fadd	f2 f0 f3
	call	L_sin_2448
	addi	r4 r0 4099
	addi	r5 r0 0
	fload	f3 r2 7
	fmul	f4 f3 f2
	fload	f5 r0 24
	fmul	f4 f4 f5
	add	r4 r4 r5
	fstore	f4 r4 0
	addi	r4 r0 4099
	addi	r5 r0 1
	fload	f4 r0 23
	fload	f5 r2 8
	fmul	f4 f5 f4
	add	r4 r4 r5
	fstore	f4 r4 0
	addi	r4 r0 4099
	addi	r5 r0 2
	fload	f4 r2 10
	fmul	f6 f3 f4
	fload	f7 r0 24
	fmul	f6 f6 f7
	add	r4 r4 r5
	fstore	f6 r4 0
	addi	r4 r0 4102
	addi	r5 r0 0
	add	r4 r4 r5
	fstore	f4 r4 0
	addi	r4 r0 4102
	addi	r5 r0 1
	fload	f6 r0 54
	add	r4 r4 r5
	fstore	f6 r4 0
	addi	r4 r0 4102
	addi	r5 r0 2
	fstore	f4 r2 10
	fstore	f3 r2 7
	fstore	f2 r2 11
	fstore	f5 r2 8
	store	r5 r2 12
	store	r4 r2 13
	call	L_fneg_2440
	load	r4 r2 12
	load	r5 r2 13
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4105
	addi	r5 r0 0
	fload	f2 r2 8
	fstore	f2 r2 8
	store	r5 r2 14
	store	r4 r2 15
	call	L_fneg_2440
	fload	f3 r2 11
	fmul	f2 f2 f3
	load	r4 r2 14
	load	r5 r2 15
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4105
	addi	r5 r0 1
	fload	f2 r2 7
	store	r5 r2 16
	store	r4 r2 17
	call	L_fneg_2440
	load	r4 r2 16
	load	r5 r2 17
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4105
	addi	r5 r0 2
	fload	f2 r2 8
	store	r5 r2 18
	store	r4 r2 19
	call	L_fneg_2440
	fload	f3 r2 10
	fmul	f2 f2 f3
	load	r4 r2 18
	load	r5 r2 19
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4108
	addi	r5 r0 0
	addi	r6 r0 4096
	addi	r7 r0 0
	add	r6 r6 r7
	fload	f2 r6 0
	addi	r6 r0 4099
	addi	r7 r0 0
	add	r6 r6 r7
	fload	f3 r6 0
	fsub	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 4108
	addi	r5 r0 1
	addi	r6 r0 4096
	addi	r7 r0 1
	add	r6 r6 r7
	fload	f2 r6 0
	addi	r6 r0 4099
	addi	r7 r0 1
	add	r6 r6 r7
	fload	f3 r6 0
	fsub	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 4108
	addi	r5 r0 2
	addi	r6 r0 4096
	addi	r7 r0 2
	add	r6 r6 r7
	fload	f2 r6 0
	addi	r6 r0 4099
	addi	r7 r0 2
	add	r6 r6 r7
	fload	f3 r6 0
	fsub	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 20
	return
L_read_light_2592 : 
	subi	r2 r2 7
	call	min_caml_read_int
	call	min_caml_read_float
	call	L_rad_2588
	fstore	f2 r2 0
	call	L_sin_2448
	addi	r4 r0 4111
	addi	r5 r0 1
	store	r5 r2 1
	store	r4 r2 2
	call	L_fneg_2440
	load	r4 r2 1
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	call	min_caml_read_float
	call	L_rad_2588
	fload	f3 r2 0
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	L_cos_2450
	fload	f3 r2 3
	fstore	f3 r2 3
	fstore	f2 r2 4
	fadd	f2 f0 f3
	call	L_sin_2448
	addi	r4 r0 4111
	addi	r5 r0 0
	fload	f3 r2 4
	fmul	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	fload	f2 r2 3
	fstore	f3 r2 4
	call	L_cos_2450
	addi	r4 r0 4111
	addi	r5 r0 2
	fload	f3 r2 4
	fmul	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 4153
	addi	r5 r0 0
	store	r5 r2 5
	store	r4 r2 6
	call	min_caml_read_float
	load	r4 r2 5
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r2 r2 7
	return
L_rotate_quadratic_matrix_2594 : 
	subi	r2 r2 28
	addi	r6 r0 0
	add	r6 r5 r6
	fload	f2 r6 0
	store	r4 r2 0
	store	r5 r2 1
	call	L_cos_2450
	addi	r4 r0 0
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	fstore	f2 r2 2
	store	r5 r2 1
	fadd	f2 f0 f3
	call	L_sin_2448
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	fstore	f2 r2 3
	store	r5 r2 1
	fadd	f2 f0 f3
	call	L_cos_2450
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	fstore	f2 r2 4
	store	r5 r2 1
	fadd	f2 f0 f3
	call	L_sin_2448
	addi	r4 r0 2
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	fstore	f2 r2 5
	store	r5 r2 1
	fadd	f2 f0 f3
	call	L_cos_2450
	addi	r4 r0 2
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	store	r5 r2 1
	fstore	f2 r2 6
	fadd	f2 f0 f3
	call	L_sin_2448
	fload	f3 r2 6
	fload	f4 r2 4
	fmul	f5 f4 f3
	fload	f6 r2 5
	fload	f7 r2 3
	fmul	f8 f7 f6
	fmul	f8 f8 f3
	fload	f9 r2 2
	fmul	f10 f9 f2
	fsub	f8 f8 f10
	fmul	f10 f9 f6
	fmul	f10 f10 f3
	fmul	f11 f7 f2
	fadd	f10 f10 f11
	fmul	f11 f4 f2
	fmul	f12 f7 f6
	fmul	f12 f12 f2
	fmul	f13 f9 f3
	fadd	f12 f12 f13
	fmul	f13 f9 f6
	fmul	f2 f13 f2
	fmul	f3 f7 f3
	fsub	f2 f2 f3
	fstore	f2 r2 7
	fstore	f10 r2 8
	fstore	f12 r2 9
	fstore	f8 r2 10
	fstore	f11 r2 11
	fstore	f5 r2 12
	fstore	f9 r2 2
	fstore	f4 r2 4
	fstore	f7 r2 3
	fadd	f2 f0 f6
	call	L_fneg_2440
	fload	f3 r2 4
	fload	f4 r2 3
	fmul	f4 f4 f3
	fload	f5 r2 2
	fmul	f3 f5 f3
	addi	r4 r0 0
	load	r5 r2 0
	add	r4 r5 r4
	fload	f5 r4 0
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f6 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f7 r4 0
	addi	r4 r0 0
	fload	f8 r2 12
	fstore	f8 r2 12
	fstore	f3 r2 13
	fstore	f4 r2 14
	store	r4 r2 15
	store	r5 r2 0
	fstore	f7 r2 16
	fstore	f2 r2 17
	fstore	f6 r2 18
	fstore	f5 r2 19
	fadd	f2 f0 f8
	call	L_fsqr_2442
	fload	f3 r2 19
	fmul	f2 f3 f2
	fload	f4 r2 11
	fstore	f4 r2 11
	fstore	f3 r2 19
	fstore	f2 r2 20
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 18
	fmul	f2 f3 f2
	fload	f4 r2 20
	fadd	f2 f4 f2
	fload	f4 r2 17
	fstore	f4 r2 17
	fstore	f3 r2 18
	fstore	f2 r2 21
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 16
	fmul	f2 f3 f2
	fload	f4 r2 21
	fadd	f2 f4 f2
	load	r4 r2 15
	load	r5 r2 0
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	fload	f2 r2 10
	fstore	f2 r2 10
	store	r4 r2 22
	store	r5 r2 0
	fstore	f3 r2 16
	call	L_fsqr_2442
	fload	f3 r2 19
	fmul	f2 f3 f2
	fload	f4 r2 9
	fstore	f4 r2 9
	fstore	f3 r2 19
	fstore	f2 r2 23
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 18
	fmul	f2 f3 f2
	fload	f4 r2 23
	fadd	f2 f4 f2
	fload	f4 r2 14
	fstore	f4 r2 14
	fstore	f3 r2 18
	fstore	f2 r2 24
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 16
	fmul	f2 f3 f2
	fload	f4 r2 24
	fadd	f2 f4 f2
	load	r4 r2 22
	load	r5 r2 0
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	fload	f2 r2 8
	fstore	f2 r2 8
	store	r4 r2 25
	store	r5 r2 0
	fstore	f3 r2 16
	call	L_fsqr_2442
	fload	f3 r2 19
	fmul	f2 f3 f2
	fload	f4 r2 7
	fstore	f4 r2 7
	fstore	f3 r2 19
	fstore	f2 r2 26
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 18
	fmul	f2 f3 f2
	fload	f4 r2 26
	fadd	f2 f4 f2
	fload	f4 r2 13
	fstore	f4 r2 13
	fstore	f3 r2 18
	fstore	f2 r2 27
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 16
	fmul	f2 f3 f2
	fload	f4 r2 27
	fadd	f2 f4 f2
	load	r4 r2 25
	load	r5 r2 0
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 0
	fload	f2 r0 53
	fload	f4 r2 10
	fload	f5 r2 19
	fmul	f6 f5 f4
	fload	f7 r2 8
	fmul	f6 f6 f7
	fload	f8 r2 9
	fload	f9 r2 18
	fmul	f10 f9 f8
	fload	f11 r2 7
	fmul	f10 f10 f11
	fadd	f6 f6 f10
	fload	f10 r2 14
	fmul	f12 f3 f10
	fload	f13 r2 13
	fmul	f12 f12 f13
	fadd	f6 f6 f12
	fmul	f2 f2 f6
	load	r5 r2 1
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	fload	f2 r0 53
	fload	f6 r2 12
	fmul	f12 f5 f6
	fmul	f7 f12 f7
	fload	f12 r2 11
	fmul	f14 f9 f12
	fmul	f11 f14 f11
	fadd	f7 f7 f11
	fload	f11 r2 17
	fmul	f14 f3 f11
	fmul	f13 f14 f13
	fadd	f7 f7 f13
	fmul	f2 f2 f7
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	fload	f2 r0 53
	fmul	f5 f5 f6
	fmul	f4 f5 f4
	fmul	f5 f9 f12
	fmul	f5 f5 f8
	fadd	f4 f4 f5
	fmul	f3 f3 f11
	fmul	f3 f3 f10
	fadd	f3 f4 f3
	fmul	f2 f2 f3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r2 r2 28
	return
L_read_nth_object_2597 : 
	subi	r2 r2 35
	store	r4 r2 0
	call	min_caml_read_int
	addi	r5 r0 -1
	bne	r4 r5 L_else_8304
	addi	r4 r0 0
	addi	r2 r2 35
	return
L_else_8304 : 
	store	r4 r2 1
	call	min_caml_read_int
	store	r4 r2 2
	call	min_caml_read_int
	store	r4 r2 3
	call	min_caml_read_int
	addi	r5 r0 3
	fload	f2 r0 54
	store	r4 r2 4
	add	r4 r0 r5
	call	min_caml_create_float_array
	addi	r5 r0 0
	store	r5 r2 5
	store	r4 r2 6
	call	min_caml_read_float
	load	r4 r2 5
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 7
	store	r5 r2 6
	call	min_caml_read_float
	load	r4 r2 7
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	store	r4 r2 8
	store	r5 r2 6
	call	min_caml_read_float
	load	r4 r2 8
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	fload	f2 r0 54
	store	r5 r2 6
	call	min_caml_create_float_array
	addi	r5 r0 0
	store	r5 r2 9
	store	r4 r2 10
	call	min_caml_read_float
	load	r4 r2 9
	load	r5 r2 10
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 11
	store	r5 r2 10
	call	min_caml_read_float
	load	r4 r2 11
	load	r5 r2 10
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	store	r4 r2 12
	store	r5 r2 10
	call	min_caml_read_float
	load	r4 r2 12
	load	r5 r2 10
	add	r4 r5 r4
	fstore	f2 r4 0
	store	r5 r2 10
	call	min_caml_read_float
	call	L_fisneg_2431
	addi	r5 r0 2
	fload	f2 r0 54
	store	r4 r2 13
	add	r4 r0 r5
	call	min_caml_create_float_array
	addi	r5 r0 0
	store	r5 r2 14
	store	r4 r2 15
	call	min_caml_read_float
	load	r4 r2 14
	load	r5 r2 15
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 16
	store	r5 r2 15
	call	min_caml_read_float
	load	r4 r2 16
	load	r5 r2 15
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	fload	f2 r0 54
	store	r5 r2 15
	call	min_caml_create_float_array
	addi	r5 r0 0
	store	r5 r2 17
	store	r4 r2 18
	call	min_caml_read_float
	load	r4 r2 17
	load	r5 r2 18
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 19
	store	r5 r2 18
	call	min_caml_read_float
	load	r4 r2 19
	load	r5 r2 18
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	store	r4 r2 20
	store	r5 r2 18
	call	min_caml_read_float
	load	r4 r2 20
	load	r5 r2 18
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	fload	f2 r0 54
	store	r5 r2 18
	call	min_caml_create_float_array
	addi	r5 r0 0
	load	r6 r2 4
	store	r6 r2 4
	store	r4 r2 21
	bne	r6 r5 L_else_8321
	jump	L_endif_8322
L_else_8321 : 
	addi	r5 r0 0
	store	r6 r2 4
	store	r5 r2 22
	store	r4 r2 21
	call	min_caml_read_float
	call	L_rad_2588
	load	r4 r2 22
	load	r5 r2 21
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 23
	store	r5 r2 21
	call	min_caml_read_float
	call	L_rad_2588
	load	r4 r2 23
	load	r5 r2 21
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	store	r4 r2 24
	store	r5 r2 21
	call	min_caml_read_float
	call	L_rad_2588
	load	r4 r2 24
	load	r5 r2 21
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8322 : 
	addi	r4 r0 2
	load	r5 r2 2
	bne	r5 r4 L_else_8319
	addi	r4 r0 1
	jump	L_endif_8320
L_else_8319 : 
	load	r4 r2 13
	add	r4 r0 r4
L_endif_8320 : 
	addi	r6 r0 4
	fload	f2 r0 54
	store	r5 r2 2
	store	r4 r2 25
	add	r4 r0 r6
	call	min_caml_create_float_array
	add	r5 r0 r3
	addi	r3 r3 11
	store	r4 r5 10
	load	r4 r2 21
	store	r4 r5 9
	load	r6 r2 18
	store	r6 r5 8
	load	r6 r2 15
	store	r6 r5 7
	load	r6 r2 25
	store	r6 r5 6
	load	r6 r2 10
	store	r6 r5 5
	load	r6 r2 6
	store	r6 r5 4
	load	r7 r2 4
	store	r7 r5 3
	load	r8 r2 3
	store	r8 r5 2
	load	r8 r2 2
	store	r8 r5 1
	load	r9 r2 1
	store	r9 r5 0
	add	r5 r0 r5
	addi	r9 r0 5042
	load	r10 r2 0
	add	r9 r9 r10
	store	r5 r9 0
	addi	r5 r0 3
	store	r4 r2 21
	store	r6 r2 6
	store	r7 r2 4
	bne	r8 r5 L_else_8307
	addi	r5 r0 0
	add	r5 r6 r5
	fload	f2 r5 0
	addi	r5 r0 0
	store	r4 r2 21
	store	r7 r2 4
	store	r5 r2 26
	store	r6 r2 6
	fstore	f2 r2 27
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8317
	fload	f2 r2 27
	fstore	f2 r2 27
	call	L_sgn_2463
	fload	f3 r2 27
	fstore	f2 r2 28
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 28
	fdiv	f2 f3 f2
	jump	L_endif_8318
L_else_8317 : 
	fload	f2 r0 54
L_endif_8318 : 
	load	r4 r2 26
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f2 r4 0
	addi	r4 r0 1
	store	r4 r2 29
	store	r5 r2 6
	fstore	f2 r2 30
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8315
	fload	f2 r2 30
	fstore	f2 r2 30
	call	L_sgn_2463
	fload	f3 r2 30
	fstore	f2 r2 31
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 31
	fdiv	f2 f3 f2
	jump	L_endif_8316
L_else_8315 : 
	fload	f2 r0 54
L_endif_8316 : 
	load	r4 r2 29
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f2 r4 0
	addi	r4 r0 2
	store	r4 r2 32
	store	r5 r2 6
	fstore	f2 r2 33
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8313
	fload	f2 r2 33
	fstore	f2 r2 33
	call	L_sgn_2463
	fload	f3 r2 33
	fstore	f2 r2 34
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 34
	fdiv	f2 f3 f2
	jump	L_endif_8314
L_else_8313 : 
	fload	f2 r0 54
L_endif_8314 : 
	load	r4 r2 32
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8308
L_else_8307 : 
	addi	r5 r0 2
	store	r4 r2 21
	store	r6 r2 6
	store	r7 r2 4
	bne	r8 r5 L_else_8309
	addi	r5 r0 0
	load	r8 r2 13
	bne	r8 r5 L_else_8311
	addi	r4 r0 1
	jump	L_endif_8312
L_else_8311 : 
	addi	r4 r0 0
L_endif_8312 : 
	store	r4 r2 21
	store	r6 r2 6
	store	r7 r2 4
	add	r4 r0 r6
	call	L_vecunit_sgn_2489
	jump	L_endif_8310
L_else_8309 : 
L_endif_8310 : 
L_endif_8308 : 
	addi	r4 r0 0
	load	r5 r2 4
	bne	r5 r4 L_else_8305
	jump	L_endif_8306
L_else_8305 : 
	load	r4 r2 6
	load	r5 r2 21
	call	L_rotate_quadratic_matrix_2594
L_endif_8306 : 
	addi	r4 r0 1
	addi	r2 r2 35
	return
L_read_object_2599 : 
	subi	r2 r2 1
	addi	r5 r0 60
	bgt	r5 r4 L_else_8323
	addi	r2 r2 1
	return
L_else_8323 : 
	store	r4 r2 0
	call	L_read_nth_object_2597
	addi	r5 r0 0
	bne	r4 r5 L_else_8324
	addi	r4 r0 4144
	addi	r5 r0 0
	add	r4 r4 r5
	load	r5 r2 0
	store	r5 r4 0
	addi	r2 r2 1
	return
L_else_8324 : 
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	addi	r2 r2 1
	jump	L_read_object_2599
L_read_all_object_2601 : 
	addi	r4 r0 0
	jump	L_read_object_2599
L_read_net_item_2603 : 
	subi	r2 r2 2
	store	r4 r2 0
	call	min_caml_read_int
	addi	r5 r0 -1
	bne	r4 r5 L_else_8325
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	addi	r5 r0 -1
	addi	r2 r2 2
	jump	min_caml_create_array
L_else_8325 : 
	addi	r5 r0 1
	load	r6 r2 0
	add	r5 r6 r5
	store	r4 r2 1
	store	r6 r2 0
	add	r4 r0 r5
	call	L_read_net_item_2603
	load	r5 r2 0
	add	r5 r4 r5
	load	r6 r2 1
	store	r6 r5 0
	add	r4 r0 r4
	addi	r2 r2 2
	return
L_read_or_network_2605 : 
	subi	r2 r2 2
	addi	r5 r0 0
	store	r4 r2 0
	add	r4 r0 r5
	call	L_read_net_item_2603
	add	r5 r0 r4
	addi	r4 r0 0
	add	r4 r5 r4
	load	r4 r4 0
	addi	r6 r0 -1
	bne	r4 r6 L_else_8326
	addi	r4 r0 1
	load	r6 r2 0
	add	r4 r6 r4
	addi	r2 r2 2
	jump	min_caml_create_array
L_else_8326 : 
	addi	r4 r0 1
	load	r6 r2 0
	add	r4 r6 r4
	store	r5 r2 1
	store	r6 r2 0
	call	L_read_or_network_2605
	load	r5 r2 0
	add	r5 r4 r5
	load	r6 r2 1
	store	r6 r5 0
	add	r4 r0 r4
	addi	r2 r2 2
	return
L_read_and_network_2607 : 
	subi	r2 r2 1
	addi	r5 r0 0
	store	r4 r2 0
	add	r4 r0 r5
	call	L_read_net_item_2603
	addi	r5 r0 0
	add	r5 r4 r5
	load	r5 r5 0
	addi	r6 r0 -1
	bne	r5 r6 L_else_8327
	addi	r2 r2 1
	return
L_else_8327 : 
	addi	r5 r0 4157
	load	r6 r2 0
	add	r5 r5 r6
	store	r4 r5 0
	addi	r4 r0 1
	add	r4 r6 r4
	addi	r2 r2 1
	jump	L_read_and_network_2607
L_read_parameter_2609 : 
	subi	r2 r2 2
	call	L_read_screen_settings_2590
	call	L_read_light_2592
	call	L_read_all_object_2601
	addi	r4 r0 0
	call	L_read_and_network_2607
	addi	r4 r0 4155
	addi	r5 r0 0
	addi	r6 r0 0
	store	r5 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	call	L_read_or_network_2605
	load	r5 r2 0
	load	r6 r2 1
	add	r5 r6 r5
	store	r4 r5 0
	addi	r2 r2 2
	return
L_solver_rect_surface_2611 : 
	subi	r2 r2 11
	add	r9 r5 r6
	fload	f5 r9 0
	fstore	f4 r2 0
	store	r8 r2 1
	fstore	f3 r2 2
	store	r7 r2 3
	fstore	f2 r2 4
	store	r6 r2 5
	store	r5 r2 6
	store	r4 r2 7
	fadd	f2 f0 f5
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8328
	load	r4 r2 7
	store	r4 r2 7
	call	L_o_param_abc_2533
	load	r5 r2 7
	store	r4 r2 8
	add	r4 r0 r5
	call	L_o_isinvert_2523
	load	r5 r2 5
	load	r6 r2 6
	add	r7 r6 r5
	fload	f2 r7 0
	store	r6 r2 6
	store	r5 r2 5
	store	r4 r2 9
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 9
	call	L_xor_2460
	load	r5 r2 5
	load	r6 r2 8
	add	r7 r6 r5
	fload	f2 r7 0
	store	r6 r2 8
	store	r5 r2 5
	call	L_fneg_cond_2465
	fload	f3 r2 4
	fsub	f2 f2 f3
	load	r4 r2 5
	load	r5 r2 6
	add	r4 r5 r4
	fload	f3 r4 0
	fdiv	f2 f2 f3
	load	r4 r2 3
	add	r6 r5 r4
	fload	f3 r6 0
	fmul	f3 f2 f3
	fload	f4 r2 2
	fadd	f3 f3 f4
	fstore	f2 r2 10
	store	r5 r2 6
	store	r4 r2 3
	fadd	f2 f0 f3
	call	L_fabs_2433
	load	r4 r2 3
	load	r5 r2 8
	add	r4 r5 r4
	fload	f3 r4 0
	store	r5 r2 8
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8329
	addi	r4 r0 0
	addi	r2 r2 11
	return
L_else_8329 : 
	load	r4 r2 1
	load	r5 r2 6
	add	r5 r5 r4
	fload	f2 r5 0
	fload	f3 r2 10
	fmul	f2 f3 f2
	fload	f4 r2 0
	fadd	f2 f2 f4
	fstore	f3 r2 10
	store	r4 r2 1
	call	L_fabs_2433
	load	r4 r2 1
	load	r5 r2 8
	add	r4 r5 r4
	fload	f3 r4 0
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8330
	addi	r4 r0 0
	addi	r2 r2 11
	return
L_else_8330 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 10
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 11
	return
L_else_8328 : 
	addi	r4 r0 0
	addi	r2 r2 11
	return
L_solver_rect_2620 : 
	subi	r2 r2 5
	addi	r6 r0 0
	addi	r7 r0 1
	addi	r8 r0 2
	fstore	f2 r2 0
	fstore	f4 r2 1
	fstore	f3 r2 2
	store	r5 r2 3
	store	r4 r2 4
	call	L_solver_rect_surface_2611
	addi	r5 r0 0
	bne	r4 r5 L_else_8331
	addi	r6 r0 1
	addi	r7 r0 2
	addi	r8 r0 0
	fload	f2 r2 2
	fload	f3 r2 1
	fload	f4 r2 0
	load	r4 r2 4
	load	r5 r2 3
	fstore	f2 r2 2
	fstore	f4 r2 0
	fstore	f3 r2 1
	store	r5 r2 3
	store	r4 r2 4
	call	L_solver_rect_surface_2611
	addi	r5 r0 0
	bne	r4 r5 L_else_8332
	addi	r6 r0 2
	addi	r7 r0 0
	addi	r8 r0 1
	fload	f2 r2 1
	fload	f3 r2 0
	fload	f4 r2 2
	load	r4 r2 4
	load	r5 r2 3
	call	L_solver_rect_surface_2611
	addi	r5 r0 0
	bne	r4 r5 L_else_8333
	addi	r4 r0 0
	addi	r2 r2 5
	return
L_else_8333 : 
	addi	r4 r0 3
	addi	r2 r2 5
	return
L_else_8332 : 
	addi	r4 r0 2
	addi	r2 r2 5
	return
L_else_8331 : 
	addi	r4 r0 1
	addi	r2 r2 5
	return
L_solver_surface_2626 : 
	subi	r2 r2 8
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	store	r5 r2 3
	call	L_o_param_abc_2533
	add	r5 r0 r4
	load	r4 r2 3
	store	r5 r2 4
	call	L_veciprod_2492
	fstore	f2 r2 5
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8334
	addi	r4 r0 0
	addi	r2 r2 8
	return
L_else_8334 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f2 r2 2
	fload	f3 r2 1
	fload	f4 r2 0
	load	r6 r2 4
	store	r5 r2 6
	store	r4 r2 7
	add	r4 r0 r6
	call	L_veciprod2_2495
	call	L_fneg_2440
	fload	f3 r2 5
	fdiv	f2 f2 f3
	load	r4 r2 6
	load	r5 r2 7
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 8
	return
L_quadratic_2632 : 
	subi	r2 r2 15
	fstore	f2 r2 0
	fstore	f4 r2 1
	fstore	f3 r2 2
	store	r4 r2 3
	call	L_fsqr_2442
	load	r4 r2 3
	store	r4 r2 3
	fstore	f2 r2 4
	call	L_o_param_a_2527
	fload	f3 r2 4
	fmul	f2 f3 f2
	fload	f3 r2 2
	fstore	f3 r2 2
	fstore	f2 r2 5
	fadd	f2 f0 f3
	call	L_fsqr_2442
	load	r4 r2 3
	store	r4 r2 3
	fstore	f2 r2 6
	call	L_o_param_b_2529
	fload	f3 r2 6
	fmul	f2 f3 f2
	fload	f3 r2 5
	fadd	f2 f3 f2
	fload	f3 r2 1
	fstore	f3 r2 1
	fstore	f2 r2 7
	fadd	f2 f0 f3
	call	L_fsqr_2442
	load	r4 r2 3
	store	r4 r2 3
	fstore	f2 r2 8
	call	L_o_param_c_2531
	fload	f3 r2 8
	fmul	f2 f3 f2
	fload	f3 r2 7
	fadd	f2 f3 f2
	load	r4 r2 3
	store	r4 r2 3
	fstore	f2 r2 9
	call	L_o_isrot_2525
	addi	r5 r0 0
	bne	r4 r5 L_else_8335
	fload	f2 r2 9
	fadd	f2 f0 f2
	addi	r2 r2 15
	return
L_else_8335 : 
	fload	f2 r2 1
	fload	f3 r2 2
	fmul	f4 f3 f2
	load	r4 r2 3
	fstore	f3 r2 2
	store	r4 r2 3
	fstore	f2 r2 1
	fstore	f4 r2 10
	call	L_o_param_r1_2551
	fload	f3 r2 10
	fmul	f2 f3 f2
	fload	f3 r2 9
	fadd	f2 f3 f2
	fload	f3 r2 0
	fload	f4 r2 1
	fmul	f4 f4 f3
	load	r4 r2 3
	store	r4 r2 3
	fstore	f3 r2 0
	fstore	f2 r2 11
	fstore	f4 r2 12
	call	L_o_param_r2_2553
	fload	f3 r2 12
	fmul	f2 f3 f2
	fload	f3 r2 11
	fadd	f2 f3 f2
	fload	f3 r2 2
	fload	f4 r2 0
	fmul	f3 f4 f3
	load	r4 r2 3
	fstore	f2 r2 13
	fstore	f3 r2 14
	call	L_o_param_r3_2555
	fload	f3 r2 14
	fmul	f2 f3 f2
	fload	f3 r2 13
	fadd	f2 f3 f2
	addi	r2 r2 15
	return
L_bilinear_2637 : 
	subi	r2 r2 18
	fmul	f8 f2 f5
	fstore	f5 r2 0
	fstore	f2 r2 1
	fstore	f7 r2 2
	fstore	f4 r2 3
	store	r4 r2 4
	fstore	f6 r2 5
	fstore	f3 r2 6
	fstore	f8 r2 7
	call	L_o_param_a_2527
	fload	f3 r2 7
	fmul	f2 f3 f2
	fload	f3 r2 5
	fload	f4 r2 6
	fmul	f5 f4 f3
	load	r4 r2 4
	fstore	f4 r2 6
	fstore	f3 r2 5
	store	r4 r2 4
	fstore	f2 r2 8
	fstore	f5 r2 9
	call	L_o_param_b_2529
	fload	f3 r2 9
	fmul	f2 f3 f2
	fload	f3 r2 8
	fadd	f2 f3 f2
	fload	f3 r2 2
	fload	f4 r2 3
	fmul	f5 f4 f3
	load	r4 r2 4
	fstore	f3 r2 2
	fstore	f4 r2 3
	store	r4 r2 4
	fstore	f2 r2 10
	fstore	f5 r2 11
	call	L_o_param_c_2531
	fload	f3 r2 11
	fmul	f2 f3 f2
	fload	f3 r2 10
	fadd	f2 f3 f2
	load	r4 r2 4
	store	r4 r2 4
	fstore	f2 r2 12
	call	L_o_isrot_2525
	addi	r5 r0 0
	bne	r4 r5 L_else_8336
	fload	f2 r2 12
	fadd	f2 f0 f2
	addi	r2 r2 18
	return
L_else_8336 : 
	fload	f2 r2 5
	fload	f3 r2 3
	fmul	f4 f3 f2
	fload	f5 r2 2
	fload	f6 r2 6
	fmul	f7 f6 f5
	fadd	f4 f4 f7
	load	r4 r2 4
	fstore	f6 r2 6
	fstore	f2 r2 5
	store	r4 r2 4
	fstore	f3 r2 3
	fstore	f5 r2 2
	fstore	f4 r2 13
	call	L_o_param_r1_2551
	fload	f3 r2 13
	fmul	f2 f3 f2
	fload	f3 r2 2
	fload	f4 r2 1
	fmul	f3 f4 f3
	fload	f5 r2 0
	fload	f6 r2 3
	fmul	f6 f6 f5
	fadd	f3 f3 f6
	load	r4 r2 4
	store	r4 r2 4
	fstore	f5 r2 0
	fstore	f4 r2 1
	fstore	f2 r2 14
	fstore	f3 r2 15
	call	L_o_param_r2_2553
	fload	f3 r2 15
	fmul	f2 f3 f2
	fload	f3 r2 14
	fadd	f2 f3 f2
	fload	f3 r2 5
	fload	f4 r2 1
	fmul	f3 f4 f3
	fload	f4 r2 0
	fload	f5 r2 6
	fmul	f4 f5 f4
	fadd	f3 f3 f4
	load	r4 r2 4
	fstore	f2 r2 16
	fstore	f3 r2 17
	call	L_o_param_r3_2555
	fload	f3 r2 17
	fmul	f2 f3 f2
	fload	f3 r2 16
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 12
	fadd	f2 f3 f2
	addi	r2 r2 18
	return
L_solver_second_2645 : 
	subi	r2 r2 11
	addi	r6 r0 0
	add	r6 r5 r6
	fload	f5 r6 0
	addi	r6 r0 1
	add	r6 r5 r6
	fload	f6 r6 0
	addi	r6 r0 2
	add	r6 r5 r6
	fload	f7 r6 0
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	store	r4 r2 3
	store	r5 r2 4
	fadd	f4 f0 f7
	fadd	f3 f0 f6
	fadd	f2 f0 f5
	call	L_quadratic_2632
	fstore	f2 r2 5
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8337
	addi	r4 r0 0
	load	r5 r2 4
	add	r4 r5 r4
	fload	f2 r4 0
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f3 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f4 r4 0
	fload	f5 r2 2
	fload	f6 r2 1
	fload	f7 r2 0
	load	r4 r2 3
	fstore	f7 r2 0
	fstore	f6 r2 1
	fstore	f5 r2 2
	store	r4 r2 3
	call	L_bilinear_2637
	fload	f3 r2 2
	fload	f4 r2 1
	fload	f5 r2 0
	load	r4 r2 3
	fstore	f2 r2 6
	store	r4 r2 3
	fadd	f2 f0 f3
	fadd	f3 f0 f4
	fadd	f4 f0 f5
	call	L_quadratic_2632
	load	r4 r2 3
	store	r4 r2 3
	fstore	f2 r2 7
	call	L_o_form_2519
	addi	r5 r0 3
	bne	r4 r5 L_else_8341
	fload	f2 r0 40
	fload	f3 r2 7
	fsub	f2 f3 f2
	jump	L_endif_8342
L_else_8341 : 
	fload	f2 r2 7
	fadd	f2 f0 f2
L_endif_8342 : 
	fload	f3 r2 6
	fstore	f3 r2 6
	fstore	f2 r2 8
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 8
	fload	f4 r2 5
	fmul	f3 f4 f3
	fsub	f2 f2 f3
	fstore	f4 r2 5
	fstore	f2 r2 9
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8338
	addi	r4 r0 0
	addi	r2 r2 11
	return
L_else_8338 : 
	fload	f2 r2 9
	call	L_sqrt_2458
	load	r4 r2 3
	fstore	f2 r2 10
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8339
	fload	f2 r2 10
	call	L_fneg_2440
	jump	L_endif_8340
L_else_8339 : 
	fload	f2 r2 10
	fadd	f2 f0 f2
L_endif_8340 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f3 r2 6
	fsub	f2 f2 f3
	fload	f3 r2 5
	fdiv	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 11
	return
L_else_8337 : 
	addi	r4 r0 0
	addi	r2 r2 11
	return
L_solver_2651 : 
	subi	r2 r2 9
	addi	r7 r0 5042
	add	r4 r7 r4
	load	r4 r4 0
	addi	r7 r0 0
	add	r7 r6 r7
	fload	f2 r7 0
	store	r5 r2 0
	store	r4 r2 1
	store	r6 r2 2
	fstore	f2 r2 3
	call	L_o_param_x_2535
	fload	f3 r2 3
	fsub	f2 f3 f2
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 1
	fstore	f2 r2 4
	store	r4 r2 1
	store	r5 r2 2
	fstore	f3 r2 5
	call	L_o_param_y_2537
	fload	f3 r2 5
	fsub	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 2
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 1
	fstore	f2 r2 6
	store	r4 r2 1
	fstore	f3 r2 7
	call	L_o_param_z_2539
	fload	f3 r2 7
	fsub	f2 f3 f2
	load	r4 r2 1
	fstore	f2 r2 8
	store	r4 r2 1
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8343
	fload	f2 r2 4
	fload	f3 r2 6
	fload	f4 r2 8
	load	r4 r2 1
	load	r5 r2 0
	addi	r2 r2 9
	jump	L_solver_rect_2620
L_else_8343 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8344
	fload	f2 r2 4
	fload	f3 r2 6
	fload	f4 r2 8
	load	r4 r2 1
	load	r5 r2 0
	addi	r2 r2 9
	jump	L_solver_surface_2626
L_else_8344 : 
	fload	f2 r2 4
	fload	f3 r2 6
	fload	f4 r2 8
	load	r4 r2 1
	load	r5 r2 0
	addi	r2 r2 9
	jump	L_solver_second_2645
L_solver_rect_fast_2655 : 
	subi	r2 r2 15
	addi	r7 r0 0
	add	r7 r6 r7
	fload	f5 r7 0
	fsub	f5 f5 f2
	addi	r7 r0 1
	add	r7 r6 r7
	fload	f6 r7 0
	fmul	f5 f5 f6
	addi	r7 r0 1
	add	r7 r5 r7
	fload	f6 r7 0
	fmul	f6 f5 f6
	fadd	f6 f6 f3
	fstore	f2 r2 0
	fstore	f3 r2 1
	store	r6 r2 2
	fstore	f4 r2 3
	fstore	f5 r2 4
	store	r5 r2 5
	store	r4 r2 6
	fadd	f2 f0 f6
	call	L_fabs_2433
	load	r4 r2 6
	store	r4 r2 6
	fstore	f2 r2 7
	call	L_o_param_b_2529
	add	f3 r0 f2
	fload	f2 r2 7
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8360
	addi	r4 r0 0
	jump	L_endif_8361
L_else_8360 : 
	addi	r4 r0 2
	load	r5 r2 5
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 4
	fmul	f2 f3 f2
	fload	f4 r2 3
	fadd	f2 f2 f4
	fstore	f3 r2 4
	fstore	f4 r2 3
	store	r5 r2 5
	call	L_fabs_2433
	load	r4 r2 6
	store	r4 r2 6
	fstore	f2 r2 8
	call	L_o_param_c_2531
	add	f3 r0 f2
	fload	f2 r2 8
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8362
	addi	r4 r0 0
	jump	L_endif_8363
L_else_8362 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r4 0
	store	r5 r2 2
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8364
	addi	r4 r0 1
	jump	L_endif_8365
L_else_8364 : 
	addi	r4 r0 0
L_endif_8365 : 
L_endif_8363 : 
L_endif_8361 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8345
	addi	r4 r0 2
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 1
	fsub	f2 f2 f3
	addi	r4 r0 3
	add	r4 r5 r4
	fload	f4 r4 0
	fmul	f2 f2 f4
	addi	r4 r0 0
	load	r6 r2 5
	add	r4 r6 r4
	fload	f4 r4 0
	fmul	f4 f2 f4
	fload	f5 r2 0
	fadd	f4 f4 f5
	fstore	f3 r2 1
	fstore	f5 r2 0
	store	r5 r2 2
	fstore	f2 r2 9
	store	r6 r2 5
	fadd	f2 f0 f4
	call	L_fabs_2433
	load	r4 r2 6
	store	r4 r2 6
	fstore	f2 r2 10
	call	L_o_param_a_2527
	add	f3 r0 f2
	fload	f2 r2 10
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8354
	addi	r4 r0 0
	jump	L_endif_8355
L_else_8354 : 
	addi	r4 r0 2
	load	r5 r2 5
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 9
	fmul	f2 f3 f2
	fload	f4 r2 3
	fadd	f2 f2 f4
	fstore	f3 r2 9
	store	r5 r2 5
	fstore	f4 r2 3
	call	L_fabs_2433
	load	r4 r2 6
	store	r4 r2 6
	fstore	f2 r2 11
	call	L_o_param_c_2531
	add	f3 r0 f2
	fload	f2 r2 11
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8356
	addi	r4 r0 0
	jump	L_endif_8357
L_else_8356 : 
	addi	r4 r0 3
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r4 0
	store	r5 r2 2
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8358
	addi	r4 r0 1
	jump	L_endif_8359
L_else_8358 : 
	addi	r4 r0 0
L_endif_8359 : 
L_endif_8357 : 
L_endif_8355 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8346
	addi	r4 r0 4
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 3
	fsub	f2 f2 f3
	addi	r4 r0 5
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f2 f2 f3
	addi	r4 r0 0
	load	r6 r2 5
	add	r4 r6 r4
	fload	f3 r4 0
	fmul	f3 f2 f3
	fload	f4 r2 0
	fadd	f3 f3 f4
	store	r5 r2 2
	fstore	f2 r2 12
	store	r6 r2 5
	fadd	f2 f0 f3
	call	L_fabs_2433
	load	r4 r2 6
	store	r4 r2 6
	fstore	f2 r2 13
	call	L_o_param_a_2527
	add	f3 r0 f2
	fload	f2 r2 13
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8348
	addi	r4 r0 0
	jump	L_endif_8349
L_else_8348 : 
	addi	r4 r0 1
	load	r5 r2 5
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 12
	fmul	f2 f3 f2
	fload	f4 r2 1
	fadd	f2 f2 f4
	fstore	f3 r2 12
	call	L_fabs_2433
	load	r4 r2 6
	fstore	f2 r2 14
	call	L_o_param_b_2529
	add	f3 r0 f2
	fload	f2 r2 14
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8350
	addi	r4 r0 0
	jump	L_endif_8351
L_else_8350 : 
	addi	r4 r0 5
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r4 0
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8352
	addi	r4 r0 1
	jump	L_endif_8353
L_else_8352 : 
	addi	r4 r0 0
L_endif_8353 : 
L_endif_8351 : 
L_endif_8349 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8347
	addi	r4 r0 0
	addi	r2 r2 15
	return
L_else_8347 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 12
	fstore	f2 r4 0
	addi	r4 r0 3
	addi	r2 r2 15
	return
L_else_8346 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 9
	fstore	f2 r4 0
	addi	r4 r0 2
	addi	r2 r2 15
	return
L_else_8345 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 4
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 15
	return
L_solver_surface_fast_2662 : 
	subi	r2 r2 4
	addi	r4 r0 0
	add	r4 r5 r4
	fload	f5 r4 0
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	store	r5 r2 3
	fadd	f2 f0 f5
	call	L_fisneg_2431
	addi	r5 r0 0
	bne	r4 r5 L_else_8366
	addi	r4 r0 0
	addi	r2 r2 4
	return
L_else_8366 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	addi	r6 r0 1
	load	r7 r2 3
	add	r6 r7 r6
	fload	f2 r6 0
	fload	f3 r2 2
	fmul	f2 f2 f3
	addi	r6 r0 2
	add	r6 r7 r6
	fload	f3 r6 0
	fload	f4 r2 1
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r6 r0 3
	add	r6 r7 r6
	fload	f3 r6 0
	fload	f4 r2 0
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 4
	return
L_solver_second_fast_2668 : 
	subi	r2 r2 14
	addi	r6 r0 0
	add	r6 r5 r6
	fload	f5 r6 0
	fstore	f5 r2 0
	store	r4 r2 1
	fstore	f4 r2 2
	fstore	f3 r2 3
	fstore	f2 r2 4
	store	r5 r2 5
	fadd	f2 f0 f5
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8367
	addi	r4 r0 1
	load	r5 r2 5
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 4
	fmul	f2 f2 f3
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f4 r4 0
	fload	f5 r2 3
	fmul	f4 f4 f5
	fadd	f2 f2 f4
	addi	r4 r0 3
	add	r4 r5 r4
	fload	f4 r4 0
	fload	f6 r2 2
	fmul	f4 f4 f6
	fadd	f2 f2 f4
	load	r4 r2 1
	store	r5 r2 5
	fstore	f2 r2 6
	store	r4 r2 1
	fadd	f4 f0 f6
	fadd	f2 f0 f3
	fadd	f3 f0 f5
	call	L_quadratic_2632
	load	r4 r2 1
	store	r4 r2 1
	fstore	f2 r2 7
	call	L_o_form_2519
	addi	r5 r0 3
	bne	r4 r5 L_else_8371
	fload	f2 r0 40
	fload	f3 r2 7
	fsub	f2 f3 f2
	jump	L_endif_8372
L_else_8371 : 
	fload	f2 r2 7
	fadd	f2 f0 f2
L_endif_8372 : 
	fload	f3 r2 6
	fstore	f3 r2 6
	fstore	f2 r2 8
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 8
	fload	f4 r2 0
	fmul	f3 f4 f3
	fsub	f2 f2 f3
	fstore	f2 r2 9
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8368
	addi	r4 r0 0
	addi	r2 r2 14
	return
L_else_8368 : 
	load	r4 r2 1
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8369
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f2 r2 9
	store	r5 r2 10
	store	r4 r2 11
	call	L_sqrt_2458
	fload	f3 r2 6
	fsub	f2 f3 f2
	addi	r4 r0 4
	load	r5 r2 5
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f2 f2 f3
	load	r4 r2 10
	load	r5 r2 11
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8370
L_else_8369 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f2 r2 9
	store	r5 r2 12
	store	r4 r2 13
	call	L_sqrt_2458
	fload	f3 r2 6
	fadd	f2 f3 f2
	addi	r4 r0 4
	load	r5 r2 5
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f2 f2 f3
	load	r4 r2 12
	load	r5 r2 13
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8370 : 
	addi	r4 r0 1
	addi	r2 r2 14
	return
L_else_8367 : 
	addi	r4 r0 0
	addi	r2 r2 14
	return
L_solver_fast_2674 : 
	subi	r2 r2 11
	addi	r7 r0 5042
	add	r7 r7 r4
	load	r7 r7 0
	addi	r8 r0 0
	add	r8 r6 r8
	fload	f2 r8 0
	store	r4 r2 0
	store	r5 r2 1
	store	r7 r2 2
	store	r6 r2 3
	fstore	f2 r2 4
	add	r4 r0 r7
	call	L_o_param_x_2535
	fload	f3 r2 4
	fsub	f2 f3 f2
	addi	r4 r0 1
	load	r5 r2 3
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 2
	fstore	f2 r2 5
	store	r4 r2 2
	store	r5 r2 3
	fstore	f3 r2 6
	call	L_o_param_y_2537
	fload	f3 r2 6
	fsub	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 3
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 2
	fstore	f2 r2 7
	store	r4 r2 2
	fstore	f3 r2 8
	call	L_o_param_z_2539
	fload	f3 r2 8
	fsub	f2 f3 f2
	load	r4 r2 1
	fstore	f2 r2 9
	store	r4 r2 1
	call	L_d_const_2580
	load	r5 r2 0
	add	r4 r4 r5
	load	r4 r4 0
	load	r5 r2 2
	store	r4 r2 10
	store	r5 r2 2
	add	r4 r0 r5
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8373
	load	r4 r2 1
	call	L_d_vec_2578
	add	r5 r0 r4
	fload	f2 r2 5
	fload	f3 r2 7
	fload	f4 r2 9
	load	r4 r2 2
	load	r6 r2 10
	addi	r2 r2 11
	jump	L_solver_rect_fast_2655
L_else_8373 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8374
	fload	f2 r2 5
	fload	f3 r2 7
	fload	f4 r2 9
	load	r4 r2 2
	load	r5 r2 10
	addi	r2 r2 11
	jump	L_solver_surface_fast_2662
L_else_8374 : 
	fload	f2 r2 5
	fload	f3 r2 7
	fload	f4 r2 9
	load	r4 r2 2
	load	r5 r2 10
	addi	r2 r2 11
	jump	L_solver_second_fast_2668
L_solver_surface_fast2_2678 : 
	subi	r2 r2 2
	addi	r4 r0 0
	add	r4 r5 r4
	fload	f2 r4 0
	store	r6 r2 0
	store	r5 r2 1
	call	L_fisneg_2431
	addi	r5 r0 0
	bne	r4 r5 L_else_8375
	addi	r4 r0 0
	addi	r2 r2 2
	return
L_else_8375 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	addi	r6 r0 0
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	addi	r6 r0 3
	load	r7 r2 0
	add	r6 r7 r6
	fload	f3 r6 0
	fmul	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r2 r2 2
	return
L_solver_second_fast2_2685 : 
	subi	r2 r2 14
	addi	r7 r0 0
	add	r7 r5 r7
	fload	f5 r7 0
	store	r4 r2 0
	fstore	f5 r2 1
	store	r6 r2 2
	fstore	f4 r2 3
	fstore	f3 r2 4
	fstore	f2 r2 5
	store	r5 r2 6
	fadd	f2 f0 f5
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8376
	addi	r4 r0 1
	load	r5 r2 6
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r2 5
	fmul	f2 f2 f3
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f3 r4 0
	fload	f4 r2 4
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r4 r0 3
	add	r4 r5 r4
	fload	f3 r4 0
	fload	f4 r2 3
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r4 r0 3
	load	r6 r2 2
	add	r4 r6 r4
	fload	f3 r4 0
	store	r5 r2 6
	fstore	f2 r2 7
	fstore	f3 r2 8
	call	L_fsqr_2442
	fload	f3 r2 8
	fload	f4 r2 1
	fmul	f3 f4 f3
	fsub	f2 f2 f3
	fstore	f2 r2 9
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8377
	addi	r4 r0 0
	addi	r2 r2 14
	return
L_else_8377 : 
	load	r4 r2 0
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8378
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f2 r2 9
	store	r5 r2 10
	store	r4 r2 11
	call	L_sqrt_2458
	fload	f3 r2 7
	fsub	f2 f3 f2
	addi	r4 r0 4
	load	r5 r2 6
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f2 f2 f3
	load	r4 r2 10
	load	r5 r2 11
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8379
L_else_8378 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	fload	f2 r2 9
	store	r5 r2 12
	store	r4 r2 13
	call	L_sqrt_2458
	fload	f3 r2 7
	fadd	f2 f3 f2
	addi	r4 r0 4
	load	r5 r2 6
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f2 f2 f3
	load	r4 r2 12
	load	r5 r2 13
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8379 : 
	addi	r4 r0 1
	addi	r2 r2 14
	return
L_else_8376 : 
	addi	r4 r0 0
	addi	r2 r2 14
	return
L_solver_fast2_2692 : 
	subi	r2 r2 8
	addi	r6 r0 5042
	add	r6 r6 r4
	load	r6 r6 0
	store	r6 r2 0
	store	r4 r2 1
	store	r5 r2 2
	add	r4 r0 r6
	call	L_o_param_ctbl_2557
	addi	r5 r0 0
	add	r5 r4 r5
	fload	f2 r5 0
	addi	r5 r0 1
	add	r5 r4 r5
	fload	f3 r5 0
	addi	r5 r0 2
	add	r5 r4 r5
	fload	f4 r5 0
	load	r5 r2 2
	store	r4 r2 3
	fstore	f4 r2 4
	fstore	f3 r2 5
	fstore	f2 r2 6
	store	r5 r2 2
	add	r4 r0 r5
	call	L_d_const_2580
	load	r5 r2 1
	add	r4 r4 r5
	load	r4 r4 0
	load	r5 r2 0
	store	r4 r2 7
	store	r5 r2 0
	add	r4 r0 r5
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8380
	load	r4 r2 2
	call	L_d_vec_2578
	add	r5 r0 r4
	fload	f2 r2 6
	fload	f3 r2 5
	fload	f4 r2 4
	load	r4 r2 0
	load	r6 r2 7
	addi	r2 r2 8
	jump	L_solver_rect_fast_2655
L_else_8380 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8381
	fload	f2 r2 6
	fload	f3 r2 5
	fload	f4 r2 4
	load	r4 r2 0
	load	r5 r2 7
	load	r6 r2 3
	addi	r2 r2 8
	jump	L_solver_surface_fast2_2678
L_else_8381 : 
	fload	f2 r2 6
	fload	f3 r2 5
	fload	f4 r2 4
	load	r4 r2 0
	load	r5 r2 7
	load	r6 r2 3
	addi	r2 r2 8
	jump	L_solver_second_fast2_2685
L_setup_rect_table_2695 : 
	subi	r2 r2 12
	addi	r6 r0 6
	fload	f2 r0 54
	store	r5 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	call	min_caml_create_float_array
	addi	r5 r0 0
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	store	r4 r2 2
	store	r6 r2 1
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8386
	addi	r4 r0 0
	load	r5 r2 0
	store	r4 r2 3
	store	r5 r2 0
	add	r4 r0 r5
	call	L_o_isinvert_2523
	addi	r5 r0 0
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	store	r6 r2 1
	store	r4 r2 4
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 4
	call	L_xor_2460
	load	r5 r2 0
	store	r5 r2 0
	store	r4 r2 5
	add	r4 r0 r5
	call	L_o_param_a_2527
	load	r4 r2 5
	call	L_fneg_cond_2465
	load	r4 r2 3
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	fload	f2 r0 40
	addi	r6 r0 0
	load	r7 r2 1
	add	r6 r7 r6
	fload	f3 r6 0
	fdiv	f2 f2 f3
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8387
L_else_8386 : 
	addi	r4 r0 1
	fload	f2 r0 54
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8387 : 
	addi	r4 r0 1
	load	r6 r2 1
	add	r4 r6 r4
	fload	f2 r4 0
	store	r5 r2 2
	store	r6 r2 1
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8384
	addi	r4 r0 2
	load	r5 r2 0
	store	r4 r2 6
	store	r5 r2 0
	add	r4 r0 r5
	call	L_o_isinvert_2523
	addi	r5 r0 1
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	store	r6 r2 1
	store	r4 r2 7
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 7
	call	L_xor_2460
	load	r5 r2 0
	store	r5 r2 0
	store	r4 r2 8
	add	r4 r0 r5
	call	L_o_param_b_2529
	load	r4 r2 8
	call	L_fneg_cond_2465
	load	r4 r2 6
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	fload	f2 r0 40
	addi	r6 r0 1
	load	r7 r2 1
	add	r6 r7 r6
	fload	f3 r6 0
	fdiv	f2 f2 f3
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8385
L_else_8384 : 
	addi	r4 r0 3
	fload	f2 r0 54
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8385 : 
	addi	r4 r0 2
	load	r6 r2 1
	add	r4 r6 r4
	fload	f2 r4 0
	store	r5 r2 2
	store	r6 r2 1
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8382
	addi	r4 r0 4
	load	r5 r2 0
	store	r4 r2 9
	store	r5 r2 0
	add	r4 r0 r5
	call	L_o_isinvert_2523
	addi	r5 r0 2
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	store	r6 r2 1
	store	r4 r2 10
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 10
	call	L_xor_2460
	load	r5 r2 0
	store	r4 r2 11
	add	r4 r0 r5
	call	L_o_param_c_2531
	load	r4 r2 11
	call	L_fneg_cond_2465
	load	r4 r2 9
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 5
	fload	f2 r0 40
	addi	r6 r0 2
	load	r7 r2 1
	add	r6 r7 r6
	fload	f3 r6 0
	fdiv	f2 f2 f3
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8383
L_else_8382 : 
	addi	r4 r0 5
	fload	f2 r0 54
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8383 : 
	add	r4 r0 r5
	addi	r2 r2 12
	return
L_setup_surface_table_2698 : 
	subi	r2 r2 12
	addi	r6 r0 4
	fload	f2 r0 54
	store	r5 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	call	min_caml_create_float_array
	addi	r5 r0 0
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	load	r5 r2 0
	store	r4 r2 2
	store	r5 r2 0
	store	r6 r2 1
	fstore	f2 r2 3
	add	r4 r0 r5
	call	L_o_param_a_2527
	fload	f3 r2 3
	fmul	f2 f3 f2
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	store	r4 r2 0
	store	r5 r2 1
	fstore	f2 r2 4
	fstore	f3 r2 5
	call	L_o_param_b_2529
	fload	f3 r2 5
	fmul	f2 f3 f2
	fload	f3 r2 4
	fadd	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	store	r4 r2 0
	fstore	f2 r2 6
	fstore	f3 r2 7
	call	L_o_param_c_2531
	fload	f3 r2 7
	fmul	f2 f3 f2
	fload	f3 r2 6
	fadd	f2 f3 f2
	fstore	f2 r2 8
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8388
	addi	r4 r0 0
	fload	f2 r0 54
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8389
L_else_8388 : 
	addi	r4 r0 0
	fload	f2 r0 26
	fload	f3 r2 8
	fdiv	f2 f2 f3
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	load	r6 r2 0
	store	r6 r2 0
	store	r4 r2 9
	store	r5 r2 2
	fstore	f3 r2 8
	add	r4 r0 r6
	call	L_o_param_a_2527
	fload	f3 r2 8
	fdiv	f2 f2 f3
	fstore	f3 r2 8
	call	L_fneg_2440
	load	r4 r2 9
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	load	r6 r2 0
	store	r6 r2 0
	store	r4 r2 10
	store	r5 r2 2
	add	r4 r0 r6
	call	L_o_param_b_2529
	fload	f3 r2 8
	fdiv	f2 f2 f3
	fstore	f3 r2 8
	call	L_fneg_2440
	load	r4 r2 10
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	load	r6 r2 0
	store	r4 r2 11
	store	r5 r2 2
	add	r4 r0 r6
	call	L_o_param_c_2531
	fload	f3 r2 8
	fdiv	f2 f2 f3
	call	L_fneg_2440
	load	r4 r2 11
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8389 : 
	add	r4 r0 r5
	addi	r2 r2 12
	return
L_setup_second_table_2701 : 
	subi	r2 r2 22
	addi	r6 r0 5
	fload	f2 r0 54
	store	r5 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	call	min_caml_create_float_array
	addi	r5 r0 0
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	addi	r5 r0 1
	add	r5 r6 r5
	fload	f3 r5 0
	addi	r5 r0 2
	add	r5 r6 r5
	fload	f4 r5 0
	load	r5 r2 0
	store	r4 r2 2
	store	r5 r2 0
	store	r6 r2 1
	add	r4 r0 r5
	call	L_quadratic_2632
	addi	r4 r0 0
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	fstore	f2 r2 3
	store	r4 r2 0
	store	r5 r2 1
	fstore	f3 r2 4
	call	L_o_param_a_2527
	fload	f3 r2 4
	fmul	f2 f3 f2
	call	L_fneg_2440
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	fstore	f2 r2 5
	store	r4 r2 0
	store	r5 r2 1
	fstore	f3 r2 6
	call	L_o_param_b_2529
	fload	f3 r2 6
	fmul	f2 f3 f2
	call	L_fneg_2440
	addi	r4 r0 2
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	store	r5 r2 1
	fstore	f2 r2 7
	store	r4 r2 0
	fstore	f3 r2 8
	call	L_o_param_c_2531
	fload	f3 r2 8
	fmul	f2 f3 f2
	call	L_fneg_2440
	addi	r4 r0 0
	load	r5 r2 2
	add	r4 r5 r4
	fload	f3 r2 3
	fstore	f3 r4 0
	load	r4 r2 0
	fstore	f3 r2 3
	store	r4 r2 0
	fstore	f2 r2 9
	store	r5 r2 2
	call	L_o_isrot_2525
	addi	r5 r0 0
	bne	r4 r5 L_else_8392
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	fload	f2 r2 5
	fstore	f2 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f2 r2 7
	fstore	f2 r4 0
	addi	r4 r0 3
	add	r4 r5 r4
	fload	f2 r2 9
	fstore	f2 r4 0
	jump	L_endif_8393
L_else_8392 : 
	addi	r4 r0 1
	addi	r5 r0 2
	load	r6 r2 1
	add	r5 r6 r5
	fload	f2 r5 0
	load	r5 r2 0
	store	r4 r2 10
	store	r5 r2 0
	store	r6 r2 1
	fstore	f2 r2 11
	add	r4 r0 r5
	call	L_o_param_r2_2553
	fload	f3 r2 11
	fmul	f2 f3 f2
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	store	r4 r2 0
	store	r5 r2 1
	fstore	f2 r2 12
	fstore	f3 r2 13
	call	L_o_param_r3_2555
	fload	f3 r2 13
	fmul	f2 f3 f2
	fload	f3 r2 12
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 5
	fsub	f2 f3 f2
	load	r4 r2 10
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	addi	r6 r0 2
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	load	r6 r2 0
	store	r4 r2 14
	store	r5 r2 2
	store	r6 r2 0
	store	r7 r2 1
	fstore	f2 r2 15
	add	r4 r0 r6
	call	L_o_param_r1_2551
	fload	f3 r2 15
	fmul	f2 f3 f2
	addi	r4 r0 0
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	store	r4 r2 0
	store	r5 r2 1
	fstore	f2 r2 16
	fstore	f3 r2 17
	call	L_o_param_r3_2555
	fload	f3 r2 17
	fmul	f2 f3 f2
	fload	f3 r2 16
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 7
	fsub	f2 f3 f2
	load	r4 r2 14
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 3
	addi	r6 r0 1
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	load	r6 r2 0
	store	r4 r2 18
	store	r5 r2 2
	store	r6 r2 0
	store	r7 r2 1
	fstore	f2 r2 19
	add	r4 r0 r6
	call	L_o_param_r1_2551
	fload	f3 r2 19
	fmul	f2 f3 f2
	addi	r4 r0 0
	load	r5 r2 1
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 0
	fstore	f2 r2 20
	fstore	f3 r2 21
	call	L_o_param_r2_2553
	fload	f3 r2 21
	fmul	f2 f3 f2
	fload	f3 r2 20
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 9
	fsub	f2 f3 f2
	load	r4 r2 18
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8393 : 
	fload	f2 r2 3
	store	r5 r2 2
	fstore	f2 r2 3
	call	L_fiszero_2427
	addi	r5 r0 0
	bne	r4 r5 L_else_8390
	addi	r4 r0 4
	fload	f2 r0 40
	fload	f3 r2 3
	fdiv	f2 f2 f3
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8391
L_else_8390 : 
L_endif_8391 : 
	load	r4 r2 2
	add	r4 r0 r4
	addi	r2 r2 22
	return
L_iter_setup_dirvec_constants_2704 : 
	subi	r2 r2 5
	addi	r6 r0 0
	bgt	r6 r5 L_else_8394
	addi	r6 r0 5042
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	store	r6 r2 1
	store	r4 r2 2
	call	L_d_const_2580
	load	r5 r2 2
	store	r5 r2 2
	store	r4 r2 3
	add	r4 r0 r5
	call	L_d_vec_2578
	load	r5 r2 1
	store	r5 r2 1
	store	r4 r2 4
	add	r4 r0 r5
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8395
	load	r4 r2 4
	load	r5 r2 1
	call	L_setup_rect_table_2695
	load	r5 r2 0
	load	r6 r2 3
	add	r6 r6 r5
	store	r4 r6 0
	jump	L_endif_8396
L_else_8395 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8397
	load	r4 r2 4
	load	r5 r2 1
	call	L_setup_surface_table_2698
	load	r5 r2 0
	load	r6 r2 3
	add	r6 r6 r5
	store	r4 r6 0
	jump	L_endif_8398
L_else_8397 : 
	load	r4 r2 4
	load	r5 r2 1
	call	L_setup_second_table_2701
	load	r5 r2 0
	load	r6 r2 3
	add	r6 r6 r5
	store	r4 r6 0
L_endif_8398 : 
L_endif_8396 : 
	addi	r4 r0 1
	sub	r5 r5 r4
	load	r4 r2 2
	addi	r2 r2 5
	jump	L_iter_setup_dirvec_constants_2704
L_else_8394 : 
	addi	r2 r2 5
	return
L_setup_dirvec_constants_2707 : 
	addi	r5 r0 4144
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	addi	r6 r0 1
	sub	r5 r5 r6
	jump	L_iter_setup_dirvec_constants_2704
L_setup_startp_constants_2709 : 
	subi	r2 r2 12
	addi	r6 r0 0
	bgt	r6 r5 L_else_8399
	addi	r6 r0 5042
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	store	r4 r2 1
	store	r6 r2 2
	add	r4 r0 r6
	call	L_o_param_ctbl_2557
	load	r5 r2 2
	store	r4 r2 3
	store	r5 r2 2
	add	r4 r0 r5
	call	L_o_form_2519
	addi	r5 r0 0
	addi	r6 r0 0
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	load	r6 r2 2
	store	r4 r2 4
	store	r6 r2 2
	store	r7 r2 1
	store	r5 r2 5
	fstore	f2 r2 6
	add	r4 r0 r6
	call	L_o_param_x_2535
	fload	f3 r2 6
	fsub	f2 f3 f2
	load	r4 r2 5
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	addi	r6 r0 1
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	load	r6 r2 2
	store	r6 r2 2
	store	r7 r2 1
	store	r4 r2 7
	store	r5 r2 3
	fstore	f2 r2 8
	add	r4 r0 r6
	call	L_o_param_y_2537
	fload	f3 r2 8
	fsub	f2 f3 f2
	load	r4 r2 7
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	addi	r6 r0 2
	load	r7 r2 1
	add	r6 r7 r6
	fload	f2 r6 0
	load	r6 r2 2
	store	r7 r2 1
	store	r6 r2 2
	store	r4 r2 9
	store	r5 r2 3
	fstore	f2 r2 10
	add	r4 r0 r6
	call	L_o_param_z_2539
	fload	f3 r2 10
	fsub	f2 f3 f2
	load	r4 r2 9
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 2
	load	r6 r2 4
	bne	r6 r4 L_else_8400
	addi	r4 r0 3
	load	r6 r2 2
	store	r4 r2 11
	store	r5 r2 3
	add	r4 r0 r6
	call	L_o_param_abc_2533
	addi	r5 r0 0
	load	r6 r2 3
	add	r5 r6 r5
	fload	f2 r5 0
	addi	r5 r0 1
	add	r5 r6 r5
	fload	f3 r5 0
	addi	r5 r0 2
	add	r5 r6 r5
	fload	f4 r5 0
	store	r6 r2 3
	call	L_veciprod2_2495
	load	r4 r2 11
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	jump	L_endif_8401
L_else_8400 : 
	addi	r4 r0 2
	bgt	r6 r4 L_else_8402
	jump	L_endif_8403
L_else_8402 : 
	addi	r4 r0 0
	add	r4 r5 r4
	fload	f2 r4 0
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f3 r4 0
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f4 r4 0
	load	r4 r2 2
	store	r5 r2 3
	store	r6 r2 4
	call	L_quadratic_2632
	addi	r4 r0 3
	addi	r5 r0 3
	load	r6 r2 4
	bne	r6 r5 L_else_8404
	fload	f3 r0 40
	fsub	f2 f2 f3
	jump	L_endif_8405
L_else_8404 : 
	fadd	f2 f0 f2
L_endif_8405 : 
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8403 : 
L_endif_8401 : 
	addi	r4 r0 1
	load	r5 r2 0
	sub	r5 r5 r4
	load	r4 r2 1
	addi	r2 r2 12
	jump	L_setup_startp_constants_2709
L_else_8399 : 
	addi	r2 r2 12
	return
L_setup_startp_2712 : 
	subi	r2 r2 1
	addi	r5 r0 4138
	store	r4 r2 0
	add	r1 r0 r5
	add	r5 r0 r4
	add	r4 r0 r1
	call	L_veccpy_2481
	addi	r4 r0 4144
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r5 r0 1
	sub	r5 r4 r5
	load	r4 r2 0
	addi	r2 r2 1
	jump	L_setup_startp_constants_2709
L_is_rect_outside_2714 : 
	subi	r2 r2 6
	fstore	f4 r2 0
	fstore	f3 r2 1
	store	r4 r2 2
	call	L_fabs_2433
	load	r4 r2 2
	store	r4 r2 2
	fstore	f2 r2 3
	call	L_o_param_a_2527
	add	f3 r0 f2
	fload	f2 r2 3
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8408
	addi	r4 r0 0
	jump	L_endif_8409
L_else_8408 : 
	fload	f2 r2 1
	call	L_fabs_2433
	load	r4 r2 2
	store	r4 r2 2
	fstore	f2 r2 4
	call	L_o_param_b_2529
	add	f3 r0 f2
	fload	f2 r2 4
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8410
	addi	r4 r0 0
	jump	L_endif_8411
L_else_8410 : 
	fload	f2 r2 0
	call	L_fabs_2433
	load	r4 r2 2
	store	r4 r2 2
	fstore	f2 r2 5
	call	L_o_param_c_2531
	add	f3 r0 f2
	fload	f2 r2 5
	call	L_fless_2435
L_endif_8411 : 
L_endif_8409 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8406
	load	r4 r2 2
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8407
	addi	r4 r0 1
	addi	r2 r2 6
	return
L_else_8407 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_else_8406 : 
	load	r4 r2 2
	addi	r2 r2 6
	jump	L_o_isinvert_2523
L_is_plane_outside_2719 : 
	subi	r2 r2 6
	store	r4 r2 0
	fstore	f4 r2 1
	fstore	f3 r2 2
	fstore	f2 r2 3
	call	L_o_param_abc_2533
	fload	f2 r2 3
	fload	f3 r2 2
	fload	f4 r2 1
	call	L_veciprod2_2495
	load	r4 r2 0
	fstore	f2 r2 4
	call	L_o_isinvert_2523
	fload	f2 r2 4
	store	r4 r2 5
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 5
	call	L_xor_2460
	addi	r5 r0 0
	bne	r4 r5 L_else_8412
	addi	r4 r0 1
	addi	r2 r2 6
	return
L_else_8412 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_is_second_outside_2724 : 
	subi	r2 r2 4
	store	r4 r2 0
	call	L_quadratic_2632
	load	r4 r2 0
	store	r4 r2 0
	fstore	f2 r2 1
	call	L_o_form_2519
	addi	r5 r0 3
	bne	r4 r5 L_else_8414
	fload	f2 r0 40
	fload	f3 r2 1
	fsub	f2 f3 f2
	jump	L_endif_8415
L_else_8414 : 
	fload	f2 r2 1
	fadd	f2 f0 f2
L_endif_8415 : 
	load	r4 r2 0
	fstore	f2 r2 2
	call	L_o_isinvert_2523
	fload	f2 r2 2
	store	r4 r2 3
	call	L_fisneg_2431
	add	r5 r0 r4
	load	r4 r2 3
	call	L_xor_2460
	addi	r5 r0 0
	bne	r4 r5 L_else_8413
	addi	r4 r0 1
	addi	r2 r2 4
	return
L_else_8413 : 
	addi	r4 r0 0
	addi	r2 r2 4
	return
L_is_outside_2729 : 
	subi	r2 r2 7
	fstore	f4 r2 0
	fstore	f3 r2 1
	store	r4 r2 2
	fstore	f2 r2 3
	call	L_o_param_x_2535
	fload	f3 r2 3
	fsub	f2 f3 f2
	load	r4 r2 2
	fstore	f2 r2 4
	store	r4 r2 2
	call	L_o_param_y_2537
	fload	f3 r2 1
	fsub	f2 f3 f2
	load	r4 r2 2
	fstore	f2 r2 5
	store	r4 r2 2
	call	L_o_param_z_2539
	fload	f3 r2 0
	fsub	f2 f3 f2
	load	r4 r2 2
	fstore	f2 r2 6
	store	r4 r2 2
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8416
	fload	f2 r2 4
	fload	f3 r2 5
	fload	f4 r2 6
	load	r4 r2 2
	addi	r2 r2 7
	jump	L_is_rect_outside_2714
L_else_8416 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8417
	fload	f2 r2 4
	fload	f3 r2 5
	fload	f4 r2 6
	load	r4 r2 2
	addi	r2 r2 7
	jump	L_is_plane_outside_2719
L_else_8417 : 
	fload	f2 r2 4
	fload	f3 r2 5
	fload	f4 r2 6
	load	r4 r2 2
	addi	r2 r2 7
	jump	L_is_second_outside_2724
L_check_all_inside_2734 : 
	subi	r2 r2 5
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 -1
	bne	r6 r7 L_else_8418
	addi	r4 r0 1
	addi	r2 r2 5
	return
L_else_8418 : 
	addi	r7 r0 5042
	add	r6 r7 r6
	load	r6 r6 0
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	store	r5 r2 3
	store	r4 r2 4
	add	r4 r0 r6
	call	L_is_outside_2729
	addi	r5 r0 0
	bne	r4 r5 L_else_8419
	addi	r4 r0 1
	load	r5 r2 4
	add	r4 r5 r4
	fload	f2 r2 2
	fload	f3 r2 1
	fload	f4 r2 0
	load	r5 r2 3
	addi	r2 r2 5
	jump	L_check_all_inside_2734
L_else_8419 : 
	addi	r4 r0 0
	addi	r2 r2 5
	return
L_shadow_check_and_group_2740 : 
	subi	r2 r2 4
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 -1
	bne	r6 r7 L_else_8420
	addi	r4 r0 0
	addi	r2 r2 4
	return
L_else_8420 : 
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 4977
	addi	r8 r0 4114
	store	r5 r2 0
	store	r4 r2 1
	store	r6 r2 2
	add	r5 r0 r7
	add	r4 r0 r6
	add	r6 r0 r8
	call	L_solver_fast_2674
	addi	r5 r0 4145
	addi	r6 r0 0
	add	r5 r5 r6
	fload	f2 r5 0
	addi	r5 r0 0
	fstore	f2 r2 3
	bne	r4 r5 L_else_8424
	addi	r4 r0 0
	jump	L_endif_8425
L_else_8424 : 
	fload	f3 r0 22
	fstore	f2 r2 3
	call	L_fless_2435
L_endif_8425 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8421
	addi	r4 r0 5042
	load	r5 r2 2
	add	r4 r4 r5
	load	r4 r4 0
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8423
	addi	r4 r0 0
	addi	r2 r2 4
	return
L_else_8423 : 
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r5 r2 0
	addi	r2 r2 4
	jump	L_shadow_check_and_group_2740
L_else_8421 : 
	fload	f2 r0 21
	fload	f3 r2 3
	fadd	f2 f3 f2
	addi	r4 r0 4111
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fmul	f3 f3 f2
	addi	r4 r0 4114
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f4 r4 0
	fadd	f3 f3 f4
	addi	r4 r0 4111
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f4 r4 0
	fmul	f4 f4 f2
	addi	r4 r0 4114
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f5 r4 0
	fadd	f4 f4 f5
	addi	r4 r0 4111
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f5 r4 0
	fmul	f2 f5 f2
	addi	r4 r0 4114
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f5 r4 0
	fadd	f2 f2 f5
	addi	r4 r0 0
	load	r5 r2 0
	store	r5 r2 0
	fadd	f1 f0 f4
	fadd	f4 f0 f2
	fadd	f2 f0 f3
	fadd	f3 f0 f1
	call	L_check_all_inside_2734
	addi	r5 r0 0
	bne	r4 r5 L_else_8422
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r5 r2 0
	addi	r2 r2 4
	jump	L_shadow_check_and_group_2740
L_else_8422 : 
	addi	r4 r0 1
	addi	r2 r2 4
	return
L_shadow_check_one_or_group_2743 : 
	subi	r2 r2 2
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 -1
	bne	r6 r7 L_else_8426
	addi	r4 r0 0
	addi	r2 r2 2
	return
L_else_8426 : 
	addi	r7 r0 4157
	add	r6 r7 r6
	load	r6 r6 0
	addi	r7 r0 0
	store	r5 r2 0
	store	r4 r2 1
	add	r5 r0 r6
	add	r4 r0 r7
	call	L_shadow_check_and_group_2740
	addi	r5 r0 0
	bne	r4 r5 L_else_8427
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r5 r2 0
	addi	r2 r2 2
	jump	L_shadow_check_one_or_group_2743
L_else_8427 : 
	addi	r4 r0 1
	addi	r2 r2 2
	return
L_shadow_check_one_or_matrix_2746 : 
	subi	r2 r2 3
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 0
	add	r7 r6 r7
	load	r7 r7 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_8428
	addi	r4 r0 0
	addi	r2 r2 3
	return
L_else_8428 : 
	addi	r8 r0 99
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	bne	r7 r8 L_else_8431
	addi	r4 r0 1
	jump	L_endif_8432
L_else_8431 : 
	addi	r8 r0 4977
	addi	r9 r0 4114
	store	r5 r2 1
	store	r4 r2 2
	store	r6 r2 0
	add	r6 r0 r9
	add	r5 r0 r8
	add	r4 r0 r7
	call	L_solver_fast_2674
	addi	r5 r0 0
	bne	r4 r5 L_else_8433
	addi	r4 r0 0
	jump	L_endif_8434
L_else_8433 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	fload	f3 r0 20
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8435
	addi	r4 r0 0
	jump	L_endif_8436
L_else_8435 : 
	addi	r4 r0 1
	load	r5 r2 0
	store	r5 r2 0
	call	L_shadow_check_one_or_group_2743
	addi	r5 r0 0
	bne	r4 r5 L_else_8437
	addi	r4 r0 0
	jump	L_endif_8438
L_else_8437 : 
	addi	r4 r0 1
L_endif_8438 : 
L_endif_8436 : 
L_endif_8434 : 
L_endif_8432 : 
	addi	r5 r0 0
	bne	r4 r5 L_else_8429
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	addi	r2 r2 3
	jump	L_shadow_check_one_or_matrix_2746
L_else_8429 : 
	addi	r4 r0 1
	load	r5 r2 0
	call	L_shadow_check_one_or_group_2743
	addi	r5 r0 0
	bne	r4 r5 L_else_8430
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	addi	r2 r2 3
	jump	L_shadow_check_one_or_matrix_2746
L_else_8430 : 
	addi	r4 r0 1
	addi	r2 r2 3
	return
L_solve_each_element_2749 : 
	subi	r2 r2 10
	add	r7 r5 r4
	load	r7 r7 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_8439
	addi	r2 r2 10
	return
L_else_8439 : 
	addi	r8 r0 4135
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	store	r7 r2 3
	add	r5 r0 r6
	add	r4 r0 r7
	add	r6 r0 r8
	call	L_solver_2651
	addi	r5 r0 0
	bne	r4 r5 L_else_8440
	addi	r4 r0 5042
	load	r5 r2 3
	add	r4 r4 r5
	load	r4 r4 0
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8447
	addi	r2 r2 10
	return
L_else_8447 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 10
	jump	L_solve_each_element_2749
L_else_8440 : 
	addi	r5 r0 4145
	addi	r6 r0 0
	add	r5 r5 r6
	fload	f3 r5 0
	fload	f2 r0 54
	store	r4 r2 4
	fstore	f3 r2 5
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8441
	jump	L_endif_8442
L_else_8441 : 
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fload	f2 r2 5
	fstore	f2 r2 5
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8443
	jump	L_endif_8444
L_else_8443 : 
	fload	f2 r0 21
	fload	f3 r2 5
	fadd	f2 f3 f2
	addi	r4 r0 0
	load	r5 r2 0
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f3 f3 f2
	addi	r4 r0 4135
	addi	r6 r0 0
	add	r4 r4 r6
	fload	f4 r4 0
	fadd	f3 f3 f4
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f4 r4 0
	fmul	f4 f4 f2
	addi	r4 r0 4135
	addi	r6 r0 1
	add	r4 r4 r6
	fload	f5 r4 0
	fadd	f4 f4 f5
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f5 r4 0
	fmul	f5 f5 f2
	addi	r4 r0 4135
	addi	r6 r0 2
	add	r4 r4 r6
	fload	f6 r4 0
	fadd	f5 f5 f6
	addi	r4 r0 0
	load	r6 r2 1
	store	r5 r2 0
	store	r6 r2 1
	fstore	f5 r2 6
	fstore	f4 r2 7
	fstore	f3 r2 8
	fstore	f2 r2 9
	add	r5 r0 r6
	fadd	f2 f0 f3
	fadd	f3 f0 f4
	fadd	f4 f0 f5
	call	L_check_all_inside_2734
	addi	r5 r0 0
	bne	r4 r5 L_else_8445
	jump	L_endif_8446
L_else_8445 : 
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 9
	fstore	f2 r4 0
	addi	r4 r0 4114
	fload	f2 r2 8
	fload	f3 r2 7
	fload	f4 r2 6
	call	L_vecset_2471
	addi	r4 r0 4115
	addi	r5 r0 0
	add	r4 r4 r5
	load	r5 r2 3
	store	r5 r4 0
	addi	r4 r0 4146
	addi	r5 r0 0
	add	r4 r4 r5
	load	r5 r2 4
	store	r5 r4 0
L_endif_8446 : 
L_endif_8444 : 
L_endif_8442 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 10
	jump	L_solve_each_element_2749
L_solve_one_or_network_2753 : 
	subi	r2 r2 3
	add	r7 r5 r4
	load	r7 r7 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_8448
	addi	r2 r2 3
	return
L_else_8448 : 
	addi	r8 r0 4157
	add	r7 r8 r7
	load	r7 r7 0
	addi	r8 r0 0
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r5 r0 r7
	add	r4 r0 r8
	call	L_solve_each_element_2749
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 3
	jump	L_solve_one_or_network_2753
L_trace_or_matrix_2757 : 
	subi	r2 r2 4
	add	r7 r5 r4
	load	r7 r7 0
	addi	r8 r0 0
	add	r8 r7 r8
	load	r8 r8 0
	addi	r9 r0 -1
	bne	r8 r9 L_else_8449
	addi	r2 r2 4
	return
L_else_8449 : 
	addi	r9 r0 99
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	bne	r8 r9 L_else_8450
	addi	r8 r0 1
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r5 r0 r7
	add	r4 r0 r8
	call	L_solve_one_or_network_2753
	jump	L_endif_8451
L_else_8450 : 
	addi	r9 r0 4135
	store	r5 r2 1
	store	r4 r2 2
	store	r6 r2 0
	store	r7 r2 3
	add	r5 r0 r6
	add	r4 r0 r8
	add	r6 r0 r9
	call	L_solver_2651
	addi	r5 r0 0
	bne	r4 r5 L_else_8452
	jump	L_endif_8453
L_else_8452 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8454
	jump	L_endif_8455
L_else_8454 : 
	addi	r4 r0 1
	load	r5 r2 3
	load	r6 r2 0
	store	r6 r2 0
	call	L_solve_one_or_network_2753
L_endif_8455 : 
L_endif_8453 : 
L_endif_8451 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 4
	jump	L_trace_or_matrix_2757
L_judge_intersection_2761 : 
	subi	r2 r2 1
	addi	r5 r0 4154
	addi	r6 r0 0
	fload	f2 r0 19
	add	r5 r5 r6
	fstore	f2 r5 0
	addi	r5 r0 0
	addi	r6 r0 4155
	addi	r7 r0 0
	add	r6 r6 r7
	load	r6 r6 0
	add	r1 r0 r6
	add	r6 r0 r4
	add	r4 r0 r5
	add	r5 r0 r1
	call	L_trace_or_matrix_2757
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fload	f2 r0 20
	fstore	f3 r2 0
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8456
	addi	r4 r0 0
	addi	r2 r2 1
	return
L_else_8456 : 
	fload	f3 r0 18
	fload	f2 r2 0
	addi	r2 r2 1
	jump	L_fless_2435
L_solve_each_element_fast_2763 : 
	subi	r2 r2 11
	store	r6 r2 0
	store	r4 r2 1
	store	r5 r2 2
	add	r4 r0 r6
	call	L_d_vec_2578
	load	r5 r2 1
	load	r6 r2 2
	add	r7 r6 r5
	load	r7 r7 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_8457
	addi	r2 r2 11
	return
L_else_8457 : 
	load	r8 r2 0
	store	r4 r2 3
	store	r8 r2 0
	store	r6 r2 2
	store	r5 r2 1
	store	r7 r2 4
	add	r5 r0 r8
	add	r4 r0 r7
	call	L_solver_fast2_2692
	addi	r5 r0 0
	bne	r4 r5 L_else_8458
	addi	r4 r0 5042
	load	r5 r2 4
	add	r4 r4 r5
	load	r4 r4 0
	call	L_o_isinvert_2523
	addi	r5 r0 0
	bne	r4 r5 L_else_8465
	addi	r2 r2 11
	return
L_else_8465 : 
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r5 r2 2
	load	r6 r2 0
	addi	r2 r2 11
	jump	L_solve_each_element_fast_2763
L_else_8458 : 
	addi	r5 r0 4145
	addi	r6 r0 0
	add	r5 r5 r6
	fload	f3 r5 0
	fload	f2 r0 54
	store	r4 r2 5
	fstore	f3 r2 6
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8459
	jump	L_endif_8460
L_else_8459 : 
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fload	f2 r2 6
	fstore	f2 r2 6
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8461
	jump	L_endif_8462
L_else_8461 : 
	fload	f2 r0 21
	fload	f3 r2 6
	fadd	f2 f3 f2
	addi	r4 r0 0
	load	r5 r2 3
	add	r4 r5 r4
	fload	f3 r4 0
	fmul	f3 f3 f2
	addi	r4 r0 4138
	addi	r6 r0 0
	add	r4 r4 r6
	fload	f4 r4 0
	fadd	f3 f3 f4
	addi	r4 r0 1
	add	r4 r5 r4
	fload	f4 r4 0
	fmul	f4 f4 f2
	addi	r4 r0 4138
	addi	r6 r0 1
	add	r4 r4 r6
	fload	f5 r4 0
	fadd	f4 f4 f5
	addi	r4 r0 2
	add	r4 r5 r4
	fload	f5 r4 0
	fmul	f5 f5 f2
	addi	r4 r0 4138
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f6 r4 0
	fadd	f5 f5 f6
	addi	r4 r0 0
	load	r5 r2 2
	store	r5 r2 2
	fstore	f5 r2 7
	fstore	f4 r2 8
	fstore	f3 r2 9
	fstore	f2 r2 10
	fadd	f2 f0 f3
	fadd	f3 f0 f4
	fadd	f4 f0 f5
	call	L_check_all_inside_2734
	addi	r5 r0 0
	bne	r4 r5 L_else_8463
	jump	L_endif_8464
L_else_8463 : 
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 10
	fstore	f2 r4 0
	addi	r4 r0 4114
	fload	f2 r2 9
	fload	f3 r2 8
	fload	f4 r2 7
	call	L_vecset_2471
	addi	r4 r0 4115
	addi	r5 r0 0
	add	r4 r4 r5
	load	r5 r2 4
	store	r5 r4 0
	addi	r4 r0 4146
	addi	r5 r0 0
	add	r4 r4 r5
	load	r5 r2 5
	store	r5 r4 0
L_endif_8464 : 
L_endif_8462 : 
L_endif_8460 : 
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r5 r2 2
	load	r6 r2 0
	addi	r2 r2 11
	jump	L_solve_each_element_fast_2763
L_solve_one_or_network_fast_2767 : 
	subi	r2 r2 3
	add	r7 r5 r4
	load	r7 r7 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_8466
	addi	r2 r2 3
	return
L_else_8466 : 
	addi	r8 r0 4157
	add	r7 r8 r7
	load	r7 r7 0
	addi	r8 r0 0
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r5 r0 r7
	add	r4 r0 r8
	call	L_solve_each_element_fast_2763
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 3
	jump	L_solve_one_or_network_fast_2767
L_trace_or_matrix_fast_2771 : 
	subi	r2 r2 4
	add	r7 r5 r4
	load	r7 r7 0
	addi	r8 r0 0
	add	r8 r7 r8
	load	r8 r8 0
	addi	r9 r0 -1
	bne	r8 r9 L_else_8467
	addi	r2 r2 4
	return
L_else_8467 : 
	addi	r9 r0 99
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	bne	r8 r9 L_else_8468
	addi	r8 r0 1
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r5 r0 r7
	add	r4 r0 r8
	call	L_solve_one_or_network_fast_2767
	jump	L_endif_8469
L_else_8468 : 
	store	r5 r2 1
	store	r4 r2 2
	store	r6 r2 0
	store	r7 r2 3
	add	r5 r0 r6
	add	r4 r0 r8
	call	L_solver_fast2_2692
	addi	r5 r0 0
	bne	r4 r5 L_else_8470
	jump	L_endif_8471
L_else_8470 : 
	addi	r4 r0 4145
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8472
	jump	L_endif_8473
L_else_8472 : 
	addi	r4 r0 1
	load	r5 r2 3
	load	r6 r2 0
	store	r6 r2 0
	call	L_solve_one_or_network_fast_2767
L_endif_8473 : 
L_endif_8471 : 
L_endif_8469 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r4 r5 r4
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 4
	jump	L_trace_or_matrix_fast_2771
L_judge_intersection_fast_2775 : 
	subi	r2 r2 1
	addi	r5 r0 4154
	addi	r6 r0 0
	fload	f2 r0 19
	add	r5 r5 r6
	fstore	f2 r5 0
	addi	r5 r0 0
	addi	r6 r0 4155
	addi	r7 r0 0
	add	r6 r6 r7
	load	r6 r6 0
	add	r1 r0 r6
	add	r6 r0 r4
	add	r4 r0 r5
	add	r5 r0 r1
	call	L_trace_or_matrix_fast_2771
	addi	r4 r0 4154
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fload	f2 r0 20
	fstore	f3 r2 0
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8474
	addi	r4 r0 0
	addi	r2 r2 1
	return
L_else_8474 : 
	fload	f3 r0 18
	fload	f2 r2 0
	addi	r2 r2 1
	jump	L_fless_2435
L_get_nvector_rect_2777 : 
	subi	r2 r2 4
	addi	r5 r0 4146
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	addi	r6 r0 4118
	store	r4 r2 0
	store	r5 r2 1
	add	r4 r0 r6
	call	L_vecbzero_2479
	addi	r4 r0 4118
	addi	r5 r0 1
	load	r6 r2 1
	sub	r5 r6 r5
	addi	r7 r0 1
	sub	r6 r6 r7
	load	r7 r2 0
	add	r6 r7 r6
	fload	f2 r6 0
	store	r5 r2 2
	store	r4 r2 3
	call	L_sgn_2463
	call	L_fneg_2440
	load	r4 r2 2
	load	r5 r2 3
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r2 r2 4
	return
L_get_nvector_plane_2779 : 
	subi	r2 r2 7
	addi	r5 r0 4118
	addi	r6 r0 0
	store	r4 r2 0
	store	r6 r2 1
	store	r5 r2 2
	call	L_o_param_a_2527
	call	L_fneg_2440
	load	r4 r2 1
	load	r5 r2 2
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 1
	load	r6 r2 0
	store	r6 r2 0
	store	r5 r2 3
	store	r4 r2 4
	add	r4 r0 r6
	call	L_o_param_b_2529
	call	L_fneg_2440
	load	r4 r2 3
	load	r5 r2 4
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 2
	load	r6 r2 0
	store	r5 r2 5
	store	r4 r2 6
	add	r4 r0 r6
	call	L_o_param_c_2531
	call	L_fneg_2440
	load	r4 r2 5
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r2 r2 7
	return
L_get_nvector_second_2781 : 
	subi	r2 r2 20
	addi	r5 r0 4114
	addi	r6 r0 0
	add	r5 r5 r6
	fload	f2 r5 0
	store	r4 r2 0
	fstore	f2 r2 1
	call	L_o_param_x_2535
	fload	f3 r2 1
	fsub	f2 f3 f2
	addi	r4 r0 4114
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f3 r4 0
	load	r4 r2 0
	fstore	f2 r2 2
	store	r4 r2 0
	fstore	f3 r2 3
	call	L_o_param_y_2537
	fload	f3 r2 3
	fsub	f2 f3 f2
	addi	r4 r0 4114
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f3 r4 0
	load	r4 r2 0
	fstore	f2 r2 4
	store	r4 r2 0
	fstore	f3 r2 5
	call	L_o_param_z_2539
	fload	f3 r2 5
	fsub	f2 f3 f2
	load	r4 r2 0
	fstore	f2 r2 6
	store	r4 r2 0
	call	L_o_param_a_2527
	fload	f3 r2 2
	fmul	f2 f3 f2
	load	r4 r2 0
	fstore	f3 r2 2
	fstore	f2 r2 7
	store	r4 r2 0
	call	L_o_param_b_2529
	fload	f3 r2 4
	fmul	f2 f3 f2
	load	r4 r2 0
	fstore	f3 r2 4
	fstore	f2 r2 8
	store	r4 r2 0
	call	L_o_param_c_2531
	fload	f3 r2 6
	fmul	f2 f3 f2
	load	r4 r2 0
	fstore	f3 r2 6
	store	r4 r2 0
	fstore	f2 r2 9
	call	L_o_isrot_2525
	addi	r5 r0 0
	bne	r4 r5 L_else_8475
	addi	r4 r0 4118
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r2 7
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r2 8
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r2 9
	fstore	f2 r4 0
	jump	L_endif_8476
L_else_8475 : 
	addi	r4 r0 4118
	addi	r5 r0 0
	load	r6 r2 0
	store	r5 r2 10
	store	r4 r2 11
	store	r6 r2 0
	add	r4 r0 r6
	call	L_o_param_r3_2555
	fload	f3 r2 4
	fmul	f2 f3 f2
	load	r4 r2 0
	fstore	f3 r2 4
	store	r4 r2 0
	fstore	f2 r2 12
	call	L_o_param_r2_2553
	fload	f3 r2 6
	fmul	f2 f3 f2
	fload	f4 r2 12
	fadd	f2 f4 f2
	fstore	f3 r2 6
	call	L_fhalf_2438
	fload	f3 r2 7
	fadd	f2 f3 f2
	load	r4 r2 10
	load	r5 r2 11
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 1
	load	r6 r2 0
	store	r5 r2 13
	store	r4 r2 14
	store	r6 r2 0
	add	r4 r0 r6
	call	L_o_param_r3_2555
	fload	f3 r2 2
	fmul	f2 f3 f2
	load	r4 r2 0
	fstore	f3 r2 2
	store	r4 r2 0
	fstore	f2 r2 15
	call	L_o_param_r1_2551
	fload	f3 r2 6
	fmul	f2 f3 f2
	fload	f3 r2 15
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 8
	fadd	f2 f3 f2
	load	r4 r2 13
	load	r5 r2 14
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4118
	addi	r5 r0 2
	load	r6 r2 0
	store	r5 r2 16
	store	r4 r2 17
	store	r6 r2 0
	add	r4 r0 r6
	call	L_o_param_r2_2553
	fload	f3 r2 2
	fmul	f2 f3 f2
	load	r4 r2 0
	store	r4 r2 0
	fstore	f2 r2 18
	call	L_o_param_r1_2551
	fload	f3 r2 4
	fmul	f2 f3 f2
	fload	f3 r2 18
	fadd	f2 f3 f2
	call	L_fhalf_2438
	fload	f3 r2 9
	fadd	f2 f3 f2
	load	r4 r2 16
	load	r5 r2 17
	add	r4 r5 r4
	fstore	f2 r4 0
L_endif_8476 : 
	addi	r4 r0 4118
	load	r5 r2 0
	store	r4 r2 19
	add	r4 r0 r5
	call	L_o_isinvert_2523
	add	r5 r0 r4
	load	r4 r2 19
	addi	r2 r2 20
	jump	L_vecunit_sgn_2489
L_get_nvector_2783 : 
	subi	r2 r2 2
	store	r4 r2 0
	store	r5 r2 1
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8477
	load	r4 r2 1
	addi	r2 r2 2
	jump	L_get_nvector_rect_2777
L_else_8477 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8478
	load	r4 r2 0
	addi	r2 r2 2
	jump	L_get_nvector_plane_2779
L_else_8478 : 
	load	r4 r2 0
	addi	r2 r2 2
	jump	L_get_nvector_second_2781
L_utexture_2786 : 
	subi	r2 r2 33
	store	r5 r2 0
	store	r4 r2 1
	call	L_o_texturetype_2517
	addi	r5 r0 4121
	addi	r6 r0 0
	load	r7 r2 1
	store	r4 r2 2
	store	r7 r2 1
	store	r6 r2 3
	store	r5 r2 4
	add	r4 r0 r7
	call	L_o_color_red_2545
	load	r4 r2 3
	load	r5 r2 4
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4121
	addi	r5 r0 1
	load	r6 r2 1
	store	r6 r2 1
	store	r5 r2 5
	store	r4 r2 6
	add	r4 r0 r6
	call	L_o_color_green_2547
	load	r4 r2 5
	load	r5 r2 6
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 4121
	addi	r5 r0 2
	load	r6 r2 1
	store	r6 r2 1
	store	r5 r2 7
	store	r4 r2 8
	add	r4 r0 r6
	call	L_o_color_blue_2549
	load	r4 r2 7
	load	r5 r2 8
	add	r4 r5 r4
	fstore	f2 r4 0
	addi	r4 r0 1
	load	r5 r2 2
	bne	r5 r4 L_else_8479
	addi	r4 r0 0
	load	r5 r2 0
	add	r4 r5 r4
	fload	f2 r4 0
	load	r4 r2 1
	store	r4 r2 1
	store	r5 r2 0
	fstore	f2 r2 9
	call	L_o_param_x_2535
	fload	f3 r2 9
	fsub	f2 f3 f2
	fload	f3 r0 8
	fmul	f3 f2 f3
	floor	f3 f3
	fload	f4 r0 7
	fmul	f3 f3 f4
	fsub	f2 f2 f3
	fload	f3 r0 10
	call	L_fless_2435
	addi	r5 r0 2
	load	r6 r2 0
	add	r5 r6 r5
	fload	f2 r5 0
	load	r5 r2 1
	store	r4 r2 10
	fstore	f2 r2 11
	add	r4 r0 r5
	call	L_o_param_z_2539
	fload	f3 r2 11
	fsub	f2 f3 f2
	fload	f3 r0 8
	fmul	f3 f2 f3
	floor	f3 f3
	fload	f4 r0 7
	fmul	f3 f3 f4
	fsub	f2 f2 f3
	fload	f3 r0 10
	call	L_fless_2435
	addi	r5 r0 4121
	addi	r6 r0 1
	addi	r7 r0 0
	load	r8 r2 10
	bne	r8 r7 L_else_8489
	addi	r7 r0 0
	bne	r4 r7 L_else_8493
	fload	f2 r0 12
	jump	L_endif_8494
L_else_8493 : 
	fload	f2 r0 54
L_endif_8494 : 
	jump	L_endif_8490
L_else_8489 : 
	addi	r7 r0 0
	bne	r4 r7 L_else_8491
	fload	f2 r0 54
	jump	L_endif_8492
L_else_8491 : 
	fload	f2 r0 12
L_endif_8492 : 
L_endif_8490 : 
	add	r4 r5 r6
	fstore	f2 r4 0
	addi	r2 r2 33
	return
L_else_8479 : 
	addi	r4 r0 2
	bne	r5 r4 L_else_8480
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	fload	f2 r4 0
	fload	f3 r0 9
	fmul	f2 f2 f3
	call	L_sin_2448
	call	L_fsqr_2442
	addi	r4 r0 4121
	addi	r5 r0 0
	fload	f3 r0 12
	fmul	f3 f3 f2
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4121
	addi	r5 r0 1
	fload	f3 r0 12
	fload	f4 r0 40
	fsub	f2 f4 f2
	fmul	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 33
	return
L_else_8480 : 
	addi	r4 r0 3
	bne	r5 r4 L_else_8481
	addi	r4 r0 0
	load	r5 r2 0
	add	r4 r5 r4
	fload	f2 r4 0
	load	r4 r2 1
	store	r4 r2 1
	store	r5 r2 0
	fstore	f2 r2 12
	call	L_o_param_x_2535
	fload	f3 r2 12
	fsub	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 0
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 1
	fstore	f2 r2 13
	fstore	f3 r2 14
	call	L_o_param_z_2539
	fload	f3 r2 14
	fsub	f2 f3 f2
	fload	f3 r2 13
	fstore	f2 r2 15
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 15
	fstore	f2 r2 16
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 16
	fadd	f2 f3 f2
	call	L_sqrt_2458
	fload	f3 r0 10
	fdiv	f2 f2 f3
	floor	f3 f2
	fsub	f2 f2 f3
	fload	f3 r0 14
	fmul	f2 f2 f3
	call	L_cos_2450
	call	L_fsqr_2442
	addi	r4 r0 4121
	addi	r5 r0 1
	fload	f3 r0 12
	fmul	f3 f2 f3
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4121
	addi	r5 r0 2
	fload	f3 r0 40
	fsub	f2 f3 f2
	fload	f3 r0 12
	fmul	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 33
	return
L_else_8481 : 
	addi	r4 r0 4
	bne	r5 r4 L_else_8482
	addi	r4 r0 0
	load	r5 r2 0
	add	r4 r5 r4
	fload	f2 r4 0
	load	r4 r2 1
	store	r5 r2 0
	store	r4 r2 1
	fstore	f2 r2 17
	call	L_o_param_x_2535
	fload	f3 r2 17
	fsub	f2 f3 f2
	load	r4 r2 1
	store	r4 r2 1
	fstore	f2 r2 18
	call	L_o_param_a_2527
	call	L_sqrt_2458
	fload	f3 r2 18
	fmul	f2 f3 f2
	addi	r4 r0 2
	load	r5 r2 0
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 1
	store	r5 r2 0
	fstore	f2 r2 19
	store	r4 r2 1
	fstore	f3 r2 20
	call	L_o_param_z_2539
	fload	f3 r2 20
	fsub	f2 f3 f2
	load	r4 r2 1
	store	r4 r2 1
	fstore	f2 r2 21
	call	L_o_param_c_2531
	call	L_sqrt_2458
	fload	f3 r2 21
	fmul	f2 f3 f2
	fload	f3 r2 19
	fstore	f3 r2 19
	fstore	f2 r2 22
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 22
	fstore	f3 r2 22
	fstore	f2 r2 23
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 23
	fadd	f2 f3 f2
	fload	f3 r2 19
	fstore	f2 r2 24
	fstore	f3 r2 19
	fadd	f2 f0 f3
	call	L_fabs_2433
	fload	f3 r0 17
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8487
	fload	f2 r2 19
	fload	f3 r2 22
	fdiv	f2 f3 f2
	call	L_fabs_2433
	call	L_atan_2452
	fload	f3 r0 15
	fmul	f2 f2 f3
	fload	f3 r0 14
	fdiv	f2 f2 f3
	jump	L_endif_8488
L_else_8487 : 
	fload	f2 r0 16
L_endif_8488 : 
	floor	f3 f2
	fsub	f2 f2 f3
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	fload	f3 r4 0
	load	r4 r2 1
	fstore	f2 r2 25
	store	r4 r2 1
	fstore	f3 r2 26
	call	L_o_param_y_2537
	fload	f3 r2 26
	fsub	f2 f3 f2
	load	r4 r2 1
	fstore	f2 r2 27
	call	L_o_param_b_2529
	call	L_sqrt_2458
	fload	f3 r2 27
	fmul	f2 f3 f2
	fload	f3 r2 24
	fstore	f3 r2 24
	fstore	f2 r2 28
	fadd	f2 f0 f3
	call	L_fabs_2433
	fload	f3 r0 17
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8485
	fload	f2 r2 24
	fload	f3 r2 28
	fdiv	f2 f3 f2
	call	L_fabs_2433
	call	L_atan_2452
	fload	f3 r0 15
	fmul	f2 f2 f3
	fload	f3 r0 14
	fdiv	f2 f2 f3
	jump	L_endif_8486
L_else_8485 : 
	fload	f2 r0 16
L_endif_8486 : 
	floor	f3 f2
	fsub	f2 f2 f3
	fload	f3 r0 13
	fload	f4 r0 41
	fload	f5 r2 25
	fsub	f4 f4 f5
	fstore	f2 r2 29
	fstore	f3 r2 30
	fadd	f2 f0 f4
	call	L_fsqr_2442
	fload	f3 r2 30
	fsub	f2 f3 f2
	fload	f3 r0 41
	fload	f4 r2 29
	fsub	f3 f3 f4
	fstore	f2 r2 31
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 31
	fsub	f2 f3 f2
	fstore	f2 r2 32
	call	L_fisneg_2431
	addi	r5 r0 0
	bne	r4 r5 L_else_8483
	fload	f2 r2 32
	fadd	f2 f0 f2
	jump	L_endif_8484
L_else_8483 : 
	fload	f2 r0 54
L_endif_8484 : 
	addi	r4 r0 4121
	addi	r5 r0 2
	fload	f3 r0 12
	fmul	f2 f3 f2
	fload	f3 r0 11
	fdiv	f2 f2 f3
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 33
	return
L_else_8482 : 
	addi	r2 r2 33
	return
L_add_light_2789 : 
	subi	r2 r2 3
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8496
	jump	L_endif_8497
L_else_8496 : 
	addi	r4 r0 4127
	addi	r5 r0 4121
	fload	f2 r2 2
	call	L_vecaccum_2500
L_endif_8497 : 
	fload	f2 r2 1
	fstore	f2 r2 1
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8495
	addi	r2 r2 3
	return
L_else_8495 : 
	fload	f2 r2 1
	call	L_fsqr_2442
	call	L_fsqr_2442
	fload	f3 r2 0
	fmul	f2 f2 f3
	addi	r4 r0 4127
	addi	r5 r0 0
	addi	r6 r0 4127
	addi	r7 r0 0
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f3 f3 f2
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4127
	addi	r5 r0 1
	addi	r6 r0 4127
	addi	r7 r0 1
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f3 f3 f2
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4127
	addi	r5 r0 2
	addi	r6 r0 4127
	addi	r7 r0 2
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 3
	return
L_trace_reflections_2793 : 
	subi	r2 r2 11
	addi	r6 r0 0
	bgt	r6 r4 L_else_8498
	addi	r6 r0 4257
	add	r6 r6 r4
	load	r6 r6 0
	store	r4 r2 0
	fstore	f3 r2 1
	store	r5 r2 2
	fstore	f2 r2 3
	store	r6 r2 4
	add	r4 r0 r6
	call	L_r_dvec_2584
	store	r4 r2 5
	call	L_judge_intersection_fast_2775
	addi	r5 r0 0
	bne	r4 r5 L_else_8499
	jump	L_endif_8500
L_else_8499 : 
	addi	r4 r0 4115
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r5 r0 4
	mul	r4 r4 r5
	addi	r5 r0 4146
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	add	r4 r4 r5
	load	r5 r2 4
	store	r5 r2 4
	store	r4 r2 6
	add	r4 r0 r5
	call	L_r_surface_id_2582
	load	r5 r2 6
	bne	r5 r4 L_else_8501
	addi	r4 r0 0
	addi	r5 r0 4155
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	call	L_shadow_check_one_or_matrix_2746
	addi	r5 r0 0
	bne	r4 r5 L_else_8503
	addi	r4 r0 4118
	load	r5 r2 5
	store	r5 r2 5
	store	r4 r2 7
	add	r4 r0 r5
	call	L_d_vec_2578
	add	r5 r0 r4
	load	r4 r2 7
	call	L_veciprod_2492
	load	r4 r2 4
	fstore	f2 r2 8
	call	L_r_bright_2586
	fload	f3 r2 3
	fmul	f4 f2 f3
	fload	f5 r2 8
	fmul	f4 f4 f5
	load	r4 r2 5
	fstore	f3 r2 3
	fstore	f4 r2 9
	fstore	f2 r2 10
	call	L_d_vec_2578
	add	r5 r0 r4
	load	r4 r2 2
	store	r4 r2 2
	call	L_veciprod_2492
	fload	f3 r2 10
	fmul	f3 f3 f2
	fload	f2 r2 9
	fload	f4 r2 1
	fstore	f4 r2 1
	call	L_add_light_2789
	jump	L_endif_8504
L_else_8503 : 
L_endif_8504 : 
	jump	L_endif_8502
L_else_8501 : 
L_endif_8502 : 
L_endif_8500 : 
	addi	r4 r0 1
	load	r5 r2 0
	sub	r4 r5 r4
	fload	f2 r2 3
	fload	f3 r2 1
	load	r5 r2 2
	addi	r2 r2 11
	jump	L_trace_reflections_2793
L_else_8498 : 
	addi	r2 r2 11
	return
L_trace_ray_2798 : 
	subi	r2 r2 17
	addi	r7 r0 4
	bgt	r4 r7 L_else_8505
	fstore	f3 r2 0
	store	r6 r2 1
	fstore	f2 r2 2
	store	r4 r2 3
	store	r5 r2 4
	add	r4 r0 r6
	call	L_p_surface_ids_2563
	load	r5 r2 4
	store	r5 r2 4
	store	r4 r2 5
	add	r4 r0 r5
	call	L_judge_intersection_2761
	addi	r5 r0 0
	bne	r4 r5 L_else_8506
	addi	r4 r0 -1
	load	r5 r2 3
	load	r6 r2 5
	add	r6 r6 r5
	store	r4 r6 0
	addi	r4 r0 0
	bne	r5 r4 L_else_8515
	addi	r2 r2 17
	return
L_else_8515 : 
	addi	r5 r0 4111
	load	r4 r2 4
	call	L_veciprod_2492
	call	L_fneg_2440
	fstore	f2 r2 6
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8516
	addi	r2 r2 17
	return
L_else_8516 : 
	fload	f2 r2 6
	fstore	f2 r2 6
	call	L_fsqr_2442
	fload	f3 r2 6
	fmul	f2 f2 f3
	fload	f3 r2 2
	fmul	f2 f2 f3
	addi	r4 r0 4153
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fmul	f2 f2 f3
	addi	r4 r0 4127
	addi	r5 r0 0
	addi	r6 r0 4127
	addi	r7 r0 0
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f3 f3 f2
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4127
	addi	r5 r0 1
	addi	r6 r0 4127
	addi	r7 r0 1
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f3 f3 f2
	add	r4 r4 r5
	fstore	f3 r4 0
	addi	r4 r0 4127
	addi	r5 r0 2
	addi	r6 r0 4127
	addi	r7 r0 2
	add	r6 r6 r7
	fload	f3 r6 0
	fadd	f2 f3 f2
	add	r4 r4 r5
	fstore	f2 r4 0
	addi	r2 r2 17
	return
L_else_8506 : 
	addi	r4 r0 4115
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r5 r0 5042
	add	r5 r5 r4
	load	r5 r5 0
	store	r4 r2 7
	store	r5 r2 8
	add	r4 r0 r5
	call	L_o_reflectiontype_2521
	load	r5 r2 8
	store	r4 r2 9
	store	r5 r2 8
	add	r4 r0 r5
	call	L_o_diffuse_2541
	fload	f3 r2 2
	fmul	f2 f2 f3
	load	r4 r2 8
	load	r5 r2 4
	fstore	f3 r2 2
	store	r5 r2 4
	fstore	f2 r2 10
	store	r4 r2 8
	call	L_get_nvector_2783
	addi	r4 r0 4135
	addi	r5 r0 4114
	call	L_veccpy_2481
	addi	r5 r0 4114
	load	r4 r2 8
	store	r4 r2 8
	call	L_utexture_2786
	addi	r4 r0 4
	load	r5 r2 7
	mul	r4 r5 r4
	addi	r5 r0 4146
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	add	r4 r4 r5
	load	r5 r2 3
	load	r6 r2 5
	add	r7 r6 r5
	store	r4 r7 0
	load	r4 r2 1
	store	r6 r2 5
	store	r4 r2 1
	store	r5 r2 3
	call	L_p_intersection_points_2561
	load	r5 r2 3
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 4114
	store	r5 r2 3
	add	r5 r0 r6
	call	L_veccpy_2481
	load	r4 r2 1
	store	r4 r2 1
	call	L_p_calc_diffuse_2565
	load	r5 r2 8
	store	r5 r2 8
	store	r4 r2 11
	add	r4 r0 r5
	call	L_o_diffuse_2541
	fload	f3 r0 41
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8513
	addi	r4 r0 1
	load	r5 r2 3
	load	r6 r2 11
	add	r6 r6 r5
	store	r4 r6 0
	load	r4 r2 1
	store	r4 r2 1
	store	r5 r2 3
	call	L_p_energy_2567
	load	r5 r2 3
	add	r6 r4 r5
	load	r6 r6 0
	addi	r7 r0 4121
	store	r5 r2 3
	store	r4 r2 12
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_veccpy_2481
	load	r4 r2 3
	load	r5 r2 12
	add	r5 r5 r4
	load	r5 r5 0
	fload	f2 r0 6
	fload	f3 r2 10
	fmul	f2 f2 f3
	fstore	f3 r2 10
	store	r4 r2 3
	add	r4 r0 r5
	call	L_vecscale_2510
	load	r4 r2 1
	store	r4 r2 1
	call	L_p_nvectors_2576
	load	r5 r2 3
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 4118
	store	r5 r2 3
	add	r5 r0 r6
	call	L_veccpy_2481
	jump	L_endif_8514
L_else_8513 : 
	addi	r4 r0 0
	load	r5 r2 3
	load	r6 r2 11
	add	r6 r6 r5
	store	r4 r6 0
L_endif_8514 : 
	fload	f2 r0 5
	addi	r5 r0 4118
	load	r4 r2 4
	store	r4 r2 4
	fstore	f2 r2 13
	call	L_veciprod_2492
	fload	f3 r2 13
	fmul	f2 f3 f2
	addi	r5 r0 4118
	load	r4 r2 4
	store	r4 r2 4
	call	L_vecaccum_2500
	load	r4 r2 8
	store	r4 r2 8
	call	L_o_hilight_2543
	fload	f3 r2 2
	fmul	f2 f3 f2
	addi	r4 r0 0
	addi	r5 r0 4155
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	fstore	f3 r2 2
	fstore	f2 r2 14
	call	L_shadow_check_one_or_matrix_2746
	addi	r5 r0 0
	bne	r4 r5 L_else_8511
	addi	r4 r0 4118
	addi	r5 r0 4111
	call	L_veciprod_2492
	call	L_fneg_2440
	fload	f3 r2 10
	fmul	f2 f2 f3
	addi	r5 r0 4111
	load	r4 r2 4
	fstore	f3 r2 10
	store	r4 r2 4
	fstore	f2 r2 15
	call	L_veciprod_2492
	call	L_fneg_2440
	add	f3 r0 f2
	fload	f2 r2 15
	fload	f4 r2 14
	fstore	f4 r2 14
	call	L_add_light_2789
	jump	L_endif_8512
L_else_8511 : 
L_endif_8512 : 
	addi	r4 r0 4114
	call	L_setup_startp_2712
	addi	r4 r0 4147
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r5 r0 1
	sub	r4 r4 r5
	fload	f2 r2 10
	fload	f3 r2 14
	load	r5 r2 4
	store	r5 r2 4
	call	L_trace_reflections_2793
	fload	f2 r0 4
	fload	f3 r2 2
	fstore	f3 r2 2
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8507
	addi	r2 r2 17
	return
L_else_8507 : 
	addi	r4 r0 4
	load	r5 r2 3
	bgt	r4 r5 L_else_8509
	jump	L_endif_8510
L_else_8509 : 
	addi	r4 r0 1
	add	r4 r5 r4
	addi	r6 r0 -1
	load	r7 r2 5
	add	r4 r7 r4
	store	r6 r4 0
L_endif_8510 : 
	addi	r4 r0 2
	load	r6 r2 9
	bne	r6 r4 L_else_8508
	fload	f2 r0 40
	load	r4 r2 8
	store	r5 r2 3
	fstore	f2 r2 16
	call	L_o_diffuse_2541
	fload	f3 r2 16
	fsub	f2 f3 f2
	fload	f3 r2 2
	fmul	f2 f3 f2
	addi	r4 r0 1
	load	r5 r2 3
	add	r4 r5 r4
	addi	r5 r0 4154
	addi	r6 r0 0
	add	r5 r5 r6
	fload	f3 r5 0
	fload	f4 r2 0
	fadd	f3 f4 f3
	load	r5 r2 4
	load	r6 r2 1
	addi	r2 r2 17
	jump	L_trace_ray_2798
L_else_8508 : 
	addi	r2 r2 17
	return
L_else_8505 : 
	addi	r2 r2 17
	return
L_trace_diffuse_ray_2804 : 
	subi	r2 r2 6
	fstore	f2 r2 0
	store	r4 r2 1
	call	L_judge_intersection_fast_2775
	addi	r5 r0 0
	bne	r4 r5 L_else_8517
	addi	r2 r2 6
	return
L_else_8517 : 
	addi	r4 r0 5042
	addi	r5 r0 4115
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	add	r4 r4 r5
	load	r4 r4 0
	load	r5 r2 1
	store	r4 r2 2
	add	r4 r0 r5
	call	L_d_vec_2578
	add	r5 r0 r4
	load	r4 r2 2
	store	r4 r2 2
	call	L_get_nvector_2783
	addi	r5 r0 4114
	load	r4 r2 2
	store	r4 r2 2
	call	L_utexture_2786
	addi	r4 r0 0
	addi	r5 r0 4155
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	call	L_shadow_check_one_or_matrix_2746
	addi	r5 r0 0
	bne	r4 r5 L_else_8518
	addi	r4 r0 4118
	addi	r5 r0 4111
	call	L_veciprod_2492
	call	L_fneg_2440
	fstore	f2 r2 3
	call	L_fispos_2429
	addi	r5 r0 0
	bne	r4 r5 L_else_8519
	fload	f2 r0 54
	jump	L_endif_8520
L_else_8519 : 
	fload	f2 r2 3
	fadd	f2 f0 f2
L_endif_8520 : 
	addi	r4 r0 4124
	fload	f3 r2 0
	fmul	f2 f3 f2
	load	r5 r2 2
	store	r4 r2 4
	fstore	f2 r2 5
	add	r4 r0 r5
	call	L_o_diffuse_2541
	fload	f3 r2 5
	fmul	f2 f3 f2
	addi	r5 r0 4121
	load	r4 r2 4
	addi	r2 r2 6
	jump	L_vecaccum_2500
L_else_8518 : 
	addi	r2 r2 6
	return
L_iter_trace_diffuse_rays_2807 : 
	subi	r2 r2 5
	addi	r8 r0 0
	bgt	r8 r7 L_else_8521
	add	r8 r4 r7
	load	r8 r8 0
	store	r6 r2 0
	store	r7 r2 1
	store	r4 r2 2
	store	r5 r2 3
	add	r4 r0 r8
	call	L_d_vec_2578
	load	r5 r2 3
	store	r5 r2 3
	call	L_veciprod_2492
	fstore	f2 r2 4
	call	L_fisneg_2431
	addi	r5 r0 0
	bne	r4 r5 L_else_8522
	load	r4 r2 1
	load	r5 r2 2
	add	r6 r5 r4
	load	r6 r6 0
	fload	f2 r0 2
	fload	f3 r2 4
	fdiv	f2 f3 f2
	store	r5 r2 2
	store	r4 r2 1
	add	r4 r0 r6
	call	L_trace_diffuse_ray_2804
	jump	L_endif_8523
L_else_8522 : 
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	load	r6 r2 2
	add	r4 r6 r4
	load	r4 r4 0
	fload	f2 r0 3
	fload	f3 r2 4
	fdiv	f2 f3 f2
	store	r6 r2 2
	store	r5 r2 1
	call	L_trace_diffuse_ray_2804
L_endif_8523 : 
	addi	r4 r0 2
	load	r5 r2 1
	sub	r7 r5 r4
	load	r4 r2 2
	load	r5 r2 3
	load	r6 r2 0
	addi	r2 r2 5
	jump	L_iter_trace_diffuse_rays_2807
L_else_8521 : 
	addi	r2 r2 5
	return
L_trace_diffuse_rays_2812 : 
	subi	r2 r2 3
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r4 r0 r6
	call	L_setup_startp_2712
	addi	r7 r0 118
	load	r4 r2 2
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 3
	jump	L_iter_trace_diffuse_rays_2807
L_trace_diffuse_ray_80percent_2816 : 
	subi	r2 r2 3
	addi	r7 r0 0
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	bne	r4 r7 L_else_8531
	jump	L_endif_8532
L_else_8531 : 
	addi	r7 r0 4148
	addi	r8 r0 0
	add	r7 r7 r8
	load	r7 r7 0
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r4 r0 r7
	call	L_trace_diffuse_rays_2812
L_endif_8532 : 
	addi	r4 r0 1
	load	r5 r2 2
	store	r5 r2 2
	bne	r5 r4 L_else_8529
	jump	L_endif_8530
L_else_8529 : 
	addi	r4 r0 4148
	addi	r6 r0 1
	add	r4 r4 r6
	load	r4 r4 0
	load	r6 r2 1
	load	r7 r2 0
	store	r7 r2 0
	store	r6 r2 1
	store	r5 r2 2
	add	r5 r0 r6
	add	r6 r0 r7
	call	L_trace_diffuse_rays_2812
L_endif_8530 : 
	addi	r4 r0 2
	load	r5 r2 2
	store	r5 r2 2
	bne	r5 r4 L_else_8527
	jump	L_endif_8528
L_else_8527 : 
	addi	r4 r0 4148
	addi	r6 r0 2
	add	r4 r4 r6
	load	r4 r4 0
	load	r6 r2 1
	load	r7 r2 0
	store	r7 r2 0
	store	r6 r2 1
	store	r5 r2 2
	add	r5 r0 r6
	add	r6 r0 r7
	call	L_trace_diffuse_rays_2812
L_endif_8528 : 
	addi	r4 r0 3
	load	r5 r2 2
	store	r5 r2 2
	bne	r5 r4 L_else_8525
	jump	L_endif_8526
L_else_8525 : 
	addi	r4 r0 4148
	addi	r6 r0 3
	add	r4 r4 r6
	load	r4 r4 0
	load	r6 r2 1
	load	r7 r2 0
	store	r7 r2 0
	store	r6 r2 1
	store	r5 r2 2
	add	r5 r0 r6
	add	r6 r0 r7
	call	L_trace_diffuse_rays_2812
L_endif_8526 : 
	addi	r4 r0 4
	load	r5 r2 2
	bne	r5 r4 L_else_8524
	addi	r2 r2 3
	return
L_else_8524 : 
	addi	r4 r0 4148
	addi	r5 r0 4
	add	r4 r4 r5
	load	r4 r4 0
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 3
	jump	L_trace_diffuse_rays_2812
L_calc_diffuse_using_1point_2820 : 
	subi	r2 r2 6
	store	r5 r2 0
	store	r4 r2 1
	call	L_p_received_ray_20percent_2569
	load	r5 r2 1
	store	r4 r2 2
	store	r5 r2 1
	add	r4 r0 r5
	call	L_p_nvectors_2576
	load	r5 r2 1
	store	r4 r2 3
	store	r5 r2 1
	add	r4 r0 r5
	call	L_p_intersection_points_2561
	load	r5 r2 1
	store	r4 r2 4
	store	r5 r2 1
	add	r4 r0 r5
	call	L_p_energy_2567
	addi	r5 r0 4124
	load	r6 r2 0
	load	r7 r2 2
	add	r7 r7 r6
	load	r7 r7 0
	store	r4 r2 5
	store	r6 r2 0
	add	r4 r0 r5
	add	r5 r0 r7
	call	L_veccpy_2481
	load	r4 r2 1
	call	L_p_group_id_2571
	load	r5 r2 0
	load	r6 r2 3
	add	r6 r6 r5
	load	r6 r6 0
	load	r7 r2 4
	add	r7 r7 r5
	load	r7 r7 0
	store	r5 r2 0
	add	r5 r0 r6
	add	r6 r0 r7
	call	L_trace_diffuse_ray_80percent_2816
	addi	r4 r0 4127
	load	r5 r2 0
	load	r6 r2 5
	add	r5 r6 r5
	load	r5 r5 0
	addi	r6 r0 4124
	addi	r2 r2 6
	jump	L_vecaccumv_2513
L_calc_diffuse_using_5points_2823 : 
	subi	r2 r2 9
	add	r5 r5 r4
	load	r5 r5 0
	store	r8 r2 0
	store	r7 r2 1
	store	r6 r2 2
	store	r4 r2 3
	add	r4 r0 r5
	call	L_p_received_ray_20percent_2569
	addi	r5 r0 1
	load	r6 r2 3
	sub	r5 r6 r5
	load	r7 r2 2
	add	r5 r7 r5
	load	r5 r5 0
	store	r4 r2 4
	store	r6 r2 3
	store	r7 r2 2
	add	r4 r0 r5
	call	L_p_received_ray_20percent_2569
	load	r5 r2 3
	load	r6 r2 2
	add	r7 r6 r5
	load	r7 r7 0
	store	r4 r2 5
	store	r6 r2 2
	store	r5 r2 3
	add	r4 r0 r7
	call	L_p_received_ray_20percent_2569
	addi	r5 r0 1
	load	r6 r2 3
	add	r5 r6 r5
	load	r7 r2 2
	add	r5 r7 r5
	load	r5 r5 0
	store	r7 r2 2
	store	r4 r2 6
	store	r6 r2 3
	add	r4 r0 r5
	call	L_p_received_ray_20percent_2569
	load	r5 r2 3
	load	r6 r2 1
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 3
	store	r4 r2 7
	add	r4 r0 r6
	call	L_p_received_ray_20percent_2569
	addi	r5 r0 4124
	load	r6 r2 0
	load	r7 r2 4
	add	r7 r7 r6
	load	r7 r7 0
	store	r4 r2 8
	store	r6 r2 0
	add	r4 r0 r5
	add	r5 r0 r7
	call	L_veccpy_2481
	addi	r4 r0 4124
	load	r5 r2 0
	load	r6 r2 5
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	add	r5 r0 r6
	call	L_vecadd_2504
	addi	r4 r0 4124
	load	r5 r2 0
	load	r6 r2 6
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	add	r5 r0 r6
	call	L_vecadd_2504
	addi	r4 r0 4124
	load	r5 r2 0
	load	r6 r2 7
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	add	r5 r0 r6
	call	L_vecadd_2504
	addi	r4 r0 4124
	load	r5 r2 0
	load	r6 r2 8
	add	r6 r6 r5
	load	r6 r6 0
	store	r5 r2 0
	add	r5 r0 r6
	call	L_vecadd_2504
	load	r4 r2 3
	load	r5 r2 2
	add	r4 r5 r4
	load	r4 r4 0
	call	L_p_energy_2567
	addi	r5 r0 4127
	load	r6 r2 0
	add	r4 r4 r6
	load	r4 r4 0
	addi	r6 r0 4124
	add	r1 r0 r5
	add	r5 r0 r4
	add	r4 r0 r1
	addi	r2 r2 9
	jump	L_vecaccumv_2513
L_do_without_neighbors_2829 : 
	subi	r2 r2 2
	addi	r6 r0 4
	bgt	r5 r6 L_else_8533
	store	r4 r2 0
	store	r5 r2 1
	call	L_p_surface_ids_2563
	addi	r5 r0 0
	load	r6 r2 1
	add	r4 r4 r6
	load	r4 r4 0
	bgt	r5 r4 L_else_8534
	load	r4 r2 0
	store	r4 r2 0
	store	r6 r2 1
	call	L_p_calc_diffuse_2565
	load	r5 r2 1
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 0
	store	r5 r2 1
	bne	r4 r6 L_else_8535
	jump	L_endif_8536
L_else_8535 : 
	load	r4 r2 0
	store	r4 r2 0
	store	r5 r2 1
	call	L_calc_diffuse_using_1point_2820
L_endif_8536 : 
	addi	r4 r0 1
	load	r5 r2 1
	add	r5 r5 r4
	load	r4 r2 0
	addi	r2 r2 2
	jump	L_do_without_neighbors_2829
L_else_8534 : 
	addi	r2 r2 2
	return
L_else_8533 : 
	addi	r2 r2 2
	return
L_neighbors_exist_2832 : 
	addi	r6 r0 4130
	addi	r7 r0 1
	add	r6 r6 r7
	load	r6 r6 0
	addi	r7 r0 1
	add	r7 r5 r7
	bgt	r6 r7 L_else_8537
	addi	r4 r0 0
	return
L_else_8537 : 
	addi	r6 r0 0
	bgt	r5 r6 L_else_8538
	addi	r4 r0 0
	return
L_else_8538 : 
	addi	r5 r0 4130
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	addi	r6 r0 1
	add	r6 r4 r6
	bgt	r5 r6 L_else_8539
	addi	r4 r0 0
	return
L_else_8539 : 
	addi	r5 r0 0
	bgt	r4 r5 L_else_8540
	addi	r4 r0 0
	return
L_else_8540 : 
	addi	r4 r0 1
	return
L_get_surface_id_2836 : 
	subi	r2 r2 1
	store	r5 r2 0
	call	L_p_surface_ids_2563
	load	r5 r2 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r2 r2 1
	return
L_neighbors_are_available_2839 : 
	subi	r2 r2 6
	add	r9 r6 r4
	load	r9 r9 0
	store	r6 r2 0
	store	r7 r2 1
	store	r8 r2 2
	store	r4 r2 3
	store	r5 r2 4
	add	r5 r0 r8
	add	r4 r0 r9
	call	L_get_surface_id_2836
	load	r5 r2 3
	load	r6 r2 4
	add	r6 r6 r5
	load	r6 r6 0
	load	r7 r2 2
	store	r7 r2 2
	store	r5 r2 3
	store	r4 r2 5
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_get_surface_id_2836
	load	r5 r2 5
	bne	r4 r5 L_else_8541
	load	r4 r2 3
	load	r6 r2 1
	add	r6 r6 r4
	load	r6 r6 0
	load	r7 r2 2
	store	r7 r2 2
	store	r4 r2 3
	store	r5 r2 5
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_get_surface_id_2836
	load	r5 r2 5
	bne	r4 r5 L_else_8542
	addi	r4 r0 1
	load	r6 r2 3
	sub	r4 r6 r4
	load	r7 r2 0
	add	r4 r7 r4
	load	r4 r4 0
	load	r8 r2 2
	store	r8 r2 2
	store	r7 r2 0
	store	r6 r2 3
	store	r5 r2 5
	add	r5 r0 r8
	call	L_get_surface_id_2836
	load	r5 r2 5
	bne	r4 r5 L_else_8543
	addi	r4 r0 1
	load	r6 r2 3
	add	r4 r6 r4
	load	r6 r2 0
	add	r4 r6 r4
	load	r4 r4 0
	load	r6 r2 2
	store	r5 r2 5
	add	r5 r0 r6
	call	L_get_surface_id_2836
	load	r5 r2 5
	bne	r4 r5 L_else_8544
	addi	r4 r0 1
	addi	r2 r2 6
	return
L_else_8544 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_else_8543 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_else_8542 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_else_8541 : 
	addi	r4 r0 0
	addi	r2 r2 6
	return
L_try_exploit_neighbors_2845 : 
	subi	r2 r2 8
	add	r10 r7 r4
	load	r10 r10 0
	addi	r11 r0 4
	bgt	r9 r11 L_else_8545
	addi	r11 r0 0
	store	r5 r2 0
	store	r10 r2 1
	store	r9 r2 2
	store	r8 r2 3
	store	r7 r2 4
	store	r6 r2 5
	store	r4 r2 6
	store	r11 r2 7
	add	r5 r0 r9
	add	r4 r0 r10
	call	L_get_surface_id_2836
	load	r5 r2 7
	bgt	r5 r4 L_else_8546
	load	r4 r2 6
	load	r5 r2 5
	load	r6 r2 4
	load	r7 r2 3
	load	r8 r2 2
	store	r7 r2 3
	store	r5 r2 5
	store	r8 r2 2
	store	r4 r2 6
	store	r6 r2 4
	call	L_neighbors_are_available_2839
	addi	r5 r0 0
	bne	r4 r5 L_else_8547
	load	r4 r2 6
	load	r5 r2 4
	add	r4 r5 r4
	load	r4 r4 0
	load	r5 r2 2
	addi	r2 r2 8
	jump	L_do_without_neighbors_2829
L_else_8547 : 
	load	r4 r2 1
	call	L_p_calc_diffuse_2565
	load	r8 r2 2
	add	r4 r4 r8
	load	r4 r4 0
	addi	r5 r0 0
	store	r8 r2 2
	bne	r4 r5 L_else_8548
	jump	L_endif_8549
L_else_8548 : 
	load	r4 r2 6
	load	r5 r2 5
	load	r6 r2 4
	load	r7 r2 3
	store	r7 r2 3
	store	r6 r2 4
	store	r5 r2 5
	store	r4 r2 6
	store	r8 r2 2
	call	L_calc_diffuse_using_5points_2823
L_endif_8549 : 
	addi	r4 r0 1
	load	r5 r2 2
	add	r9 r5 r4
	load	r4 r2 6
	load	r5 r2 0
	load	r6 r2 5
	load	r7 r2 4
	load	r8 r2 3
	addi	r2 r2 8
	jump	L_try_exploit_neighbors_2845
L_else_8546 : 
	addi	r2 r2 8
	return
L_else_8545 : 
	addi	r2 r2 8
	return
L_write_ppm_header_2852 : 
	addi	r4 r0 4130
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	call	min_caml_print_int
	addi	r4 r0 4130
	addi	r5 r0 1
	add	r4 r4 r5
	load	r4 r4 0
	call	min_caml_print_int
	addi	r4 r0 255
	jump	min_caml_print_int
L_write_rgb_element_2854 : 
	fload	f3 r0 12
	fbgt	f2 f3 L_else_8550
	fload	f3 r0 54
	fbgt	f3 f2 L_else_8552
	fadd	f2 f0 f2
	jump	L_endif_8553
L_else_8552 : 
	fload	f2 r0 54
L_endif_8553 : 
	jump	L_endif_8551
L_else_8550 : 
	fload	f2 r0 12
L_endif_8551 : 
	floor	f2 f2
	jump	min_caml_print_float
L_write_rgb_2856 : 
	addi	r4 r0 4127
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f2 r4 0
	call	L_write_rgb_element_2854
	addi	r4 r0 4127
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f2 r4 0
	call	L_write_rgb_element_2854
	addi	r4 r0 4127
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f2 r4 0
	jump	L_write_rgb_element_2854
L_pretrace_diffuse_rays_2858 : 
	subi	r2 r2 4
	addi	r6 r0 4
	bgt	r5 r6 L_else_8554
	store	r5 r2 0
	store	r4 r2 1
	call	L_get_surface_id_2836
	addi	r5 r0 0
	bgt	r5 r4 L_else_8555
	load	r4 r2 1
	store	r4 r2 1
	call	L_p_calc_diffuse_2565
	load	r5 r2 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 0
	store	r5 r2 0
	bne	r4 r6 L_else_8556
	jump	L_endif_8557
L_else_8556 : 
	load	r4 r2 1
	store	r5 r2 0
	store	r4 r2 1
	call	L_p_group_id_2571
	addi	r5 r0 4124
	store	r4 r2 2
	add	r4 r0 r5
	call	L_vecbzero_2479
	load	r4 r2 1
	store	r4 r2 1
	call	L_p_nvectors_2576
	load	r5 r2 1
	store	r5 r2 1
	store	r4 r2 3
	add	r4 r0 r5
	call	L_p_intersection_points_2561
	addi	r5 r0 4148
	load	r6 r2 2
	add	r5 r5 r6
	load	r5 r5 0
	load	r6 r2 0
	load	r7 r2 3
	add	r7 r7 r6
	load	r7 r7 0
	add	r4 r4 r6
	load	r4 r4 0
	store	r6 r2 0
	add	r6 r0 r4
	add	r4 r0 r5
	add	r5 r0 r7
	call	L_trace_diffuse_rays_2812
	load	r4 r2 1
	store	r4 r2 1
	call	L_p_received_ray_20percent_2569
	load	r5 r2 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 4124
	store	r5 r2 0
	add	r5 r0 r6
	call	L_veccpy_2481
L_endif_8557 : 
	addi	r4 r0 1
	load	r5 r2 0
	add	r5 r5 r4
	load	r4 r2 1
	addi	r2 r2 4
	jump	L_pretrace_diffuse_rays_2858
L_else_8555 : 
	addi	r2 r2 4
	return
L_else_8554 : 
	addi	r2 r2 4
	return
L_pretrace_pixels_2861 : 
	subi	r2 r2 7
	addi	r7 r0 0
	bgt	r7 r5 L_else_8558
	addi	r7 r0 4134
	addi	r8 r0 0
	add	r7 r7 r8
	fload	f5 r7 0
	addi	r7 r0 4132
	addi	r8 r0 0
	add	r7 r7 r8
	load	r7 r7 0
	sub	r7 r5 r7
	foi	f6 r7
	fmul	f5 f5 f6
	addi	r7 r0 4141
	addi	r8 r0 0
	addi	r9 r0 4102
	addi	r10 r0 0
	add	r9 r9 r10
	fload	f6 r9 0
	fmul	f6 f5 f6
	fadd	f6 f6 f2
	add	r7 r7 r8
	fstore	f6 r7 0
	addi	r7 r0 4141
	addi	r8 r0 1
	addi	r9 r0 4102
	addi	r10 r0 1
	add	r9 r9 r10
	fload	f6 r9 0
	fmul	f6 f5 f6
	fadd	f6 f6 f3
	add	r7 r7 r8
	fstore	f6 r7 0
	addi	r7 r0 4141
	addi	r8 r0 2
	addi	r9 r0 4102
	addi	r10 r0 2
	add	r9 r9 r10
	fload	f6 r9 0
	fmul	f5 f5 f6
	fadd	f5 f5 f4
	add	r7 r7 r8
	fstore	f5 r7 0
	addi	r7 r0 4141
	addi	r8 r0 0
	fstore	f4 r2 0
	fstore	f3 r2 1
	fstore	f2 r2 2
	store	r6 r2 3
	store	r5 r2 4
	store	r4 r2 5
	add	r5 r0 r8
	add	r4 r0 r7
	call	L_vecunit_sgn_2489
	addi	r4 r0 4127
	call	L_vecbzero_2479
	addi	r4 r0 4135
	addi	r5 r0 4108
	call	L_veccpy_2481
	addi	r4 r0 0
	fload	f2 r0 40
	addi	r5 r0 4141
	load	r6 r2 4
	load	r7 r2 5
	add	r8 r7 r6
	load	r8 r8 0
	fload	f3 r0 54
	store	r6 r2 4
	store	r7 r2 5
	add	r6 r0 r8
	call	L_trace_ray_2798
	load	r4 r2 4
	load	r5 r2 5
	add	r6 r5 r4
	load	r6 r6 0
	store	r4 r2 4
	store	r5 r2 5
	add	r4 r0 r6
	call	L_p_rgb_2559
	addi	r5 r0 4127
	call	L_veccpy_2481
	load	r4 r2 4
	load	r5 r2 5
	add	r6 r5 r4
	load	r6 r6 0
	load	r7 r2 3
	store	r7 r2 3
	store	r4 r2 4
	store	r5 r2 5
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_p_set_group_id_2573
	load	r4 r2 4
	load	r5 r2 5
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 0
	store	r5 r2 5
	store	r4 r2 4
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_pretrace_diffuse_rays_2858
	addi	r4 r0 1
	load	r5 r2 4
	sub	r4 r5 r4
	addi	r5 r0 1
	load	r6 r2 3
	store	r4 r2 6
	add	r4 r0 r6
	call	L_add_mod5_2468
	add	r6 r0 r4
	fload	f2 r2 2
	fload	f3 r2 1
	fload	f4 r2 0
	load	r4 r2 5
	load	r5 r2 6
	addi	r2 r2 7
	jump	L_pretrace_pixels_2861
L_else_8558 : 
	addi	r2 r2 7
	return
L_pretrace_line_2868 : 
	addi	r7 r0 4134
	addi	r8 r0 0
	add	r7 r7 r8
	fload	f2 r7 0
	addi	r7 r0 4132
	addi	r8 r0 1
	add	r7 r7 r8
	load	r7 r7 0
	sub	r5 r5 r7
	foi	f3 r5
	fmul	f2 f2 f3
	addi	r5 r0 4105
	addi	r7 r0 0
	add	r5 r5 r7
	fload	f3 r5 0
	fmul	f3 f2 f3
	addi	r5 r0 4099
	addi	r7 r0 0
	add	r5 r5 r7
	fload	f4 r5 0
	fadd	f3 f3 f4
	addi	r5 r0 4105
	addi	r7 r0 1
	add	r5 r5 r7
	fload	f4 r5 0
	fmul	f4 f2 f4
	addi	r5 r0 4099
	addi	r7 r0 1
	add	r5 r5 r7
	fload	f5 r5 0
	fadd	f4 f4 f5
	addi	r5 r0 4105
	addi	r7 r0 2
	add	r5 r5 r7
	fload	f5 r5 0
	fmul	f2 f2 f5
	addi	r5 r0 4099
	addi	r7 r0 2
	add	r5 r5 r7
	fload	f5 r5 0
	fadd	f2 f2 f5
	addi	r5 r0 4130
	addi	r7 r0 0
	add	r5 r5 r7
	load	r5 r5 0
	addi	r7 r0 1
	sub	r5 r5 r7
	fadd	f1 f0 f4
	fadd	f4 f0 f2
	fadd	f2 f0 f3
	fadd	f3 f0 f1
	jump	L_pretrace_pixels_2861
L_scan_pixel_2872 : 
	subi	r2 r2 6
	addi	r9 r0 4130
	addi	r10 r0 0
	add	r9 r9 r10
	load	r9 r9 0
	bgt	r9 r4 L_else_8559
	addi	r2 r2 6
	return
L_else_8559 : 
	addi	r9 r0 4127
	add	r10 r7 r4
	load	r10 r10 0
	store	r6 r2 0
	store	r7 r2 1
	store	r8 r2 2
	store	r5 r2 3
	store	r4 r2 4
	store	r9 r2 5
	add	r4 r0 r10
	call	L_p_rgb_2559
	add	r5 r0 r4
	load	r4 r2 5
	call	L_veccpy_2481
	load	r4 r2 4
	load	r5 r2 3
	load	r6 r2 2
	store	r6 r2 2
	store	r5 r2 3
	store	r4 r2 4
	call	L_neighbors_exist_2832
	addi	r5 r0 0
	bne	r4 r5 L_else_8560
	load	r4 r2 4
	load	r5 r2 1
	add	r6 r5 r4
	load	r6 r6 0
	addi	r7 r0 0
	store	r5 r2 1
	store	r4 r2 4
	add	r5 r0 r7
	add	r4 r0 r6
	call	L_do_without_neighbors_2829
	jump	L_endif_8561
L_else_8560 : 
	addi	r9 r0 0
	load	r4 r2 4
	load	r5 r2 3
	load	r6 r2 0
	load	r7 r2 1
	load	r8 r2 2
	store	r8 r2 2
	store	r7 r2 1
	store	r6 r2 0
	store	r5 r2 3
	store	r4 r2 4
	call	L_try_exploit_neighbors_2845
L_endif_8561 : 
	call	L_write_rgb_2856
	addi	r4 r0 1
	load	r5 r2 4
	add	r4 r5 r4
	load	r5 r2 3
	load	r6 r2 0
	load	r7 r2 1
	load	r8 r2 2
	addi	r2 r2 6
	jump	L_scan_pixel_2872
L_scan_line_2878 : 
	subi	r2 r2 6
	addi	r9 r0 4130
	addi	r10 r0 1
	add	r9 r9 r10
	load	r9 r9 0
	bgt	r9 r4 L_else_8562
	addi	r2 r2 6
	return
L_else_8562 : 
	addi	r9 r0 4130
	addi	r10 r0 1
	add	r9 r9 r10
	load	r9 r9 0
	addi	r10 r0 1
	sub	r9 r9 r10
	store	r8 r2 0
	store	r7 r2 1
	store	r6 r2 2
	store	r5 r2 3
	store	r4 r2 4
	bgt	r9 r4 L_else_8563
	jump	L_endif_8564
L_else_8563 : 
	addi	r9 r0 1
	add	r9 r4 r9
	store	r8 r2 0
	store	r7 r2 1
	store	r6 r2 2
	store	r5 r2 3
	store	r4 r2 4
	add	r6 r0 r8
	add	r5 r0 r9
	add	r4 r0 r7
	call	L_pretrace_line_2868
L_endif_8564 : 
	addi	r4 r0 0
	load	r5 r2 4
	load	r6 r2 3
	load	r7 r2 2
	load	r8 r2 1
	store	r6 r2 3
	store	r8 r2 1
	store	r7 r2 2
	store	r5 r2 4
	call	L_scan_pixel_2872
	addi	r4 r0 1
	load	r5 r2 4
	add	r4 r5 r4
	addi	r5 r0 2
	load	r6 r2 0
	store	r4 r2 5
	add	r4 r0 r6
	call	L_add_mod5_2468
	add	r8 r0 r4
	load	r4 r2 5
	load	r5 r2 2
	load	r6 r2 1
	load	r7 r2 3
	addi	r2 r2 6
	jump	L_scan_line_2878
L_create_float5x3array_2884 : 
	subi	r2 r2 5
	addi	r4 r0 3
	fload	f2 r0 54
	call	min_caml_create_float_array
	add	r5 r0 r4
	addi	r4 r0 5
	call	min_caml_create_array
	addi	r5 r0 1
	addi	r6 r0 3
	fload	f2 r0 54
	store	r5 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	call	min_caml_create_float_array
	load	r5 r2 0
	load	r6 r2 1
	add	r5 r6 r5
	store	r4 r5 0
	addi	r4 r0 2
	addi	r5 r0 3
	fload	f2 r0 54
	store	r4 r2 2
	store	r6 r2 1
	add	r4 r0 r5
	call	min_caml_create_float_array
	load	r5 r2 2
	load	r6 r2 1
	add	r5 r6 r5
	store	r4 r5 0
	addi	r4 r0 3
	addi	r5 r0 3
	fload	f2 r0 54
	store	r4 r2 3
	store	r6 r2 1
	add	r4 r0 r5
	call	min_caml_create_float_array
	load	r5 r2 3
	load	r6 r2 1
	add	r5 r6 r5
	store	r4 r5 0
	addi	r4 r0 4
	addi	r5 r0 3
	fload	f2 r0 54
	store	r4 r2 4
	store	r6 r2 1
	add	r4 r0 r5
	call	min_caml_create_float_array
	load	r5 r2 4
	load	r6 r2 1
	add	r5 r6 r5
	store	r4 r5 0
	add	r4 r0 r6
	addi	r2 r2 5
	return
L_create_pixel_2886 : 
	subi	r2 r2 7
	addi	r4 r0 3
	fload	f2 r0 54
	call	min_caml_create_float_array
	store	r4 r2 0
	call	L_create_float5x3array_2884
	addi	r5 r0 5
	addi	r6 r0 0
	store	r4 r2 1
	add	r4 r0 r5
	add	r5 r0 r6
	call	min_caml_create_array
	addi	r5 r0 5
	addi	r6 r0 0
	store	r4 r2 2
	add	r4 r0 r5
	add	r5 r0 r6
	call	min_caml_create_array
	store	r4 r2 3
	call	L_create_float5x3array_2884
	store	r4 r2 4
	call	L_create_float5x3array_2884
	addi	r5 r0 1
	addi	r6 r0 0
	store	r4 r2 5
	add	r4 r0 r5
	add	r5 r0 r6
	call	min_caml_create_array
	store	r4 r2 6
	call	L_create_float5x3array_2884
	add	r5 r0 r3
	addi	r3 r3 8
	store	r4 r5 7
	load	r4 r2 6
	store	r4 r5 6
	load	r4 r2 5
	store	r4 r5 5
	load	r4 r2 4
	store	r4 r5 4
	load	r4 r2 3
	store	r4 r5 3
	load	r4 r2 2
	store	r4 r5 2
	load	r4 r2 1
	store	r4 r5 1
	load	r4 r2 0
	store	r4 r5 0
	add	r4 r0 r5
	addi	r2 r2 7
	return
L_init_line_elements_2888 : 
	subi	r2 r2 2
	addi	r6 r0 0
	bgt	r6 r5 L_else_8565
	store	r5 r2 0
	store	r4 r2 1
	call	L_create_pixel_2886
	load	r5 r2 0
	load	r6 r2 1
	add	r7 r6 r5
	store	r4 r7 0
	addi	r4 r0 1
	sub	r5 r5 r4
	add	r4 r0 r6
	addi	r2 r2 2
	jump	L_init_line_elements_2888
L_else_8565 : 
	add	r4 r0 r4
	addi	r2 r2 2
	return
L_create_pixelline_2891 : 
	subi	r2 r2 1
	addi	r4 r0 4130
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	store	r4 r2 0
	call	L_create_pixel_2886
	add	r5 r0 r4
	load	r4 r2 0
	call	min_caml_create_array
	addi	r5 r0 4130
	addi	r6 r0 0
	add	r5 r5 r6
	load	r5 r5 0
	addi	r6 r0 2
	sub	r5 r5 r6
	addi	r2 r2 1
	jump	L_init_line_elements_2888
L_tan_2893 : 
	subi	r2 r2 2
	fstore	f2 r2 0
	call	L_sin_2448
	fload	f3 r2 0
	fstore	f2 r2 1
	fadd	f2 f0 f3
	call	L_cos_2450
	fload	f3 r2 1
	fdiv	f2 f3 f2
	addi	r2 r2 2
	return
L_adjust_position_2895 : 
	subi	r2 r2 2
	fmul	f2 f2 f2
	fload	f4 r0 4
	fadd	f2 f2 f4
	fstore	f3 r2 0
	call	L_sqrt_2458
	fload	f3 r0 40
	fdiv	f3 f3 f2
	fstore	f2 r2 1
	fadd	f2 f0 f3
	call	L_atan_2452
	fload	f3 r2 0
	fmul	f2 f2 f3
	call	L_tan_2893
	fload	f3 r2 1
	fmul	f2 f2 f3
	addi	r2 r2 2
	return
L_calc_dirvec_2898 : 
	subi	r2 r2 23
	addi	r7 r0 5
	bgt	r7 r4 L_else_8566
	store	r6 r2 0
	store	r5 r2 1
	fstore	f2 r2 2
	fstore	f3 r2 3
	call	L_fsqr_2442
	fload	f3 r2 3
	fstore	f3 r2 3
	fstore	f2 r2 4
	fadd	f2 f0 f3
	call	L_fsqr_2442
	fload	f3 r2 4
	fadd	f2 f3 f2
	fload	f3 r0 40
	fadd	f2 f2 f3
	call	L_sqrt_2458
	fload	f3 r2 2
	fdiv	f3 f3 f2
	fload	f4 r2 3
	fdiv	f4 f4 f2
	fload	f5 r0 40
	fdiv	f2 f5 f2
	addi	r4 r0 4148
	load	r5 r2 1
	add	r4 r4 r5
	load	r4 r4 0
	load	r5 r2 0
	add	r6 r4 r5
	load	r6 r6 0
	store	r4 r2 5
	store	r5 r2 0
	fstore	f2 r2 6
	fstore	f4 r2 7
	fstore	f3 r2 8
	add	r4 r0 r6
	call	L_d_vec_2578
	fload	f2 r2 8
	fload	f3 r2 7
	fload	f4 r2 6
	fstore	f4 r2 6
	fstore	f2 r2 8
	fstore	f3 r2 7
	call	L_vecset_2471
	addi	r4 r0 40
	load	r5 r2 0
	add	r4 r5 r4
	load	r6 r2 5
	add	r4 r6 r4
	load	r4 r4 0
	store	r6 r2 5
	store	r5 r2 0
	call	L_d_vec_2578
	fload	f2 r2 7
	fstore	f2 r2 7
	store	r4 r2 9
	call	L_fneg_2440
	add	f4 r0 f2
	fload	f2 r2 8
	fload	f3 r2 6
	load	r4 r2 9
	fstore	f3 r2 6
	fstore	f2 r2 8
	call	L_vecset_2471
	addi	r4 r0 80
	load	r5 r2 0
	add	r4 r5 r4
	load	r6 r2 5
	add	r4 r6 r4
	load	r4 r4 0
	store	r6 r2 5
	store	r5 r2 0
	call	L_d_vec_2578
	fload	f2 r2 8
	fstore	f2 r2 8
	store	r4 r2 10
	call	L_fneg_2440
	fload	f3 r2 7
	fstore	f3 r2 7
	fstore	f2 r2 11
	fadd	f2 f0 f3
	call	L_fneg_2440
	add	f4 r0 f2
	fload	f2 r2 6
	fload	f3 r2 11
	load	r4 r2 10
	fstore	f2 r2 6
	call	L_vecset_2471
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	load	r6 r2 5
	add	r4 r6 r4
	load	r4 r4 0
	store	r6 r2 5
	store	r5 r2 0
	call	L_d_vec_2578
	fload	f2 r2 8
	fstore	f2 r2 8
	store	r4 r2 12
	call	L_fneg_2440
	fload	f3 r2 7
	fstore	f3 r2 7
	fstore	f2 r2 13
	fadd	f2 f0 f3
	call	L_fneg_2440
	fload	f3 r2 6
	fstore	f3 r2 6
	fstore	f2 r2 14
	fadd	f2 f0 f3
	call	L_fneg_2440
	add	f4 r0 f2
	fload	f2 r2 13
	fload	f3 r2 14
	load	r4 r2 12
	call	L_vecset_2471
	addi	r4 r0 41
	load	r5 r2 0
	add	r4 r5 r4
	load	r6 r2 5
	add	r4 r6 r4
	load	r4 r4 0
	store	r6 r2 5
	store	r5 r2 0
	call	L_d_vec_2578
	fload	f2 r2 8
	fstore	f2 r2 8
	store	r4 r2 15
	call	L_fneg_2440
	fload	f3 r2 6
	fstore	f3 r2 6
	fstore	f2 r2 16
	fadd	f2 f0 f3
	call	L_fneg_2440
	add	f3 r0 f2
	fload	f2 r2 16
	fload	f4 r2 7
	load	r4 r2 15
	fstore	f4 r2 7
	call	L_vecset_2471
	addi	r4 r0 81
	load	r5 r2 0
	add	r4 r5 r4
	load	r5 r2 5
	add	r4 r5 r4
	load	r4 r4 0
	call	L_d_vec_2578
	fload	f2 r2 6
	store	r4 r2 17
	call	L_fneg_2440
	fload	f3 r2 8
	fload	f4 r2 7
	load	r4 r2 17
	addi	r2 r2 23
	jump	L_vecset_2471
L_else_8566 : 
	fstore	f4 r2 18
	store	r6 r2 0
	store	r5 r2 1
	fstore	f5 r2 19
	store	r4 r2 20
	fadd	f2 f0 f3
	fadd	f3 f0 f4
	call	L_adjust_position_2895
	addi	r4 r0 1
	load	r5 r2 20
	add	r4 r5 r4
	fload	f3 r2 19
	fstore	f3 r2 19
	fstore	f2 r2 21
	store	r4 r2 22
	call	L_adjust_position_2895
	add	f3 r0 f2
	fload	f2 r2 21
	fload	f4 r2 18
	fload	f5 r2 19
	load	r4 r2 22
	load	r5 r2 1
	load	r6 r2 0
	addi	r2 r2 23
	jump	L_calc_dirvec_2898
L_calc_dirvecs_2906 : 
	subi	r2 r2 5
	addi	r7 r0 0
	bgt	r7 r4 L_else_8567
	foi	f3 r4
	fload	f4 r0 29
	fmul	f3 f3 f4
	fload	f4 r0 1
	fsub	f4 f3 f4
	addi	r7 r0 0
	fload	f3 r0 54
	fload	f5 r0 54
	fstore	f2 r2 0
	store	r5 r2 1
	store	r6 r2 2
	store	r4 r2 3
	add	r4 r0 r7
	fadd	f1 f0 f5
	fadd	f5 f0 f2
	fadd	f2 f0 f3
	fadd	f3 f0 f1
	call	L_calc_dirvec_2898
	load	r4 r2 3
	foi	f2 r4
	fload	f3 r0 29
	fmul	f2 f2 f3
	fload	f3 r0 4
	fadd	f4 f2 f3
	addi	r5 r0 0
	fload	f2 r0 54
	fload	f3 r0 54
	addi	r6 r0 2
	load	r7 r2 2
	add	r6 r7 r6
	fload	f5 r2 0
	load	r8 r2 1
	fstore	f5 r2 0
	store	r7 r2 2
	store	r8 r2 1
	store	r4 r2 3
	add	r4 r0 r5
	add	r5 r0 r8
	call	L_calc_dirvec_2898
	addi	r4 r0 1
	load	r5 r2 3
	sub	r4 r5 r4
	addi	r5 r0 1
	load	r6 r2 1
	store	r4 r2 4
	add	r4 r0 r6
	call	L_add_mod5_2468
	add	r5 r0 r4
	fload	f2 r2 0
	load	r4 r2 4
	load	r6 r2 2
	addi	r2 r2 5
	jump	L_calc_dirvecs_2906
L_else_8567 : 
	addi	r2 r2 5
	return
L_calc_dirvec_rows_2911 : 
	subi	r2 r2 4
	addi	r7 r0 0
	bgt	r7 r4 L_else_8568
	foi	f2 r4
	fload	f3 r0 29
	fmul	f2 f2 f3
	fload	f3 r0 1
	fsub	f2 f2 f3
	addi	r7 r0 4
	store	r6 r2 0
	store	r5 r2 1
	store	r4 r2 2
	add	r4 r0 r7
	call	L_calc_dirvecs_2906
	addi	r4 r0 1
	load	r5 r2 2
	sub	r4 r5 r4
	addi	r5 r0 2
	load	r6 r2 1
	store	r4 r2 3
	add	r4 r0 r6
	call	L_add_mod5_2468
	add	r5 r0 r4
	addi	r4 r0 4
	load	r6 r2 0
	add	r6 r6 r4
	load	r4 r2 3
	addi	r2 r2 4
	jump	L_calc_dirvec_rows_2911
L_else_8568 : 
	addi	r2 r2 4
	return
L_create_dirvec_2915 : 
	subi	r2 r2 1
	addi	r4 r0 3
	fload	f2 r0 54
	call	min_caml_create_float_array
	add	r5 r0 r4
	addi	r4 r0 4144
	addi	r6 r0 0
	add	r4 r4 r6
	load	r4 r4 0
	store	r5 r2 0
	call	min_caml_create_array
	add	r5 r0 r3
	addi	r3 r3 2
	store	r4 r5 1
	load	r4 r2 0
	store	r4 r5 0
	add	r4 r0 r5
	addi	r2 r2 1
	return
L_create_dirvec_elements_2917 : 
	subi	r2 r2 2
	addi	r6 r0 0
	bgt	r6 r5 L_else_8569
	store	r5 r2 0
	store	r4 r2 1
	call	L_create_dirvec_2915
	load	r5 r2 0
	load	r6 r2 1
	add	r7 r6 r5
	store	r4 r7 0
	addi	r4 r0 1
	sub	r5 r5 r4
	add	r4 r0 r6
	addi	r2 r2 2
	jump	L_create_dirvec_elements_2917
L_else_8569 : 
	addi	r2 r2 2
	return
L_create_dirvecs_2920 : 
	subi	r2 r2 3
	addi	r5 r0 0
	bgt	r5 r4 L_else_8570
	addi	r5 r0 4148
	addi	r6 r0 120
	store	r4 r2 0
	store	r5 r2 1
	store	r6 r2 2
	call	L_create_dirvec_2915
	add	r5 r0 r4
	load	r4 r2 2
	call	min_caml_create_array
	load	r5 r2 0
	load	r6 r2 1
	add	r6 r6 r5
	store	r4 r6 0
	addi	r4 r0 4148
	add	r4 r4 r5
	load	r4 r4 0
	addi	r6 r0 118
	store	r5 r2 0
	add	r5 r0 r6
	call	L_create_dirvec_elements_2917
	addi	r4 r0 1
	load	r5 r2 0
	sub	r4 r5 r4
	addi	r2 r2 3
	jump	L_create_dirvecs_2920
L_else_8570 : 
	addi	r2 r2 3
	return
L_init_dirvec_constants_2922 : 
	subi	r2 r2 2
	addi	r6 r0 0
	bgt	r6 r5 L_else_8571
	add	r6 r4 r5
	load	r6 r6 0
	store	r4 r2 0
	store	r5 r2 1
	add	r4 r0 r6
	call	L_setup_dirvec_constants_2707
	addi	r4 r0 1
	load	r5 r2 1
	sub	r5 r5 r4
	load	r4 r2 0
	addi	r2 r2 2
	jump	L_init_dirvec_constants_2922
L_else_8571 : 
	addi	r2 r2 2
	return
L_init_vecset_constants_2925 : 
	subi	r2 r2 1
	addi	r5 r0 0
	bgt	r5 r4 L_else_8572
	addi	r5 r0 4148
	add	r5 r5 r4
	load	r5 r5 0
	addi	r6 r0 119
	store	r4 r2 0
	add	r4 r0 r5
	add	r5 r0 r6
	call	L_init_dirvec_constants_2922
	addi	r4 r0 1
	load	r5 r2 0
	sub	r4 r5 r4
	addi	r2 r2 1
	jump	L_init_vecset_constants_2925
L_else_8572 : 
	addi	r2 r2 1
	return
L_init_dirvecs_2927 : 
	addi	r4 r0 4
	call	L_create_dirvecs_2920
	addi	r4 r0 9
	addi	r5 r0 0
	addi	r6 r0 0
	call	L_calc_dirvec_rows_2911
	addi	r4 r0 4
	jump	L_init_vecset_constants_2925
L_add_reflection_2929 : 
	subi	r2 r2 7
	store	r4 r2 0
	store	r5 r2 1
	fstore	f2 r2 2
	fstore	f5 r2 3
	fstore	f4 r2 4
	fstore	f3 r2 5
	call	L_create_dirvec_2915
	store	r4 r2 6
	call	L_d_vec_2578
	fload	f2 r2 5
	fload	f3 r2 4
	fload	f4 r2 3
	call	L_vecset_2471
	load	r4 r2 6
	store	r4 r2 6
	call	L_setup_dirvec_constants_2707
	addi	r4 r0 4257
	add	r5 r0 r3
	addi	r3 r3 3
	fload	f2 r2 2
	fstore	f2 r5 2
	load	r6 r2 6
	store	r6 r5 1
	load	r6 r2 1
	store	r6 r5 0
	add	r5 r0 r5
	load	r6 r2 0
	add	r4 r4 r6
	store	r5 r4 0
	addi	r2 r2 7
	return
L_setup_rect_reflection_2936 : 
	subi	r2 r2 7
	addi	r6 r0 4
	mul	r4 r4 r6
	addi	r6 r0 4147
	addi	r7 r0 0
	add	r6 r6 r7
	load	r6 r6 0
	fload	f2 r0 40
	store	r6 r2 0
	store	r4 r2 1
	fstore	f2 r2 2
	add	r4 r0 r5
	call	L_o_diffuse_2541
	fload	f3 r2 2
	fsub	f2 f3 f2
	addi	r4 r0 4111
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f3 r4 0
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	L_fneg_2440
	addi	r4 r0 4111
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f3 r4 0
	fstore	f2 r2 4
	fadd	f2 f0 f3
	call	L_fneg_2440
	addi	r4 r0 4111
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f3 r4 0
	fstore	f2 r2 5
	fadd	f2 f0 f3
	call	L_fneg_2440
	add	f5 r0 f2
	addi	r4 r0 1
	load	r5 r2 1
	add	r4 r5 r4
	addi	r6 r0 4111
	addi	r7 r0 0
	add	r6 r6 r7
	fload	f3 r6 0
	fload	f2 r2 3
	fload	f4 r2 5
	load	r6 r2 0
	fstore	f4 r2 5
	fstore	f5 r2 6
	fstore	f2 r2 3
	store	r5 r2 1
	store	r6 r2 0
	add	r5 r0 r4
	add	r4 r0 r6
	call	L_add_reflection_2929
	addi	r4 r0 1
	load	r5 r2 0
	add	r4 r5 r4
	addi	r6 r0 2
	load	r7 r2 1
	add	r6 r7 r6
	addi	r8 r0 4111
	addi	r9 r0 1
	add	r8 r8 r9
	fload	f4 r8 0
	fload	f2 r2 3
	fload	f3 r2 4
	fload	f5 r2 6
	fstore	f3 r2 4
	fstore	f2 r2 3
	store	r7 r2 1
	store	r5 r2 0
	add	r5 r0 r6
	call	L_add_reflection_2929
	addi	r4 r0 2
	load	r5 r2 0
	add	r4 r5 r4
	addi	r6 r0 3
	load	r7 r2 1
	add	r6 r7 r6
	addi	r7 r0 4111
	addi	r8 r0 2
	add	r7 r7 r8
	fload	f5 r7 0
	fload	f2 r2 3
	fload	f3 r2 4
	fload	f4 r2 5
	store	r5 r2 0
	add	r5 r0 r6
	call	L_add_reflection_2929
	addi	r4 r0 4147
	addi	r5 r0 0
	addi	r6 r0 3
	load	r7 r2 0
	add	r6 r7 r6
	add	r4 r4 r5
	store	r6 r4 0
	addi	r2 r2 7
	return
L_setup_surface_reflection_2939 : 
	subi	r2 r2 12
	addi	r6 r0 4
	mul	r4 r4 r6
	addi	r6 r0 1
	add	r4 r4 r6
	addi	r6 r0 4147
	addi	r7 r0 0
	add	r6 r6 r7
	load	r6 r6 0
	fload	f2 r0 40
	store	r4 r2 0
	store	r6 r2 1
	store	r5 r2 2
	fstore	f2 r2 3
	add	r4 r0 r5
	call	L_o_diffuse_2541
	fload	f3 r2 3
	fsub	f2 f3 f2
	addi	r4 r0 4111
	load	r5 r2 2
	fstore	f2 r2 4
	store	r5 r2 2
	store	r4 r2 5
	add	r4 r0 r5
	call	L_o_param_abc_2533
	add	r5 r0 r4
	load	r4 r2 5
	call	L_veciprod_2492
	fload	f3 r0 53
	load	r4 r2 2
	store	r4 r2 2
	fstore	f2 r2 6
	fstore	f3 r2 7
	call	L_o_param_a_2527
	fload	f3 r2 7
	fmul	f2 f3 f2
	fload	f3 r2 6
	fmul	f2 f2 f3
	addi	r4 r0 4111
	addi	r5 r0 0
	add	r4 r4 r5
	fload	f4 r4 0
	fsub	f2 f2 f4
	fload	f4 r0 53
	load	r4 r2 2
	fstore	f2 r2 8
	store	r4 r2 2
	fstore	f3 r2 6
	fstore	f4 r2 9
	call	L_o_param_b_2529
	fload	f3 r2 9
	fmul	f2 f3 f2
	fload	f3 r2 6
	fmul	f2 f2 f3
	addi	r4 r0 4111
	addi	r5 r0 1
	add	r4 r4 r5
	fload	f4 r4 0
	fsub	f2 f2 f4
	fload	f4 r0 53
	load	r4 r2 2
	fstore	f2 r2 10
	fstore	f3 r2 6
	fstore	f4 r2 11
	call	L_o_param_c_2531
	fload	f3 r2 11
	fmul	f2 f3 f2
	fload	f3 r2 6
	fmul	f2 f2 f3
	addi	r4 r0 4111
	addi	r5 r0 2
	add	r4 r4 r5
	fload	f3 r4 0
	fsub	f5 f2 f3
	fload	f2 r2 4
	fload	f3 r2 8
	fload	f4 r2 10
	load	r4 r2 1
	load	r5 r2 0
	store	r4 r2 1
	call	L_add_reflection_2929
	addi	r4 r0 4147
	addi	r5 r0 0
	addi	r6 r0 1
	load	r7 r2 1
	add	r6 r7 r6
	add	r4 r4 r5
	store	r6 r4 0
	addi	r2 r2 12
	return
L_setup_reflections_2942 : 
	subi	r2 r2 2
	addi	r5 r0 0
	bgt	r5 r4 L_else_8573
	addi	r5 r0 5042
	add	r5 r5 r4
	load	r5 r5 0
	store	r4 r2 0
	store	r5 r2 1
	add	r4 r0 r5
	call	L_o_reflectiontype_2521
	addi	r5 r0 2
	bne	r4 r5 L_else_8574
	load	r4 r2 1
	store	r4 r2 1
	call	L_o_diffuse_2541
	fload	f3 r0 40
	call	L_fless_2435
	addi	r5 r0 0
	bne	r4 r5 L_else_8575
	addi	r2 r2 2
	return
L_else_8575 : 
	load	r4 r2 1
	store	r4 r2 1
	call	L_o_form_2519
	addi	r5 r0 1
	bne	r4 r5 L_else_8576
	load	r4 r2 0
	load	r5 r2 1
	addi	r2 r2 2
	jump	L_setup_rect_reflection_2936
L_else_8576 : 
	addi	r5 r0 2
	bne	r4 r5 L_else_8577
	load	r4 r2 0
	load	r5 r2 1
	addi	r2 r2 2
	jump	L_setup_surface_reflection_2939
L_else_8577 : 
	addi	r2 r2 2
	return
L_else_8574 : 
	addi	r2 r2 2
	return
L_else_8573 : 
	addi	r2 r2 2
	return
L_rt_2944 : 
	subi	r2 r2 3
	addi	r6 r0 4130
	addi	r7 r0 0
	add	r6 r6 r7
	store	r4 r6 0
	addi	r6 r0 4130
	addi	r7 r0 1
	add	r6 r6 r7
	store	r5 r6 0
	addi	r5 r0 4132
	addi	r6 r0 0
	addi	r7 r0 64
	add	r5 r5 r6
	store	r7 r5 0
	addi	r5 r0 4132
	addi	r6 r0 1
	addi	r7 r0 64
	add	r5 r5 r6
	store	r7 r5 0
	addi	r5 r0 4134
	addi	r6 r0 0
	fload	f2 r0 0
	foi	f3 r4
	fdiv	f2 f2 f3
	add	r4 r5 r6
	fstore	f2 r4 0
	call	L_create_pixelline_2891
	store	r4 r2 0
	call	L_create_pixelline_2891
	store	r4 r2 1
	call	L_create_pixelline_2891
	store	r4 r2 2
	call	L_read_parameter_2609
	call	L_write_ppm_header_2852
	call	L_init_dirvecs_2927
	addi	r4 r0 4977
	call	L_d_vec_2578
	addi	r5 r0 4111
	call	L_veccpy_2481
	addi	r4 r0 4977
	call	L_setup_dirvec_constants_2707
	addi	r4 r0 4144
	addi	r5 r0 0
	add	r4 r4 r5
	load	r4 r4 0
	addi	r5 r0 1
	sub	r4 r4 r5
	call	L_setup_reflections_2942
	addi	r5 r0 0
	addi	r6 r0 0
	load	r4 r2 1
	store	r4 r2 1
	call	L_pretrace_line_2868
	addi	r4 r0 0
	addi	r8 r0 2
	load	r5 r2 0
	load	r6 r2 1
	load	r7 r2 2
	addi	r2 r2 3
	jump	L_scan_line_2878
L_end_8272 : 
	store	r4 r0 4095
