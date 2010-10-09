	nop
	nop
L_main_5242 : 
	addi	r2 r0 4095
	addi	r3 r0 768
	addi	r4 r0 768
	addi	r5 r0 0
	call	L_rt_2141
	jump	L_end_5051
L_xor_1977 : 
	subi	r2 r2 0
	addi	r5 r0 0
	bne	r3 r5 L_else_5052
	add	r3 r0 r4
L_else_5052 : 
	addi	r3 r0 0
	bne	r4 r3 L_else_5053
	addi	r3 r0 1
L_else_5053 : 
	addi	r3 r0 0
	addi	r2 r2 0
	return
L_fsqr_1980 : 
	subi	r2 r2 0
	fmul	r3 f2 f2
	addi	r2 r2 0
	return
L_fhalf_1982 : 
	subi	r2 r2 0
	fload	f3 r0 28
	fdiv	r3 f2 f3
	addi	r2 r2 0
	return
L_o_texturetype_1984 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_form_1986 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_reflectiontype_1988 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_isinvert_1990 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_isrot_1992 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_a_1994 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_b_1996 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_c_1998 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_x_2000 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_y_2002 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_z_2004 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_diffuse_2006 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_hilight_2008 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_color_red_2010 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_color_green_2012 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_color_blue_2014 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_r1_2016 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_r2_2018 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_o_param_r3_2020 : 
	subi	r2 r2 0
	addi	r2 r2 0
	return
L_normalize_vector_2022 : 
	subi	r2 r2 3
	addi	r3 r0 0
	store	r4 r2 0
	call	L_fsqr_1980
	addi	r3 r0 1
	fstore	f2 r2 1
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 1
	fadd	f2 r3 f2
	addi	r3 r0 2
	fstore	f2 r2 2
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 2
	fadd	f2 r3 f2
	call	min_caml_sqrt
	addi	r3 r0 0
	load	r4 r2 0
	bne	r4 r3 L_else_5054
	fadd	r3 f0 f2
	jump	L_endif_5055
L_else_5054 : 
	fsub	r3 f0 f2
L_endif_5055 : 
	addi	r3 r0 0
	addi	r3 r0 0
	fdiv	f3 f3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	fdiv	f3 f3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	fdiv	f2 f3 f2
	addi	r2 r2 3
	return
L_sgn_2025 : 
	subi	r2 r2 0
	fload	f3 r0 27
	bne	f2 f3 L_else_5056
	fload	r3 r0 25
L_else_5056 : 
	fload	r3 r0 26
	addi	r2 r2 0
	return
L_rad_2027 : 
	subi	r2 r2 0
	fload	f3 r0 24
	fmul	r3 f2 f3
	addi	r2 r2 0
	return
L_read_environ_2029 : 
	subi	r2 r2 5
	addi	r3 r0 0
	call	min_caml_read_float
	addi	r3 r0 1
	call	min_caml_read_float
	addi	r3 r0 2
	call	min_caml_read_float
	call	min_caml_read_float
	call	L_rad_2027
	addi	r3 r0 0
	fstore	f2 r2 0
	call	min_caml_cos
	addi	r3 r0 0
	fload	f2 r2 0
	call	min_caml_sin
	call	min_caml_read_float
	call	L_rad_2027
	addi	r3 r0 1
	fstore	f2 r2 1
	call	min_caml_cos
	addi	r3 r0 1
	fload	f2 r2 1
	call	min_caml_sin
	call	min_caml_read_float
	call	min_caml_read_float
	call	L_rad_2027
	fstore	f2 r2 2
	call	min_caml_sin
	addi	r3 r0 1
	fsub	f2 f0 f2
	call	min_caml_read_float
	call	L_rad_2027
	fload	f3 r2 2
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	min_caml_cos
	fload	f3 r2 3
	fstore	f3 r2 3
	fstore	f2 r2 4
	fadd	f2 f0 f3
	call	min_caml_sin
	addi	r3 r0 0
	fload	r3 r2 4
	fmul	f2 r3 f2
	fload	f2 r2 3
	store	r3 r2 4
	call	min_caml_cos
	addi	r3 r0 2
	fload	r3 r2 4
	fmul	f2 r3 f2
	addi	r3 r0 0
	call	min_caml_read_float
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f2 f2 f3
	fload	f3 r0 23
	fmul	f2 f2 f3
	addi	r3 r0 1
	addi	r3 r0 0
	fsub	f2 f0 f2
	fload	f3 r0 23
	fmul	f2 f2 f3
	addi	r3 r0 2
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f2 f2 f3
	fload	f3 r0 23
	fmul	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 0
	fadd	f2 f2 f3
	addi	r3 r0 1
	addi	r3 r0 1
	addi	r3 r0 1
	fadd	f2 f2 f3
	addi	r3 r0 2
	addi	r3 r0 2
	addi	r3 r0 2
	fadd	f2 f2 f3
	addi	r2 r2 5
	return
L_read_nth_object_2031 : 
	subi	r2 r2 20
	call	min_caml_read_int
	addi	r4 r0 -1
	bne	r3 r4 L_else_5057
	addi	r3 r0 0
L_else_5057 : 
	call	min_caml_read_int
	store	r3 r2 0
	call	min_caml_read_int
	call	min_caml_read_int
	addi	r4 r0 3
	fload	f2 r0 27
	store	r3 r2 1
	add	r3 r0 r4
	call	min_caml_create_float_array
	addi	r4 r0 0
	store	r3 r2 2
	call	min_caml_read_float
	addi	r3 r0 1
	call	min_caml_read_float
	addi	r3 r0 2
	call	min_caml_read_float
	addi	r3 r0 3
	fload	f2 r0 27
	call	min_caml_create_float_array
	addi	r3 r0 0
	call	min_caml_read_float
	addi	r3 r0 1
	call	min_caml_read_float
	addi	r3 r0 2
	call	min_caml_read_float
	fload	f2 r0 27
	fstore	f2 r2 3
	call	min_caml_read_float
	fload	f3 r2 3
	bne	f3 f2 L_else_5076
	addi	r3 r0 0
	jump	L_endif_5077
L_else_5076 : 
	addi	r3 r0 1
L_endif_5077 : 
	addi	r4 r0 2
	fload	f2 r0 27
	store	r3 r2 4
	add	r3 r0 r4
	call	min_caml_create_float_array
	addi	r3 r0 0
	call	min_caml_read_float
	addi	r3 r0 1
	call	min_caml_read_float
	addi	r3 r0 3
	fload	f2 r0 27
	call	min_caml_create_float_array
	addi	r3 r0 0
	call	min_caml_read_float
	addi	r3 r0 1
	call	min_caml_read_float
	addi	r3 r0 2
	call	min_caml_read_float
	addi	r3 r0 3
	fload	f2 r0 27
	call	min_caml_create_float_array
	addi	r3 r0 0
	load	r4 r2 1
	store	r4 r2 1
	bne	r4 r3 L_else_5074
	jump	L_endif_5075
L_else_5074 : 
	addi	r3 r0 0
	store	r4 r2 1
	call	min_caml_read_float
	call	L_rad_2027
	addi	r3 r0 1
	call	min_caml_read_float
	call	L_rad_2027
	addi	r3 r0 2
	call	min_caml_read_float
	call	L_rad_2027
L_endif_5075 : 
	addi	r3 r0 2
	load	r4 r2 0
	bne	r4 r3 L_else_5072
	addi	r3 r0 1
	jump	L_endif_5073
L_else_5072 : 
	load	r3 r2 4
	add	r3 r0 r3
L_endif_5073 : 
	addi	r3 r0 3
	bne	r4 r3 L_else_5060
	addi	r3 r0 0
	addi	r3 r0 0
	fload	f3 r0 27
	bne	f3 f2 L_else_5070
	fload	r3 r0 27
	jump	L_endif_5071
L_else_5070 : 
	fstore	f2 r2 5
	call	L_sgn_2025
	fload	f3 r2 5
	fstore	f2 r2 6
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 6
	fdiv	r3 r3 f2
L_endif_5071 : 
	addi	r3 r0 1
	addi	r3 r0 1
	fload	f3 r0 27
	bne	f3 f2 L_else_5068
	fload	r3 r0 27
	jump	L_endif_5069
L_else_5068 : 
	fstore	f2 r2 7
	call	L_sgn_2025
	fload	f3 r2 7
	fstore	f2 r2 8
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 8
	fdiv	r3 r3 f2
L_endif_5069 : 
	addi	r3 r0 2
	addi	r3 r0 2
	fload	f3 r0 27
	bne	f3 f2 L_else_5066
	fload	r3 r0 27
	jump	L_endif_5067
L_else_5066 : 
	fstore	f2 r2 9
	call	L_sgn_2025
	fload	f3 r2 9
	fstore	f2 r2 10
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 10
	fdiv	r3 r3 f2
L_endif_5067 : 
	jump	L_endif_5061
L_else_5060 : 
	addi	r3 r0 2
	bne	r4 r3 L_else_5062
	addi	r3 r0 0
	load	r4 r2 4
	bne	r4 r3 L_else_5064
	addi	r3 r0 1
	jump	L_endif_5065
L_else_5064 : 
	addi	r3 r0 0
L_endif_5065 : 
	load	r3 r2 2
	call	L_normalize_vector_2022
	jump	L_endif_5063
L_else_5062 : 
L_endif_5063 : 
L_endif_5061 : 
	addi	r3 r0 0
	load	r4 r2 1
	bne	r4 r3 L_else_5058
	jump	L_endif_5059
L_else_5058 : 
	addi	r3 r0 10
	addi	r3 r0 0
	call	min_caml_cos
	addi	r3 r0 11
	addi	r3 r0 0
	call	min_caml_sin
	addi	r3 r0 12
	addi	r3 r0 1
	call	min_caml_cos
	addi	r3 r0 13
	addi	r3 r0 1
	call	min_caml_sin
	addi	r3 r0 14
	addi	r3 r0 2
	call	min_caml_cos
	addi	r3 r0 15
	addi	r3 r0 2
	call	min_caml_sin
	addi	r3 r0 0
	addi	r3 r0 12
	addi	r3 r0 14
	fmul	f2 f2 f3
	addi	r3 r0 1
	addi	r3 r0 11
	addi	r3 r0 13
	fmul	f2 f2 f3
	addi	r3 r0 14
	fmul	f2 f2 f3
	addi	r3 r0 10
	addi	r3 r0 15
	fmul	f3 f3 f4
	fsub	f2 f2 f3
	addi	r3 r0 2
	addi	r3 r0 10
	addi	r3 r0 13
	fmul	f2 f2 f3
	addi	r3 r0 14
	fmul	f2 f2 f3
	addi	r3 r0 11
	addi	r3 r0 15
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r3 r0 3
	addi	r3 r0 12
	addi	r3 r0 15
	fmul	f2 f2 f3
	addi	r3 r0 4
	addi	r3 r0 11
	addi	r3 r0 13
	fmul	f2 f2 f3
	addi	r3 r0 15
	fmul	f2 f2 f3
	addi	r3 r0 10
	addi	r3 r0 14
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r3 r0 5
	addi	r3 r0 10
	addi	r3 r0 13
	fmul	f2 f2 f3
	addi	r3 r0 15
	fmul	f2 f2 f3
	addi	r3 r0 11
	addi	r3 r0 14
	fmul	f3 f3 f4
	fsub	f2 f2 f3
	addi	r3 r0 6
	addi	r3 r0 13
	fsub	f2 f0 f2
	addi	r3 r0 7
	addi	r3 r0 11
	addi	r3 r0 12
	fmul	f2 f2 f3
	addi	r3 r0 8
	addi	r3 r0 10
	addi	r3 r0 12
	fmul	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 1
	addi	r3 r0 2
	addi	r3 r0 0
	addi	r3 r0 0
	fstore	f4 r2 11
	fstore	f3 r2 12
	fstore	f2 r2 13
	fadd	f2 f0 f5
	call	L_fsqr_1980
	fload	r3 r2 13
	fmul	f2 r3 f2
	addi	r4 r0 3
	store	r3 r2 13
	fstore	f2 r2 14
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 12
	fmul	f2 r3 f2
	fload	r4 r2 14
	fadd	f2 r4 f2
	addi	r4 r0 6
	store	r3 r2 12
	fstore	f2 r2 15
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 11
	fmul	f2 r3 f2
	fload	r4 r2 15
	fadd	f2 r4 f2
	addi	r4 r0 1
	addi	r4 r0 1
	store	r3 r2 11
	call	L_fsqr_1980
	fload	r3 r2 13
	fmul	f2 r3 f2
	addi	r4 r0 4
	store	r3 r2 13
	fstore	f2 r2 16
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 12
	fmul	f2 r3 f2
	fload	r4 r2 16
	fadd	f2 r4 f2
	addi	r4 r0 7
	store	r3 r2 12
	fstore	f2 r2 17
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 11
	fmul	f2 r3 f2
	fload	r4 r2 17
	fadd	f2 r4 f2
	addi	r4 r0 2
	addi	r4 r0 2
	store	r3 r2 11
	call	L_fsqr_1980
	fload	r3 r2 13
	fmul	f2 r3 f2
	addi	r4 r0 5
	store	r3 r2 13
	fstore	f2 r2 18
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 12
	fmul	f2 r3 f2
	fload	r4 r2 18
	fadd	f2 r4 f2
	addi	r4 r0 8
	store	r3 r2 12
	fstore	f2 r2 19
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 11
	fmul	f2 r3 f2
	fload	r4 r2 19
	fadd	f2 r4 f2
	addi	r4 r0 0
	fload	f2 r0 28
	addi	r4 r0 1
	fload	r4 r2 13
	fmul	f3 r4 f3
	addi	r5 r0 2
	fmul	f3 f3 f4
	addi	r5 r0 4
	fload	r5 r2 12
	fmul	f4 r5 f4
	addi	r6 r0 5
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	addi	r6 r0 7
	fmul	f4 r3 f4
	addi	r6 r0 8
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	fmul	f2 f2 f3
	addi	r6 r0 1
	fload	f2 r0 28
	addi	r6 r0 0
	fmul	f3 r4 f3
	addi	r6 r0 2
	fmul	f3 f3 f4
	addi	r6 r0 3
	fmul	f4 r5 f4
	addi	r6 r0 5
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	addi	r6 r0 6
	fmul	f4 r3 f4
	addi	r6 r0 8
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	fmul	f2 f2 f3
	addi	r6 r0 2
	fload	f2 r0 28
	addi	r6 r0 0
	fmul	f3 r4 f3
	addi	r4 r0 1
	fmul	f3 f3 f4
	addi	r4 r0 3
	fmul	f4 r5 f4
	addi	r4 r0 4
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	addi	r4 r0 6
	fmul	f4 r3 f4
	addi	r3 r0 7
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	fmul	f2 f2 f3
L_endif_5059 : 
	addi	r3 r0 1
	addi	r2 r2 20
	return
L_read_object_2033 : 
	subi	r2 r2 1
	addi	r4 r0 61
	bne	r4 r3 L_else_5078
L_else_5078 : 
	store	r3 r2 0
	call	L_read_nth_object_2031
	addi	r4 r0 0
	bne	r3 r4 L_else_5079
L_else_5079 : 
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	jump	L_read_object_2033
	addi	r2 r2 1
	return
L_read_all_object_2035 : 
	subi	r2 r2 0
	addi	r3 r0 0
	jump	L_read_object_2033
	addi	r2 r2 0
	return
L_read_net_item_2037 : 
	subi	r2 r2 1
	store	r3 r2 0
	call	min_caml_read_int
	addi	r4 r0 -1
	bne	r3 r4 L_else_5080
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	addi	r4 r0 -1
	jump	min_caml_create_array
L_else_5080 : 
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	call	L_read_net_item_2037
	add	r3 r0 r3
	addi	r2 r2 1
	return
L_read_or_network_2039 : 
	subi	r2 r2 1
	addi	r4 r0 0
	store	r3 r2 0
	add	r3 r0 r4
	call	L_read_net_item_2037
	addi	r3 r0 0
	addi	r5 r0 -1
	bne	r3 r5 L_else_5081
	addi	r3 r0 1
	load	r5 r2 0
	add	r3 r5 r3
	jump	min_caml_create_array
L_else_5081 : 
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	call	L_read_or_network_2039
	add	r3 r0 r3
	addi	r2 r2 1
	return
L_read_and_network_2041 : 
	subi	r2 r2 1
	addi	r4 r0 0
	store	r3 r2 0
	add	r3 r0 r4
	call	L_read_net_item_2037
	addi	r3 r0 0
	addi	r4 r0 -1
	bne	r3 r4 L_else_5082
L_else_5082 : 
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	jump	L_read_and_network_2041
	addi	r2 r2 1
	return
L_read_parameter_2043 : 
	subi	r2 r2 0
	call	L_read_environ_2029
	call	L_read_all_object_2035
	addi	r3 r0 0
	call	L_read_and_network_2041
	addi	r3 r0 0
	addi	r3 r0 0
	call	L_read_or_network_2039
	addi	r2 r2 0
	return
L_solver_rect_2045 : 
	subi	r2 r2 10
	fload	f2 r0 27
	addi	r4 r0 0
	store	r3 r2 0
	bne	f2 f3 L_else_5106
	addi	r3 r0 0
	jump	L_endif_5107
L_else_5106 : 
	store	r3 r2 0
	call	L_o_isinvert_1990
	fload	f2 r0 27
	addi	r4 r0 0
	bne	f2 f3 L_else_5114
	addi	r3 r0 0
	jump	L_endif_5115
L_else_5114 : 
	addi	r3 r0 1
L_endif_5115 : 
	call	L_xor_1977
	addi	r4 r0 0
	bne	r3 r4 L_else_5112
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_a_1994
	fsub	r3 f0 f2
	jump	L_endif_5113
L_else_5112 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_a_1994
L_endif_5113 : 
	addi	r3 r0 0
	fsub	f2 f2 f3
	addi	r3 r0 0
	fdiv	f2 f2 f3
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_b_1996
	addi	r3 r0 1
	fload	r3 r2 1
	fmul	f3 r3 f3
	addi	r4 r0 1
	fadd	f3 f3 f4
	store	r3 r2 1
	fstore	f2 r2 2
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 2
	bne	f3 f2 L_else_5108
	addi	r3 r0 0
	jump	L_endif_5109
L_else_5108 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_c_1998
	addi	r3 r0 2
	fload	r3 r2 1
	fmul	f3 r3 f3
	addi	r3 r0 2
	fadd	f3 f3 f4
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 3
	bne	f3 f2 L_else_5110
	addi	r3 r0 0
	jump	L_endif_5111
L_else_5110 : 
	addi	r3 r0 0
	addi	r3 r0 1
L_endif_5111 : 
L_endif_5109 : 
L_endif_5107 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5083
	fload	f2 r0 27
	addi	r3 r0 1
	bne	f2 f3 L_else_5096
	addi	r3 r0 0
	jump	L_endif_5097
L_else_5096 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_isinvert_1990
	fload	f2 r0 27
	addi	r4 r0 1
	bne	f2 f3 L_else_5104
	addi	r3 r0 0
	jump	L_endif_5105
L_else_5104 : 
	addi	r3 r0 1
L_endif_5105 : 
	call	L_xor_1977
	addi	r4 r0 0
	bne	r3 r4 L_else_5102
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_b_1996
	fsub	r3 f0 f2
	jump	L_endif_5103
L_else_5102 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_b_1996
L_endif_5103 : 
	addi	r3 r0 1
	fsub	f2 f2 f3
	addi	r3 r0 1
	fdiv	f2 f2 f3
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 4
	call	L_o_param_c_1998
	addi	r3 r0 2
	fload	r3 r2 4
	fmul	f3 r3 f3
	addi	r4 r0 2
	fadd	f3 f3 f4
	store	r3 r2 4
	fstore	f2 r2 5
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 5
	bne	f3 f2 L_else_5098
	addi	r3 r0 0
	jump	L_endif_5099
L_else_5098 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_a_1994
	addi	r3 r0 0
	fload	r3 r2 4
	fmul	f3 r3 f3
	addi	r3 r0 0
	fadd	f3 f3 f4
	fstore	f2 r2 6
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 6
	bne	f3 f2 L_else_5100
	addi	r3 r0 0
	jump	L_endif_5101
L_else_5100 : 
	addi	r3 r0 0
	addi	r3 r0 1
L_endif_5101 : 
L_endif_5099 : 
L_endif_5097 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5084
	fload	f2 r0 27
	addi	r3 r0 2
	bne	f2 f3 L_else_5086
	addi	r3 r0 0
	jump	L_endif_5087
L_else_5086 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_isinvert_1990
	fload	f2 r0 27
	addi	r4 r0 2
	bne	f2 f3 L_else_5094
	addi	r3 r0 0
	jump	L_endif_5095
L_else_5094 : 
	addi	r3 r0 1
L_endif_5095 : 
	call	L_xor_1977
	addi	r4 r0 0
	bne	r3 r4 L_else_5092
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_c_1998
	fsub	r3 f0 f2
	jump	L_endif_5093
L_else_5092 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_c_1998
L_endif_5093 : 
	addi	r3 r0 2
	fsub	f2 f2 f3
	addi	r3 r0 2
	fdiv	f2 f2 f3
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 7
	call	L_o_param_a_1994
	addi	r3 r0 0
	fload	r3 r2 7
	fmul	f3 r3 f3
	addi	r4 r0 0
	fadd	f3 f3 f4
	store	r3 r2 7
	fstore	f2 r2 8
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 8
	bne	f3 f2 L_else_5088
	addi	r3 r0 0
	jump	L_endif_5089
L_else_5088 : 
	load	r3 r2 0
	call	L_o_param_b_1996
	addi	r3 r0 1
	fload	r3 r2 7
	fmul	f3 r3 f3
	addi	r3 r0 1
	fadd	f3 f3 f4
	fstore	f2 r2 9
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 9
	bne	f3 f2 L_else_5090
	addi	r3 r0 0
	jump	L_endif_5091
L_else_5090 : 
	addi	r3 r0 0
	addi	r3 r0 1
L_endif_5091 : 
L_endif_5089 : 
L_endif_5087 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5085
	addi	r3 r0 0
L_else_5085 : 
	addi	r3 r0 3
L_else_5084 : 
	addi	r3 r0 2
L_else_5083 : 
	addi	r3 r0 1
	addi	r2 r2 10
	return
L_solver_surface_2048 : 
	subi	r2 r2 12
	addi	r4 r0 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_a_1994
	fload	r3 r2 1
	fmul	f2 r3 f2
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	fstore	f3 r2 3
	call	L_o_param_b_1996
	fload	r3 r2 3
	fmul	f2 r3 f2
	fload	r3 r2 2
	fadd	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 4
	fstore	f3 r2 5
	call	L_o_param_c_1998
	fload	r3 r2 5
	fmul	f2 r3 f2
	fload	r3 r2 4
	fadd	f2 r3 f2
	fload	f3 r0 27
	bne	f2 f3 L_else_5116
	addi	r3 r0 0
L_else_5116 : 
	addi	r3 r0 0
	load	r3 r2 0
	fstore	f2 r2 6
	store	r3 r2 0
	fstore	f3 r2 7
	call	L_o_param_a_1994
	fload	r3 r2 7
	fmul	f2 r3 f2
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 8
	fstore	f3 r2 9
	call	L_o_param_b_1996
	fload	r3 r2 9
	fmul	f2 r3 f2
	fload	r3 r2 8
	fadd	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	fstore	f2 r2 10
	fstore	f3 r2 11
	call	L_o_param_c_1998
	fload	r3 r2 11
	fmul	f2 r3 f2
	fload	r3 r2 10
	fadd	f2 r3 f2
	fload	f3 r2 6
	fdiv	f2 f2 f3
	addi	r3 r0 0
	fsub	f2 f0 f2
	addi	r3 r0 1
	addi	r2 r2 12
	return
L_in_prod_sqr_obj_2051 : 
	subi	r2 r2 6
	addi	r4 r0 0
	store	r3 r2 0
	call	L_fsqr_1980
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_a_1994
	fload	r3 r2 1
	fmul	f2 r3 f2
	addi	r3 r0 1
	fstore	f2 r2 2
	fadd	f2 f0 f3
	call	L_fsqr_1980
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 3
	call	L_o_param_b_1996
	fload	r3 r2 3
	fmul	f2 r3 f2
	fload	r3 r2 2
	fadd	f2 r3 f2
	addi	r3 r0 2
	fstore	f2 r2 4
	fadd	f2 f0 f3
	call	L_fsqr_1980
	load	r3 r2 0
	fstore	f2 r2 5
	call	L_o_param_c_1998
	fload	r3 r2 5
	fmul	f2 r3 f2
	fload	r3 r2 4
	fadd	r3 r3 f2
	addi	r2 r2 6
	return
L_in_prod_co_objrot_2054 : 
	subi	r2 r2 6
	addi	r4 r0 1
	addi	r4 r0 2
	fmul	f2 f2 f3
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_r1_2016
	fload	r3 r2 1
	fmul	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 2
	fmul	f3 f3 f4
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	fstore	f3 r2 3
	call	L_o_param_r2_2018
	fload	r3 r2 3
	fmul	f2 r3 f2
	fload	r3 r2 2
	fadd	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f3 f3 f4
	load	r3 r2 0
	fstore	f2 r2 4
	fstore	f3 r2 5
	call	L_o_param_r3_2020
	fload	r3 r2 5
	fmul	f2 r3 f2
	fload	r3 r2 4
	fadd	r3 r3 f2
	addi	r2 r2 6
	return
L_solver2nd_mul_b_2057 : 
	subi	r2 r2 6
	addi	r4 r0 0
	addi	r4 r0 0
	fmul	f2 f2 f3
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_a_1994
	fload	r3 r2 1
	fmul	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	fmul	f3 f3 f4
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	fstore	f3 r2 3
	call	L_o_param_b_1996
	fload	r3 r2 3
	fmul	f2 r3 f2
	fload	r3 r2 2
	fadd	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	fmul	f3 f3 f4
	load	r3 r2 0
	fstore	f2 r2 4
	fstore	f3 r2 5
	call	L_o_param_c_1998
	fload	r3 r2 5
	fmul	f2 r3 f2
	fload	r3 r2 4
	fadd	r3 r3 f2
	addi	r2 r2 6
	return
L_solver2nd_rot_b_2060 : 
	subi	r2 r2 6
	addi	r4 r0 2
	addi	r4 r0 1
	fmul	f2 f2 f3
	addi	r4 r0 1
	addi	r4 r0 2
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_r1_2016
	fload	r3 r2 1
	fmul	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 2
	fmul	f3 f3 f4
	addi	r3 r0 2
	addi	r3 r0 0
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	fstore	f3 r2 3
	call	L_o_param_r2_2018
	fload	r3 r2 3
	fmul	f2 r3 f2
	fload	r3 r2 2
	fadd	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f3 f3 f4
	addi	r3 r0 1
	addi	r3 r0 0
	fmul	f4 f4 f5
	fadd	f3 f3 f4
	load	r3 r2 0
	fstore	f2 r2 4
	fstore	f3 r2 5
	call	L_o_param_r3_2020
	fload	r3 r2 5
	fmul	f2 r3 f2
	fload	r3 r2 4
	fadd	r3 r3 f2
	addi	r2 r2 6
	return
L_solver_second_2063 : 
	subi	r2 r2 11
	store	r4 r2 0
	store	r3 r2 1
	call	L_in_prod_sqr_obj_2051
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 2
	call	L_o_isrot_1992
	addi	r4 r0 0
	bne	r3 r4 L_else_5127
	fload	f2 r2 2
	fadd	r3 f0 f2
	jump	L_endif_5128
L_else_5127 : 
	load	r3 r2 1
	load	r4 r2 0
	store	r4 r2 0
	store	r3 r2 1
	call	L_in_prod_co_objrot_2054
	fload	r3 r2 2
	fadd	r3 r3 f2
L_endif_5128 : 
	fload	f3 r0 27
	bne	f3 f2 L_else_5117
	addi	r3 r0 0
L_else_5117 : 
	fload	f3 r0 28
	load	r3 r2 1
	load	r4 r2 0
	fstore	f2 r2 3
	store	r4 r2 0
	store	r3 r2 1
	fstore	f3 r2 4
	call	L_solver2nd_mul_b_2057
	fload	r3 r2 4
	fmul	f2 r3 f2
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 5
	call	L_o_isrot_1992
	addi	r4 r0 0
	bne	r3 r4 L_else_5125
	fload	f2 r2 5
	fadd	r3 f0 f2
	jump	L_endif_5126
L_else_5125 : 
	load	r3 r2 1
	load	r4 r2 0
	store	r3 r2 1
	call	L_solver2nd_rot_b_2060
	fload	r3 r2 5
	fadd	r3 r3 f2
L_endif_5126 : 
	load	r3 r2 1
	fstore	f2 r2 6
	store	r3 r2 1
	call	L_in_prod_sqr_obj_2051
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 7
	call	L_o_isrot_1992
	addi	r4 r0 0
	bne	r3 r4 L_else_5123
	fload	f2 r2 7
	fadd	r3 f0 f2
	jump	L_endif_5124
L_else_5123 : 
	load	r3 r2 1
	store	r3 r2 1
	call	L_in_prod_co_objrot_2054
	fload	r3 r2 7
	fadd	r3 r3 f2
L_endif_5124 : 
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 8
	call	L_o_form_1986
	addi	r4 r0 3
	bne	r3 r4 L_else_5121
	fload	f2 r0 26
	fload	r3 r2 8
	fsub	r3 r3 f2
	jump	L_endif_5122
L_else_5121 : 
	fload	f2 r2 8
	fadd	r3 f0 f2
L_endif_5122 : 
	fload	f3 r0 22
	fload	f4 r2 3
	fmul	f3 f3 f4
	fmul	f2 f3 f2
	fload	f3 r2 6
	fstore	f4 r2 3
	fstore	f3 r2 6
	fstore	f2 r2 9
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	f3 r2 9
	fsub	f2 f2 f3
	fload	f3 r0 27
	bne	f2 f3 L_else_5118
	addi	r3 r0 0
L_else_5118 : 
	call	min_caml_sqrt
	load	r3 r2 1
	fstore	f2 r2 10
	call	L_o_isinvert_1990
	addi	r4 r0 0
	bne	r3 r4 L_else_5119
	fload	f2 r2 10
	fsub	r3 f0 f2
	jump	L_endif_5120
L_else_5119 : 
	fload	f2 r2 10
	fadd	r3 f0 f2
L_endif_5120 : 
	addi	r3 r0 0
	fload	f3 r2 6
	fsub	f2 f2 f3
	fload	f3 r0 28
	fdiv	f2 f2 f3
	fload	f3 r2 3
	fdiv	f2 f2 f3
	addi	r3 r0 1
	addi	r2 r2 11
	return
L_solver_2066 : 
	subi	r2 r2 5
	addi	r5 r0 0
	addi	r5 r0 0
	store	r4 r2 0
	store	r3 r2 1
	fstore	f2 r2 2
	call	L_o_param_x_2000
	fload	r3 r2 2
	fsub	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 3
	call	L_o_param_y_2002
	fload	r3 r2 3
	fsub	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	load	r3 r2 1
	store	r3 r2 1
	fstore	f2 r2 4
	call	L_o_param_z_2004
	fload	r3 r2 4
	fsub	f2 r3 f2
	load	r3 r2 1
	store	r3 r2 1
	call	L_o_form_1986
	addi	r4 r0 1
	bne	r3 r4 L_else_5129
	load	r3 r2 1
	load	r4 r2 0
	jump	L_solver_rect_2045
L_else_5129 : 
	addi	r4 r0 2
	bne	r3 r4 L_else_5130
	load	r3 r2 1
	load	r4 r2 0
	jump	L_solver_surface_2048
L_else_5130 : 
	load	r3 r2 1
	load	r4 r2 0
	jump	L_solver_second_2063
	addi	r2 r2 5
	return
L_is_rect_outside_2070 : 
	subi	r2 r2 4
	store	r3 r2 0
	call	L_o_param_a_1994
	addi	r3 r0 0
	fstore	f2 r2 1
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 1
	bne	f3 f2 L_else_5133
	addi	r3 r0 0
	jump	L_endif_5134
L_else_5133 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_b_1996
	addi	r3 r0 1
	fstore	f2 r2 2
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 2
	bne	f3 f2 L_else_5135
	addi	r3 r0 0
	jump	L_endif_5136
L_else_5135 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_c_1998
	addi	r3 r0 2
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	min_caml_abs_float
	fload	f3 r2 3
	bne	f3 f2 L_else_5137
	addi	r3 r0 0
	jump	L_endif_5138
L_else_5137 : 
	addi	r3 r0 1
L_endif_5138 : 
L_endif_5136 : 
L_endif_5134 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5131
	load	r3 r2 0
	call	L_o_isinvert_1990
	addi	r4 r0 0
	bne	r3 r4 L_else_5132
	addi	r3 r0 1
L_else_5132 : 
	addi	r3 r0 0
L_else_5131 : 
	load	r3 r2 0
	jump	L_o_isinvert_1990
	addi	r2 r2 4
	return
L_is_plane_outside_2072 : 
	subi	r2 r2 4
	store	r3 r2 0
	call	L_o_param_a_1994
	addi	r3 r0 0
	fmul	f2 f2 f3
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_b_1996
	addi	r3 r0 1
	fmul	f2 f2 f3
	fload	r3 r2 1
	fadd	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_param_c_1998
	addi	r3 r0 2
	fmul	f2 f2 f3
	fload	r3 r2 2
	fadd	f2 r3 f2
	fload	f3 r0 27
	bne	f3 f2 L_else_5140
	addi	r3 r0 0
	jump	L_endif_5141
L_else_5140 : 
	addi	r3 r0 1
L_endif_5141 : 
	load	r4 r2 0
	store	r3 r2 3
	add	r3 r0 r4
	call	L_o_isinvert_1990
	load	r4 r2 3
	call	L_xor_1977
	addi	r4 r0 0
	bne	r3 r4 L_else_5139
	addi	r3 r0 1
L_else_5139 : 
	addi	r3 r0 0
	addi	r2 r2 4
	return
L_is_second_outside_2074 : 
	subi	r2 r2 4
	store	r3 r2 0
	call	L_in_prod_sqr_obj_2051
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_form_1986
	addi	r4 r0 3
	bne	r3 r4 L_else_5147
	fload	f2 r0 26
	fload	r3 r2 1
	fsub	r3 r3 f2
	jump	L_endif_5148
L_else_5147 : 
	fload	f2 r2 1
	fadd	r3 f0 f2
L_endif_5148 : 
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_isrot_1992
	addi	r4 r0 0
	bne	r3 r4 L_else_5145
	fload	f2 r2 2
	fadd	r3 f0 f2
	jump	L_endif_5146
L_else_5145 : 
	load	r3 r2 0
	store	r3 r2 0
	call	L_in_prod_co_objrot_2054
	fload	r3 r2 2
	fadd	r3 r3 f2
L_endif_5146 : 
	fload	f3 r0 27
	bne	f3 f2 L_else_5143
	addi	r3 r0 0
	jump	L_endif_5144
L_else_5143 : 
	addi	r3 r0 1
L_endif_5144 : 
	load	r4 r2 0
	store	r3 r2 3
	add	r3 r0 r4
	call	L_o_isinvert_1990
	load	r4 r2 3
	call	L_xor_1977
	addi	r4 r0 0
	bne	r3 r4 L_else_5142
	addi	r3 r0 1
L_else_5142 : 
	addi	r3 r0 0
	addi	r2 r2 4
	return
L_is_outside_2076 : 
	subi	r2 r2 4
	addi	r4 r0 0
	addi	r4 r0 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_x_2000
	fload	r3 r2 1
	fsub	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_param_y_2002
	fload	r3 r2 2
	fsub	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 3
	call	L_o_param_z_2004
	fload	r3 r2 3
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_form_1986
	addi	r4 r0 1
	bne	r3 r4 L_else_5149
	load	r3 r2 0
	jump	L_is_rect_outside_2070
L_else_5149 : 
	addi	r4 r0 2
	bne	r3 r4 L_else_5150
	load	r3 r2 0
	jump	L_is_plane_outside_2072
L_else_5150 : 
	load	r3 r2 0
	jump	L_is_second_outside_2074
	addi	r2 r2 4
	return
L_check_all_inside_2078 : 
	subi	r2 r2 2
	addi	r6 r0 -1
	bne	r5 r6 L_else_5151
	addi	r3 r0 1
L_else_5151 : 
	store	r4 r2 0
	store	r3 r2 1
	add	r3 r0 r5
	call	L_is_outside_2076
	addi	r4 r0 0
	bne	r3 r4 L_else_5152
	addi	r3 r0 1
	load	r4 r2 1
	add	r3 r4 r3
	load	r4 r2 0
	jump	L_check_all_inside_2078
L_else_5152 : 
	addi	r3 r0 0
	addi	r2 r2 2
	return
L_shadow_check_and_group_2081 : 
	subi	r2 r2 3
	addi	r7 r0 -1
	bne	r6 r7 L_else_5153
	addi	r3 r0 0
L_else_5153 : 
	store	r5 r2 0
	store	r4 r2 1
	store	r3 r2 2
	add	r4 r0 r7
	add	r3 r0 r6
	call	L_solver_2066
	addi	r4 r0 0
	addi	r4 r0 0
	bne	r3 r4 L_else_5157
	addi	r3 r0 0
	jump	L_endif_5158
L_else_5157 : 
	fload	f3 r0 21
	bne	f3 f2 L_else_5159
	addi	r3 r0 0
	jump	L_endif_5160
L_else_5159 : 
	addi	r3 r0 1
L_endif_5160 : 
L_endif_5158 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5154
	call	L_o_isinvert_1990
	addi	r4 r0 0
	bne	r3 r4 L_else_5156
	addi	r3 r0 0
L_else_5156 : 
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_and_group_2081
L_else_5154 : 
	fload	f3 r0 20
	fadd	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f3 f3 f2
	addi	r3 r0 0
	fadd	f3 f3 f4
	addi	r3 r0 1
	addi	r3 r0 1
	fmul	f3 f3 f2
	addi	r3 r0 1
	fadd	f3 f3 f4
	addi	r3 r0 2
	addi	r3 r0 2
	fmul	f2 f3 f2
	addi	r3 r0 2
	fadd	f2 f2 f3
	addi	r3 r0 0
	load	r4 r2 1
	store	r4 r2 1
	call	L_check_all_inside_2078
	addi	r4 r0 0
	bne	r3 r4 L_else_5155
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_and_group_2081
L_else_5155 : 
	addi	r3 r0 1
	addi	r2 r2 3
	return
L_shadow_check_one_or_group_2085 : 
	subi	r2 r2 3
	addi	r7 r0 -1
	bne	r6 r7 L_else_5161
	addi	r3 r0 0
L_else_5161 : 
	addi	r7 r0 0
	store	r5 r2 0
	store	r4 r2 1
	store	r3 r2 2
	add	r4 r0 r6
	add	r3 r0 r7
	call	L_shadow_check_and_group_2081
	addi	r4 r0 0
	bne	r3 r4 L_else_5162
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_one_or_group_2085
L_else_5162 : 
	addi	r3 r0 1
	addi	r2 r2 3
	return
L_shadow_check_one_or_matrix_2089 : 
	subi	r2 r2 4
	addi	r7 r0 0
	addi	r8 r0 -1
	bne	r7 r8 L_else_5163
	addi	r3 r0 0
L_else_5163 : 
	addi	r8 r0 99
	bne	r7 r8 L_else_5164
	addi	r7 r0 1
	store	r5 r2 0
	store	r4 r2 1
	store	r3 r2 2
	add	r4 r0 r6
	add	r3 r0 r7
	call	L_shadow_check_one_or_group_2085
	addi	r4 r0 0
	bne	r3 r4 L_else_5168
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_one_or_matrix_2089
L_else_5168 : 
	addi	r3 r0 1
L_else_5164 : 
	store	r6 r2 3
	store	r5 r2 0
	store	r4 r2 1
	store	r3 r2 2
	add	r4 r0 r8
	add	r3 r0 r7
	call	L_solver_2066
	addi	r4 r0 0
	bne	r3 r4 L_else_5165
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_one_or_matrix_2089
L_else_5165 : 
	fload	f2 r0 19
	addi	r3 r0 0
	bne	f2 f3 L_else_5166
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_one_or_matrix_2089
L_else_5166 : 
	addi	r3 r0 1
	load	r4 r2 3
	load	r5 r2 0
	store	r5 r2 0
	call	L_shadow_check_one_or_group_2085
	addi	r4 r0 0
	bne	r3 r4 L_else_5167
	addi	r3 r0 1
	load	r4 r2 2
	add	r3 r4 r3
	load	r4 r2 1
	load	r5 r2 0
	jump	L_shadow_check_one_or_matrix_2089
L_else_5167 : 
	addi	r3 r0 1
	addi	r2 r2 4
	return
L_solve_each_element_2093 : 
	subi	r2 r2 2
	addi	r6 r0 -1
	bne	r5 r6 L_else_5169
L_else_5169 : 
	store	r3 r2 0
	store	r4 r2 1
	add	r4 r0 r6
	add	r3 r0 r5
	add	r5 r0 r7
	call	L_solver_2066
	addi	r4 r0 0
	bne	r3 r4 L_else_5171
	call	L_o_isinvert_1990
	addi	r4 r0 0
	bne	r3 r4 L_else_5179
	addi	r3 r0 0
	addi	r3 r0 1
	jump	L_endif_5180
L_else_5179 : 
L_endif_5180 : 
	jump	L_endif_5172
L_else_5171 : 
	addi	r3 r0 0
	fload	f3 r0 19
	bne	f2 f3 L_else_5173
	jump	L_endif_5174
L_else_5173 : 
	addi	r3 r0 0
	bne	f3 f2 L_else_5175
	jump	L_endif_5176
L_else_5175 : 
	fload	f3 r0 20
	fadd	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f3 f3 f2
	addi	r3 r0 0
	fadd	f3 f3 f4
	addi	r3 r0 1
	addi	r3 r0 1
	fmul	f3 f3 f2
	addi	r3 r0 1
	fadd	f3 f3 f4
	addi	r3 r0 2
	addi	r3 r0 2
	fmul	f2 f3 f2
	addi	r3 r0 2
	fadd	f2 f2 f3
	addi	r3 r0 0
	load	r4 r2 1
	store	r4 r2 1
	call	L_check_all_inside_2078
	addi	r4 r0 0
	bne	r3 r4 L_else_5177
	jump	L_endif_5178
L_else_5177 : 
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 1
	addi	r3 r0 1
	addi	r3 r0 2
	addi	r3 r0 2
	addi	r3 r0 0
	addi	r3 r0 0
L_endif_5178 : 
L_endif_5176 : 
L_endif_5174 : 
L_endif_5172 : 
	addi	r3 r0 0
	addi	r4 r0 0
	bne	r3 r4 L_else_5170
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	load	r4 r2 1
	jump	L_solve_each_element_2093
L_else_5170 : 
	addi	r2 r2 2
	return
L_solve_one_or_network_2096 : 
	subi	r2 r2 2
	addi	r6 r0 -1
	bne	r5 r6 L_else_5181
L_else_5181 : 
	addi	r6 r0 0
	addi	r6 r0 0
	addi	r6 r0 0
	store	r4 r2 0
	store	r3 r2 1
	add	r4 r0 r5
	add	r3 r0 r6
	call	L_solve_each_element_2093
	addi	r3 r0 1
	load	r4 r2 1
	add	r3 r4 r3
	load	r4 r2 0
	jump	L_solve_one_or_network_2096
	addi	r2 r2 2
	return
L_trace_or_matrix_2099 : 
	subi	r2 r2 3
	addi	r6 r0 0
	addi	r7 r0 -1
	bne	r6 r7 L_else_5182
L_else_5182 : 
	addi	r7 r0 99
	store	r4 r2 0
	store	r3 r2 1
	bne	r6 r7 L_else_5183
	addi	r6 r0 1
	store	r4 r2 0
	store	r3 r2 1
	add	r4 r0 r5
	add	r3 r0 r6
	call	L_solve_one_or_network_2096
	jump	L_endif_5184
L_else_5183 : 
	store	r4 r2 0
	store	r3 r2 1
	store	r5 r2 2
	add	r5 r0 r8
	add	r4 r0 r7
	add	r3 r0 r6
	call	L_solver_2066
	addi	r4 r0 0
	bne	r3 r4 L_else_5185
	jump	L_endif_5186
L_else_5185 : 
	addi	r3 r0 0
	addi	r3 r0 0
	bne	f3 f2 L_else_5187
	jump	L_endif_5188
L_else_5187 : 
	addi	r3 r0 1
	load	r4 r2 2
	call	L_solve_one_or_network_2096
L_endif_5188 : 
L_endif_5186 : 
L_endif_5184 : 
	addi	r3 r0 1
	load	r4 r2 1
	add	r3 r4 r3
	load	r4 r2 0
	jump	L_trace_or_matrix_2099
	addi	r2 r2 3
	return
L_tracer_2102 : 
	subi	r2 r2 0
	addi	r3 r0 0
	fload	f2 r0 18
	addi	r3 r0 0
	addi	r4 r0 0
	call	L_trace_or_matrix_2099
	addi	r3 r0 0
	fload	f3 r0 19
	bne	f2 f3 L_else_5189
	addi	r3 r0 0
L_else_5189 : 
	fload	f3 r0 17
	bne	f3 f2 L_else_5190
	addi	r3 r0 0
L_else_5190 : 
	addi	r3 r0 1
	addi	r2 r2 0
	return
L_get_nvector_rect_2105 : 
	subi	r2 r2 0
	addi	r3 r0 0
	addi	r4 r0 1
	bne	r3 r4 L_else_5191
	addi	r3 r0 0
	addi	r3 r0 0
	call	L_sgn_2025
	fsub	f2 f0 f2
	addi	r3 r0 1
	fload	f2 r0 27
	addi	r3 r0 2
	fload	f2 r0 27
L_else_5191 : 
	addi	r4 r0 2
	bne	r3 r4 L_else_5192
	addi	r3 r0 0
	fload	f2 r0 27
	addi	r3 r0 1
	addi	r3 r0 1
	call	L_sgn_2025
	fsub	f2 f0 f2
	addi	r3 r0 2
	fload	f2 r0 27
L_else_5192 : 
	addi	r4 r0 3
	bne	r3 r4 L_else_5193
	addi	r3 r0 0
	fload	f2 r0 27
	addi	r3 r0 1
	fload	f2 r0 27
	addi	r3 r0 2
	addi	r3 r0 2
	call	L_sgn_2025
	fsub	f2 f0 f2
L_else_5193 : 
	addi	r2 r2 0
	return
L_get_nvector_plane_2107 : 
	subi	r2 r2 1
	addi	r4 r0 0
	store	r3 r2 0
	call	L_o_param_a_1994
	fsub	f2 f0 f2
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_param_b_1996
	fsub	f2 f0 f2
	addi	r3 r0 2
	load	r3 r2 0
	call	L_o_param_c_1998
	fsub	f2 f0 f2
	addi	r2 r2 1
	return
L_get_nvector_second_norot_2109 : 
	subi	r2 r2 8
	addi	r4 r0 0
	addi	r4 r0 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_x_2000
	fload	r3 r2 1
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_param_a_1994
	fload	r3 r2 2
	fmul	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 3
	call	L_o_param_y_2002
	fload	r3 r2 3
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 4
	call	L_o_param_b_1996
	fload	r3 r2 4
	fmul	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 5
	call	L_o_param_z_2004
	fload	r3 r2 5
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 6
	call	L_o_param_c_1998
	fload	r3 r2 6
	fmul	f2 r3 f2
	load	r4 r2 0
	store	r3 r2 7
	add	r3 r0 r4
	call	L_o_isinvert_1990
	load	r3 r2 7
	jump	L_normalize_vector_2022
	addi	r2 r2 8
	return
L_get_nvector_second_rot_2112 : 
	subi	r2 r2 20
	addi	r4 r0 0
	addi	r4 r0 0
	store	r3 r2 0
	fstore	f2 r2 1
	call	L_o_param_x_2000
	fload	r3 r2 1
	fsub	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_param_y_2002
	fload	r3 r2 2
	fsub	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 3
	call	L_o_param_z_2004
	fload	r3 r2 3
	fsub	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 0
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 4
	call	L_o_param_a_1994
	fload	r3 r2 4
	fmul	f2 r3 f2
	addi	r3 r0 1
	load	r3 r2 0
	fstore	f2 r2 5
	store	r3 r2 0
	fstore	f3 r2 6
	call	L_o_param_r3_2020
	fload	r3 r2 6
	fmul	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 7
	fstore	f3 r2 8
	call	L_o_param_r2_2018
	fload	r3 r2 8
	fmul	f2 r3 f2
	fload	r3 r2 7
	fadd	f2 r3 f2
	call	L_fhalf_1982
	fload	r3 r2 5
	fadd	f2 r3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 9
	call	L_o_param_b_1996
	fload	r3 r2 9
	fmul	f2 r3 f2
	addi	r3 r0 0
	load	r3 r2 0
	fstore	f2 r2 10
	store	r3 r2 0
	fstore	f3 r2 11
	call	L_o_param_r3_2020
	fload	r3 r2 11
	fmul	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 12
	fstore	f3 r2 13
	call	L_o_param_r1_2016
	fload	r3 r2 13
	fmul	f2 r3 f2
	fload	r3 r2 12
	fadd	f2 r3 f2
	call	L_fhalf_1982
	fload	r3 r2 10
	fadd	f2 r3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 14
	call	L_o_param_c_1998
	fload	r3 r2 14
	fmul	f2 r3 f2
	addi	r3 r0 0
	load	r3 r2 0
	fstore	f2 r2 15
	store	r3 r2 0
	fstore	f3 r2 16
	call	L_o_param_r2_2018
	fload	r3 r2 16
	fmul	f2 r3 f2
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 17
	fstore	f3 r2 18
	call	L_o_param_r1_2016
	fload	r3 r2 18
	fmul	f2 r3 f2
	fload	r3 r2 17
	fadd	f2 r3 f2
	call	L_fhalf_1982
	fload	r3 r2 15
	fadd	f2 r3 f2
	load	r4 r2 0
	store	r3 r2 19
	add	r3 r0 r4
	call	L_o_isinvert_1990
	load	r3 r2 19
	jump	L_normalize_vector_2022
	addi	r2 r2 20
	return
L_get_nvector_2115 : 
	subi	r2 r2 2
	store	r4 r2 0
	store	r3 r2 1
	call	L_o_form_1986
	addi	r4 r0 1
	bne	r3 r4 L_else_5194
	jump	L_get_nvector_rect_2105
L_else_5194 : 
	addi	r4 r0 2
	bne	r3 r4 L_else_5195
	load	r3 r2 1
	jump	L_get_nvector_plane_2107
L_else_5195 : 
	load	r3 r2 1
	store	r3 r2 1
	call	L_o_isrot_1992
	addi	r4 r0 0
	bne	r3 r4 L_else_5196
	load	r3 r2 1
	load	r4 r2 0
	jump	L_get_nvector_second_norot_2109
L_else_5196 : 
	load	r3 r2 1
	load	r4 r2 0
	jump	L_get_nvector_second_rot_2112
	addi	r2 r2 2
	return
L_utexture_2118 : 
	subi	r2 r2 32
	store	r3 r2 0
	call	L_o_texturetype_1984
	addi	r4 r0 0
	load	r4 r2 0
	store	r3 r2 1
	store	r4 r2 0
	add	r3 r0 r4
	call	L_o_color_red_2010
	addi	r3 r0 1
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_color_green_2012
	addi	r3 r0 2
	load	r3 r2 0
	store	r3 r2 0
	call	L_o_color_blue_2014
	addi	r3 r0 1
	load	r4 r2 1
	bne	r4 r3 L_else_5197
	addi	r3 r0 0
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 2
	call	L_o_param_x_2000
	fload	r3 r2 2
	fsub	f2 r3 f2
	fload	f3 r0 6
	fmul	f3 f2 f3
	fstore	f2 r2 3
	fadd	f2 f0 f3
	call	min_caml_floor
	fload	f3 r0 5
	fmul	f2 f2 f3
	fload	f3 r0 10
	fload	r3 r2 3
	fsub	f2 r3 f2
	bne	f3 f2 L_else_5215
	addi	r3 r0 0
	jump	L_endif_5216
L_else_5215 : 
	addi	r3 r0 1
L_endif_5216 : 
	addi	r4 r0 2
	load	r4 r2 0
	store	r3 r2 4
	fstore	f2 r2 5
	add	r3 r0 r4
	call	L_o_param_z_2004
	fload	r3 r2 5
	fsub	f2 r3 f2
	fload	f3 r0 6
	fmul	f3 f2 f3
	fstore	f2 r2 6
	fadd	f2 f0 f3
	call	min_caml_floor
	fload	f3 r0 5
	fmul	f2 f2 f3
	fload	f3 r0 10
	fload	r3 r2 6
	fsub	f2 r3 f2
	bne	f3 f2 L_else_5213
	addi	r3 r0 0
	jump	L_endif_5214
L_else_5213 : 
	addi	r3 r0 1
L_endif_5214 : 
	addi	r4 r0 1
	addi	r4 r0 0
	load	r5 r2 4
	bne	r5 r4 L_else_5207
	addi	r4 r0 0
	bne	r3 r4 L_else_5211
	fload	r3 r0 8
	jump	L_endif_5212
L_else_5211 : 
	fload	r3 r0 27
L_endif_5212 : 
	jump	L_endif_5208
L_else_5207 : 
	addi	r4 r0 0
	bne	r3 r4 L_else_5209
	fload	r3 r0 27
	jump	L_endif_5210
L_else_5209 : 
	fload	r3 r0 8
L_endif_5210 : 
L_endif_5208 : 
L_else_5197 : 
	addi	r3 r0 2
	bne	r4 r3 L_else_5198
	addi	r3 r0 1
	fload	f3 r0 7
	fmul	f2 f2 f3
	call	min_caml_sin
	call	L_fsqr_1980
	addi	r3 r0 0
	fload	f3 r0 8
	fmul	f3 f3 f2
	addi	r3 r0 1
	fload	f3 r0 8
	fload	f4 r0 26
	fsub	f2 f4 f2
	fmul	f2 f3 f2
L_else_5198 : 
	addi	r3 r0 3
	bne	r4 r3 L_else_5199
	addi	r3 r0 0
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 7
	call	L_o_param_x_2000
	fload	r3 r2 7
	fsub	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	fstore	f2 r2 8
	fstore	f3 r2 9
	call	L_o_param_z_2004
	fload	r3 r2 9
	fsub	f2 r3 f2
	fload	f3 r2 8
	fstore	f2 r2 10
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	f3 r2 10
	fstore	f2 r2 11
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 11
	fadd	f2 r3 f2
	call	min_caml_sqrt
	fload	f3 r0 10
	fdiv	f2 f2 f3
	fstore	f2 r2 12
	call	min_caml_floor
	fload	r3 r2 12
	fsub	f2 r3 f2
	fload	f3 r0 9
	fmul	f2 f2 f3
	call	min_caml_cos
	call	L_fsqr_1980
	addi	r3 r0 1
	fload	f3 r0 8
	fmul	f3 f2 f3
	addi	r3 r0 2
	fload	f3 r0 26
	fsub	f2 f3 f2
	fload	f3 r0 8
	fmul	f2 f2 f3
L_else_5199 : 
	addi	r3 r0 4
	bne	r4 r3 L_else_5200
	addi	r3 r0 0
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 13
	call	L_o_param_x_2000
	fload	r3 r2 13
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 14
	call	L_o_param_a_1994
	call	min_caml_sqrt
	fload	r3 r2 14
	fmul	f2 r3 f2
	addi	r3 r0 2
	load	r3 r2 0
	fstore	f2 r2 15
	store	r3 r2 0
	fstore	f3 r2 16
	call	L_o_param_z_2004
	fload	r3 r2 16
	fsub	f2 r3 f2
	load	r3 r2 0
	store	r3 r2 0
	fstore	f2 r2 17
	call	L_o_param_c_1998
	call	min_caml_sqrt
	fload	r3 r2 17
	fmul	f2 r3 f2
	fload	f3 r2 15
	fstore	f3 r2 15
	fstore	f2 r2 18
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	f3 r2 18
	fstore	f3 r2 18
	fstore	f2 r2 19
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 19
	fadd	f2 r3 f2
	call	min_caml_sqrt
	fload	f3 r0 16
	fload	f4 r2 15
	fstore	f2 r2 20
	fstore	f4 r2 15
	fstore	f3 r2 21
	fadd	f2 f0 f4
	call	min_caml_abs_float
	fload	f3 r2 21
	bne	f3 f2 L_else_5205
	fload	f2 r2 15
	fload	r3 r2 18
	fdiv	f2 r3 f2
	call	min_caml_abs_float
	call	min_caml_atan
	fload	f3 r0 14
	fmul	r3 f2 f3
	jump	L_endif_5206
L_else_5205 : 
	fload	r3 r0 15
L_endif_5206 : 
	fstore	f2 r2 22
	call	min_caml_floor
	fload	r3 r2 22
	fsub	f2 r3 f2
	addi	r4 r0 1
	load	r4 r2 0
	fstore	f2 r2 23
	store	r3 r2 22
	store	r4 r2 0
	fstore	f3 r2 24
	add	r3 r0 r4
	call	L_o_param_y_2002
	fload	r3 r2 24
	fsub	f2 r3 f2
	load	r3 r2 0
	fstore	f2 r2 25
	call	L_o_param_b_1996
	call	min_caml_sqrt
	fload	r3 r2 25
	fmul	f2 r3 f2
	fload	f3 r0 16
	fload	f4 r2 22
	fstore	f2 r2 26
	fstore	f3 r2 27
	fadd	f2 f0 f4
	call	min_caml_abs_float
	fload	f3 r2 27
	bne	f3 f2 L_else_5203
	fload	f2 r2 20
	fload	r3 r2 26
	fdiv	f2 r3 f2
	call	min_caml_abs_float
	call	min_caml_atan
	fload	f3 r0 14
	fmul	r3 f2 f3
	jump	L_endif_5204
L_else_5203 : 
	fload	r3 r0 15
L_endif_5204 : 
	fstore	f2 r2 28
	call	min_caml_floor
	fload	r3 r2 28
	fsub	f2 r3 f2
	fload	f3 r0 13
	fload	f4 r0 12
	fload	f5 r2 23
	fsub	f4 f4 f5
	fstore	f2 r2 29
	fstore	f3 r2 30
	fadd	f2 f0 f4
	call	L_fsqr_1980
	fload	r3 r2 30
	fsub	f2 r3 f2
	fload	f3 r0 12
	fload	f4 r2 29
	fsub	f3 f3 f4
	fstore	f2 r2 31
	fadd	f2 f0 f3
	call	L_fsqr_1980
	fload	r3 r2 31
	fsub	f2 r3 f2
	addi	r3 r0 2
	fload	f3 r0 27
	bne	f2 f3 L_else_5201
	fload	r3 r0 27
	jump	L_endif_5202
L_else_5201 : 
	fload	f3 r0 11
	fmul	r3 f2 f3
L_endif_5202 : 
L_else_5200 : 
	addi	r2 r2 32
	return
L_in_prod_2121 : 
	subi	r2 r2 0
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f2 f2 f3
	addi	r3 r0 1
	addi	r3 r0 1
	fmul	f3 f3 f4
	fadd	f2 f2 f3
	addi	r3 r0 2
	addi	r3 r0 2
	fmul	f3 f3 f4
	fadd	r3 f2 f3
	addi	r2 r2 0
	return
L_accumulate_vec_mul_2124 : 
	subi	r2 r2 0
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f4 f2 f4
	fadd	f3 f3 f4
	addi	r3 r0 1
	addi	r3 r0 1
	addi	r3 r0 1
	fmul	f4 f2 f4
	fadd	f3 f3 f4
	addi	r3 r0 2
	addi	r3 r0 2
	addi	r3 r0 2
	fmul	f2 f2 f4
	fadd	f2 f3 f2
	addi	r2 r2 0
	return
L_raytracing_2128 : 
	subi	r2 r2 11
	fstore	f2 r2 0
	store	r3 r2 1
	add	r3 r0 r4
	add	r4 r0 r5
	call	L_tracer_2102
	addi	r4 r0 0
	store	r3 r2 2
	bne	r3 r4 L_else_5228
	addi	r4 r0 0
	load	r5 r2 1
	store	r5 r2 1
	store	r3 r2 2
	bne	r5 r4 L_else_5230
	jump	L_endif_5231
L_else_5230 : 
	store	r5 r2 1
	store	r3 r2 2
	add	r3 r0 r4
	add	r4 r0 r6
	call	L_in_prod_2121
	fsub	f2 f0 f2
	fload	f3 r0 27
	bne	f2 f3 L_else_5232
	jump	L_endif_5233
L_else_5232 : 
	fstore	f2 r2 3
	call	L_fsqr_1980
	fload	f3 r2 3
	fmul	f2 f2 f3
	fload	f3 r2 0
	fmul	f2 f2 f3
	addi	r3 r0 0
	fmul	f2 f2 f4
	addi	r3 r0 0
	addi	r3 r0 0
	fadd	f4 f4 f2
	addi	r3 r0 1
	addi	r3 r0 1
	fadd	f4 f4 f2
	addi	r3 r0 2
	addi	r3 r0 2
	fadd	f2 f4 f2
L_endif_5233 : 
L_endif_5231 : 
	jump	L_endif_5229
L_else_5228 : 
L_endif_5229 : 
	addi	r3 r0 0
	load	r4 r2 2
	bne	r4 r3 L_else_5217
L_else_5217 : 
	addi	r3 r0 0
	store	r3 r2 4
	call	L_get_nvector_2115
	addi	r3 r0 0
	addi	r4 r0 0
	call	L_shadow_check_one_or_matrix_2089
	addi	r4 r0 0
	bne	r3 r4 L_else_5224
	call	L_in_prod_2121
	fsub	f2 f0 f2
	fload	f3 r0 27
	bne	f3 f2 L_else_5226
	fload	f3 r0 4
	fadd	r3 f2 f3
	jump	L_endif_5227
L_else_5226 : 
	fload	r3 r0 4
L_endif_5227 : 
	fload	f3 r2 0
	fmul	f2 f2 f3
	load	r3 r2 4
	fstore	f3 r2 0
	store	r3 r2 4
	fstore	f2 r2 5
	call	L_o_diffuse_2006
	fload	r3 r2 5
	fmul	r3 r3 f2
	jump	L_endif_5225
L_else_5224 : 
	fload	r3 r0 27
L_endif_5225 : 
	load	r3 r2 4
	store	r3 r2 4
	fstore	f2 r2 6
	call	L_utexture_2118
	fload	f2 r2 6
	fstore	f2 r2 6
	call	L_accumulate_vec_mul_2124
	addi	r3 r0 4
	load	r4 r2 1
	bne	r4 r3 L_else_5218
	fload	f2 r0 3
	fload	f3 r2 0
	bne	f3 f2 L_else_5219
L_else_5219 : 
	fload	f2 r0 2
	store	r4 r2 1
	fstore	f3 r2 0
	fstore	f2 r2 7
	add	r4 r0 r5
	call	L_in_prod_2121
	fload	r3 r2 7
	fmul	f2 r3 f2
	call	L_accumulate_vec_mul_2124
	load	r3 r2 4
	store	r3 r2 4
	call	L_o_reflectiontype_1988
	addi	r4 r0 1
	bne	r3 r4 L_else_5220
	fload	f2 r0 27
	load	r3 r2 4
	store	r3 r2 4
	fstore	f2 r2 8
	call	L_o_hilight_2008
	fload	f3 r2 8
	bne	f3 f2 L_else_5222
L_else_5222 : 
	call	L_in_prod_2121
	fsub	f2 f0 f2
	fload	f3 r0 27
	bne	f2 f3 L_else_5223
L_else_5223 : 
	call	L_fsqr_1980
	call	L_fsqr_1980
	fload	f3 r2 0
	fmul	f2 f2 f3
	fload	f3 r2 6
	fmul	f2 f2 f3
	load	r3 r2 4
	fstore	f2 r2 9
	call	L_o_hilight_2008
	fload	r3 r2 9
	fmul	f2 r3 f2
	addi	r3 r0 0
	addi	r3 r0 0
	fadd	f3 f3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	fadd	f3 f3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	fadd	f2 f3 f2
L_else_5220 : 
	addi	r4 r0 2
	bne	r3 r4 L_else_5221
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 1
	addi	r3 r0 1
	addi	r3 r0 2
	addi	r3 r0 2
	fload	f2 r0 26
	load	r3 r2 4
	fstore	f2 r2 10
	call	L_o_diffuse_2006
	fload	r3 r2 10
	fsub	f2 r3 f2
	fload	r3 r2 0
	fmul	f2 r3 f2
	addi	r3 r0 1
	load	r4 r2 1
	add	r3 r4 r3
	jump	L_raytracing_2128
L_else_5221 : 
L_else_5218 : 
	addi	r2 r2 11
	return
L_write_rgb_2131 : 
	subi	r2 r2 0
	addi	r3 r0 0
	call	min_caml_int_of_float
	addi	r4 r0 255
	bne	r3 r4 L_else_5238
	add	r3 r0 r3
	jump	L_endif_5239
L_else_5238 : 
	addi	r3 r0 255
L_endif_5239 : 
	call	min_caml_print_byte
	addi	r3 r0 1
	call	min_caml_int_of_float
	addi	r4 r0 255
	bne	r3 r4 L_else_5236
	add	r3 r0 r3
	jump	L_endif_5237
L_else_5236 : 
	addi	r3 r0 255
L_endif_5237 : 
	call	min_caml_print_byte
	addi	r3 r0 2
	call	min_caml_int_of_float
	addi	r4 r0 255
	bne	r3 r4 L_else_5234
	add	r3 r0 r3
	jump	L_endif_5235
L_else_5234 : 
	addi	r3 r0 255
L_endif_5235 : 
	jump	min_caml_print_byte
	addi	r2 r2 0
	return
L_write_ppm_header_2133 : 
	subi	r2 r2 0
	addi	r3 r0 80
	call	min_caml_print_byte
	addi	r3 r0 54
	call	min_caml_print_byte
	addi	r3 r0 10
	call	min_caml_print_byte
	addi	r3 r0 0
	call	min_caml_print_int
	addi	r3 r0 32
	call	min_caml_print_byte
	addi	r3 r0 1
	call	min_caml_print_int
	addi	r3 r0 10
	call	min_caml_print_byte
	addi	r3 r0 255
	call	min_caml_print_int
	addi	r3 r0 10
	jump	min_caml_print_byte
	addi	r2 r2 0
	return
L_scan_point_2135 : 
	subi	r2 r2 1
	addi	r4 r0 0
	bne	r4 r3 L_else_5240
L_else_5240 : 
	store	r3 r2 0
	call	min_caml_float_of_int
	addi	r3 r0 0
	fsub	f2 f2 f3
	addi	r3 r0 0
	fmul	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f3 f2 f3
	addi	r3 r0 0
	fadd	f3 f3 f4
	addi	r3 r0 1
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f3 f3 f4
	addi	r3 r0 1
	fsub	f3 f3 f4
	addi	r3 r0 2
	fsub	f3 f0 f2
	addi	r3 r0 1
	fmul	f3 f3 f4
	addi	r3 r0 2
	fadd	f3 f3 f4
	call	L_fsqr_1980
	addi	r3 r0 0
	fadd	f2 f2 f3
	call	min_caml_sqrt
	addi	r3 r0 0
	addi	r3 r0 0
	fdiv	f3 f3 f2
	addi	r3 r0 1
	addi	r3 r0 1
	fdiv	f3 f3 f2
	addi	r3 r0 2
	addi	r3 r0 2
	fdiv	f2 f3 f2
	addi	r3 r0 0
	addi	r3 r0 0
	addi	r3 r0 1
	addi	r3 r0 1
	addi	r3 r0 2
	addi	r3 r0 2
	addi	r3 r0 0
	fload	f2 r0 27
	addi	r3 r0 1
	fload	f2 r0 27
	addi	r3 r0 2
	fload	f2 r0 27
	addi	r3 r0 0
	fload	f2 r0 26
	call	L_raytracing_2128
	call	L_write_rgb_2131
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	jump	L_scan_point_2135
	addi	r2 r2 1
	return
L_scan_line_2137 : 
	subi	r2 r2 2
	addi	r4 r0 0
	bne	r4 r3 L_else_5241
L_else_5241 : 
	addi	r4 r0 0
	addi	r4 r0 0
	fload	f3 r0 26
	fsub	f2 f2 f3
	store	r3 r2 0
	fstore	f2 r2 1
	call	min_caml_float_of_int
	fload	r3 r2 1
	fsub	f2 r3 f2
	addi	r3 r0 0
	fmul	f2 f3 f2
	addi	r3 r0 0
	addi	r3 r0 0
	call	L_fsqr_1980
	fload	f3 r0 1
	fadd	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 0
	fmul	f2 f2 f3
	addi	r3 r0 0
	addi	r3 r0 1
	fmul	f3 f2 f3
	addi	r3 r0 0
	fsub	f3 f3 f4
	addi	r3 r0 2
	addi	r3 r0 1
	fmul	f2 f2 f3
	addi	r3 r0 2
	fsub	f2 f2 f3
	addi	r3 r0 0
	call	L_scan_point_2135
	addi	r3 r0 1
	load	r4 r2 0
	add	r3 r4 r3
	jump	L_scan_line_2137
	addi	r2 r2 2
	return
L_scan_start_2139 : 
	subi	r2 r2 0
	call	L_write_ppm_header_2133
	addi	r3 r0 0
	call	min_caml_float_of_int
	addi	r3 r0 0
	fload	f3 r0 0
	fdiv	f3 f3 f2
	addi	r3 r0 0
	fload	f3 r0 28
	fdiv	f2 f2 f3
	addi	r3 r0 0
	jump	L_scan_line_2137
	addi	r2 r2 0
	return
L_rt_2141 : 
	subi	r2 r2 0
	addi	r3 r0 0
	addi	r3 r0 1
	addi	r3 r0 0
	call	L_read_parameter_2043
	jump	L_scan_start_2139
	addi	r2 r2 0
	return
L_end_5051 : 
	add	r3 r0 r3
	jump	L_end_5051

29
43000000
471C4000
C0000000
3DCCCCCD
3E4CCCCD
41A00000
3D4CCCCD
3E800000
437F0000
40490FDB
41200000
44548000
3F000000
3E19999A
4118C9EB
41700000
38D1B717
4CBEBC20
4E6E6B28
BDCCCCCD
3C23D70A
BE4CCCCD
40800000
C3480000
3C8EFA35
BF800000
3F800000
00000000
40000000

00000000
00000000
24400FFF
24600300
24800300
24A00000
D0000997
C000099F
28420000
24A00000
84650002
04602000
24600000
84830002
24600001
24600000
24420000
E0000000
28420000
48621000
24420000
E0000000
28420000
6860001C
54621800
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420000
24420000
E0000000
28420003
24600000
64820000
D0000012
24600001
6C420001
40401800
D0000012
68620001
40431000
24600002
6C420002
40401800
D0000012
68620002
40431000
24600000
60820000
84830003
40601000
C000006A
44601000
24600000
24600000
54631000
24600001
24600001
54631000
24600002
24600002
54431000
24420003
E0000000
28420000
6860001B
84430002
68600019
6860001A
24420000
E0000000
28420000
68600018
48621800
24420000
E0000000
28420005
24600000
24600001
24600002
D000007C
24600000
6C420000
24600000
68420000
D000007C
24600001
6C420001
24600001
68420001
D000007C
6C420002
24600001
44401000
D000007C
68620002
6C420003
40401800
68620003
6C620003
6C420004
40401800
24600000
68620004
48431000
68420003
64620004
24600002
68620004
48431000
24600000
24600000
24600000
24600001
48421800
68600017
48421800
24600001
24600000
44401000
68600017
48421800
24600002
24600000
24600001
48421800
68600017
48421800
24600000
24600000
24600000
40421800
24600001
24600001
24600001
40421800
24600002
24600002
24600002
40421800
24420005
E0000000
28420014
2480FFFF
84640002
24600000
64620000
24800003
6840001B
64620001
04602000
24800000
64620002
24600001
24600002
24600003
6840001B
24600000
24600001
24600002
6840001B
6C420003
68620003
84620003
24600000
C00000DC
24600001
24800002
6840001B
64620004
04602000
24600000
24600001
24600003
6840001B
24600000
24600001
24600002
24600003
6840001B
24600000
60820001
64820001
84830002
C00000F5
24600000
64820001
D000007C
24600001
D000007C
24600002
D000007C
24600002
60820000
84830003
24600001
C00000FC
60620004
04601800
24600003
8483002C
24600000
24600000
6860001B
84620003
6860001B
C000010C
6C420005
D0000075
68620005
6C420006
40401800
D0000012
68620006
54631000
24600001
24600001
6860001B
84620003
6860001B
C000011A
6C420007
D0000075
68620007
6C420008
40401800
D0000012
68620008
54631000
24600002
24600002
6860001B
84620003
6860001B
C0000128
6C420009
D0000075
68620009
6C42000A
40401800
D0000012
6862000A
54631000
C0000134
24600002
8483000A
24600000
60820004
84830003
24600001
C0000131
24600000
60620002
D0000054
C0000134
24600000
60820001
84830002
C0000202
2460000A
24600000
2460000B
24600000
2460000C
24600001
2460000D
24600001
2460000E
24600002
2460000F
24600002
24600000
2460000C
2460000E
48421800
24600001
2460000B
2460000D
48421800
2460000E
48421800
2460000A
2460000F
48632000
44421800
24600002
2460000A
2460000D
48421800
2460000E
48421800
2460000B
2460000F
48632000
40421800
24600003
2460000C
2460000F
48421800
24600004
2460000B
2460000D
48421800
2460000F
48421800
2460000A
2460000E
48632000
40421800
24600005
2460000A
2460000D
48421800
2460000F
48421800
2460000B
2460000E
48632000
44421800
24600006
2460000D
44401000
24600007
2460000B
2460000C
48421800
24600008
2460000A
2460000C
48421800
24600000
24600001
24600002
24600000
24600000
6C82000B
6C62000C
6C42000D
40402800
D0000012
6862000D
48431000
24800003
6462000D
6C42000E
40401800
D0000012
6862000C
48431000
6882000E
40441000
24800006
6462000C
6C42000F
40401800
D0000012
6862000B
48431000
6882000F
40441000
24800001
24800001
6462000B
D0000012
6862000D
48431000
24800004
6462000D
6C420010
40401800
D0000012
6862000C
48431000
68820010
40441000
24800007
6462000C
6C420011
40401800
D0000012
6862000B
48431000
68820011
40441000
24800002
24800002
6462000B
D0000012
6862000D
48431000
24800005
6462000D
6C420012
40401800
D0000012
6862000C
48431000
68820012
40441000
24800008
6462000C
6C420013
40401800
D0000012
6862000B
48431000
68820013
40441000
24800000
6840001C
24800001
6882000D
48641800
24A00002
48632000
24A00004
68A2000C
48852000
24C00005
48842800
40632000
24C00007
48832000
24C00008
48842800
40632000
48421800
24C00001
6840001C
24C00000
48641800
24C00002
48632000
24C00003
48852000
24C00005
48842800
40632000
24C00006
48832000
24C00008
48842800
40632000
48421800
24C00002
6840001C
24C00000
48641800
24800001
48632000
24800003
48852000
24800004
48842800
40632000
24800006
48832000
24600007
48842800
40632000
48421800
24600001
24420014
E0000000
28420001
2480003D
84830001
64620000
D00000C3
24800000
84640001
24600001
60820000
04641800
C0000205
24420001
E0000000
28420000
24600000
C0000205
24420000
E0000000
28420001
64620000
2480FFFF
84640006
24600001
60820000
04641800
2480FFFF
24600001
60820000
04641800
D0000217
04601800
24420001
E0000000
28420001
24800000
64620000
04602000
D0000217
24600000
24A0FFFF
84650005
24600001
60A20000
04651800
24600001
60820000
04641800
D0000227
04601800
24420001
E0000000
28420001
24800000
64620000
04602000
D0000217
24600000
2480FFFF
84640001
24600001
60820000
04641800
C000023A
24420001
E0000000
28420000
D0000081
D0000212
24600000
D000023A
24600000
24600000
D0000227
24420000
E0000000
2842000A
6840001B
24800000
64620000
84430003
24600000
C0000290
64620000
D0000024
6840001B
24800000
84430003
24600000
C0000261
24600001
D0000008
24800000
84640006
60620000
64620000
D000002A
44601000
C000026C
60620000
64620000
D000002A
24600000
44421800
24600000
54421800
60620000
64620000
6C420001
D000002D
24600001
68620001
48631800
24800001
40632000
64620001
6C420002
40401800
68620002
84620003
24600000
C0000290
60620000
64620000
D0000030
24600002
68620001
48631800
24600002
40632000
6C420003
40401800
68620003
84620003
24600000
C0000290
24600000
24600001
24800000
84640081
6840001B
24600001
84430003
24600000
C00002CF
60620000
64620000
D0000024
6840001B
24800001
84430003
24600000
C00002A0
24600001
D0000008
24800000
84640006
60620000
64620000
D000002D
44601000
C00002AB
60620000
64620000
D000002D
24600001
44421800
24600001
54421800
60620000
64620000
6C420004
D0000030
24600002
68620004
48631800
24800002
40632000
64620004
6C420005
40401800
68620005
84620003
24600000
C00002CF
60620000
64620000
D000002A
24600000
68620004
48631800
24600000
40632000
6C420006
40401800
68620006
84620003
24600000
C00002CF
24600000
24600001
24800000
84640041
6840001B
24600002
84430003
24600000
C000030D
60620000
64620000
D0000024
6840001B
24800002
84430003
24600000
C00002DF
24600001
D0000008
24800000
84640006
60620000
64620000
D0000030
44601000
C00002EA
60620000
64620000
D0000030
24600002
44421800
24600002
54421800
60620000
64620000
6C420007
D000002A
24600000
68620007
48631800
24800000
40632000
64620007
6C420008
40401800
68620008
84620003
24600000
C000030D
60620000
D000002D
24600001
68620007
48631800
24600001
40632000
6C420009
40401800
68620009
84620003
24600000
C000030D
24600000
24600001
24800000
84640002
24600000
24600003
24600002
24600001
2442000A
E0000000
2842000C
24800000
64620000
6C420001
D000002A
68620001
48431000
24600001
60620000
64620000
6C420002
6C620003
D000002D
68620003
48431000
68620002
40431000
24600002
60620000
64620000
6C420004
6C620005
D0000030
68620005
48431000
68620004
40431000
6860001B
84430002
24600000
24600000
60620000
6C420006
64620000
6C620007
D000002A
68620007
48431000
24600001
60620000
64620000
6C420008
6C620009
D000002D
68620009
48431000
68620008
40431000
24600002
60620000
6C42000A
6C62000B
D0000030
6862000B
48431000
6862000A
40431000
68620006
54421800
24600000
44401000
24600001
2442000C
E0000000
28420006
24800000
64620000
D0000012
60620000
64620000
6C420001
D000002A
68620001
48431000
24600001
6C420002
40401800
D0000012
60620000
64620000
6C420003
D000002D
68620003
48431000
68620002
40431000
24600002
6C420004
40401800
D0000012
60620000
6C420005
D0000030
68620005
48431000
68620004
40631000
24420006
E0000000
28420006
24800001
24800002
48421800
64620000
6C420001
D000004B
68620001
48431000
24600000
24600002
48632000
60620000
64620000
6C420002
6C620003
D000004E
68620003
48431000
68620002
40431000
24600000
24600001
48632000
60620000
6C420004
6C620005
D0000051
68620005
48431000
68620004
40631000
24420006
E0000000
28420006
24800000
24800000
48421800
64620000
6C420001
D000002A
68620001
48431000
24600001
24600001
48632000
60620000
64620000
6C420002
6C620003
D000002D
68620003
48431000
68620002
40431000
24600002
24600002
48632000
60620000
6C420004
6C620005
D0000030
68620005
48431000
68620004
40631000
24420006
E0000000
28420006
24800002
24800001
48421800
24800001
24800002
48632000
40421800
64620000
6C420001
D000004B
68620001
48431000
24600000
24600002
48632000
24600002
24600000
48842800
40632000
60620000
64620000
6C420002
6C620003
D000004E
68620003
48431000
68620002
40431000
24600000
24600001
48632000
24600001
24600000
48842800
40632000
60620000
6C420004
6C620005
D0000051
68620005
48431000
68620004
40631000
24420006
E0000000
2842000B
64820000
64620001
D0000355
60620001
64620001
6C420002
D0000027
24800000
84640004
68420002
40601000
C00003FE
60620001
60820000
64820000
64620001
D0000378
68620002
40631000
6860001B
84620002
24600000
6860001C
60620001
60820000
6C420003
64820000
64620001
6C620004
D000039A
68620004
48431000
60620001
64620001
6C420005
D0000027
24800000
84640004
68420005
40601000
C000041A
60620001
60820000
64620001
D00003BC
68620005
40631000
60620001
6C420006
64620001
D0000355
60620001
64620001
6C420007
D0000027
24800000
84640004
68420007
40601000
C000042C
60620001
64620001
D0000378
68620007
40631000
60620001
64620001
6C420008
D000001E
24800003
84640005
6840001A
68620008
44631000
C0000438
68420008
40601000
68600016
68820003
48632000
48431000
68620006
6C820003
6C620006
6C420009
40401800
D0000012
68620009
44421800
6860001B
84430002
24600000
60620001
6C42000A
D0000024
24800000
84640004
6842000A
44601000
C0000451
6842000A
40601000
24600000
68620006
44421800
6860001C
54421800
68620003
54421800
24600001
2442000B
E0000000
28420005
24A00000
24A00000
64820000
64620001
6C420002
D0000033
68620002
44431000
24600001
24600001
60620001
64620001
6C420003
D0000036
68620003
44431000
24600002
24600002
60620001
64620001
6C420004
D0000039
68620004
44431000
60620001
64620001
D000001E
24800001
84640004
60620001
60820000
C0000252
24800002
84640004
60620001
60820000
C0000315
60620001
60820000
C00003EA
24420005
E0000000
28420004
64620000
D000002A
24600000
6C420001
40401800
68620001
84620003
24600000
C00004A5
60620000
64620000
D000002D
24600001
6C420002
40401800
68620002
84620003
24600000
C00004A5
60620000
64620000
D0000030
24600002
6C420003
40401800
68620003
84620003
24600000
C00004A5
24600001
24800000
84640007
60620000
D0000024
24800000
84640002
24600001
24600000
60620000
C0000024
24420004
E0000000
28420004
64620000
D000002A
24600000
48421800
60620000
64620000
6C420001
D000002D
24600001
48421800
68620001
40431000
60620000
64620000
6C420002
D0000030
24600002
48421800
68620002
40431000
6860001B
84620003
24600000
C00004CB
24600001
60820000
64620003
04602000
D0000024
60820003
D0000008
24800000
84640002
24600001
24600000
24420004
E0000000
28420004
64620000
D0000355
60620000
64620000
6C420001
D000001E
24800003
84640005
6840001A
68620001
44631000
C00004E6
68420001
40601000
60620000
64620000
6C420002
D0000027
24800000
84640004
68420002
40601000
C00004F4
60620000
64620000
D0000378
68620002
40631000
6860001B
84620003
24600000
C00004F9
24600001
60820000
64620003
04602000
D0000024
60820003
D0000008
24800000
84640002
24600001
24600000
24420004
E0000000
28420004
24800000
24800000
64620000
6C420001
D0000033
68620001
44431000
24600001
24600001
60620000
64620000
6C420002
D0000036
68620002
44431000
24600002
24600002
60620000
64620000
6C420003
D0000039
68620003
44431000
60620000
64620000
D000001E
24800001
84640003
60620000
C0000486
24800002
84640003
60620000
C00004B1
60620000
C00004D7
24420004
E0000000
28420002
24C0FFFF
84A60002
24600001
64820000
64620001
04602800
D0000505
24800000
84640006
24600001
60820001
04641800
60820000
C000052C
24600000
24420002
E0000000
28420003
24E0FFFF
84C70002
24600000
64A20000
64820001
64620002
04803800
04603000
D000045B
24800000
24800000
84640003
24600000
C0000552
68600015
84620003
24600000
C0000552
24600001
24800000
8464000B
D0000024
24800000
84640002
24600000
24600001
60820002
04641800
60820001
60A20000
C000053E
68600014
40421800
24600000
24600000
48631000
24600000
40632000
24600001
24600001
48631000
24600001
40632000
24600002
24600002
48431000
24600002
40421800
24600000
60820001
64820001
D000052C
24800000
84640007
24600001
60820002
04641800
60820001
60A20000
C000053E
24600001
24420003
E0000000
28420003
24E0FFFF
84C70002
24600000
24E00000
64A20000
64820001
64620002
04803000
04603800
D000053E
24800000
84640007
24600001
60820002
04641800
60820001
60A20000
C000057E
24600001
24420003
E0000000
28420004
24E00000
2500FFFF
84E80002
24600000
25000063
84E80011
24E00001
64A20000
64820001
64620002
04803000
04603800
D000057E
24800000
84640007
24600001
60820002
04641800
60820001
60A20000
C0000594
24600001
64C20003
64A20000
64820001
64620002
04804000
04603800
D000045B
24800000
84640007
24600001
60820002
04641800
60820001
60A20000
C0000594
68400013
24600000
84430007
24600001
60820002
04641800
60820001
60A20000
C0000594
24600001
60820003
60A20000
64A20000
D000057E
24800000
84640007
24600001
60820002
04641800
60820001
60A20000
C0000594
24600001
24420004
E0000000
28420002
24C0FFFF
84A60001
64620000
64820001
04803000
04602800
04A03800
D000045B
24800000
84640008
D0000024
24800000
84640004
24600000
24600001
C00005E4
C000060D
24600000
68600013
84430002
C000060D
24600000
84620002
C000060D
68600014
40421800
24600000
24600000
48631000
24600000
40632000
24600001
24600001
48631000
24600001
40632000
24600002
24600002
48431000
24600002
40421800
24600000
60820001
64820001
D000052C
24800000
84640002
C000060D
24600000
24600000
24600000
24600001
24600001
24600002
24600002
24600000
24600000
24600000
24800000
84640006
24600001
60820000
04641800
60820001
C00005D3
24420002
E0000000
28420002
24C0FFFF
84A60001
24C00000
24C00000
24C00000
64820000
64620001
04802800
04603000
D00005D3
24600001
60820001
04641800
60820000
C0000617
24420002
E0000000
28420003
24C00000
24E0FFFF
84C70001
24E00063
64820000
64620001
84C70008
24C00001
64820000
64620001
04802800
04603000
D0000617
C0000649
64820000
64620001
64A20002
04A04000
04803800
04603000
D000045B
24800000
84640002
C0000649
24600000
24600000
84620002
C0000649
24600001
60820002
D0000617
24600001
60820001
04641800
60820000
C0000629
24420003
E0000000
28420000
24600000
68400012
24600000
24800000
D0000629
24600000
68600013
84430002
24600000
68600011
84620002
24600000
24600001
24420000
E0000000
28420000
24600000
24800001
84640009
24600000
24600000
D0000075
44401000
24600001
6840001B
24600002
6840001B
24800002
84640009
24600000
6840001B
24600001
24600001
D0000075
44401000
24600002
6840001B
24800003
84640009
24600000
6840001B
24600001
6840001B
24600002
24600002
D0000075
44401000
24420000
E0000000
28420001
24800000
64620000
D000002A
44401000
24600001
60620000
64620000
D000002D
44401000
24600002
60620000
D0000030
44401000
24420001
E0000000
28420008
24800000
24800000
64620000
6C420001
D0000033
68620001
44431000
60620000
64620000
6C420002
D000002A
68620002
48431000
24600001
24600001
60620000
64620000
6C420003
D0000036
68620003
44431000
60620000
64620000
6C420004
D000002D
68620004
48431000
24600002
24600002
60620000
64620000
6C420005
D0000039
68620005
44431000
60620000
64620000
6C420006
D0000030
68620006
48431000
60820000
64620007
04602000
D0000024
60620007
C0000054
24420008
E0000000
28420014
24800000
24800000
64620000
6C420001
D0000033
68620001
44431000
24600001
24600001
60620000
64620000
6C420002
D0000036
68620002
44431000
24600002
24600002
60620000
64620000
6C420003
D0000039
68620003
44431000
24600000
24600000
60620000
64620000
6C420004
D000002A
68620004
48431000
24600001
60620000
6C420005
64620000
6C620006
D0000051
68620006
48431000
24600002
60620000
64620000
6C420007
6C620008
D000004E
68620008
48431000
68620007
40431000
D0000016
68620005
40431000
24600001
24600001
60620000
64620000
6C420009
D000002D
68620009
48431000
24600000
60620000
6C42000A
64620000
6C62000B
D0000051
6862000B
48431000
24600002
60620000
64620000
6C42000C
6C62000D
D000004B
6862000D
48431000
6862000C
40431000
D0000016
6862000A
40431000
24600002
24600002
60620000
64620000
6C42000E
D0000030
6862000E
48431000
24600000
60620000
6C42000F
64620000
6C620010
D000004E
68620010
48431000
24600001
60620000
64620000
6C420011
6C620012
D000004B
68620012
48431000
68620011
40431000
D0000016
6862000F
40431000
60820000
64620013
04602000
D0000024
60620013
C0000054
24420014
E0000000
28420002
64820000
64620001
D000001E
24800001
84640002
C0000660
24800002
84640003
60620001
C0000682
60620001
64620001
D0000027
24800000
84640004
60620001
60820000
C0000692
60620001
60820000
C00006C4
24420002
E0000000
28420020
64620000
D000001B
24800000
60820000
64620001
64820000
04602000
D0000042
24600001
60620000
64620000
D0000045
24600002
60620000
64620000
D0000048
24600001
60820001
84830039
24600000
60620000
64620000
6C420002
D0000033
68620002
44431000
68600006
48621800
6C420003
40401800
68600005
48421800
6860000A
68620003
44431000
84620003
24600000
C000077B
24600001
24800002
60820000
64620004
6C420005
04602000
D0000039
68620005
44431000
68600006
48621800
6C420006
40401800
68600005
48421800
6860000A
68620006
44431000
84620003
24600000
C0000790
24600001
24800001
24800000
60A20004
84A40007
24800000
84640003
68600008
C0000799
6860001B
C000079F
24800000
84640003
6860001B
C000079F
68600008
24600002
8483000D
24600001
68600007
48421800
D0000012
24600000
68600008
48631000
24600001
68600008
6880001A
44441000
48431000
24600003
84830029
24600000
60620000
64620000
6C420007
D0000033
68620007
44431000
24600002
60620000
6C420008
6C620009
D0000039
68620009
44431000
68620008
6C42000A
40401800
D0000012
6862000A
6C42000B
40401800
D0000012
6862000B
40431000
6860000A
54421800
6C42000C
6862000C
44431000
68600009
48421800
D0000012
24600001
68600008
48621800
24600002
6860001A
44431000
68600008
48421800
24600004
84830073
24600000
60620000
64620000
6C42000D
D0000033
6862000D
44431000
60620000
64620000
6C42000E
D000002A
6862000E
48431000
24600002
60620000
6C42000F
64620000
6C620010
D0000039
68620010
44431000
60620000
64620000
6C420011
D0000030
68620011
48431000
6862000F
6C62000F
6C420012
40401800
D0000012
68620012
6C620012
6C420013
40401800
D0000012
68620013
40431000
68600010
6882000F
6C420014
6C82000F
6C620015
40402000
68620015
84620007
6842000F
68620012
54431000
6860000E
48621800
C000080F
6860000F
6C420016
68620016
44431000
24800001
60820000
6C420017
64620016
64820000
6C620018
04602000
D0000036
68620018
44431000
60620000
6C420019
D000002D
68620019
48431000
68600010
68820016
6C42001A
6C62001B
40402000
6862001B
84620007
68420014
6862001A
54431000
6860000E
48621800
C000082F
6860000F
6C42001C
6862001C
44431000
6860000D
6880000C
68A20017
44842800
6C42001D
6C62001E
40402000
D0000012
6862001E
44431000
6860000C
6882001D
44632000
6C42001F
40401800
D0000012
6862001F
44431000
24600002
6860001B
84430003
6860001B
C000084B
6860000B
48621800
24420020
E0000000
28420000
24600000
24600000
48421800
24600001
24600001
48632000
40421800
24600002
24600002
48632000
40621800
24420000
E0000000
28420000
24600000
24600000
24600000
48822000
40632000
24600001
24600001
24600001
48822000
40632000
24600002
24600002
24600002
48422000
40431000
24420000
E0000000
2842000B
6C420000
64620001
04602000
04802800
D0000650
24800000
64620002
84640022
24800000
60A20001
64A20001
64620002
84A40002
C0000896
64A20001
64620002
04602000
04803000
D000084D
44401000
6860001B
84430002
C0000896
6C420003
D0000012
68620003
48421800
68620000
48421800
24600000
48422000
24600000
24600000
40841000
24600001
24600001
40841000
24600002
24600002
40441000
C0000897
24600000
60820002
84830001
24600000
64620004
D000073B
24600000
24800000
D0000594
24800000
84640013
D000084D
44401000
6860001B
84620004
68600004
40621800
C00008AA
68600004
68620000
48421800
60620004
6C620000
64620004
6C420005
D000003C
68620005
48631000
C00008B5
6860001B
60620004
64620004
6C420006
D0000753
68420006
6C420006
D000085B
24600004
60820001
84830045
68400003
68620000
84620001
68400002
64820001
6C620000
6C420007
04802800
D000084D
68620007
48431000
D000085B
60620004
64620004
D0000021
24800001
84640020
6840001B
60620004
64620004
6C420008
D000003F
68620008
84620001
D000084D
44401000
6860001B
84430001
D0000012
D0000012
68620000
48421800
68620006
48421800
60620004
6C420009
D000003F
68620009
48431000
24600000
24600000
40631000
24600001
24600001
40631000
24600002
24600002
40431000
24800002
84640013
24600000
24600000
24600001
24600001
24600002
24600002
6840001A
60620004
6C42000A
D000003C
6862000A
44431000
68620000
48431000
24600001
60820001
04641800
C000086D
2442000B
E0000000
28420000
24600000
248000FF
84640003
04601800
C000090C
246000FF
24600001
248000FF
84640003
04601800
C0000912
246000FF
24600002
248000FF
84640003
04601800
C0000918
246000FF
24420000
E0000000
28420000
24600050
24600036
2460000A
24600000
24600020
24600001
2460000A
246000FF
2460000A
24420000
E0000000
28420001
24800000
84830001
64620000
24600000
44421800
24600000
48421800
24600000
24600001
48621800
24600000
40632000
24600001
24600000
24600000
48632000
24600001
44632000
24600002
44601000
24600001
48632000
24600002
40632000
D0000012
24600000
40421800
24600000
24600000
54631000
24600001
24600001
54631000
24600002
24600002
54431000
24600000
24600000
24600001
24600001
24600002
24600002
24600000
6840001B
24600001
6840001B
24600002
6840001B
24600000
6840001A
D000086D
D0000905
24600001
60820000
04641800
C0000928
24420001
E0000000
28420002
24800000
84830001
24800000
24800000
6860001A
44421800
64620000
6C420001
68620001
44431000
24600000
48431000
24600000
24600000
D0000012
68600001
40421800
24600000
24600000
48421800
24600000
24600001
48621800
24600000
44632000
24600002
24600001
48421800
24600002
44421800
24600000
D0000928
24600001
60820000
04641800
C0000963
24420002
E0000000
28420000
D000091B
24600000
24600000
68600000
54631000
24600000
6860001C
54421800
24600000
C0000963
24420000
E0000000
28420000
24600000
24600001
24600000
D0000248
C000098A
24420000
E0000000
04601800
C000099F
00000000
00000000
00000000
00000000
FFFFFFFF
