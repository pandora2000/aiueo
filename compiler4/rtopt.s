l.6965:	! 128.000000
	.long	0x0
	.long	0x40600000
l.6916:	! 0.900000
	.long	0xcccccccd
	.long	0x3feccccc
l.6914:	! 0.200000
	.long	0x9999999a
	.long	0x3fc99999
l.6803:	! 150.000000
	.long	0x0
	.long	0x4062c000
l.6800:	! -150.000000
	.long	0x0
	.long	0xc062c000
l.6781:	! 0.100000
	.long	0x9999999a
	.long	0x3fb99999
l.6777:	! -2.000000
	.long	0x0
	.long	0xc0000000
l.6774:	! 0.003906
	.long	0x0
	.long	0x3f700000
l.6742:	! 20.000000
	.long	0x0
	.long	0x40340000
l.6740:	! 0.050000
	.long	0x9999999a
	.long	0x3fa99999
l.6732:	! 0.250000
	.long	0x0
	.long	0x3fd00000
l.6723:	! 10.000000
	.long	0x0
	.long	0x40240000
l.6718:	! 0.300000
	.long	0x33333333
	.long	0x3fd33333
l.6716:	! 255.000000
	.long	0x0
	.long	0x406fe000
l.6712:	! 0.500000
	.long	0x0
	.long	0x3fe00000
l.6710:	! 0.150000
	.long	0x33333333
	.long	0x3fc33333
l.6703:	! 3.141593
	.long	0x5a7ed197
	.long	0x400921fb
l.6701:	! 30.000000
	.long	0x0
	.long	0x403e0000
l.6699:	! 15.000000
	.long	0x0
	.long	0x402e0000
l.6697:	! 0.000100
	.long	0xeb1c432d
	.long	0x3f1a36e2
l.6648:	! 100000000.000000
	.long	0x0
	.long	0x4197d784
l.6642:	! 1000000000.000000
	.long	0x0
	.long	0x41cdcd65
l.6619:	! -0.100000
	.long	0x9999999a
	.long	0xbfb99999
l.6605:	! 0.010000
	.long	0x47ae147b
	.long	0x3f847ae1
l.6603:	! -0.200000
	.long	0x9999999a
	.long	0xbfc99999
l.6384:	! 2.000000
	.long	0x0
	.long	0x40000000
l.6347:	! -200.000000
	.long	0x0
	.long	0xc0690000
l.6344:	! 200.000000
	.long	0x0
	.long	0x40690000
l.6339:	! 0.017453
	.long	0xaa91ed06
	.long	0x3f91df46
l.6251:	! -1.000000
	.long	0x0
	.long	0xbff00000
l.6249:	! 1.000000
	.long	0x0
	.long	0x3ff00000
l.6247:	! 0.000000
	.long	0x0
	.long	0x0
.section	".text"
xor.2578:
	cmp	%i2, 0
	bne	be_else.8314
	nop
	mov	%i3, %i2
	retl
	nop
be_else.8314:
	cmp	%i3, 0
	bne	be_else.8315
	nop
	set	1, %i2
	retl
	nop
be_else.8315:
	set	0, %i2
	retl
	nop
sgn.2581:
	std	%f0, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_fiszero
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8316
	nop
	ldd	%i0, 0, %f0
	st	%o7, %i0, 12
	call	min_caml_fispos
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8317
	nop
	set	l.6251, %i2
	ldd	%i2, 0, %f0
	retl
	nop
be_else.8317:
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	retl
	nop
be_else.8316:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	retl
	nop
fneg_cond.2583:
	cmp	%i2, 0
	bne	be_else.8318
	nop
	b	min_caml_fneg
	nop
be_else.8318:
	retl
	nop
add_mod5.2586:
	add	%i2, %i3, %i2
	cmp	%i2, 5
	bl	bge_else.8319
	nop
	sub	%i2, 5, %i2
	retl
	nop
bge_else.8319:
	retl
	nop
vecset.2589:
	std	%f0, %i2, 0
	std	%f2, %i2, 8
	std	%f4, %i2, 16
	retl
	nop
vecfill.2594:
	std	%f0, %i2, 0
	std	%f0, %i2, 8
	std	%f0, %i2, 16
	retl
	nop
vecbzero.2597:
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	b	vecfill.2594
	nop
veccpy.2599:
	ldd	%i3, 0, %f0
	std	%f0, %i2, 0
	ldd	%i3, 8, %f0
	std	%f0, %i2, 8
	ldd	%i3, 16, %f0
	std	%f0, %i2, 16
	retl
	nop
vecunit_sgn.2607:
	ldd	%i2, 0, %f0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_fsqr
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	std	%f0, %i0, 8
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 20
	call	min_caml_fsqr
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f2
	std	%f0, %i0, 16
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 28
	call	min_caml_fsqr
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 28
	call	min_caml_sqrt
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	std	%f0, %i0, 24
	st	%o7, %i0, 36
	call	min_caml_fiszero
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8323
	nop
	ld	%i0, 0, %i2
	cmp	%i2, 0
	bne	be_else.8325
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 24, %f2
	fdivd	%f0, %f2, %f0
	b	be_cont.8326
	nop
be_else.8325:
	set	l.6251, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 24, %f2
	fdivd	%f0, %f2, %f0
be_cont.8326:
	b	be_cont.8324
	nop
be_else.8323:
	set	l.6249, %i2
	ldd	%i2, 0, %f0
be_cont.8324:
	ld	%i0, 4, %i2
	ldd	%i2, 0, %f2
	fmuld	%f2, %f0, %f2
	std	%f2, %i2, 0
	ldd	%i2, 8, %f2
	fmuld	%f2, %f0, %f2
	std	%f2, %i2, 8
	ldd	%i2, 16, %f2
	fmuld	%f2, %f0, %f0
	std	%f0, %i2, 16
	retl
	nop
veciprod.2610:
	ldd	%i2, 0, %f0
	ldd	%i3, 0, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i2, 8, %f2
	ldd	%i3, 8, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	ldd	%i2, 16, %f2
	ldd	%i3, 16, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	retl
	nop
veciprod2.2613:
	ldd	%i2, 0, %f6
	fmuld	%f6, %f0, %f0
	ldd	%i2, 8, %f6
	fmuld	%f6, %f2, %f2
	faddd	%f0, %f2, %f0
	ldd	%i2, 16, %f2
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	retl
	nop
vecaccum.2618:
	ldd	%i2, 0, %f2
	ldd	%i3, 0, %f4
	fmuld	%f0, %f4, %f4
	faddd	%f2, %f4, %f2
	std	%f2, %i2, 0
	ldd	%i2, 8, %f2
	ldd	%i3, 8, %f4
	fmuld	%f0, %f4, %f4
	faddd	%f2, %f4, %f2
	std	%f2, %i2, 8
	ldd	%i2, 16, %f2
	ldd	%i3, 16, %f4
	fmuld	%f0, %f4, %f0
	faddd	%f2, %f0, %f0
	std	%f0, %i2, 16
	retl
	nop
vecadd.2622:
	ldd	%i2, 0, %f0
	ldd	%i3, 0, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 0
	ldd	%i2, 8, %f0
	ldd	%i3, 8, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 8
	ldd	%i2, 16, %f0
	ldd	%i3, 16, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
vecscale.2628:
	ldd	%i2, 0, %f2
	fmuld	%f2, %f0, %f2
	std	%f2, %i2, 0
	ldd	%i2, 8, %f2
	fmuld	%f2, %f0, %f2
	std	%f2, %i2, 8
	ldd	%i2, 16, %f2
	fmuld	%f2, %f0, %f0
	std	%f0, %i2, 16
	retl
	nop
vecaccumv.2631:
	ldd	%i2, 0, %f0
	ldd	%i3, 0, %f2
	ldd	%i4, 0, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 0
	ldd	%i2, 8, %f0
	ldd	%i3, 8, %f2
	ldd	%i4, 8, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 8
	ldd	%i2, 16, %f0
	ldd	%i3, 16, %f2
	ldd	%i4, 16, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
o_texturetype.2635:
	ld	%i2, 0, %i2
	retl
	nop
o_form.2637:
	ld	%i2, 4, %i2
	retl
	nop
o_reflectiontype.2639:
	ld	%i2, 8, %i2
	retl
	nop
o_isinvert.2641:
	ld	%i2, 24, %i2
	retl
	nop
o_isrot.2643:
	ld	%i2, 12, %i2
	retl
	nop
o_param_a.2645:
	ld	%i2, 16, %i2
	ldd	%i2, 0, %f0
	retl
	nop
o_param_b.2647:
	ld	%i2, 16, %i2
	ldd	%i2, 8, %f0
	retl
	nop
o_param_c.2649:
	ld	%i2, 16, %i2
	ldd	%i2, 16, %f0
	retl
	nop
o_param_abc.2651:
	ld	%i2, 16, %i2
	retl
	nop
o_param_x.2653:
	ld	%i2, 20, %i2
	ldd	%i2, 0, %f0
	retl
	nop
o_param_y.2655:
	ld	%i2, 20, %i2
	ldd	%i2, 8, %f0
	retl
	nop
o_param_z.2657:
	ld	%i2, 20, %i2
	ldd	%i2, 16, %f0
	retl
	nop
o_diffuse.2659:
	ld	%i2, 28, %i2
	ldd	%i2, 0, %f0
	retl
	nop
o_hilight.2661:
	ld	%i2, 28, %i2
	ldd	%i2, 8, %f0
	retl
	nop
o_color_red.2663:
	ld	%i2, 32, %i2
	ldd	%i2, 0, %f0
	retl
	nop
o_color_green.2665:
	ld	%i2, 32, %i2
	ldd	%i2, 8, %f0
	retl
	nop
o_color_blue.2667:
	ld	%i2, 32, %i2
	ldd	%i2, 16, %f0
	retl
	nop
o_param_r1.2669:
	ld	%i2, 36, %i2
	ldd	%i2, 0, %f0
	retl
	nop
o_param_r2.2671:
	ld	%i2, 36, %i2
	ldd	%i2, 8, %f0
	retl
	nop
o_param_r3.2673:
	ld	%i2, 36, %i2
	ldd	%i2, 16, %f0
	retl
	nop
o_param_ctbl.2675:
	ld	%i2, 40, %i2
	retl
	nop
p_rgb.2677:
	ld	%i2, 0, %i2
	retl
	nop
p_intersection_points.2679:
	ld	%i2, 4, %i2
	retl
	nop
p_surface_ids.2681:
	ld	%i2, 8, %i2
	retl
	nop
p_calc_diffuse.2683:
	ld	%i2, 12, %i2
	retl
	nop
p_energy.2685:
	ld	%i2, 16, %i2
	retl
	nop
p_received_ray_20percent.2687:
	ld	%i2, 20, %i2
	retl
	nop
p_group_id.2689:
	ld	%i2, 24, %i2
	ld	%i2, 0, %i2
	retl
	nop
p_set_group_id.2691:
	ld	%i2, 24, %i2
	st	%i3, %i2, 0
	retl
	nop
p_nvectors.2694:
	ld	%i2, 28, %i2
	retl
	nop
d_vec.2696:
	ld	%i2, 0, %i2
	retl
	nop
d_const.2698:
	ld	%i2, 4, %i2
	retl
	nop
r_surface_id.2700:
	ld	%i2, 0, %i2
	retl
	nop
r_dvec.2702:
	ld	%i2, 4, %i2
	retl
	nop
r_bright.2704:
	ldd	%i2, 8, %f0
	retl
	nop
rad.2706:
	set	l.6339, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	retl
	nop
read_screen_settings.2708:
	set	min_caml_screen, %i2
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	min_caml_read_float
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i2
	std	%f0, %i2, 0
	set	min_caml_screen, %i2
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_read_float
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	std	%f0, %i2, 8
	set	min_caml_screen, %i2
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	min_caml_read_float
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 16
	st	%o7, %i0, 12
	call	min_caml_read_float
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%o7, %i0, 12
	call	rad.2706
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	min_caml_cos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	std	%f0, %i0, 24
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 36
	call	min_caml_sin
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%o7, %i0, 44
	call	rad.2706
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	std	%f0, %i0, 40
	st	%o7, %i0, 52
	call	min_caml_cos
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	std	%f0, %i0, 48
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 60
	call	min_caml_sin
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	set	min_caml_screenz_dir, %i2
	ldd	%i0, 24, %f2
	fmuld	%f2, %f0, %f4
	set	l.6344, %i3
	ldd	%i3, 0, %f6
	fmuld	%f4, %f6, %f4
	std	%f4, %i2, 0
	set	min_caml_screenz_dir, %i2
	set	l.6347, %i3
	ldd	%i3, 0, %f4
	ldd	%i0, 32, %f6
	fmuld	%f6, %f4, %f4
	std	%f4, %i2, 8
	set	min_caml_screenz_dir, %i2
	ldd	%i0, 48, %f4
	fmuld	%f2, %f4, %f8
	set	l.6344, %i3
	ldd	%i3, 0, %f10
	fmuld	%f8, %f10, %f8
	std	%f8, %i2, 16
	set	min_caml_screenx_dir, %i2
	std	%f4, %i2, 0
	set	min_caml_screenx_dir, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f8
	std	%f8, %i2, 8
	set	min_caml_screenx_dir, %i2
	std	%f0, %i0, 56
	st	%i2, %i0, 64
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 64, %i2
	std	%f0, %i2, 16
	set	min_caml_screeny_dir, %i2
	ldd	%i0, 32, %f0
	st	%i2, %i0, 68
	st	%o7, %i0, 76
	call	min_caml_fneg
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 56, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 68, %i2
	std	%f0, %i2, 0
	set	min_caml_screeny_dir, %i2
	ldd	%i0, 24, %f0
	st	%i2, %i0, 72
	st	%o7, %i0, 76
	call	min_caml_fneg
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 72, %i2
	std	%f0, %i2, 8
	set	min_caml_screeny_dir, %i2
	ldd	%i0, 32, %f0
	st	%i2, %i0, 76
	st	%o7, %i0, 84
	call	min_caml_fneg
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 48, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 76, %i2
	std	%f0, %i2, 16
	set	min_caml_viewpoint, %i2
	set	min_caml_screen, %i3
	ldd	%i3, 0, %f0
	set	min_caml_screenz_dir, %i3
	ldd	%i3, 0, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i2, 0
	set	min_caml_viewpoint, %i2
	set	min_caml_screen, %i3
	ldd	%i3, 8, %f0
	set	min_caml_screenz_dir, %i3
	ldd	%i3, 8, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i2, 8
	set	min_caml_viewpoint, %i2
	set	min_caml_screen, %i3
	ldd	%i3, 16, %f0
	set	min_caml_screenz_dir, %i3
	ldd	%i3, 16, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
read_light.2710:
	st	%o7, %i0, 4
	call	min_caml_read_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	min_caml_read_float
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	rad.2706
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	std	%f0, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_sin
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	min_caml_light, %i2
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	min_caml_fneg
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 8
	st	%o7, %i0, 12
	call	min_caml_read_float
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%o7, %i0, 12
	call	rad.2706
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ldd	%i0, 0, %f2
	std	%f0, %i0, 16
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 28
	call	min_caml_cos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	std	%f0, %i0, 24
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 36
	call	min_caml_sin
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_light, %i2
	ldd	%i0, 24, %f2
	fmuld	%f2, %f0, %f0
	std	%f0, %i2, 0
	ldd	%i0, 16, %f0
	st	%o7, %i0, 36
	call	min_caml_cos
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_light, %i2
	ldd	%i0, 24, %f2
	fmuld	%f2, %f0, %f0
	std	%f0, %i2, 16
	set	min_caml_beam, %i2
	st	%i2, %i0, 32
	st	%o7, %i0, 36
	call	min_caml_read_float
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 32, %i2
	std	%f0, %i2, 0
	retl
	nop
rotate_quadratic_matrix.2712:
	ldd	%i3, 0, %f0
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_cos
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 0, %f2
	std	%f0, %i0, 8
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 20
	call	min_caml_sin
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	std	%f0, %i0, 16
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 28
	call	min_caml_cos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	std	%f0, %i0, 24
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 36
	call	min_caml_sin
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f2
	std	%f0, %i0, 32
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 44
	call	min_caml_cos
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f2
	std	%f0, %i0, 40
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 52
	call	min_caml_sin
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	ldd	%i0, 24, %f4
	fmuld	%f4, %f2, %f6
	ldd	%i0, 32, %f8
	ldd	%i0, 16, %f10
	fmuld	%f10, %f8, %f12
	fmuld	%f12, %f2, %f12
	ldd	%i0, 8, %f14
	fmuld	%f14, %f0, %f16
	fsubd	%f12, %f16, %f12
	fmuld	%f14, %f8, %f16
	fmuld	%f16, %f2, %f16
	fmuld	%f10, %f0, %f18
	faddd	%f16, %f18, %f16
	fmuld	%f4, %f0, %f18
	fmuld	%f10, %f8, %f20
	fmuld	%f20, %f0, %f20
	fmuld	%f14, %f2, %f22
	faddd	%f20, %f22, %f20
	fmuld	%f14, %f8, %f22
	fmuld	%f22, %f0, %f0
	fmuld	%f10, %f2, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i0, 48
	std	%f16, %i0, 56
	std	%f20, %i0, 64
	std	%f12, %i0, 72
	std	%f18, %i0, 80
	std	%f6, %i0, 88
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	st	%o7, %i0, 100
	call	min_caml_fneg
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	fmuld	%f4, %f2, %f4
	ldd	%i0, 8, %f6
	fmuld	%f6, %f2, %f2
	ld	%i0, 0, %i2
	ldd	%i2, 0, %f6
	ldd	%i2, 8, %f8
	ldd	%i2, 16, %f10
	ldd	%i0, 88, %f12
	std	%f2, %i0, 96
	std	%f4, %i0, 104
	std	%f10, %i0, 112
	std	%f0, %i0, 120
	std	%f8, %i0, 128
	std	%f6, %i0, 136
	fmovs	%f12, %f0
	fmovs	%f13, %f1
	st	%o7, %i0, 148
	call	min_caml_fsqr
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 136, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 80, %f4
	std	%f0, %i0, 144
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 156
	call	min_caml_fsqr
	add	%i0, 160, %i0
	sub	%i0, 160, %i0
	ld	%i0, 156, %o7
	ldd	%i0, 128, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 144, %f4
	faddd	%f4, %f0, %f0
	ldd	%i0, 120, %f4
	std	%f0, %i0, 152
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 164
	call	min_caml_fsqr
	add	%i0, 168, %i0
	sub	%i0, 168, %i0
	ld	%i0, 164, %o7
	ldd	%i0, 112, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 152, %f4
	faddd	%f4, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i2, 0
	ldd	%i0, 72, %f0
	st	%o7, %i0, 164
	call	min_caml_fsqr
	add	%i0, 168, %i0
	sub	%i0, 168, %i0
	ld	%i0, 164, %o7
	ldd	%i0, 136, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 64, %f4
	std	%f0, %i0, 160
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 172
	call	min_caml_fsqr
	add	%i0, 176, %i0
	sub	%i0, 176, %i0
	ld	%i0, 172, %o7
	ldd	%i0, 128, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 160, %f4
	faddd	%f4, %f0, %f0
	ldd	%i0, 104, %f4
	std	%f0, %i0, 168
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 180
	call	min_caml_fsqr
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	ldd	%i0, 112, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 168, %f4
	faddd	%f4, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i2, 8
	ldd	%i0, 56, %f0
	st	%o7, %i0, 180
	call	min_caml_fsqr
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	ldd	%i0, 136, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 48, %f4
	std	%f0, %i0, 176
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 188
	call	min_caml_fsqr
	add	%i0, 192, %i0
	sub	%i0, 192, %i0
	ld	%i0, 188, %o7
	ldd	%i0, 128, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 176, %f4
	faddd	%f4, %f0, %f0
	ldd	%i0, 96, %f4
	std	%f0, %i0, 184
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 196
	call	min_caml_fsqr
	add	%i0, 200, %i0
	sub	%i0, 200, %i0
	ld	%i0, 196, %o7
	ldd	%i0, 112, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 184, %f4
	faddd	%f4, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i2, 16
	set	l.6384, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 72, %f4
	ldd	%i0, 136, %f6
	fmuld	%f6, %f4, %f8
	ldd	%i0, 56, %f10
	fmuld	%f8, %f10, %f8
	ldd	%i0, 64, %f12
	ldd	%i0, 128, %f14
	fmuld	%f14, %f12, %f16
	ldd	%i0, 48, %f18
	fmuld	%f16, %f18, %f16
	faddd	%f8, %f16, %f8
	ldd	%i0, 104, %f16
	fmuld	%f2, %f16, %f20
	ldd	%i0, 96, %f22
	fmuld	%f20, %f22, %f20
	faddd	%f8, %f20, %f8
	fmuld	%f0, %f8, %f0
	ld	%i0, 4, %i2
	std	%f0, %i2, 0
	set	l.6384, %i3
	ldd	%i3, 0, %f0
	ldd	%i0, 88, %f8
	fmuld	%f6, %f8, %f20
	fmuld	%f20, %f10, %f10
	ldd	%i0, 80, %f20
	fmuld	%f14, %f20, %f24
	fmuld	%f24, %f18, %f18
	faddd	%f10, %f18, %f10
	ldd	%i0, 120, %f18
	fmuld	%f2, %f18, %f24
	fmuld	%f24, %f22, %f22
	faddd	%f10, %f22, %f10
	fmuld	%f0, %f10, %f0
	std	%f0, %i2, 8
	set	l.6384, %i3
	ldd	%i3, 0, %f0
	fmuld	%f6, %f8, %f6
	fmuld	%f6, %f4, %f4
	fmuld	%f14, %f20, %f6
	fmuld	%f6, %f12, %f6
	faddd	%f4, %f6, %f4
	fmuld	%f2, %f18, %f2
	fmuld	%f2, %f16, %f2
	faddd	%f4, %f2, %f2
	fmuld	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
read_nth_object.2715:
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	min_caml_read_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	cmp	%i2, -1
	bne	be_else.8338
	nop
	set	0, %i2
	retl
	nop
be_else.8338:
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_read_int
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	min_caml_read_int
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%i2, %i0, 12
	st	%o7, %i0, 20
	call	min_caml_read_int
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	3, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	min_caml_create_float_array
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%i2, %i0, 20
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i2
	std	%f0, %i2, 8
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i2
	std	%f0, %i2, 16
	set	3, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	min_caml_create_float_array
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%i2, %i0, 24
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 24, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 24, %i2
	std	%f0, %i2, 8
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 24, %i2
	std	%f0, %i2, 16
	st	%o7, %i0, 28
	call	min_caml_read_float
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%o7, %i0, 28
	call	min_caml_fisneg
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	2, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%i2, %i0, 28
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	min_caml_create_float_array
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	st	%i2, %i0, 32
	st	%o7, %i0, 36
	call	min_caml_read_float
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 32, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 36
	call	min_caml_read_float
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 32, %i2
	std	%f0, %i2, 8
	set	3, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	min_caml_create_float_array
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	st	%i2, %i0, 36
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 36, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 36, %i2
	std	%f0, %i2, 8
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 36, %i2
	std	%f0, %i2, 16
	set	3, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	min_caml_create_float_array
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 16, %i3
	cmp	%i3, 0
	bne	be_else.8339
	nop
	b	be_cont.8340
	nop
be_else.8339:
	st	%i2, %i0, 40
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%o7, %i0, 44
	call	rad.2706
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 40, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%o7, %i0, 44
	call	rad.2706
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 40, %i2
	std	%f0, %i2, 8
	st	%o7, %i0, 44
	call	min_caml_read_float
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%o7, %i0, 44
	call	rad.2706
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 40, %i2
	std	%f0, %i2, 16
be_cont.8340:
	ld	%i0, 8, %i3
	cmp	%i3, 2
	bne	be_else.8341
	nop
	set	1, %i4
	b	be_cont.8342
	nop
be_else.8341:
	ld	%i0, 28, %i4
be_cont.8342:
	set	4, %i5
	set	l.6247, %l0
	ldd	%l0, 0, %f0
	st	%i4, %i0, 44
	st	%i2, %i0, 40
	mov	%i5, %i2
	st	%o7, %i0, 52
	call	min_caml_create_float_array
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	mov	%i1, %i3
	add	%i1, 48, %i1
	st	%i2, %i3, 40
	ld	%i0, 40, %i2
	st	%i2, %i3, 36
	ld	%i0, 36, %i4
	st	%i4, %i3, 32
	ld	%i0, 32, %i4
	st	%i4, %i3, 28
	ld	%i0, 44, %i4
	st	%i4, %i3, 24
	ld	%i0, 24, %i4
	st	%i4, %i3, 20
	ld	%i0, 20, %i4
	st	%i4, %i3, 16
	ld	%i0, 16, %i5
	st	%i5, %i3, 12
	ld	%i0, 12, %l0
	st	%l0, %i3, 8
	ld	%i0, 8, %l0
	st	%l0, %i3, 4
	ld	%i0, 4, %l1
	st	%l1, %i3, 0
	set	min_caml_objects, %l1
	ld	%i0, 0, %l2
	sll	%l2, 2, %l2
	st	%i3, %l1, %l2
	cmp	%l0, 3
	bne	be_else.8343
	nop
	ldd	%i4, 0, %f0
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	min_caml_fiszero
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	cmp	%i2, 0
	bne	be_else.8345
	nop
	ldd	%i0, 48, %f0
	st	%o7, %i0, 60
	call	sgn.2581
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	std	%f0, %i0, 56
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 68
	call	min_caml_fsqr
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fdivd	%f2, %f0, %f0
	b	be_cont.8346
	nop
be_else.8345:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
be_cont.8346:
	ld	%i0, 20, %i2
	std	%f0, %i2, 0
	ldd	%i2, 8, %f0
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	min_caml_fiszero
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8347
	nop
	ldd	%i0, 64, %f0
	st	%o7, %i0, 76
	call	sgn.2581
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	std	%f0, %i0, 72
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 84
	call	min_caml_fsqr
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 72, %f2
	fdivd	%f2, %f0, %f0
	b	be_cont.8348
	nop
be_else.8347:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
be_cont.8348:
	ld	%i0, 20, %i2
	std	%f0, %i2, 8
	ldd	%i2, 16, %f0
	std	%f0, %i0, 80
	st	%o7, %i0, 92
	call	min_caml_fiszero
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	cmp	%i2, 0
	bne	be_else.8349
	nop
	ldd	%i0, 80, %f0
	st	%o7, %i0, 92
	call	sgn.2581
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 80, %f2
	std	%f0, %i0, 88
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 100
	call	min_caml_fsqr
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 88, %f2
	fdivd	%f2, %f0, %f0
	b	be_cont.8350
	nop
be_else.8349:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
be_cont.8350:
	ld	%i0, 20, %i2
	std	%f0, %i2, 16
	b	be_cont.8344
	nop
be_else.8343:
	cmp	%l0, 2
	bne	be_else.8351
	nop
	ld	%i0, 28, %i3
	cmp	%i3, 0
	bne	be_else.8353
	nop
	set	1, %i3
	b	be_cont.8354
	nop
be_else.8353:
	set	0, %i3
be_cont.8354:
	mov	%i4, %i2
	st	%o7, %i0, 100
	call	vecunit_sgn.2607
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	b	be_cont.8352
	nop
be_else.8351:
be_cont.8352:
be_cont.8344:
	ld	%i0, 16, %i2
	cmp	%i2, 0
	bne	be_else.8355
	nop
	b	be_cont.8356
	nop
be_else.8355:
	ld	%i0, 20, %i2
	ld	%i0, 40, %i3
	st	%o7, %i0, 100
	call	rotate_quadratic_matrix.2712
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
be_cont.8356:
	set	1, %i2
	retl
	nop
read_object.2717:
	cmp	%i2, 60
	bl	bge_else.8357
	nop
	retl
	nop
bge_else.8357:
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	read_nth_object.2715
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	cmp	%i2, 0
	bne	be_else.8359
	nop
	set	min_caml_n_objects, %i2
	ld	%i0, 0, %i3
	st	%i3, %i2, 0
	retl
	nop
be_else.8359:
	ld	%i0, 0, %i2
	add	%i2, 1, %i2
	b	read_object.2717
	nop
read_all_object.2719:
	set	0, %i2
	b	read_object.2717
	nop
read_net_item.2721:
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	min_caml_read_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	cmp	%i2, -1
	bne	be_else.8361
	nop
	ld	%i0, 0, %i2
	add	%i2, 1, %i2
	set	-1, %i3
	b	min_caml_create_array
	nop
be_else.8361:
	ld	%i0, 0, %i3
	add	%i3, 1, %i4
	st	%i2, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	read_net_item.2721
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i3
	ld	%i0, 4, %i4
	st	%i4, %i2, %i3
	retl
	nop
read_or_network.2723:
	set	0, %i3
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	read_net_item.2721
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i3
	ld	%i3, 0, %i2
	cmp	%i2, -1
	bne	be_else.8362
	nop
	ld	%i0, 0, %i2
	add	%i2, 1, %i2
	b	min_caml_create_array
	nop
be_else.8362:
	ld	%i0, 0, %i2
	add	%i2, 1, %i4
	st	%i3, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	read_or_network.2723
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i3
	ld	%i0, 4, %i4
	st	%i4, %i2, %i3
	retl
	nop
read_and_network.2725:
	set	0, %i3
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	read_net_item.2721
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i2, 0, %i3
	cmp	%i3, -1
	bne	be_else.8363
	nop
	retl
	nop
be_else.8363:
	set	min_caml_and_net, %i3
	ld	%i0, 0, %i4
	sll	%i4, 2, %i5
	st	%i2, %i3, %i5
	add	%i4, 1, %i2
	b	read_and_network.2725
	nop
read_parameter.2727:
	st	%o7, %i0, 4
	call	read_screen_settings.2708
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	read_light.2710
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	read_all_object.2719
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	0, %i2
	st	%o7, %i0, 4
	call	read_and_network.2725
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_or_net, %i2
	set	0, %i3
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	read_or_network.2723
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	st	%i2, %i3, 0
	retl
	nop
solver_rect_surface.2729:
	sll	%i4, 3, %l1
	ldd	%i3, %l1, %f6
	std	%f4, %i0, 0
	st	%l0, %i0, 8
	std	%f2, %i0, 16
	st	%i5, %i0, 24
	std	%f0, %i0, 32
	st	%i3, %i0, 40
	st	%i4, %i0, 44
	st	%i2, %i0, 48
	fmovs	%f6, %f0
	fmovs	%f7, %f1
	st	%o7, %i0, 52
	call	min_caml_fiszero
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	cmp	%i2, 0
	bne	be_else.8368
	nop
	ld	%i0, 48, %i2
	st	%o7, %i0, 52
	call	o_param_abc.2651
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 48, %i3
	st	%i2, %i0, 52
	mov	%i3, %i2
	st	%o7, %i0, 60
	call	o_isinvert.2641
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 44, %i3
	sll	%i3, 3, %i4
	ld	%i0, 40, %i5
	ldd	%i5, %i4, %f0
	st	%i2, %i0, 56
	st	%o7, %i0, 60
	call	min_caml_fisneg
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	mov	%i2, %i3
	ld	%i0, 56, %i2
	st	%o7, %i0, 60
	call	xor.2578
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 44, %i3
	sll	%i3, 3, %i4
	ld	%i0, 52, %i5
	ldd	%i5, %i4, %f0
	st	%o7, %i0, 60
	call	fneg_cond.2583
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 32, %f2
	fsubd	%f0, %f2, %f0
	ld	%i0, 44, %i2
	sll	%i2, 3, %i2
	ld	%i0, 40, %i3
	ldd	%i3, %i2, %f2
	fdivd	%f0, %f2, %f0
	ld	%i0, 24, %i2
	sll	%i2, 3, %i4
	ldd	%i3, %i4, %f2
	fmuld	%f0, %f2, %f2
	ldd	%i0, 16, %f4
	faddd	%f2, %f4, %f2
	std	%f0, %i0, 64
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 76
	call	min_caml_fabs
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 24, %i2
	sll	%i2, 3, %i2
	ld	%i0, 52, %i3
	ldd	%i3, %i2, %f2
	st	%o7, %i0, 76
	call	min_caml_fless
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8370
	nop
	set	0, %i2
	retl
	nop
be_else.8370:
	ld	%i0, 8, %i2
	sll	%i2, 3, %i3
	ld	%i0, 40, %i4
	ldd	%i4, %i3, %f0
	ldd	%i0, 64, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 0, %f4
	faddd	%f0, %f4, %f0
	st	%o7, %i0, 76
	call	min_caml_fabs
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 8, %i2
	sll	%i2, 3, %i2
	ld	%i0, 52, %i3
	ldd	%i3, %i2, %f2
	st	%o7, %i0, 76
	call	min_caml_fless
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8371
	nop
	set	0, %i2
	retl
	nop
be_else.8371:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 64, %f0
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
be_else.8368:
	set	0, %i2
	retl
	nop
solver_rect.2738:
	set	0, %i4
	set	1, %i5
	set	2, %l0
	std	%f0, %i0, 0
	std	%f4, %i0, 8
	std	%f2, %i0, 16
	st	%i3, %i0, 24
	st	%i2, %i0, 28
	st	%o7, %i0, 36
	call	solver_rect_surface.2729
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8372
	nop
	set	1, %i4
	set	2, %i5
	set	0, %l0
	ldd	%i0, 16, %f0
	ldd	%i0, 8, %f2
	ldd	%i0, 0, %f4
	ld	%i0, 28, %i2
	ld	%i0, 24, %i3
	st	%o7, %i0, 36
	call	solver_rect_surface.2729
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8373
	nop
	set	2, %i4
	set	0, %i5
	set	1, %l0
	ldd	%i0, 8, %f0
	ldd	%i0, 0, %f2
	ldd	%i0, 16, %f4
	ld	%i0, 28, %i2
	ld	%i0, 24, %i3
	st	%o7, %i0, 36
	call	solver_rect_surface.2729
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8374
	nop
	set	0, %i2
	retl
	nop
be_else.8374:
	set	3, %i2
	retl
	nop
be_else.8373:
	set	2, %i2
	retl
	nop
be_else.8372:
	set	1, %i2
	retl
	nop
solver_surface.2744:
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	std	%f0, %i0, 16
	st	%i3, %i0, 24
	st	%o7, %i0, 28
	call	o_param_abc.2651
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i3
	ld	%i0, 24, %i2
	st	%i3, %i0, 28
	st	%o7, %i0, 36
	call	veciprod.2610
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	min_caml_fispos
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8375
	nop
	set	0, %i2
	retl
	nop
be_else.8375:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 16, %f0
	ldd	%i0, 8, %f2
	ldd	%i0, 0, %f4
	ld	%i0, 28, %i3
	st	%i2, %i0, 40
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	veciprod2.2613
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%o7, %i0, 44
	call	min_caml_fneg
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fdivd	%f0, %f2, %f0
	ld	%i0, 40, %i2
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
quadratic.2750:
	std	%f0, %i0, 0
	std	%f4, %i0, 8
	std	%f2, %i0, 16
	st	%i2, %i0, 24
	st	%o7, %i0, 28
	call	min_caml_fsqr
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 24, %i2
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	o_param_a.2645
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 16, %f2
	std	%f0, %i0, 40
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 52
	call	min_caml_fsqr
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 24, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	o_param_b.2647
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 8, %f2
	std	%f0, %i0, 56
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 68
	call	min_caml_fsqr
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 24, %i2
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	o_param_c.2649
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 56, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 24, %i2
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	o_isrot.2643
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8377
	nop
	ldd	%i0, 72, %f0
	retl
	nop
be_else.8377:
	ldd	%i0, 8, %f0
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f4
	ld	%i0, 24, %i2
	std	%f4, %i0, 80
	st	%o7, %i0, 92
	call	o_param_r1.2669
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 80, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 72, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 0, %f2
	ldd	%i0, 8, %f4
	fmuld	%f4, %f2, %f4
	ld	%i0, 24, %i2
	std	%f0, %i0, 88
	std	%f4, %i0, 96
	st	%o7, %i0, 108
	call	o_param_r2.2671
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ldd	%i0, 96, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 88, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 16, %f2
	ldd	%i0, 0, %f4
	fmuld	%f4, %f2, %f2
	ld	%i0, 24, %i2
	std	%f0, %i0, 104
	std	%f2, %i0, 112
	st	%o7, %i0, 124
	call	o_param_r3.2673
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 112, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 104, %f2
	faddd	%f2, %f0, %f0
	retl
	nop
bilinear.2755:
	fmuld	%f0, %f6, %f12
	std	%f6, %i0, 0
	std	%f0, %i0, 8
	std	%f10, %i0, 16
	std	%f4, %i0, 24
	st	%i2, %i0, 32
	std	%f8, %i0, 40
	std	%f2, %i0, 48
	std	%f12, %i0, 56
	st	%o7, %i0, 68
	call	o_param_a.2645
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 48, %f4
	fmuld	%f4, %f2, %f6
	ld	%i0, 32, %i2
	std	%f0, %i0, 64
	std	%f6, %i0, 72
	st	%o7, %i0, 84
	call	o_param_b.2647
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 72, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 64, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 16, %f2
	ldd	%i0, 24, %f4
	fmuld	%f4, %f2, %f6
	ld	%i0, 32, %i2
	std	%f0, %i0, 80
	std	%f6, %i0, 88
	st	%o7, %i0, 100
	call	o_param_c.2649
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 88, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 80, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 32, %i2
	std	%f0, %i0, 96
	st	%o7, %i0, 108
	call	o_isrot.2643
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	cmp	%i2, 0
	bne	be_else.8379
	nop
	ldd	%i0, 96, %f0
	retl
	nop
be_else.8379:
	ldd	%i0, 40, %f0
	ldd	%i0, 24, %f2
	fmuld	%f2, %f0, %f4
	ldd	%i0, 16, %f6
	ldd	%i0, 48, %f8
	fmuld	%f8, %f6, %f10
	faddd	%f4, %f10, %f4
	ld	%i0, 32, %i2
	std	%f4, %i0, 104
	st	%o7, %i0, 116
	call	o_param_r1.2669
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 104, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 16, %f2
	ldd	%i0, 8, %f4
	fmuld	%f4, %f2, %f2
	ldd	%i0, 0, %f6
	ldd	%i0, 24, %f8
	fmuld	%f8, %f6, %f8
	faddd	%f2, %f8, %f2
	ld	%i0, 32, %i2
	std	%f0, %i0, 112
	std	%f2, %i0, 120
	st	%o7, %i0, 132
	call	o_param_r2.2671
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	ldd	%i0, 120, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 112, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 8, %f4
	fmuld	%f4, %f2, %f2
	ldd	%i0, 0, %f4
	ldd	%i0, 48, %f6
	fmuld	%f6, %f4, %f4
	faddd	%f2, %f4, %f2
	ld	%i0, 32, %i2
	std	%f0, %i0, 128
	std	%f2, %i0, 136
	st	%o7, %i0, 148
	call	o_param_r3.2673
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 136, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 128, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 148
	call	min_caml_fhalf
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 96, %f2
	faddd	%f2, %f0, %f0
	retl
	nop
solver_second.2763:
	ldd	%i3, 0, %f6
	ldd	%i3, 8, %f8
	ldd	%i3, 16, %f10
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	std	%f0, %i0, 16
	st	%i2, %i0, 24
	st	%i3, %i0, 28
	fmovs	%f10, %f4
	fmovs	%f11, %f5
	fmovs	%f8, %f2
	fmovs	%f9, %f3
	fmovs	%f6, %f0
	fmovs	%f7, %f1
	st	%o7, %i0, 36
	call	quadratic.2750
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	min_caml_fiszero
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8380
	nop
	ld	%i0, 28, %i2
	ldd	%i2, 0, %f0
	ldd	%i2, 8, %f2
	ldd	%i2, 16, %f4
	ldd	%i0, 16, %f6
	ldd	%i0, 8, %f8
	ldd	%i0, 0, %f10
	ld	%i0, 24, %i2
	st	%o7, %i0, 44
	call	bilinear.2755
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 16, %f2
	ldd	%i0, 8, %f4
	ldd	%i0, 0, %f6
	ld	%i0, 24, %i2
	std	%f0, %i0, 40
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f4, %f2
	fmovs	%f5, %f3
	fmovs	%f6, %f4
	fmovs	%f7, %f5
	st	%o7, %i0, 52
	call	quadratic.2750
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 24, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	o_form.2637
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	cmp	%i2, 3
	bne	be_else.8381
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	b	be_cont.8382
	nop
be_else.8381:
	ldd	%i0, 48, %f0
be_cont.8382:
	ldd	%i0, 40, %f2
	std	%f0, %i0, 56
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 68
	call	min_caml_fsqr
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	ldd	%i0, 32, %f4
	fmuld	%f4, %f2, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	min_caml_fispos
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8383
	nop
	set	0, %i2
	retl
	nop
be_else.8383:
	ldd	%i0, 64, %f0
	st	%o7, %i0, 76
	call	min_caml_sqrt
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 24, %i2
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	o_isinvert.2641
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8384
	nop
	ldd	%i0, 72, %f0
	st	%o7, %i0, 84
	call	min_caml_fneg
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	b	be_cont.8385
	nop
be_else.8384:
	ldd	%i0, 72, %f0
be_cont.8385:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 40, %f2
	fsubd	%f0, %f2, %f0
	ldd	%i0, 32, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
be_else.8380:
	set	0, %i2
	retl
	nop
solver.2769:
	set	min_caml_objects, %i5
	sll	%i2, 2, %i2
	ld	%i5, %i2, %i2
	ldd	%i4, 0, %f0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%i4, %i0, 8
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	o_param_x.2653
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 8, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 4, %i3
	std	%f0, %i0, 24
	std	%f2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	o_param_y.2655
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 8, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 4, %i2
	std	%f0, %i0, 40
	std	%f2, %i0, 48
	st	%o7, %i0, 60
	call	o_param_z.2657
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	o_form.2637
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 1
	bne	be_else.8387
	nop
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 4, %i2
	ld	%i0, 0, %i3
	b	solver_rect.2738
	nop
be_else.8387:
	cmp	%i2, 2
	bne	be_else.8388
	nop
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 4, %i2
	ld	%i0, 0, %i3
	b	solver_surface.2744
	nop
be_else.8388:
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 4, %i2
	ld	%i0, 0, %i3
	b	solver_second.2763
	nop
solver_rect_fast.2773:
	ldd	%i4, 0, %f6
	fsubd	%f6, %f0, %f6
	ldd	%i4, 8, %f8
	fmuld	%f6, %f8, %f6
	ldd	%i3, 8, %f8
	fmuld	%f6, %f8, %f8
	faddd	%f8, %f2, %f8
	std	%f0, %i0, 0
	std	%f2, %i0, 8
	st	%i4, %i0, 16
	std	%f4, %i0, 24
	std	%f6, %i0, 32
	st	%i3, %i0, 40
	st	%i2, %i0, 44
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	st	%o7, %i0, 52
	call	min_caml_fabs
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	o_param_b.2647
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 48, %f0
	st	%o7, %i0, 60
	call	min_caml_fless
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	cmp	%i2, 0
	bne	be_else.8390
	nop
	set	0, %i2
	b	be_cont.8391
	nop
be_else.8390:
	ld	%i0, 40, %i2
	ldd	%i2, 16, %f0
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 24, %f4
	faddd	%f0, %f4, %f0
	st	%o7, %i0, 60
	call	min_caml_fabs
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	o_param_c.2649
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 56, %f0
	st	%o7, %i0, 68
	call	min_caml_fless
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 0
	bne	be_else.8392
	nop
	set	0, %i2
	b	be_cont.8393
	nop
be_else.8392:
	ld	%i0, 16, %i2
	ldd	%i2, 8, %f0
	st	%o7, %i0, 68
	call	min_caml_fiszero
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 0
	bne	be_else.8394
	nop
	set	1, %i2
	b	be_cont.8395
	nop
be_else.8394:
	set	0, %i2
be_cont.8395:
be_cont.8393:
be_cont.8391:
	cmp	%i2, 0
	bne	be_else.8396
	nop
	ld	%i0, 16, %i2
	ldd	%i2, 16, %f0
	ldd	%i0, 8, %f2
	fsubd	%f0, %f2, %f0
	ldd	%i2, 24, %f4
	fmuld	%f0, %f4, %f0
	ld	%i0, 40, %i3
	ldd	%i3, 0, %f4
	fmuld	%f0, %f4, %f4
	ldd	%i0, 0, %f6
	faddd	%f4, %f6, %f4
	std	%f0, %i0, 64
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 76
	call	min_caml_fabs
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	o_param_a.2645
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 72, %f0
	st	%o7, %i0, 84
	call	min_caml_fless
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8397
	nop
	set	0, %i2
	b	be_cont.8398
	nop
be_else.8397:
	ld	%i0, 40, %i2
	ldd	%i2, 16, %f0
	ldd	%i0, 64, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 24, %f4
	faddd	%f0, %f4, %f0
	st	%o7, %i0, 84
	call	min_caml_fabs
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 80
	st	%o7, %i0, 92
	call	o_param_c.2649
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 80, %f0
	st	%o7, %i0, 92
	call	min_caml_fless
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	cmp	%i2, 0
	bne	be_else.8399
	nop
	set	0, %i2
	b	be_cont.8400
	nop
be_else.8399:
	ld	%i0, 16, %i2
	ldd	%i2, 24, %f0
	st	%o7, %i0, 92
	call	min_caml_fiszero
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	cmp	%i2, 0
	bne	be_else.8401
	nop
	set	1, %i2
	b	be_cont.8402
	nop
be_else.8401:
	set	0, %i2
be_cont.8402:
be_cont.8400:
be_cont.8398:
	cmp	%i2, 0
	bne	be_else.8403
	nop
	ld	%i0, 16, %i2
	ldd	%i2, 32, %f0
	ldd	%i0, 24, %f2
	fsubd	%f0, %f2, %f0
	ldd	%i2, 40, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 40, %i3
	ldd	%i3, 0, %f2
	fmuld	%f0, %f2, %f2
	ldd	%i0, 0, %f4
	faddd	%f2, %f4, %f2
	std	%f0, %i0, 88
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 100
	call	min_caml_fabs
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 96
	st	%o7, %i0, 108
	call	o_param_a.2645
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 96, %f0
	st	%o7, %i0, 108
	call	min_caml_fless
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	cmp	%i2, 0
	bne	be_else.8404
	nop
	set	0, %i2
	b	be_cont.8405
	nop
be_else.8404:
	ld	%i0, 40, %i2
	ldd	%i2, 8, %f0
	ldd	%i0, 88, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 8, %f4
	faddd	%f0, %f4, %f0
	st	%o7, %i0, 108
	call	min_caml_fabs
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ld	%i0, 44, %i2
	std	%f0, %i0, 104
	st	%o7, %i0, 116
	call	o_param_b.2647
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 104, %f0
	st	%o7, %i0, 116
	call	min_caml_fless
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	cmp	%i2, 0
	bne	be_else.8406
	nop
	set	0, %i2
	b	be_cont.8407
	nop
be_else.8406:
	ld	%i0, 16, %i2
	ldd	%i2, 40, %f0
	st	%o7, %i0, 116
	call	min_caml_fiszero
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	cmp	%i2, 0
	bne	be_else.8408
	nop
	set	1, %i2
	b	be_cont.8409
	nop
be_else.8408:
	set	0, %i2
be_cont.8409:
be_cont.8407:
be_cont.8405:
	cmp	%i2, 0
	bne	be_else.8410
	nop
	set	0, %i2
	retl
	nop
be_else.8410:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 88, %f0
	std	%f0, %i2, 0
	set	3, %i2
	retl
	nop
be_else.8403:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 64, %f0
	std	%f0, %i2, 0
	set	2, %i2
	retl
	nop
be_else.8396:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 32, %f0
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
solver_surface_fast.2780:
	ldd	%i3, 0, %f6
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	std	%f0, %i0, 16
	st	%i3, %i0, 24
	fmovs	%f6, %f0
	fmovs	%f7, %f1
	st	%o7, %i0, 28
	call	min_caml_fisneg
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8411
	nop
	set	0, %i2
	retl
	nop
be_else.8411:
	set	min_caml_solver_dist, %i2
	ld	%i0, 24, %i3
	ldd	%i3, 8, %f0
	ldd	%i0, 16, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i3, 16, %f2
	ldd	%i0, 8, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	ldd	%i3, 24, %f2
	ldd	%i0, 0, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
solver_second_fast.2786:
	ldd	%i3, 0, %f6
	std	%f6, %i0, 0
	st	%i2, %i0, 8
	std	%f4, %i0, 16
	std	%f2, %i0, 24
	std	%f0, %i0, 32
	st	%i3, %i0, 40
	fmovs	%f6, %f0
	fmovs	%f7, %f1
	st	%o7, %i0, 44
	call	min_caml_fiszero
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8413
	nop
	ld	%i0, 40, %i2
	ldd	%i2, 8, %f0
	ldd	%i0, 32, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i2, 16, %f4
	ldd	%i0, 24, %f6
	fmuld	%f4, %f6, %f4
	faddd	%f0, %f4, %f0
	ldd	%i2, 24, %f4
	ldd	%i0, 16, %f8
	fmuld	%f4, %f8, %f4
	faddd	%f0, %f4, %f0
	ld	%i0, 8, %i3
	std	%f0, %i0, 48
	mov	%i3, %i2
	fmovs	%f8, %f4
	fmovs	%f9, %f5
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f6, %f2
	fmovs	%f7, %f3
	st	%o7, %i0, 60
	call	quadratic.2750
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 8, %i2
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	o_form.2637
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 3
	bne	be_else.8415
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 56, %f2
	fsubd	%f2, %f0, %f0
	b	be_cont.8416
	nop
be_else.8415:
	ldd	%i0, 56, %f0
be_cont.8416:
	ldd	%i0, 48, %f2
	std	%f0, %i0, 64
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 76
	call	min_caml_fsqr
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	ldd	%i0, 0, %f4
	fmuld	%f4, %f2, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	min_caml_fispos
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8417
	nop
	set	0, %i2
	retl
	nop
be_else.8417:
	ld	%i0, 8, %i2
	st	%o7, %i0, 84
	call	o_isinvert.2641
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8418
	nop
	set	min_caml_solver_dist, %i2
	ldd	%i0, 72, %f0
	st	%i2, %i0, 80
	st	%o7, %i0, 84
	call	min_caml_sqrt
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 40, %i2
	ldd	%i2, 32, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 80, %i2
	std	%f0, %i2, 0
	b	be_cont.8419
	nop
be_else.8418:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 72, %f0
	st	%i2, %i0, 84
	st	%o7, %i0, 92
	call	min_caml_sqrt
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 48, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 40, %i2
	ldd	%i2, 32, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 84, %i2
	std	%f0, %i2, 0
be_cont.8419:
	set	1, %i2
	retl
	nop
be_else.8413:
	set	0, %i2
	retl
	nop
solver_fast.2792:
	set	min_caml_objects, %i5
	sll	%i2, 2, %l0
	ld	%i5, %l0, %i5
	ldd	%i4, 0, %f0
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%i5, %i0, 8
	st	%i4, %i0, 12
	std	%f0, %i0, 16
	mov	%i5, %i2
	st	%o7, %i0, 28
	call	o_param_x.2653
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 8, %i3
	std	%f0, %i0, 24
	std	%f2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	o_param_y.2655
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 8, %i2
	std	%f0, %i0, 40
	std	%f2, %i0, 48
	st	%o7, %i0, 60
	call	o_param_z.2657
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	d_const.2698
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	ld	%i0, 8, %i3
	st	%i2, %i0, 64
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	o_form.2637
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 1
	bne	be_else.8420
	nop
	ld	%i0, 4, %i2
	st	%o7, %i0, 68
	call	d_vec.2696
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	mov	%i2, %i3
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 8, %i2
	ld	%i0, 64, %i4
	b	solver_rect_fast.2773
	nop
be_else.8420:
	cmp	%i2, 2
	bne	be_else.8421
	nop
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 8, %i2
	ld	%i0, 64, %i3
	b	solver_surface_fast.2780
	nop
be_else.8421:
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 56, %f4
	ld	%i0, 8, %i2
	ld	%i0, 64, %i3
	b	solver_second_fast.2786
	nop
solver_surface_fast2.2796:
	ldd	%i3, 0, %f0
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_fisneg
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8422
	nop
	set	0, %i2
	retl
	nop
be_else.8422:
	set	min_caml_solver_dist, %i2
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 0, %i3
	ldd	%i3, 24, %f2
	fmuld	%f0, %f2, %f0
	std	%f0, %i2, 0
	set	1, %i2
	retl
	nop
solver_second_fast2.2803:
	ldd	%i3, 0, %f6
	st	%i2, %i0, 0
	std	%f6, %i0, 8
	st	%i4, %i0, 16
	std	%f4, %i0, 24
	std	%f2, %i0, 32
	std	%f0, %i0, 40
	st	%i3, %i0, 48
	fmovs	%f6, %f0
	fmovs	%f7, %f1
	st	%o7, %i0, 52
	call	min_caml_fiszero
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	cmp	%i2, 0
	bne	be_else.8425
	nop
	ld	%i0, 48, %i2
	ldd	%i2, 8, %f0
	ldd	%i0, 40, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i2, 16, %f2
	ldd	%i0, 32, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	ldd	%i2, 24, %f2
	ldd	%i0, 24, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	ld	%i0, 16, %i3
	ldd	%i3, 24, %f2
	std	%f0, %i0, 56
	std	%f2, %i0, 64
	st	%o7, %i0, 76
	call	min_caml_fsqr
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	ldd	%i0, 8, %f4
	fmuld	%f4, %f2, %f2
	fsubd	%f0, %f2, %f0
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	min_caml_fispos
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8427
	nop
	set	0, %i2
	retl
	nop
be_else.8427:
	ld	%i0, 0, %i2
	st	%o7, %i0, 84
	call	o_isinvert.2641
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8428
	nop
	set	min_caml_solver_dist, %i2
	ldd	%i0, 72, %f0
	st	%i2, %i0, 80
	st	%o7, %i0, 84
	call	min_caml_sqrt
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 56, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 48, %i2
	ldd	%i2, 32, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 80, %i2
	std	%f0, %i2, 0
	b	be_cont.8429
	nop
be_else.8428:
	set	min_caml_solver_dist, %i2
	ldd	%i0, 72, %f0
	st	%i2, %i0, 84
	st	%o7, %i0, 92
	call	min_caml_sqrt
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 56, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 48, %i2
	ldd	%i2, 32, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 84, %i2
	std	%f0, %i2, 0
be_cont.8429:
	set	1, %i2
	retl
	nop
be_else.8425:
	set	0, %i2
	retl
	nop
solver_fast2.2810:
	set	min_caml_objects, %i4
	sll	%i2, 2, %i5
	ld	%i4, %i5, %i4
	st	%i4, %i0, 0
	st	%i2, %i0, 4
	st	%i3, %i0, 8
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	o_param_ctbl.2675
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ldd	%i2, 0, %f0
	ldd	%i2, 8, %f2
	ldd	%i2, 16, %f4
	ld	%i0, 8, %i3
	st	%i2, %i0, 12
	std	%f4, %i0, 16
	std	%f2, %i0, 24
	std	%f0, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	d_const.2698
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 40
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	o_form.2637
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 1
	bne	be_else.8430
	nop
	ld	%i0, 8, %i2
	st	%o7, %i0, 44
	call	d_vec.2696
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	mov	%i2, %i3
	ldd	%i0, 32, %f0
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	ld	%i0, 0, %i2
	ld	%i0, 40, %i4
	b	solver_rect_fast.2773
	nop
be_else.8430:
	cmp	%i2, 2
	bne	be_else.8431
	nop
	ldd	%i0, 32, %f0
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	ld	%i0, 0, %i2
	ld	%i0, 40, %i3
	ld	%i0, 12, %i4
	b	solver_surface_fast2.2796
	nop
be_else.8431:
	ldd	%i0, 32, %f0
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	ld	%i0, 0, %i2
	ld	%i0, 40, %i3
	ld	%i0, 12, %i4
	b	solver_second_fast2.2803
	nop
setup_rect_table.2813:
	set	6, %i4
	set	l.6247, %i5
	ldd	%i5, 0, %f0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	min_caml_create_float_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	min_caml_fiszero
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8432
	nop
	ld	%i0, 0, %i2
	st	%o7, %i0, 12
	call	o_isinvert.2641
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 12
	st	%o7, %i0, 20
	call	min_caml_fisneg
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	mov	%i2, %i3
	ld	%i0, 12, %i2
	st	%o7, %i0, 20
	call	xor.2578
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 0, %i3
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	o_param_a.2645
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i2
	st	%o7, %i0, 20
	call	fneg_cond.2583
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 0
	set	l.6249, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i2, 8
	b	be_cont.8433
	nop
be_else.8432:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 8
be_cont.8433:
	ld	%i0, 4, %i3
	ldd	%i3, 8, %f0
	st	%o7, %i0, 20
	call	min_caml_fiszero
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8434
	nop
	ld	%i0, 0, %i2
	st	%o7, %i0, 20
	call	o_isinvert.2641
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 8, %f0
	st	%i2, %i0, 20
	st	%o7, %i0, 28
	call	min_caml_fisneg
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i3
	ld	%i0, 20, %i2
	st	%o7, %i0, 28
	call	xor.2578
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 0, %i3
	st	%i2, %i0, 24
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	o_param_b.2647
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 24, %i2
	st	%o7, %i0, 28
	call	fneg_cond.2583
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 16
	set	l.6249, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 4, %i3
	ldd	%i3, 8, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i2, 24
	b	be_cont.8435
	nop
be_else.8434:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 24
be_cont.8435:
	ld	%i0, 4, %i3
	ldd	%i3, 16, %f0
	st	%o7, %i0, 28
	call	min_caml_fiszero
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8436
	nop
	ld	%i0, 0, %i2
	st	%o7, %i0, 28
	call	o_isinvert.2641
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 16, %f0
	st	%i2, %i0, 28
	st	%o7, %i0, 36
	call	min_caml_fisneg
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	mov	%i2, %i3
	ld	%i0, 28, %i2
	st	%o7, %i0, 36
	call	xor.2578
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 0, %i3
	st	%i2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	o_param_c.2649
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 32, %i2
	st	%o7, %i0, 36
	call	fneg_cond.2583
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 32
	set	l.6249, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 4, %i3
	ldd	%i3, 16, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i2, 40
	b	be_cont.8437
	nop
be_else.8436:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 40
be_cont.8437:
	retl
	nop
setup_surface_table.2816:
	set	4, %i4
	set	l.6247, %i5
	ldd	%i5, 0, %f0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	min_caml_create_float_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 0, %i4
	st	%i2, %i0, 8
	std	%f0, %i0, 16
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	o_param_a.2645
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 24
	std	%f2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	o_param_b.2647
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 24, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 0, %i2
	std	%f0, %i0, 40
	std	%f2, %i0, 48
	st	%o7, %i0, 60
	call	o_param_c.2649
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	faddd	%f2, %f0, %f0
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	min_caml_fispos
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 0
	bne	be_else.8439
	nop
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 0
	b	be_cont.8440
	nop
be_else.8439:
	set	l.6251, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 56, %f2
	fdivd	%f0, %f2, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 0
	ld	%i0, 0, %i3
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	o_param_a.2645
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fdivd	%f0, %f2, %f0
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 8
	ld	%i0, 0, %i3
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	o_param_b.2647
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fdivd	%f0, %f2, %f0
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 16
	ld	%i0, 0, %i3
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	o_param_c.2649
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fdivd	%f0, %f2, %f0
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 24
be_cont.8440:
	retl
	nop
setup_second_table.2819:
	set	5, %i4
	set	l.6247, %i5
	ldd	%i5, 0, %f0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	min_caml_create_float_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	ldd	%i3, 8, %f2
	ldd	%i3, 16, %f4
	ld	%i0, 0, %i4
	st	%i2, %i0, 8
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	quadratic.2750
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 0, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 16
	std	%f2, %i0, 24
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	o_param_a.2645
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	fmuld	%f2, %f0, %f0
	st	%o7, %i0, 36
	call	min_caml_fneg
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 32
	std	%f2, %i0, 40
	mov	%i3, %i2
	st	%o7, %i0, 52
	call	o_param_b.2647
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	fmuld	%f2, %f0, %f0
	st	%o7, %i0, 52
	call	min_caml_fneg
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 48
	std	%f2, %i0, 56
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	o_param_c.2649
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f2
	fmuld	%f2, %f0, %f0
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 8, %i2
	ldd	%i0, 16, %f2
	std	%f2, %i2, 0
	ld	%i0, 0, %i3
	std	%f0, %i0, 64
	mov	%i3, %i2
	st	%o7, %i0, 76
	call	o_isrot.2643
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8442
	nop
	ld	%i0, 8, %i2
	ldd	%i0, 32, %f0
	std	%f0, %i2, 8
	ldd	%i0, 48, %f0
	std	%f0, %i2, 16
	ldd	%i0, 64, %f0
	std	%f0, %i2, 24
	b	be_cont.8443
	nop
be_else.8442:
	ld	%i0, 4, %i2
	ldd	%i2, 16, %f0
	ld	%i0, 0, %i3
	std	%f0, %i0, 72
	mov	%i3, %i2
	st	%o7, %i0, 84
	call	o_param_r2.2671
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 72, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 80
	std	%f2, %i0, 88
	mov	%i3, %i2
	st	%o7, %i0, 100
	call	o_param_r3.2673
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 88, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 80, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 100
	call	min_caml_fhalf
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 32, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 8
	ld	%i0, 4, %i3
	ldd	%i3, 16, %f0
	ld	%i0, 0, %i4
	std	%f0, %i0, 96
	mov	%i4, %i2
	st	%o7, %i0, 108
	call	o_param_r1.2669
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ldd	%i0, 96, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 0, %f2
	ld	%i0, 0, %i3
	std	%f0, %i0, 104
	std	%f2, %i0, 112
	mov	%i3, %i2
	st	%o7, %i0, 124
	call	o_param_r3.2673
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 112, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 104, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 124
	call	min_caml_fhalf
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 16
	ld	%i0, 4, %i3
	ldd	%i3, 8, %f0
	ld	%i0, 0, %i4
	std	%f0, %i0, 120
	mov	%i4, %i2
	st	%o7, %i0, 132
	call	o_param_r1.2669
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	ldd	%i0, 120, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 4, %i2
	ldd	%i2, 0, %f2
	ld	%i0, 0, %i2
	std	%f0, %i0, 128
	std	%f2, %i0, 136
	st	%o7, %i0, 148
	call	o_param_r2.2671
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 136, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 128, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 148
	call	min_caml_fhalf
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 64, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 24
be_cont.8443:
	ldd	%i0, 16, %f0
	st	%o7, %i0, 148
	call	min_caml_fiszero
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	cmp	%i2, 0
	bne	be_else.8444
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 16, %f2
	fdivd	%f0, %f2, %f0
	ld	%i0, 8, %i2
	std	%f0, %i2, 32
	b	be_cont.8445
	nop
be_else.8444:
be_cont.8445:
	ld	%i0, 8, %i2
	retl
	nop
iter_setup_dirvec_constants.2822:
	cmp	%i3, 0
	bl	bge_else.8446
	nop
	set	min_caml_objects, %i4
	sll	%i3, 2, %i5
	ld	%i4, %i5, %i4
	st	%i3, %i0, 0
	st	%i4, %i0, 4
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	d_const.2698
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	d_vec.2696
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i3
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	o_form.2637
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 1
	bne	be_else.8447
	nop
	ld	%i0, 16, %i2
	ld	%i0, 4, %i3
	st	%o7, %i0, 20
	call	setup_rect_table.2813
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 12, %i5
	st	%i2, %i5, %i4
	b	be_cont.8448
	nop
be_else.8447:
	cmp	%i2, 2
	bne	be_else.8449
	nop
	ld	%i0, 16, %i2
	ld	%i0, 4, %i3
	st	%o7, %i0, 20
	call	setup_surface_table.2816
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 12, %i5
	st	%i2, %i5, %i4
	b	be_cont.8450
	nop
be_else.8449:
	ld	%i0, 16, %i2
	ld	%i0, 4, %i3
	st	%o7, %i0, 20
	call	setup_second_table.2819
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 12, %i5
	st	%i2, %i5, %i4
be_cont.8450:
be_cont.8448:
	sub	%i3, 1, %i3
	ld	%i0, 8, %i2
	b	iter_setup_dirvec_constants.2822
	nop
bge_else.8446:
	retl
	nop
setup_dirvec_constants.2825:
	set	min_caml_n_objects, %i3
	ld	%i3, 0, %i3
	sub	%i3, 1, %i3
	b	iter_setup_dirvec_constants.2822
	nop
setup_startp_constants.2827:
	cmp	%i3, 0
	bl	bge_else.8452
	nop
	set	min_caml_objects, %i4
	sll	%i3, 2, %i5
	ld	%i4, %i5, %i4
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%i4, %i0, 8
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	o_param_ctbl.2675
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	o_form.2637
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 8, %i4
	st	%i2, %i0, 16
	std	%f0, %i0, 24
	mov	%i4, %i2
	st	%o7, %i0, 36
	call	o_param_x.2653
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	std	%f0, %i2, 0
	ld	%i0, 4, %i3
	ldd	%i3, 8, %f0
	ld	%i0, 8, %i4
	std	%f0, %i0, 32
	mov	%i4, %i2
	st	%o7, %i0, 44
	call	o_param_y.2655
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	std	%f0, %i2, 8
	ld	%i0, 4, %i3
	ldd	%i3, 16, %f0
	ld	%i0, 8, %i4
	std	%f0, %i0, 40
	mov	%i4, %i2
	st	%o7, %i0, 52
	call	o_param_z.2657
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	std	%f0, %i2, 16
	ld	%i0, 16, %i3
	cmp	%i3, 2
	bne	be_else.8454
	nop
	ld	%i0, 8, %i3
	mov	%i3, %i2
	st	%o7, %i0, 52
	call	o_param_abc.2651
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 12, %i3
	ldd	%i3, 0, %f0
	ldd	%i3, 8, %f2
	ldd	%i3, 16, %f4
	st	%o7, %i0, 52
	call	veciprod2.2613
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 12, %i2
	std	%f0, %i2, 24
	b	be_cont.8455
	nop
be_else.8454:
	cmp	%i3, 2
	bg	ble_else.8456
	nop
	b	ble_cont.8457
	nop
ble_else.8456:
	ldd	%i2, 0, %f0
	ldd	%i2, 8, %f2
	ldd	%i2, 16, %f4
	ld	%i0, 8, %i4
	mov	%i4, %i2
	st	%o7, %i0, 52
	call	quadratic.2750
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 16, %i2
	cmp	%i2, 3
	bne	be_else.8458
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f2
	fsubd	%f0, %f2, %f0
	b	be_cont.8459
	nop
be_else.8458:
be_cont.8459:
	ld	%i0, 12, %i2
	std	%f0, %i2, 24
ble_cont.8457:
be_cont.8455:
	ld	%i0, 0, %i2
	sub	%i2, 1, %i3
	ld	%i0, 4, %i2
	b	setup_startp_constants.2827
	nop
bge_else.8452:
	retl
	nop
setup_startp.2830:
	set	min_caml_startp_fast, %i3
	st	%i2, %i0, 0
	mov	%i3, %o4
	mov	%i2, %i3
	mov	%o4, %i2
	st	%o7, %i0, 4
	call	veccpy.2599
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_n_objects, %i2
	ld	%i2, 0, %i2
	sub	%i2, 1, %i3
	ld	%i0, 0, %i2
	b	setup_startp_constants.2827
	nop
is_rect_outside.2832:
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	st	%i2, %i0, 16
	st	%o7, %i0, 20
	call	min_caml_fabs
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i2
	std	%f0, %i0, 24
	st	%o7, %i0, 36
	call	o_param_a.2645
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 24, %f0
	st	%o7, %i0, 36
	call	min_caml_fless
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8462
	nop
	set	0, %i2
	b	be_cont.8463
	nop
be_else.8462:
	ldd	%i0, 8, %f0
	st	%o7, %i0, 36
	call	min_caml_fabs
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 16, %i2
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	o_param_b.2647
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 32, %f0
	st	%o7, %i0, 44
	call	min_caml_fless
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8464
	nop
	set	0, %i2
	b	be_cont.8465
	nop
be_else.8464:
	ldd	%i0, 0, %f0
	st	%o7, %i0, 44
	call	min_caml_fabs
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 16, %i2
	std	%f0, %i0, 40
	st	%o7, %i0, 52
	call	o_param_c.2649
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 40, %f0
	st	%o7, %i0, 52
	call	min_caml_fless
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
be_cont.8465:
be_cont.8463:
	cmp	%i2, 0
	bne	be_else.8466
	nop
	ld	%i0, 16, %i2
	st	%o7, %i0, 52
	call	o_isinvert.2641
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	cmp	%i2, 0
	bne	be_else.8467
	nop
	set	1, %i2
	retl
	nop
be_else.8467:
	set	0, %i2
	retl
	nop
be_else.8466:
	ld	%i0, 16, %i2
	b	o_isinvert.2641
	nop
is_plane_outside.2837:
	st	%i2, %i0, 0
	std	%f4, %i0, 8
	std	%f2, %i0, 16
	std	%f0, %i0, 24
	st	%o7, %i0, 36
	call	o_param_abc.2651
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f0
	ldd	%i0, 16, %f2
	ldd	%i0, 8, %f4
	st	%o7, %i0, 36
	call	veciprod2.2613
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 0, %i2
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	o_isinvert.2641
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f0
	st	%i2, %i0, 40
	st	%o7, %i0, 44
	call	min_caml_fisneg
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	mov	%i2, %i3
	ld	%i0, 40, %i2
	st	%o7, %i0, 44
	call	xor.2578
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8469
	nop
	set	1, %i2
	retl
	nop
be_else.8469:
	set	0, %i2
	retl
	nop
is_second_outside.2842:
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	quadratic.2750
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i2
	std	%f0, %i0, 8
	st	%o7, %i0, 20
	call	o_form.2637
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 3
	bne	be_else.8471
	nop
	set	l.6249, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 8, %f2
	fsubd	%f2, %f0, %f0
	b	be_cont.8472
	nop
be_else.8471:
	ldd	%i0, 8, %f0
be_cont.8472:
	ld	%i0, 0, %i2
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	o_isinvert.2641
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f0
	st	%i2, %i0, 24
	st	%o7, %i0, 28
	call	min_caml_fisneg
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i3
	ld	%i0, 24, %i2
	st	%o7, %i0, 28
	call	xor.2578
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8473
	nop
	set	1, %i2
	retl
	nop
be_else.8473:
	set	0, %i2
	retl
	nop
is_outside.2847:
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	st	%i2, %i0, 16
	std	%f0, %i0, 24
	st	%o7, %i0, 36
	call	o_param_x.2653
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 16, %i2
	std	%f0, %i0, 32
	st	%o7, %i0, 44
	call	o_param_y.2655
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 8, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 16, %i2
	std	%f0, %i0, 40
	st	%o7, %i0, 52
	call	o_param_z.2657
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 0, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 16, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	o_form.2637
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	cmp	%i2, 1
	bne	be_else.8475
	nop
	ldd	%i0, 32, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 48, %f4
	ld	%i0, 16, %i2
	b	is_rect_outside.2832
	nop
be_else.8475:
	cmp	%i2, 2
	bne	be_else.8476
	nop
	ldd	%i0, 32, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 48, %f4
	ld	%i0, 16, %i2
	b	is_plane_outside.2837
	nop
be_else.8476:
	ldd	%i0, 32, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 48, %f4
	ld	%i0, 16, %i2
	b	is_second_outside.2842
	nop
check_all_inside.2852:
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i4
	cmp	%i4, -1
	bne	be_else.8477
	nop
	set	1, %i2
	retl
	nop
be_else.8477:
	set	min_caml_objects, %i5
	sll	%i4, 2, %i4
	ld	%i5, %i4, %i4
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	std	%f0, %i0, 16
	st	%i3, %i0, 24
	st	%i2, %i0, 28
	mov	%i4, %i2
	st	%o7, %i0, 36
	call	is_outside.2847
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8478
	nop
	ld	%i0, 28, %i2
	add	%i2, 1, %i2
	ldd	%i0, 16, %f0
	ldd	%i0, 8, %f2
	ldd	%i0, 0, %f4
	ld	%i0, 24, %i3
	b	check_all_inside.2852
	nop
be_else.8478:
	set	0, %i2
	retl
	nop
shadow_check_and_group.2858:
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i4
	cmp	%i4, -1
	bne	be_else.8479
	nop
	set	0, %i2
	retl
	nop
be_else.8479:
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i4
	set	min_caml_light_dirvec, %i5
	set	min_caml_intersection_point, %l0
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%i4, %i0, 8
	mov	%i5, %i3
	mov	%i4, %i2
	mov	%l0, %i4
	st	%o7, %i0, 12
	call	solver_fast.2792
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	min_caml_solver_dist, %i3
	ldd	%i3, 0, %f0
	std	%f0, %i0, 16
	cmp	%i2, 0
	bne	be_else.8481
	nop
	set	0, %i2
	b	be_cont.8482
	nop
be_else.8481:
	set	l.6603, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 28
	call	min_caml_fless
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
be_cont.8482:
	cmp	%i2, 0
	bne	be_else.8483
	nop
	set	min_caml_objects, %i2
	ld	%i0, 8, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	st	%o7, %i0, 28
	call	o_isinvert.2641
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8484
	nop
	set	0, %i2
	retl
	nop
be_else.8484:
	ld	%i0, 4, %i2
	add	%i2, 1, %i2
	ld	%i0, 0, %i3
	b	shadow_check_and_group.2858
	nop
be_else.8483:
	set	l.6605, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 16, %f2
	faddd	%f2, %f0, %f0
	set	min_caml_light, %i2
	ldd	%i2, 0, %f2
	fmuld	%f2, %f0, %f2
	set	min_caml_intersection_point, %i2
	ldd	%i2, 0, %f4
	faddd	%f2, %f4, %f2
	set	min_caml_light, %i2
	ldd	%i2, 8, %f4
	fmuld	%f4, %f0, %f4
	set	min_caml_intersection_point, %i2
	ldd	%i2, 8, %f6
	faddd	%f4, %f6, %f4
	set	min_caml_light, %i2
	ldd	%i2, 16, %f6
	fmuld	%f6, %f0, %f0
	set	min_caml_intersection_point, %i2
	ldd	%i2, 16, %f6
	faddd	%f0, %f6, %f0
	set	0, %i2
	ld	%i0, 0, %i3
	fmovs	%f4, %f30
	fmovs	%f5, %f31
	fmovs	%f0, %f4
	fmovs	%f1, %f5
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f30, %f2
	fmovs	%f31, %f3
	st	%o7, %i0, 28
	call	check_all_inside.2852
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8485
	nop
	ld	%i0, 4, %i2
	add	%i2, 1, %i2
	ld	%i0, 0, %i3
	b	shadow_check_and_group.2858
	nop
be_else.8485:
	set	1, %i2
	retl
	nop
shadow_check_one_or_group.2861:
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i4
	cmp	%i4, -1
	bne	be_else.8486
	nop
	set	0, %i2
	retl
	nop
be_else.8486:
	set	min_caml_and_net, %i5
	sll	%i4, 2, %i4
	ld	%i5, %i4, %i4
	set	0, %i5
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	mov	%i4, %i3
	mov	%i5, %i2
	st	%o7, %i0, 12
	call	shadow_check_and_group.2858
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8487
	nop
	ld	%i0, 4, %i2
	add	%i2, 1, %i2
	ld	%i0, 0, %i3
	b	shadow_check_one_or_group.2861
	nop
be_else.8487:
	set	1, %i2
	retl
	nop
shadow_check_one_or_matrix.2864:
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i4
	ld	%i4, 0, %i5
	cmp	%i5, -1
	bne	be_else.8488
	nop
	set	0, %i2
	retl
	nop
be_else.8488:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	cmp	%i5, 99
	bne	be_else.8489
	nop
	set	1, %i2
	b	be_cont.8490
	nop
be_else.8489:
	set	min_caml_light_dirvec, %l0
	set	min_caml_intersection_point, %l1
	mov	%l1, %i4
	mov	%l0, %i3
	mov	%i5, %i2
	st	%o7, %i0, 12
	call	solver_fast.2792
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8491
	nop
	set	0, %i2
	b	be_cont.8492
	nop
be_else.8491:
	set	min_caml_solver_dist, %i2
	ldd	%i2, 0, %f0
	set	l.6619, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 12
	call	min_caml_fless
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8493
	nop
	set	0, %i2
	b	be_cont.8494
	nop
be_else.8493:
	set	1, %i2
	ld	%i0, 0, %i3
	st	%o7, %i0, 12
	call	shadow_check_one_or_group.2861
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8495
	nop
	set	0, %i2
	b	be_cont.8496
	nop
be_else.8495:
	set	1, %i2
be_cont.8496:
be_cont.8494:
be_cont.8492:
be_cont.8490:
	cmp	%i2, 0
	bne	be_else.8497
	nop
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	b	shadow_check_one_or_matrix.2864
	nop
be_else.8497:
	set	1, %i2
	ld	%i0, 0, %i3
	st	%o7, %i0, 12
	call	shadow_check_one_or_group.2861
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8498
	nop
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	b	shadow_check_one_or_matrix.2864
	nop
be_else.8498:
	set	1, %i2
	retl
	nop
solve_each_element.2867:
	sll	%i2, 2, %i5
	ld	%i3, %i5, %i5
	cmp	%i5, -1
	bne	be_else.8499
	nop
	retl
	nop
be_else.8499:
	set	min_caml_startp, %l0
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	st	%i5, %i0, 12
	mov	%i4, %i3
	mov	%i5, %i2
	mov	%l0, %i4
	st	%o7, %i0, 20
	call	solver.2769
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8501
	nop
	set	min_caml_objects, %i2
	ld	%i0, 12, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	st	%o7, %i0, 20
	call	o_isinvert.2641
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8502
	nop
	retl
	nop
be_else.8502:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_each_element.2867
	nop
be_else.8501:
	set	min_caml_solver_dist, %i3
	ldd	%i3, 0, %f2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 16
	std	%f2, %i0, 24
	st	%o7, %i0, 36
	call	min_caml_fless
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8505
	nop
	b	be_cont.8506
	nop
be_else.8505:
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	ldd	%i0, 24, %f0
	st	%o7, %i0, 36
	call	min_caml_fless
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8507
	nop
	b	be_cont.8508
	nop
be_else.8507:
	set	l.6605, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 24, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 0, %i2
	ldd	%i2, 0, %f2
	fmuld	%f2, %f0, %f2
	set	min_caml_startp, %i3
	ldd	%i3, 0, %f4
	faddd	%f2, %f4, %f2
	ldd	%i2, 8, %f4
	fmuld	%f4, %f0, %f4
	set	min_caml_startp, %i3
	ldd	%i3, 8, %f6
	faddd	%f4, %f6, %f4
	ldd	%i2, 16, %f6
	fmuld	%f6, %f0, %f6
	set	min_caml_startp, %i3
	ldd	%i3, 16, %f8
	faddd	%f6, %f8, %f6
	set	0, %i3
	ld	%i0, 4, %i4
	std	%f6, %i0, 32
	std	%f4, %i0, 40
	std	%f2, %i0, 48
	std	%f0, %i0, 56
	mov	%i3, %i2
	mov	%i4, %i3
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f4, %f2
	fmovs	%f5, %f3
	fmovs	%f6, %f4
	fmovs	%f7, %f5
	st	%o7, %i0, 68
	call	check_all_inside.2852
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 0
	bne	be_else.8509
	nop
	b	be_cont.8510
	nop
be_else.8509:
	set	min_caml_tmin, %i2
	ldd	%i0, 56, %f0
	std	%f0, %i2, 0
	set	min_caml_intersection_point, %i2
	ldd	%i0, 48, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 32, %f4
	st	%o7, %i0, 68
	call	vecset.2589
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	set	min_caml_intersected_object_id, %i2
	ld	%i0, 12, %i3
	st	%i3, %i2, 0
	set	min_caml_intsec_rectside, %i2
	ld	%i0, 16, %i3
	st	%i3, %i2, 0
be_cont.8510:
be_cont.8508:
be_cont.8506:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_each_element.2867
	nop
solve_one_or_network.2871:
	sll	%i2, 2, %i5
	ld	%i3, %i5, %i5
	cmp	%i5, -1
	bne	be_else.8511
	nop
	retl
	nop
be_else.8511:
	set	min_caml_and_net, %l0
	sll	%i5, 2, %i5
	ld	%l0, %i5, %i5
	set	0, %l0
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	mov	%i5, %i3
	mov	%l0, %i2
	st	%o7, %i0, 12
	call	solve_each_element.2867
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_one_or_network.2871
	nop
trace_or_matrix.2875:
	sll	%i2, 2, %i5
	ld	%i3, %i5, %i5
	ld	%i5, 0, %l0
	cmp	%l0, -1
	bne	be_else.8513
	nop
	retl
	nop
be_else.8513:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	cmp	%l0, 99
	bne	be_else.8515
	nop
	set	1, %l0
	mov	%i5, %i3
	mov	%l0, %i2
	st	%o7, %i0, 12
	call	solve_one_or_network.2871
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	b	be_cont.8516
	nop
be_else.8515:
	set	min_caml_startp, %l1
	st	%i5, %i0, 12
	mov	%i4, %i3
	mov	%l0, %i2
	mov	%l1, %i4
	st	%o7, %i0, 20
	call	solver.2769
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8517
	nop
	b	be_cont.8518
	nop
be_else.8517:
	set	min_caml_solver_dist, %i2
	ldd	%i2, 0, %f0
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 20
	call	min_caml_fless
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8519
	nop
	b	be_cont.8520
	nop
be_else.8519:
	set	1, %i2
	ld	%i0, 12, %i3
	ld	%i0, 0, %i4
	st	%o7, %i0, 20
	call	solve_one_or_network.2871
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
be_cont.8520:
be_cont.8518:
be_cont.8516:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	trace_or_matrix.2875
	nop
judge_intersection.2879:
	set	min_caml_tmin, %i3
	set	l.6642, %i4
	ldd	%i4, 0, %f0
	std	%f0, %i3, 0
	set	0, %i3
	set	min_caml_or_net, %i4
	ld	%i4, 0, %i4
	mov	%i4, %o4
	mov	%i2, %i4
	mov	%i3, %i2
	mov	%o4, %i3
	st	%o7, %i0, 4
	call	trace_or_matrix.2875
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	set	l.6619, %i2
	ldd	%i2, 0, %f0
	std	%f2, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_fless
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8521
	nop
	set	0, %i2
	retl
	nop
be_else.8521:
	set	l.6648, %i2
	ldd	%i2, 0, %f2
	ldd	%i0, 0, %f0
	b	min_caml_fless
	nop
solve_each_element_fast.2881:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	d_vec.2696
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i3
	sll	%i3, 2, %i4
	ld	%i0, 4, %i5
	ld	%i5, %i4, %i4
	cmp	%i4, -1
	bne	be_else.8522
	nop
	retl
	nop
be_else.8522:
	ld	%i0, 0, %l0
	st	%i2, %i0, 12
	st	%i4, %i0, 16
	mov	%l0, %i3
	mov	%i4, %i2
	st	%o7, %i0, 20
	call	solver_fast2.2810
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8524
	nop
	set	min_caml_objects, %i2
	ld	%i0, 16, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	st	%o7, %i0, 20
	call	o_isinvert.2641
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8525
	nop
	retl
	nop
be_else.8525:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_each_element_fast.2881
	nop
be_else.8524:
	set	min_caml_solver_dist, %i3
	ldd	%i3, 0, %f2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 20
	std	%f2, %i0, 24
	st	%o7, %i0, 36
	call	min_caml_fless
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8527
	nop
	b	be_cont.8528
	nop
be_else.8527:
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	ldd	%i0, 24, %f0
	st	%o7, %i0, 36
	call	min_caml_fless
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8529
	nop
	b	be_cont.8530
	nop
be_else.8529:
	set	l.6605, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 24, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 12, %i2
	ldd	%i2, 0, %f2
	fmuld	%f2, %f0, %f2
	set	min_caml_startp_fast, %i3
	ldd	%i3, 0, %f4
	faddd	%f2, %f4, %f2
	ldd	%i2, 8, %f4
	fmuld	%f4, %f0, %f4
	set	min_caml_startp_fast, %i3
	ldd	%i3, 8, %f6
	faddd	%f4, %f6, %f4
	ldd	%i2, 16, %f6
	fmuld	%f6, %f0, %f6
	set	min_caml_startp_fast, %i2
	ldd	%i2, 16, %f8
	faddd	%f6, %f8, %f6
	set	0, %i2
	ld	%i0, 4, %i3
	std	%f6, %i0, 32
	std	%f4, %i0, 40
	std	%f2, %i0, 48
	std	%f0, %i0, 56
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f4, %f2
	fmovs	%f5, %f3
	fmovs	%f6, %f4
	fmovs	%f7, %f5
	st	%o7, %i0, 68
	call	check_all_inside.2852
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	cmp	%i2, 0
	bne	be_else.8531
	nop
	b	be_cont.8532
	nop
be_else.8531:
	set	min_caml_tmin, %i2
	ldd	%i0, 56, %f0
	std	%f0, %i2, 0
	set	min_caml_intersection_point, %i2
	ldd	%i0, 48, %f0
	ldd	%i0, 40, %f2
	ldd	%i0, 32, %f4
	st	%o7, %i0, 68
	call	vecset.2589
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	set	min_caml_intersected_object_id, %i2
	ld	%i0, 16, %i3
	st	%i3, %i2, 0
	set	min_caml_intsec_rectside, %i2
	ld	%i0, 20, %i3
	st	%i3, %i2, 0
be_cont.8532:
be_cont.8530:
be_cont.8528:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_each_element_fast.2881
	nop
solve_one_or_network_fast.2885:
	sll	%i2, 2, %i5
	ld	%i3, %i5, %i5
	cmp	%i5, -1
	bne	be_else.8533
	nop
	retl
	nop
be_else.8533:
	set	min_caml_and_net, %l0
	sll	%i5, 2, %i5
	ld	%l0, %i5, %i5
	set	0, %l0
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	mov	%i5, %i3
	mov	%l0, %i2
	st	%o7, %i0, 12
	call	solve_each_element_fast.2881
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	solve_one_or_network_fast.2885
	nop
trace_or_matrix_fast.2889:
	sll	%i2, 2, %i5
	ld	%i3, %i5, %i5
	ld	%i5, 0, %l0
	cmp	%l0, -1
	bne	be_else.8535
	nop
	retl
	nop
be_else.8535:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	cmp	%l0, 99
	bne	be_else.8537
	nop
	set	1, %l0
	mov	%i5, %i3
	mov	%l0, %i2
	st	%o7, %i0, 12
	call	solve_one_or_network_fast.2885
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	b	be_cont.8538
	nop
be_else.8537:
	st	%i5, %i0, 12
	mov	%i4, %i3
	mov	%l0, %i2
	st	%o7, %i0, 20
	call	solver_fast2.2810
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8539
	nop
	b	be_cont.8540
	nop
be_else.8539:
	set	min_caml_solver_dist, %i2
	ldd	%i2, 0, %f0
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 20
	call	min_caml_fless
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8541
	nop
	b	be_cont.8542
	nop
be_else.8541:
	set	1, %i2
	ld	%i0, 12, %i3
	ld	%i0, 0, %i4
	st	%o7, %i0, 20
	call	solve_one_or_network_fast.2885
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
be_cont.8542:
be_cont.8540:
be_cont.8538:
	ld	%i0, 8, %i2
	add	%i2, 1, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	trace_or_matrix_fast.2889
	nop
judge_intersection_fast.2893:
	set	min_caml_tmin, %i3
	set	l.6642, %i4
	ldd	%i4, 0, %f0
	std	%f0, %i3, 0
	set	0, %i3
	set	min_caml_or_net, %i4
	ld	%i4, 0, %i4
	mov	%i4, %o4
	mov	%i2, %i4
	mov	%i3, %i2
	mov	%o4, %i3
	st	%o7, %i0, 4
	call	trace_or_matrix_fast.2889
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_tmin, %i2
	ldd	%i2, 0, %f2
	set	l.6619, %i2
	ldd	%i2, 0, %f0
	std	%f2, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_fless
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8543
	nop
	set	0, %i2
	retl
	nop
be_else.8543:
	set	l.6648, %i2
	ldd	%i2, 0, %f2
	ldd	%i0, 0, %f0
	b	min_caml_fless
	nop
get_nvector_rect.2895:
	set	min_caml_intsec_rectside, %i3
	ld	%i3, 0, %i3
	set	min_caml_nvector, %i4
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	vecbzero.2597
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	min_caml_nvector, %i2
	ld	%i0, 4, %i3
	sub	%i3, 1, %i4
	sub	%i3, 1, %i3
	sll	%i3, 3, %i3
	ld	%i0, 0, %i5
	ldd	%i5, %i3, %f0
	st	%i2, %i0, 8
	st	%i4, %i0, 12
	st	%o7, %i0, 20
	call	sgn.2581
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%o7, %i0, 20
	call	min_caml_fneg
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i2
	sll	%i2, 3, %i2
	ld	%i0, 8, %i3
	std	%f0, %i3, %i2
	retl
	nop
get_nvector_plane.2897:
	set	min_caml_nvector, %i3
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	o_param_a.2645
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%o7, %i0, 12
	call	min_caml_fneg
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	std	%f0, %i2, 0
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 8
	mov	%i3, %i2
	st	%o7, %i0, 12
	call	o_param_b.2647
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%o7, %i0, 12
	call	min_caml_fneg
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 8, %i2
	std	%f0, %i2, 8
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	o_param_c.2649
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%o7, %i0, 20
	call	min_caml_fneg
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i2
	std	%f0, %i2, 16
	retl
	nop
get_nvector_second.2899:
	set	min_caml_intersection_point, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 0
	std	%f0, %i0, 8
	st	%o7, %i0, 20
	call	o_param_x.2653
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	fsubd	%f2, %f0, %f0
	set	min_caml_intersection_point, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 0, %i2
	std	%f0, %i0, 16
	std	%f2, %i0, 24
	st	%o7, %i0, 36
	call	o_param_y.2655
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	fsubd	%f2, %f0, %f0
	set	min_caml_intersection_point, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 0, %i2
	std	%f0, %i0, 32
	std	%f2, %i0, 40
	st	%o7, %i0, 52
	call	o_param_z.2657
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	o_param_a.2645
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 56
	st	%o7, %i0, 68
	call	o_param_b.2647
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	o_param_c.2649
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 72
	st	%o7, %i0, 84
	call	o_isrot.2643
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	cmp	%i2, 0
	bne	be_else.8547
	nop
	set	min_caml_nvector, %i2
	ldd	%i0, 56, %f0
	std	%f0, %i2, 0
	set	min_caml_nvector, %i2
	ldd	%i0, 64, %f0
	std	%f0, %i2, 8
	set	min_caml_nvector, %i2
	ldd	%i0, 72, %f0
	std	%f0, %i2, 16
	b	be_cont.8548
	nop
be_else.8547:
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 80
	mov	%i3, %i2
	st	%o7, %i0, 84
	call	o_param_r3.2673
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 88
	st	%o7, %i0, 100
	call	o_param_r2.2671
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 88, %f4
	faddd	%f4, %f0, %f0
	st	%o7, %i0, 100
	call	min_caml_fhalf
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 56, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 80, %i2
	std	%f0, %i2, 0
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 96
	mov	%i3, %i2
	st	%o7, %i0, 100
	call	o_param_r3.2673
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 104
	st	%o7, %i0, 116
	call	o_param_r1.2669
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 104, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 116
	call	min_caml_fhalf
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 64, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 96, %i2
	std	%f0, %i2, 8
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 112
	mov	%i3, %i2
	st	%o7, %i0, 116
	call	o_param_r2.2671
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i0, 120
	st	%o7, %i0, 132
	call	o_param_r1.2669
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 120, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 132
	call	min_caml_fhalf
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	ldd	%i0, 72, %f2
	faddd	%f2, %f0, %f0
	ld	%i0, 112, %i2
	std	%f0, %i2, 16
be_cont.8548:
	set	min_caml_nvector, %i2
	ld	%i0, 0, %i3
	st	%i2, %i0, 128
	mov	%i3, %i2
	st	%o7, %i0, 132
	call	o_isinvert.2641
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	mov	%i2, %i3
	ld	%i0, 128, %i2
	b	vecunit_sgn.2607
	nop
get_nvector.2901:
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	o_form.2637
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 1
	bne	be_else.8552
	nop
	ld	%i0, 4, %i2
	b	get_nvector_rect.2895
	nop
be_else.8552:
	cmp	%i2, 2
	bne	be_else.8553
	nop
	ld	%i0, 0, %i2
	b	get_nvector_plane.2897
	nop
be_else.8553:
	ld	%i0, 0, %i2
	b	get_nvector_second.2899
	nop
utexture.2904:
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	o_texturetype.2635
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	min_caml_texture_color, %i3
	ld	%i0, 4, %i4
	st	%i2, %i0, 8
	st	%i3, %i0, 12
	mov	%i4, %i2
	st	%o7, %i0, 20
	call	o_color_red.2663
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i2
	std	%f0, %i2, 0
	set	min_caml_texture_color, %i2
	ld	%i0, 4, %i3
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	o_color_green.2665
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i2
	std	%f0, %i2, 8
	set	min_caml_texture_color, %i2
	ld	%i0, 4, %i3
	st	%i2, %i0, 20
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	o_color_blue.2667
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i2
	std	%f0, %i2, 16
	ld	%i0, 8, %i2
	cmp	%i2, 1
	bne	be_else.8554
	nop
	ld	%i0, 0, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 4, %i3
	std	%f0, %i0, 24
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	o_param_x.2653
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	fsubd	%f2, %f0, %f0
	set	l.6740, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f2
	std	%f0, %i0, 32
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 44
	call	min_caml_floor
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	set	l.6742, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i0, 32, %f2
	fsubd	%f2, %f0, %f0
	set	l.6723, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 44
	call	min_caml_fless
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 0, %i3
	ldd	%i3, 16, %f0
	ld	%i0, 4, %i3
	st	%i2, %i0, 40
	std	%f0, %i0, 48
	mov	%i3, %i2
	st	%o7, %i0, 60
	call	o_param_z.2657
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fsubd	%f2, %f0, %f0
	set	l.6740, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f2
	std	%f0, %i0, 56
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 68
	call	min_caml_floor
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	set	l.6742, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i0, 56, %f2
	fsubd	%f2, %f0, %f0
	set	l.6723, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 68
	call	min_caml_fless
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	set	min_caml_texture_color, %i3
	ld	%i0, 40, %i4
	cmp	%i4, 0
	bne	be_else.8556
	nop
	cmp	%i2, 0
	bne	be_else.8558
	nop
	set	l.6716, %i2
	ldd	%i2, 0, %f0
	b	be_cont.8559
	nop
be_else.8558:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
be_cont.8559:
	b	be_cont.8557
	nop
be_else.8556:
	cmp	%i2, 0
	bne	be_else.8560
	nop
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	b	be_cont.8561
	nop
be_else.8560:
	set	l.6716, %i2
	ldd	%i2, 0, %f0
be_cont.8561:
be_cont.8557:
	std	%f0, %i3, 8
	retl
	nop
be_else.8554:
	cmp	%i2, 2
	bne	be_else.8563
	nop
	ld	%i0, 0, %i2
	ldd	%i2, 8, %f0
	set	l.6732, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	st	%o7, %i0, 68
	call	min_caml_sin
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	st	%o7, %i0, 68
	call	min_caml_fsqr
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	set	min_caml_texture_color, %i2
	set	l.6716, %i3
	ldd	%i3, 0, %f2
	fmuld	%f2, %f0, %f2
	std	%f2, %i2, 0
	set	min_caml_texture_color, %i2
	set	l.6716, %i3
	ldd	%i3, 0, %f2
	set	l.6249, %i3
	ldd	%i3, 0, %f4
	fsubd	%f4, %f0, %f0
	fmuld	%f2, %f0, %f0
	std	%f0, %i2, 8
	retl
	nop
be_else.8563:
	cmp	%i2, 3
	bne	be_else.8565
	nop
	ld	%i0, 0, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 4, %i3
	std	%f0, %i0, 64
	mov	%i3, %i2
	st	%o7, %i0, 76
	call	o_param_x.2653
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 0, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 4, %i2
	std	%f0, %i0, 72
	std	%f2, %i0, 80
	st	%o7, %i0, 92
	call	o_param_z.2657
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 80, %f2
	fsubd	%f2, %f0, %f0
	ldd	%i0, 72, %f2
	std	%f0, %i0, 88
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 100
	call	min_caml_fsqr
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 88, %f2
	std	%f0, %i0, 96
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 108
	call	min_caml_fsqr
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ldd	%i0, 96, %f2
	faddd	%f2, %f0, %f0
	st	%o7, %i0, 108
	call	min_caml_sqrt
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	set	l.6723, %i2
	ldd	%i2, 0, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i0, 104
	st	%o7, %i0, 116
	call	min_caml_floor
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 104, %f2
	fsubd	%f2, %f0, %f0
	set	l.6703, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	st	%o7, %i0, 116
	call	min_caml_cos
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	st	%o7, %i0, 116
	call	min_caml_fsqr
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	set	min_caml_texture_color, %i2
	set	l.6716, %i3
	ldd	%i3, 0, %f2
	fmuld	%f0, %f2, %f2
	std	%f2, %i2, 8
	set	min_caml_texture_color, %i2
	set	l.6249, %i3
	ldd	%i3, 0, %f2
	fsubd	%f2, %f0, %f0
	set	l.6716, %i3
	ldd	%i3, 0, %f2
	fmuld	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
be_else.8565:
	cmp	%i2, 4
	bne	be_else.8567
	nop
	ld	%i0, 0, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 4, %i3
	std	%f0, %i0, 112
	mov	%i3, %i2
	st	%o7, %i0, 124
	call	o_param_x.2653
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 112, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	std	%f0, %i0, 120
	st	%o7, %i0, 132
	call	o_param_a.2645
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	st	%o7, %i0, 132
	call	min_caml_sqrt
	add	%i0, 136, %i0
	sub	%i0, 136, %i0
	ld	%i0, 132, %o7
	ldd	%i0, 120, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 0, %i2
	ldd	%i2, 16, %f2
	ld	%i0, 4, %i3
	std	%f0, %i0, 128
	std	%f2, %i0, 136
	mov	%i3, %i2
	st	%o7, %i0, 148
	call	o_param_z.2657
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ldd	%i0, 136, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	std	%f0, %i0, 144
	st	%o7, %i0, 156
	call	o_param_c.2649
	add	%i0, 160, %i0
	sub	%i0, 160, %i0
	ld	%i0, 156, %o7
	st	%o7, %i0, 156
	call	min_caml_sqrt
	add	%i0, 160, %i0
	sub	%i0, 160, %i0
	ld	%i0, 156, %o7
	ldd	%i0, 144, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 128, %f2
	std	%f0, %i0, 152
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 164
	call	min_caml_fsqr
	add	%i0, 168, %i0
	sub	%i0, 168, %i0
	ld	%i0, 164, %o7
	ldd	%i0, 152, %f2
	std	%f0, %i0, 160
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 172
	call	min_caml_fsqr
	add	%i0, 176, %i0
	sub	%i0, 176, %i0
	ld	%i0, 172, %o7
	ldd	%i0, 160, %f2
	faddd	%f2, %f0, %f0
	ldd	%i0, 128, %f2
	std	%f0, %i0, 168
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 180
	call	min_caml_fabs
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	set	l.6697, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 180
	call	min_caml_fless
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	cmp	%i2, 0
	bne	be_else.8568
	nop
	ldd	%i0, 128, %f0
	ldd	%i0, 152, %f2
	fdivd	%f2, %f0, %f0
	st	%o7, %i0, 180
	call	min_caml_fabs
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	st	%o7, %i0, 180
	call	min_caml_atan
	add	%i0, 184, %i0
	sub	%i0, 184, %i0
	ld	%i0, 180, %o7
	set	l.6701, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	l.6703, %i2
	ldd	%i2, 0, %f2
	fdivd	%f0, %f2, %f0
	b	be_cont.8569
	nop
be_else.8568:
	set	l.6699, %i2
	ldd	%i2, 0, %f0
be_cont.8569:
	std	%f0, %i0, 176
	st	%o7, %i0, 188
	call	min_caml_floor
	add	%i0, 192, %i0
	sub	%i0, 192, %i0
	ld	%i0, 188, %o7
	ldd	%i0, 176, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 0, %i2
	ldd	%i2, 8, %f2
	ld	%i0, 4, %i2
	std	%f0, %i0, 184
	std	%f2, %i0, 192
	st	%o7, %i0, 204
	call	o_param_y.2655
	add	%i0, 208, %i0
	sub	%i0, 208, %i0
	ld	%i0, 204, %o7
	ldd	%i0, 192, %f2
	fsubd	%f2, %f0, %f0
	ld	%i0, 4, %i2
	std	%f0, %i0, 200
	st	%o7, %i0, 212
	call	o_param_b.2647
	add	%i0, 216, %i0
	sub	%i0, 216, %i0
	ld	%i0, 212, %o7
	st	%o7, %i0, 212
	call	min_caml_sqrt
	add	%i0, 216, %i0
	sub	%i0, 216, %i0
	ld	%i0, 212, %o7
	ldd	%i0, 200, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 168, %f2
	std	%f0, %i0, 208
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 220
	call	min_caml_fabs
	add	%i0, 224, %i0
	sub	%i0, 224, %i0
	ld	%i0, 220, %o7
	set	l.6697, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 220
	call	min_caml_fless
	add	%i0, 224, %i0
	sub	%i0, 224, %i0
	ld	%i0, 220, %o7
	cmp	%i2, 0
	bne	be_else.8570
	nop
	ldd	%i0, 168, %f0
	ldd	%i0, 208, %f2
	fdivd	%f2, %f0, %f0
	st	%o7, %i0, 220
	call	min_caml_fabs
	add	%i0, 224, %i0
	sub	%i0, 224, %i0
	ld	%i0, 220, %o7
	st	%o7, %i0, 220
	call	min_caml_atan
	add	%i0, 224, %i0
	sub	%i0, 224, %i0
	ld	%i0, 220, %o7
	set	l.6701, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	l.6703, %i2
	ldd	%i2, 0, %f2
	fdivd	%f0, %f2, %f0
	b	be_cont.8571
	nop
be_else.8570:
	set	l.6699, %i2
	ldd	%i2, 0, %f0
be_cont.8571:
	std	%f0, %i0, 216
	st	%o7, %i0, 228
	call	min_caml_floor
	add	%i0, 232, %i0
	sub	%i0, 232, %i0
	ld	%i0, 228, %o7
	ldd	%i0, 216, %f2
	fsubd	%f2, %f0, %f0
	set	l.6710, %i2
	ldd	%i2, 0, %f2
	set	l.6712, %i2
	ldd	%i2, 0, %f4
	ldd	%i0, 184, %f6
	fsubd	%f4, %f6, %f4
	std	%f0, %i0, 224
	std	%f2, %i0, 232
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	st	%o7, %i0, 244
	call	min_caml_fsqr
	add	%i0, 248, %i0
	sub	%i0, 248, %i0
	ld	%i0, 244, %o7
	ldd	%i0, 232, %f2
	fsubd	%f2, %f0, %f0
	set	l.6712, %i2
	ldd	%i2, 0, %f2
	ldd	%i0, 224, %f4
	fsubd	%f2, %f4, %f2
	std	%f0, %i0, 240
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 252
	call	min_caml_fsqr
	add	%i0, 256, %i0
	sub	%i0, 256, %i0
	ld	%i0, 252, %o7
	ldd	%i0, 240, %f2
	fsubd	%f2, %f0, %f0
	std	%f0, %i0, 248
	st	%o7, %i0, 260
	call	min_caml_fisneg
	add	%i0, 264, %i0
	sub	%i0, 264, %i0
	ld	%i0, 260, %o7
	cmp	%i2, 0
	bne	be_else.8572
	nop
	ldd	%i0, 248, %f0
	b	be_cont.8573
	nop
be_else.8572:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
be_cont.8573:
	set	min_caml_texture_color, %i2
	set	l.6716, %i3
	ldd	%i3, 0, %f2
	fmuld	%f2, %f0, %f0
	set	l.6718, %i3
	ldd	%i3, 0, %f2
	fdivd	%f0, %f2, %f0
	std	%f0, %i2, 16
	retl
	nop
be_else.8567:
	retl
	nop
add_light.2907:
	std	%f4, %i0, 0
	std	%f2, %i0, 8
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	min_caml_fispos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8576
	nop
	b	be_cont.8577
	nop
be_else.8576:
	set	min_caml_rgb, %i2
	set	min_caml_texture_color, %i3
	ldd	%i0, 16, %f0
	st	%o7, %i0, 28
	call	vecaccum.2618
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
be_cont.8577:
	ldd	%i0, 8, %f0
	st	%o7, %i0, 28
	call	min_caml_fispos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8578
	nop
	retl
	nop
be_else.8578:
	ldd	%i0, 8, %f0
	st	%o7, %i0, 28
	call	min_caml_fsqr
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%o7, %i0, 28
	call	min_caml_fsqr
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 0, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 0, %f2
	faddd	%f2, %f0, %f2
	std	%f2, %i2, 0
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 8, %f2
	faddd	%f2, %f0, %f2
	std	%f2, %i2, 8
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 16, %f2
	faddd	%f2, %f0, %f0
	std	%f0, %i2, 16
	retl
	nop
trace_reflections.2911:
	cmp	%i2, 0
	bl	bge_else.8581
	nop
	set	min_caml_reflections, %i4
	sll	%i2, 2, %i5
	ld	%i4, %i5, %i4
	st	%i2, %i0, 0
	std	%f2, %i0, 8
	st	%i3, %i0, 16
	std	%f0, %i0, 24
	st	%i4, %i0, 32
	mov	%i4, %i2
	st	%o7, %i0, 36
	call	r_dvec.2702
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	st	%i2, %i0, 36
	st	%o7, %i0, 44
	call	judge_intersection_fast.2893
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8584
	nop
	b	be_cont.8585
	nop
be_else.8584:
	set	min_caml_intersected_object_id, %i2
	ld	%i2, 0, %i2
	set	4, %i3
	st	%o7, %i0, 44
	call	min_caml_imul
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	set	min_caml_intsec_rectside, %i3
	ld	%i3, 0, %i3
	add	%i2, %i3, %i2
	ld	%i0, 32, %i3
	st	%i2, %i0, 40
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	r_surface_id.2700
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 40, %i3
	cmp	%i3, %i2
	bne	be_else.8586
	nop
	set	0, %i2
	set	min_caml_or_net, %i3
	ld	%i3, 0, %i3
	st	%o7, %i0, 44
	call	shadow_check_one_or_matrix.2864
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	cmp	%i2, 0
	bne	be_else.8588
	nop
	set	min_caml_nvector, %i2
	ld	%i0, 36, %i3
	st	%i2, %i0, 44
	mov	%i3, %i2
	st	%o7, %i0, 52
	call	d_vec.2696
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	mov	%i2, %i3
	ld	%i0, 44, %i2
	st	%o7, %i0, 52
	call	veciprod.2610
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 32, %i2
	std	%f0, %i0, 48
	st	%o7, %i0, 60
	call	r_bright.2704
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 24, %f2
	fmuld	%f0, %f2, %f4
	ldd	%i0, 48, %f6
	fmuld	%f4, %f6, %f4
	ld	%i0, 36, %i2
	std	%f4, %i0, 56
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	d_vec.2696
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	mov	%i2, %i3
	ld	%i0, 16, %i2
	st	%o7, %i0, 76
	call	veciprod.2610
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	fmuld	%f2, %f0, %f2
	ldd	%i0, 56, %f0
	ldd	%i0, 8, %f4
	st	%o7, %i0, 76
	call	add_light.2907
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	b	be_cont.8589
	nop
be_else.8588:
be_cont.8589:
	b	be_cont.8587
	nop
be_else.8586:
be_cont.8587:
be_cont.8585:
	ld	%i0, 0, %i2
	sub	%i2, 1, %i2
	ldd	%i0, 24, %f0
	ldd	%i0, 8, %f2
	ld	%i0, 16, %i3
	b	trace_reflections.2911
	nop
bge_else.8581:
	retl
	nop
trace_ray.2916:
	cmp	%i2, 4
	bg	ble_else.8591
	nop
	std	%f2, %i0, 0
	st	%i4, %i0, 8
	std	%f0, %i0, 16
	st	%i2, %i0, 24
	st	%i3, %i0, 28
	mov	%i4, %i2
	st	%o7, %i0, 36
	call	p_surface_ids.2681
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 28, %i3
	st	%i2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	judge_intersection.2879
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	cmp	%i2, 0
	bne	be_else.8593
	nop
	set	-1, %i2
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i0, 32, %i5
	st	%i2, %i5, %i4
	cmp	%i3, 0
	bne	be_else.8594
	nop
	retl
	nop
be_else.8594:
	set	min_caml_light, %i3
	ld	%i0, 28, %i2
	st	%o7, %i0, 36
	call	veciprod.2610
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	st	%o7, %i0, 36
	call	min_caml_fneg
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	std	%f0, %i0, 40
	st	%o7, %i0, 52
	call	min_caml_fispos
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	cmp	%i2, 0
	bne	be_else.8597
	nop
	retl
	nop
be_else.8597:
	ldd	%i0, 40, %f0
	st	%o7, %i0, 52
	call	min_caml_fsqr
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i0, 16, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_beam, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 0, %f2
	faddd	%f2, %f0, %f2
	std	%f2, %i2, 0
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 8, %f2
	faddd	%f2, %f0, %f2
	std	%f2, %i2, 8
	set	min_caml_rgb, %i2
	set	min_caml_rgb, %i3
	ldd	%i3, 16, %f2
	faddd	%f2, %f0, %f0
	std	%f0, %i2, 16
	retl
	nop
be_else.8593:
	set	min_caml_intersected_object_id, %i2
	ld	%i2, 0, %i2
	set	min_caml_objects, %i3
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i3
	st	%i2, %i0, 48
	st	%i3, %i0, 52
	mov	%i3, %i2
	st	%o7, %i0, 60
	call	o_reflectiontype.2639
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 52, %i3
	st	%i2, %i0, 56
	mov	%i3, %i2
	st	%o7, %i0, 60
	call	o_diffuse.2659
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 16, %f2
	fmuld	%f0, %f2, %f0
	ld	%i0, 52, %i2
	ld	%i0, 28, %i3
	std	%f0, %i0, 64
	st	%o7, %i0, 76
	call	get_nvector.2901
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	set	min_caml_startp, %i2
	set	min_caml_intersection_point, %i3
	st	%o7, %i0, 76
	call	veccpy.2599
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	set	min_caml_intersection_point, %i3
	ld	%i0, 52, %i2
	st	%o7, %i0, 76
	call	utexture.2904
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	set	4, %i3
	ld	%i0, 48, %i2
	st	%o7, %i0, 76
	call	min_caml_imul
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	set	min_caml_intsec_rectside, %i3
	ld	%i3, 0, %i3
	add	%i2, %i3, %i2
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i0, 32, %i5
	st	%i2, %i5, %i4
	ld	%i0, 8, %i2
	st	%o7, %i0, 76
	call	p_intersection_points.2679
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	set	min_caml_intersection_point, %i4
	mov	%i4, %i3
	st	%o7, %i0, 76
	call	veccpy.2599
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 8, %i2
	st	%o7, %i0, 76
	call	p_calc_diffuse.2683
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 52, %i3
	st	%i2, %i0, 72
	mov	%i3, %i2
	st	%o7, %i0, 76
	call	o_diffuse.2659
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	set	l.6712, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 76
	call	min_caml_fless
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	cmp	%i2, 0
	bne	be_else.8601
	nop
	set	1, %i2
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i0, 72, %i5
	st	%i2, %i5, %i4
	ld	%i0, 8, %i2
	st	%o7, %i0, 76
	call	p_energy.2685
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i4
	set	min_caml_texture_color, %i5
	st	%i2, %i0, 76
	mov	%i5, %i3
	mov	%i4, %i2
	st	%o7, %i0, 84
	call	veccpy.2599
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ld	%i0, 24, %i2
	sll	%i2, 2, %i3
	ld	%i0, 76, %i4
	ld	%i4, %i3, %i3
	set	l.6774, %i4
	ldd	%i4, 0, %f0
	ldd	%i0, 64, %f2
	fmuld	%f0, %f2, %f0
	mov	%i3, %i2
	st	%o7, %i0, 84
	call	vecscale.2628
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ld	%i0, 8, %i2
	st	%o7, %i0, 84
	call	p_nvectors.2694
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	set	min_caml_nvector, %i4
	mov	%i4, %i3
	st	%o7, %i0, 84
	call	veccpy.2599
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	b	be_cont.8602
	nop
be_else.8601:
	set	0, %i2
	ld	%i0, 24, %i3
	sll	%i3, 2, %i4
	ld	%i0, 72, %i5
	st	%i2, %i5, %i4
be_cont.8602:
	set	l.6777, %i2
	ldd	%i2, 0, %f0
	set	min_caml_nvector, %i3
	ld	%i0, 28, %i2
	std	%f0, %i0, 80
	st	%o7, %i0, 92
	call	veciprod.2610
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 80, %f2
	fmuld	%f2, %f0, %f0
	set	min_caml_nvector, %i3
	ld	%i0, 28, %i2
	st	%o7, %i0, 92
	call	vecaccum.2618
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ld	%i0, 52, %i2
	st	%o7, %i0, 92
	call	o_hilight.2661
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	set	0, %i2
	set	min_caml_or_net, %i3
	ld	%i3, 0, %i3
	std	%f0, %i0, 88
	st	%o7, %i0, 100
	call	shadow_check_one_or_matrix.2864
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	cmp	%i2, 0
	bne	be_else.8603
	nop
	set	min_caml_nvector, %i2
	set	min_caml_light, %i3
	st	%o7, %i0, 100
	call	veciprod.2610
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	st	%o7, %i0, 100
	call	min_caml_fneg
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 64, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_light, %i3
	ld	%i0, 28, %i2
	std	%f0, %i0, 96
	st	%o7, %i0, 108
	call	veciprod.2610
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	st	%o7, %i0, 108
	call	min_caml_fneg
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 96, %f0
	ldd	%i0, 88, %f4
	st	%o7, %i0, 108
	call	add_light.2907
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	b	be_cont.8604
	nop
be_else.8603:
be_cont.8604:
	set	min_caml_intersection_point, %i2
	st	%o7, %i0, 108
	call	setup_startp.2830
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	set	min_caml_n_reflections, %i2
	ld	%i2, 0, %i2
	sub	%i2, 1, %i2
	ldd	%i0, 64, %f0
	ldd	%i0, 88, %f2
	ld	%i0, 28, %i3
	st	%o7, %i0, 108
	call	trace_reflections.2911
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	set	l.6781, %i2
	ldd	%i2, 0, %f0
	ldd	%i0, 16, %f2
	st	%o7, %i0, 108
	call	min_caml_fless
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	cmp	%i2, 0
	bne	be_else.8605
	nop
	retl
	nop
be_else.8605:
	ld	%i0, 24, %i2
	cmp	%i2, 4
	bl	bge_else.8607
	nop
	b	bge_cont.8608
	nop
bge_else.8607:
	add	%i2, 1, %i3
	set	-1, %i4
	sll	%i3, 2, %i3
	ld	%i0, 32, %i5
	st	%i4, %i5, %i3
bge_cont.8608:
	ld	%i0, 56, %i3
	cmp	%i3, 2
	bne	be_else.8609
	nop
	set	l.6249, %i3
	ldd	%i3, 0, %f0
	ld	%i0, 52, %i3
	std	%f0, %i0, 104
	mov	%i3, %i2
	st	%o7, %i0, 116
	call	o_diffuse.2659
	add	%i0, 120, %i0
	sub	%i0, 120, %i0
	ld	%i0, 116, %o7
	ldd	%i0, 104, %f2
	fsubd	%f2, %f0, %f0
	ldd	%i0, 16, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 24, %i2
	add	%i2, 1, %i2
	set	min_caml_tmin, %i3
	ldd	%i3, 0, %f2
	ldd	%i0, 0, %f4
	faddd	%f4, %f2, %f2
	ld	%i0, 28, %i3
	ld	%i0, 8, %i4
	b	trace_ray.2916
	nop
be_else.8609:
	retl
	nop
ble_else.8591:
	retl
	nop
trace_diffuse_ray.2922:
	std	%f0, %i0, 0
	st	%i2, %i0, 8
	st	%o7, %i0, 12
	call	judge_intersection_fast.2893
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8612
	nop
	retl
	nop
be_else.8612:
	set	min_caml_objects, %i2
	set	min_caml_intersected_object_id, %i3
	ld	%i3, 0, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	ld	%i0, 8, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	d_vec.2696
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	mov	%i2, %i3
	ld	%i0, 12, %i2
	st	%o7, %i0, 20
	call	get_nvector.2901
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	min_caml_intersection_point, %i3
	ld	%i0, 12, %i2
	st	%o7, %i0, 20
	call	utexture.2904
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	0, %i2
	set	min_caml_or_net, %i3
	ld	%i3, 0, %i3
	st	%o7, %i0, 20
	call	shadow_check_one_or_matrix.2864
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	cmp	%i2, 0
	bne	be_else.8614
	nop
	set	min_caml_nvector, %i2
	set	min_caml_light, %i3
	st	%o7, %i0, 20
	call	veciprod.2610
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%o7, %i0, 20
	call	min_caml_fneg
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	min_caml_fispos
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8615
	nop
	set	l.6247, %i2
	ldd	%i2, 0, %f0
	b	be_cont.8616
	nop
be_else.8615:
	ldd	%i0, 16, %f0
be_cont.8616:
	set	min_caml_diffuse_ray, %i2
	ldd	%i0, 0, %f2
	fmuld	%f2, %f0, %f0
	ld	%i0, 12, %i3
	st	%i2, %i0, 24
	std	%f0, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 44
	call	o_diffuse.2659
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f2
	fmuld	%f2, %f0, %f0
	set	min_caml_texture_color, %i3
	ld	%i0, 24, %i2
	b	vecaccum.2618
	nop
be_else.8614:
	retl
	nop
iter_trace_diffuse_rays.2925:
	cmp	%i5, 0
	bl	bge_else.8619
	nop
	sll	%i5, 2, %l0
	ld	%i2, %l0, %l0
	st	%i4, %i0, 0
	st	%i2, %i0, 4
	st	%i5, %i0, 8
	st	%i3, %i0, 12
	mov	%l0, %i2
	st	%o7, %i0, 20
	call	d_vec.2696
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i3
	st	%o7, %i0, 20
	call	veciprod.2610
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	std	%f0, %i0, 16
	st	%o7, %i0, 28
	call	min_caml_fisneg
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8620
	nop
	ld	%i0, 8, %i2
	sll	%i2, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	set	l.6803, %i5
	ldd	%i5, 0, %f0
	ldd	%i0, 16, %f2
	fdivd	%f2, %f0, %f0
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	trace_diffuse_ray.2922
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	b	be_cont.8621
	nop
be_else.8620:
	ld	%i0, 8, %i2
	add	%i2, 1, %i3
	sll	%i3, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	set	l.6800, %i5
	ldd	%i5, 0, %f0
	ldd	%i0, 16, %f2
	fdivd	%f2, %f0, %f0
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	trace_diffuse_ray.2922
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
be_cont.8621:
	ld	%i0, 8, %i2
	sub	%i2, 2, %i5
	ld	%i0, 4, %i2
	ld	%i0, 12, %i3
	ld	%i0, 0, %i4
	b	iter_trace_diffuse_rays.2925
	nop
bge_else.8619:
	retl
	nop
trace_diffuse_rays.2930:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	setup_startp.2830
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	118, %i5
	ld	%i0, 8, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	iter_trace_diffuse_rays.2925
	nop
trace_diffuse_ray_80percent.2934:
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	cmp	%i2, 0
	bne	be_else.8623
	nop
	b	be_cont.8624
	nop
be_else.8623:
	set	min_caml_dirvecs, %i5
	ld	%i5, 0, %i5
	mov	%i5, %i2
	st	%o7, %i0, 12
	call	trace_diffuse_rays.2930
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
be_cont.8624:
	ld	%i0, 8, %i2
	cmp	%i2, 1
	bne	be_else.8625
	nop
	b	be_cont.8626
	nop
be_else.8625:
	set	min_caml_dirvecs, %i3
	ld	%i3, 4, %i3
	ld	%i0, 4, %i4
	ld	%i0, 0, %i5
	mov	%i3, %i2
	mov	%i4, %i3
	mov	%i5, %i4
	st	%o7, %i0, 12
	call	trace_diffuse_rays.2930
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
be_cont.8626:
	ld	%i0, 8, %i2
	cmp	%i2, 2
	bne	be_else.8627
	nop
	b	be_cont.8628
	nop
be_else.8627:
	set	min_caml_dirvecs, %i3
	ld	%i3, 8, %i3
	ld	%i0, 4, %i4
	ld	%i0, 0, %i5
	mov	%i3, %i2
	mov	%i4, %i3
	mov	%i5, %i4
	st	%o7, %i0, 12
	call	trace_diffuse_rays.2930
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
be_cont.8628:
	ld	%i0, 8, %i2
	cmp	%i2, 3
	bne	be_else.8629
	nop
	b	be_cont.8630
	nop
be_else.8629:
	set	min_caml_dirvecs, %i3
	ld	%i3, 12, %i3
	ld	%i0, 4, %i4
	ld	%i0, 0, %i5
	mov	%i3, %i2
	mov	%i4, %i3
	mov	%i5, %i4
	st	%o7, %i0, 12
	call	trace_diffuse_rays.2930
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
be_cont.8630:
	ld	%i0, 8, %i2
	cmp	%i2, 4
	bne	be_else.8631
	nop
	retl
	nop
be_else.8631:
	set	min_caml_dirvecs, %i2
	ld	%i2, 16, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	trace_diffuse_rays.2930
	nop
calc_diffuse_using_1point.2938:
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	p_received_ray_20percent.2687
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	st	%i2, %i0, 8
	mov	%i3, %i2
	st	%o7, %i0, 12
	call	p_nvectors.2694
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	p_intersection_points.2679
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i3
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	p_energy.2685
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	min_caml_diffuse_ray, %i3
	ld	%i0, 0, %i4
	sll	%i4, 2, %i5
	ld	%i0, 8, %l0
	ld	%l0, %i5, %i5
	st	%i2, %i0, 20
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 28
	call	veccpy.2599
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 4, %i2
	st	%o7, %i0, 28
	call	p_group_id.2689
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 12, %i5
	ld	%i5, %i4, %i4
	sll	%i3, 2, %i5
	ld	%i0, 16, %l0
	ld	%l0, %i5, %i5
	mov	%i4, %i3
	mov	%i5, %i4
	st	%o7, %i0, 28
	call	trace_diffuse_ray_80percent.2934
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	min_caml_rgb, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i3
	ld	%i0, 20, %i4
	ld	%i4, %i3, %i3
	set	min_caml_diffuse_ray, %i4
	b	vecaccumv.2631
	nop
calc_diffuse_using_5points.2941:
	sll	%i2, 2, %l1
	ld	%i3, %l1, %i3
	st	%l0, %i0, 0
	st	%i5, %i0, 4
	st	%i4, %i0, 8
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	p_received_ray_20percent.2687
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i3
	sub	%i3, 1, %i4
	sll	%i4, 2, %i4
	ld	%i0, 8, %i5
	ld	%i5, %i4, %i4
	st	%i2, %i0, 16
	mov	%i4, %i2
	st	%o7, %i0, 20
	call	p_received_ray_20percent.2687
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i3
	sll	%i3, 2, %i4
	ld	%i0, 8, %i5
	ld	%i5, %i4, %i4
	st	%i2, %i0, 20
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	p_received_ray_20percent.2687
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 12, %i3
	add	%i3, 1, %i4
	sll	%i4, 2, %i4
	ld	%i0, 8, %i5
	ld	%i5, %i4, %i4
	st	%i2, %i0, 24
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	p_received_ray_20percent.2687
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 12, %i3
	sll	%i3, 2, %i4
	ld	%i0, 4, %i5
	ld	%i5, %i4, %i4
	st	%i2, %i0, 28
	mov	%i4, %i2
	st	%o7, %i0, 36
	call	p_received_ray_20percent.2687
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_diffuse_ray, %i3
	ld	%i0, 0, %i4
	sll	%i4, 2, %i5
	ld	%i0, 16, %l0
	ld	%l0, %i5, %i5
	st	%i2, %i0, 32
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 36
	call	veccpy.2599
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_diffuse_ray, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 20, %i5
	ld	%i5, %i4, %i4
	mov	%i4, %i3
	st	%o7, %i0, 36
	call	vecadd.2622
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_diffuse_ray, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 24, %i5
	ld	%i5, %i4, %i4
	mov	%i4, %i3
	st	%o7, %i0, 36
	call	vecadd.2622
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_diffuse_ray, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 28, %i5
	ld	%i5, %i4, %i4
	mov	%i4, %i3
	st	%o7, %i0, 36
	call	vecadd.2622
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_diffuse_ray, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i0, 32, %i5
	ld	%i5, %i4, %i4
	mov	%i4, %i3
	st	%o7, %i0, 36
	call	vecadd.2622
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 12, %i2
	sll	%i2, 2, %i2
	ld	%i0, 8, %i3
	ld	%i3, %i2, %i2
	st	%o7, %i0, 36
	call	p_energy.2685
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_rgb, %i3
	ld	%i0, 0, %i4
	sll	%i4, 2, %i4
	ld	%i2, %i4, %i2
	set	min_caml_diffuse_ray, %i4
	mov	%i3, %o4
	mov	%i2, %i3
	mov	%o4, %i2
	b	vecaccumv.2631
	nop
do_without_neighbors.2947:
	cmp	%i3, 4
	bg	ble_else.8633
	nop
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	p_surface_ids.2681
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	cmp	%i2, 0
	bl	bge_else.8634
	nop
	ld	%i0, 0, %i2
	st	%o7, %i0, 12
	call	p_calc_diffuse.2683
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	cmp	%i2, 0
	bne	be_else.8635
	nop
	b	be_cont.8636
	nop
be_else.8635:
	ld	%i0, 0, %i2
	st	%o7, %i0, 12
	call	calc_diffuse_using_1point.2938
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
be_cont.8636:
	ld	%i0, 4, %i2
	add	%i2, 1, %i3
	ld	%i0, 0, %i2
	b	do_without_neighbors.2947
	nop
bge_else.8634:
	retl
	nop
ble_else.8633:
	retl
	nop
neighbors_exist.2950:
	set	min_caml_image_size, %i4
	ld	%i4, 4, %i4
	add	%i3, 1, %i5
	cmp	%i4, %i5
	bg	ble_else.8639
	nop
	set	0, %i2
	retl
	nop
ble_else.8639:
	cmp	%i3, 0
	bg	ble_else.8640
	nop
	set	0, %i2
	retl
	nop
ble_else.8640:
	set	min_caml_image_size, %i3
	ld	%i3, 0, %i3
	add	%i2, 1, %i4
	cmp	%i3, %i4
	bg	ble_else.8641
	nop
	set	0, %i2
	retl
	nop
ble_else.8641:
	cmp	%i2, 0
	bg	ble_else.8642
	nop
	set	0, %i2
	retl
	nop
ble_else.8642:
	set	1, %i2
	retl
	nop
get_surface_id.2954:
	st	%i3, %i0, 0
	st	%o7, %i0, 4
	call	p_surface_ids.2681
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	retl
	nop
neighbors_are_available.2957:
	sll	%i2, 2, %l1
	ld	%i4, %l1, %l1
	st	%i4, %i0, 0
	st	%i5, %i0, 4
	st	%l0, %i0, 8
	st	%i3, %i0, 12
	st	%i2, %i0, 16
	mov	%l0, %i3
	mov	%l1, %i2
	st	%o7, %i0, 20
	call	get_surface_id.2954
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i3
	sll	%i3, 2, %i4
	ld	%i0, 12, %i5
	ld	%i5, %i4, %i4
	ld	%i0, 8, %i5
	st	%i2, %i0, 20
	mov	%i5, %i3
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	get_surface_id.2954
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i3
	cmp	%i2, %i3
	bne	be_else.8643
	nop
	ld	%i0, 16, %i2
	sll	%i2, 2, %i4
	ld	%i0, 4, %i5
	ld	%i5, %i4, %i4
	ld	%i0, 8, %i5
	mov	%i5, %i3
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	get_surface_id.2954
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i3
	cmp	%i2, %i3
	bne	be_else.8644
	nop
	ld	%i0, 16, %i2
	sub	%i2, 1, %i4
	sll	%i4, 2, %i4
	ld	%i0, 0, %i5
	ld	%i5, %i4, %i4
	ld	%i0, 8, %l0
	mov	%l0, %i3
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	get_surface_id.2954
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i3
	cmp	%i2, %i3
	bne	be_else.8645
	nop
	ld	%i0, 16, %i2
	add	%i2, 1, %i2
	sll	%i2, 2, %i2
	ld	%i0, 0, %i4
	ld	%i4, %i2, %i2
	ld	%i0, 8, %i4
	mov	%i4, %i3
	st	%o7, %i0, 28
	call	get_surface_id.2954
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 20, %i3
	cmp	%i2, %i3
	bne	be_else.8646
	nop
	set	1, %i2
	retl
	nop
be_else.8646:
	set	0, %i2
	retl
	nop
be_else.8645:
	set	0, %i2
	retl
	nop
be_else.8644:
	set	0, %i2
	retl
	nop
be_else.8643:
	set	0, %i2
	retl
	nop
try_exploit_neighbors.2963:
	sll	%i2, 2, %l2
	ld	%i5, %l2, %l2
	cmp	%l1, 4
	bg	ble_else.8647
	nop
	st	%i3, %i0, 0
	st	%l2, %i0, 4
	st	%l1, %i0, 8
	st	%l0, %i0, 12
	st	%i5, %i0, 16
	st	%i4, %i0, 20
	st	%i2, %i0, 24
	mov	%l1, %i3
	mov	%l2, %i2
	st	%o7, %i0, 28
	call	get_surface_id.2954
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bl	bge_else.8648
	nop
	ld	%i0, 24, %i2
	ld	%i0, 20, %i3
	ld	%i0, 16, %i4
	ld	%i0, 12, %i5
	ld	%i0, 8, %l0
	st	%o7, %i0, 28
	call	neighbors_are_available.2957
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8649
	nop
	ld	%i0, 24, %i2
	sll	%i2, 2, %i2
	ld	%i0, 16, %i3
	ld	%i3, %i2, %i2
	ld	%i0, 8, %i3
	b	do_without_neighbors.2947
	nop
be_else.8649:
	ld	%i0, 4, %i2
	st	%o7, %i0, 28
	call	p_calc_diffuse.2683
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 8, %l0
	sll	%l0, 2, %i3
	ld	%i2, %i3, %i2
	cmp	%i2, 0
	bne	be_else.8650
	nop
	b	be_cont.8651
	nop
be_else.8650:
	ld	%i0, 24, %i2
	ld	%i0, 20, %i3
	ld	%i0, 16, %i4
	ld	%i0, 12, %i5
	st	%o7, %i0, 28
	call	calc_diffuse_using_5points.2941
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
be_cont.8651:
	ld	%i0, 8, %i2
	add	%i2, 1, %l1
	ld	%i0, 24, %i2
	ld	%i0, 0, %i3
	ld	%i0, 20, %i4
	ld	%i0, 16, %i5
	ld	%i0, 12, %l0
	b	try_exploit_neighbors.2963
	nop
bge_else.8648:
	retl
	nop
ble_else.8647:
	retl
	nop
write_ppm_header.2970:
	set	min_caml_image_size, %i2
	ld	%i2, 0, %i2
	st	%o7, %i0, 4
	call	min_caml_print_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_image_size, %i2
	ld	%i2, 4, %i2
	st	%o7, %i0, 4
	call	min_caml_print_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	255, %i2
	b	min_caml_print_int
	nop
write_rgb_element.2972:
	set	l.6716, %i2
	ldd	%i2, 0, %f2
	fcmpd	%f0, %f2
	nop
	fbg	fble_else.8654
	nop
	set	l.6247, %i2
	ldd	%i2, 0, %f2
	fcmpd	%f2, %f0
	nop
	fbg	fble_else.8656
	nop
	b	fble_cont.8657
	nop
fble_else.8656:
	set	l.6247, %i2
	ldd	%i2, 0, %f0
fble_cont.8657:
	b	fble_cont.8655
	nop
fble_else.8654:
	set	l.6716, %i2
	ldd	%i2, 0, %f0
fble_cont.8655:
	st	%o7, %i0, 4
	call	min_caml_floor
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	b	min_caml_print_float
	nop
write_rgb.2974:
	set	min_caml_rgb, %i2
	ldd	%i2, 0, %f0
	st	%o7, %i0, 4
	call	write_rgb_element.2972
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_rgb, %i2
	ldd	%i2, 8, %f0
	st	%o7, %i0, 4
	call	write_rgb_element.2972
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_rgb, %i2
	ldd	%i2, 16, %f0
	b	write_rgb_element.2972
	nop
pretrace_diffuse_rays.2976:
	cmp	%i3, 4
	bg	ble_else.8658
	nop
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%o7, %i0, 12
	call	get_surface_id.2954
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bl	bge_else.8659
	nop
	ld	%i0, 4, %i2
	st	%o7, %i0, 12
	call	p_calc_diffuse.2683
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	cmp	%i2, 0
	bne	be_else.8660
	nop
	b	be_cont.8661
	nop
be_else.8660:
	ld	%i0, 4, %i2
	st	%o7, %i0, 12
	call	p_group_id.2689
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	min_caml_diffuse_ray, %i3
	st	%i2, %i0, 8
	mov	%i3, %i2
	st	%o7, %i0, 12
	call	vecbzero.2597
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	st	%o7, %i0, 12
	call	p_nvectors.2694
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	st	%i2, %i0, 12
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	p_intersection_points.2679
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	min_caml_dirvecs, %i3
	ld	%i0, 8, %i4
	sll	%i4, 2, %i4
	ld	%i3, %i4, %i3
	ld	%i0, 0, %i4
	sll	%i4, 2, %i5
	ld	%i0, 12, %l0
	ld	%l0, %i5, %i5
	sll	%i4, 2, %l0
	ld	%i2, %l0, %i2
	mov	%i2, %i4
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 20
	call	trace_diffuse_rays.2930
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 4, %i2
	st	%o7, %i0, 20
	call	p_received_ray_20percent.2687
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	set	min_caml_diffuse_ray, %i4
	mov	%i4, %i3
	st	%o7, %i0, 20
	call	veccpy.2599
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
be_cont.8661:
	ld	%i0, 0, %i2
	add	%i2, 1, %i3
	ld	%i0, 4, %i2
	b	pretrace_diffuse_rays.2976
	nop
bge_else.8659:
	retl
	nop
ble_else.8658:
	retl
	nop
pretrace_pixels.2979:
	cmp	%i3, 0
	bl	bge_else.8664
	nop
	set	min_caml_scan_pitch, %i5
	ldd	%i5, 0, %f6
	set	min_caml_image_center, %i5
	ld	%i5, 0, %i5
	sub	%i3, %i5, %i5
	st	%i4, %i0, 0
	st	%i2, %i0, 4
	st	%i3, %i0, 8
	std	%f4, %i0, 16
	std	%f2, %i0, 24
	std	%f0, %i0, 32
	std	%f6, %i0, 40
	mov	%i5, %i2
	st	%o7, %i0, 52
	call	min_caml_float_of_int
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ldd	%i0, 40, %f2
	fmuld	%f2, %f0, %f0
	set	min_caml_ptrace_dirvec, %i2
	set	min_caml_screenx_dir, %i3
	ldd	%i3, 0, %f2
	fmuld	%f0, %f2, %f2
	ldd	%i0, 32, %f4
	faddd	%f2, %f4, %f2
	std	%f2, %i2, 0
	set	min_caml_ptrace_dirvec, %i2
	set	min_caml_screenx_dir, %i3
	ldd	%i3, 8, %f2
	fmuld	%f0, %f2, %f2
	ldd	%i0, 24, %f6
	faddd	%f2, %f6, %f2
	std	%f2, %i2, 8
	set	min_caml_ptrace_dirvec, %i2
	set	min_caml_screenx_dir, %i3
	ldd	%i3, 16, %f2
	fmuld	%f0, %f2, %f0
	ldd	%i0, 16, %f2
	faddd	%f0, %f2, %f0
	std	%f0, %i2, 16
	set	min_caml_ptrace_dirvec, %i2
	set	0, %i3
	st	%o7, %i0, 52
	call	vecunit_sgn.2607
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	set	min_caml_rgb, %i2
	st	%o7, %i0, 52
	call	vecbzero.2597
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	set	min_caml_startp, %i2
	set	min_caml_viewpoint, %i3
	st	%o7, %i0, 52
	call	veccpy.2599
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	set	0, %i2
	set	l.6249, %i3
	ldd	%i3, 0, %f0
	set	min_caml_ptrace_dirvec, %i3
	ld	%i0, 8, %i4
	sll	%i4, 2, %i5
	ld	%i0, 4, %l0
	ld	%l0, %i5, %i5
	set	l.6247, %l1
	ldd	%l1, 0, %f2
	mov	%i5, %i4
	st	%o7, %i0, 52
	call	trace_ray.2916
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 8, %i2
	sll	%i2, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	mov	%i3, %i2
	st	%o7, %i0, 52
	call	p_rgb.2677
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	set	min_caml_rgb, %i3
	st	%o7, %i0, 52
	call	veccpy.2599
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 8, %i2
	sll	%i2, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	ld	%i0, 0, %i5
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 52
	call	p_set_group_id.2691
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 8, %i2
	sll	%i2, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	set	0, %i5
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 52
	call	pretrace_diffuse_rays.2976
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	ld	%i0, 8, %i2
	sub	%i2, 1, %i2
	set	1, %i3
	ld	%i0, 0, %i4
	st	%i2, %i0, 48
	mov	%i4, %i2
	st	%o7, %i0, 52
	call	add_mod5.2586
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	mov	%i2, %i4
	ldd	%i0, 32, %f0
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	ld	%i0, 4, %i2
	ld	%i0, 48, %i3
	b	pretrace_pixels.2979
	nop
bge_else.8664:
	retl
	nop
pretrace_line.2986:
	set	min_caml_scan_pitch, %i5
	ldd	%i5, 0, %f0
	set	min_caml_image_center, %i5
	ld	%i5, 4, %i5
	sub	%i3, %i5, %i3
	st	%i4, %i0, 0
	st	%i2, %i0, 4
	std	%f0, %i0, 8
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	min_caml_float_of_int
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	fmuld	%f2, %f0, %f0
	set	min_caml_screeny_dir, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f2
	set	min_caml_screenz_dir, %i2
	ldd	%i2, 0, %f4
	faddd	%f2, %f4, %f2
	set	min_caml_screeny_dir, %i2
	ldd	%i2, 8, %f4
	fmuld	%f0, %f4, %f4
	set	min_caml_screenz_dir, %i2
	ldd	%i2, 8, %f6
	faddd	%f4, %f6, %f4
	set	min_caml_screeny_dir, %i2
	ldd	%i2, 16, %f6
	fmuld	%f0, %f6, %f0
	set	min_caml_screenz_dir, %i2
	ldd	%i2, 16, %f6
	faddd	%f0, %f6, %f0
	set	min_caml_image_size, %i2
	ld	%i2, 0, %i2
	sub	%i2, 1, %i3
	ld	%i0, 4, %i2
	ld	%i0, 0, %i4
	fmovs	%f4, %f30
	fmovs	%f5, %f31
	fmovs	%f0, %f4
	fmovs	%f1, %f5
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f30, %f2
	fmovs	%f31, %f3
	b	pretrace_pixels.2979
	nop
scan_pixel.2990:
	set	min_caml_image_size, %l1
	ld	%l1, 0, %l1
	cmp	%l1, %i2
	bg	ble_else.8667
	nop
	retl
	nop
ble_else.8667:
	set	min_caml_rgb, %l1
	sll	%i2, 2, %l2
	ld	%i5, %l2, %l2
	st	%i4, %i0, 0
	st	%i5, %i0, 4
	st	%l0, %i0, 8
	st	%i3, %i0, 12
	st	%i2, %i0, 16
	st	%l1, %i0, 20
	mov	%l2, %i2
	st	%o7, %i0, 28
	call	p_rgb.2677
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i3
	ld	%i0, 20, %i2
	st	%o7, %i0, 28
	call	veccpy.2599
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 16, %i2
	ld	%i0, 12, %i3
	ld	%i0, 8, %i4
	st	%o7, %i0, 28
	call	neighbors_exist.2950
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	cmp	%i2, 0
	bne	be_else.8669
	nop
	ld	%i0, 16, %i2
	sll	%i2, 2, %i3
	ld	%i0, 4, %i4
	ld	%i4, %i3, %i3
	set	0, %i5
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 28
	call	do_without_neighbors.2947
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	b	be_cont.8670
	nop
be_else.8669:
	set	0, %l1
	ld	%i0, 16, %i2
	ld	%i0, 12, %i3
	ld	%i0, 0, %i4
	ld	%i0, 4, %i5
	ld	%i0, 8, %l0
	st	%o7, %i0, 28
	call	try_exploit_neighbors.2963
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
be_cont.8670:
	st	%o7, %i0, 28
	call	write_rgb.2974
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 16, %i2
	add	%i2, 1, %i2
	ld	%i0, 12, %i3
	ld	%i0, 0, %i4
	ld	%i0, 4, %i5
	ld	%i0, 8, %l0
	b	scan_pixel.2990
	nop
scan_line.2996:
	set	min_caml_image_size, %l1
	ld	%l1, 4, %l1
	cmp	%l1, %i2
	bg	ble_else.8671
	nop
	retl
	nop
ble_else.8671:
	set	min_caml_image_size, %l1
	ld	%l1, 4, %l1
	sub	%l1, 1, %l1
	st	%l0, %i0, 0
	st	%i5, %i0, 4
	st	%i4, %i0, 8
	st	%i3, %i0, 12
	st	%i2, %i0, 16
	cmp	%l1, %i2
	bg	ble_else.8673
	nop
	b	ble_cont.8674
	nop
ble_else.8673:
	add	%i2, 1, %l1
	mov	%l0, %i4
	mov	%l1, %i3
	mov	%i5, %i2
	st	%o7, %i0, 20
	call	pretrace_line.2986
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
ble_cont.8674:
	set	0, %i2
	ld	%i0, 16, %i3
	ld	%i0, 12, %i4
	ld	%i0, 8, %i5
	ld	%i0, 4, %l0
	st	%o7, %i0, 20
	call	scan_pixel.2990
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i2
	add	%i2, 1, %i2
	set	2, %i3
	ld	%i0, 0, %i4
	st	%i2, %i0, 20
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	add_mod5.2586
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %l0
	ld	%i0, 20, %i2
	ld	%i0, 8, %i3
	ld	%i0, 4, %i4
	ld	%i0, 12, %i5
	b	scan_line.2996
	nop
create_float5x3array.3002:
	set	3, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i3
	set	5, %i2
	st	%o7, %i0, 4
	call	min_caml_create_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	3, %i3
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	st	%i2, %i3, 4
	set	3, %i2
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	st	%i2, %i3, 8
	set	3, %i2
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	st	%i2, %i3, 12
	set	3, %i2
	set	l.6247, %i4
	ldd	%i4, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	st	%i2, %i3, 16
	mov	%i3, %i2
	retl
	nop
create_pixel.3004:
	set	3, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	create_float5x3array.3002
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	5, %i3
	set	0, %i4
	st	%i2, %i0, 4
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 12
	call	min_caml_create_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	5, %i3
	set	0, %i4
	st	%i2, %i0, 8
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 12
	call	min_caml_create_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	st	%i2, %i0, 12
	st	%o7, %i0, 20
	call	create_float5x3array.3002
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%i2, %i0, 16
	st	%o7, %i0, 20
	call	create_float5x3array.3002
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	set	1, %i3
	set	0, %i4
	st	%i2, %i0, 20
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 28
	call	min_caml_create_array
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%i2, %i0, 24
	st	%o7, %i0, 28
	call	create_float5x3array.3002
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i1, %i3
	add	%i1, 32, %i1
	st	%i2, %i3, 28
	ld	%i0, 24, %i2
	st	%i2, %i3, 24
	ld	%i0, 20, %i2
	st	%i2, %i3, 20
	ld	%i0, 16, %i2
	st	%i2, %i3, 16
	ld	%i0, 12, %i2
	st	%i2, %i3, 12
	ld	%i0, 8, %i2
	st	%i2, %i3, 8
	ld	%i0, 4, %i2
	st	%i2, %i3, 4
	ld	%i0, 0, %i2
	st	%i2, %i3, 0
	mov	%i3, %i2
	retl
	nop
init_line_elements.3006:
	cmp	%i3, 0
	bl	bge_else.8675
	nop
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	create_pixel.3004
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i0, 0, %i5
	st	%i2, %i5, %i4
	sub	%i3, 1, %i3
	mov	%i5, %i2
	b	init_line_elements.3006
	nop
bge_else.8675:
	retl
	nop
create_pixelline.3009:
	set	min_caml_image_size, %i2
	ld	%i2, 0, %i2
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	create_pixel.3004
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i3
	ld	%i0, 0, %i2
	st	%o7, %i0, 4
	call	min_caml_create_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_image_size, %i3
	ld	%i3, 0, %i3
	sub	%i3, 2, %i3
	b	init_line_elements.3006
	nop
tan.3011:
	std	%f0, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_sin
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ldd	%i0, 0, %f2
	std	%f0, %i0, 8
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 20
	call	min_caml_cos
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	fdivd	%f2, %f0, %f0
	retl
	nop
adjust_position.3013:
	fmuld	%f0, %f0, %f0
	set	l.6781, %i2
	ldd	%i2, 0, %f4
	faddd	%f0, %f4, %f0
	std	%f2, %i0, 0
	st	%o7, %i0, 12
	call	min_caml_sqrt
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	l.6249, %i2
	ldd	%i2, 0, %f2
	fdivd	%f2, %f0, %f2
	std	%f0, %i0, 8
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 20
	call	min_caml_atan
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 0, %f2
	fmuld	%f0, %f2, %f0
	st	%o7, %i0, 20
	call	tan.3011
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	fmuld	%f0, %f2, %f0
	retl
	nop
calc_dirvec.3016:
	cmp	%i2, 5
	bl	bge_else.8676
	nop
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	std	%f0, %i0, 8
	std	%f2, %i0, 16
	st	%o7, %i0, 28
	call	min_caml_fsqr
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	std	%f0, %i0, 24
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 36
	call	min_caml_fsqr
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 24, %f2
	faddd	%f2, %f0, %f0
	set	l.6249, %i2
	ldd	%i2, 0, %f2
	faddd	%f0, %f2, %f0
	st	%o7, %i0, 36
	call	min_caml_sqrt
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ldd	%i0, 8, %f2
	fdivd	%f2, %f0, %f2
	ldd	%i0, 16, %f4
	fdivd	%f4, %f0, %f4
	set	l.6249, %i2
	ldd	%i2, 0, %f6
	fdivd	%f6, %f0, %f0
	set	min_caml_dirvecs, %i2
	ld	%i0, 4, %i3
	sll	%i3, 2, %i3
	ld	%i2, %i3, %i2
	ld	%i0, 0, %i3
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i4
	st	%i2, %i0, 32
	std	%f0, %i0, 40
	std	%f4, %i0, 48
	std	%f2, %i0, 56
	mov	%i4, %i2
	st	%o7, %i0, 68
	call	d_vec.2696
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f0
	ldd	%i0, 48, %f2
	ldd	%i0, 40, %f4
	st	%o7, %i0, 68
	call	vecset.2589
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 0, %i2
	add	%i2, 40, %i3
	sll	%i3, 2, %i3
	ld	%i0, 32, %i4
	ld	%i4, %i3, %i3
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	d_vec.2696
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 48, %f0
	st	%i2, %i0, 64
	st	%o7, %i0, 68
	call	min_caml_fneg
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	fmovs	%f0, %f4
	fmovs	%f1, %f5
	ldd	%i0, 56, %f0
	ldd	%i0, 40, %f2
	ld	%i0, 64, %i2
	st	%o7, %i0, 68
	call	vecset.2589
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ld	%i0, 0, %i2
	add	%i2, 80, %i3
	sll	%i3, 2, %i3
	ld	%i0, 32, %i4
	ld	%i4, %i3, %i3
	mov	%i3, %i2
	st	%o7, %i0, 68
	call	d_vec.2696
	add	%i0, 72, %i0
	sub	%i0, 72, %i0
	ld	%i0, 68, %o7
	ldd	%i0, 56, %f0
	st	%i2, %i0, 68
	st	%o7, %i0, 76
	call	min_caml_fneg
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 48, %f2
	std	%f0, %i0, 72
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 84
	call	min_caml_fneg
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	fmovs	%f0, %f4
	fmovs	%f1, %f5
	ldd	%i0, 40, %f0
	ldd	%i0, 72, %f2
	ld	%i0, 68, %i2
	st	%o7, %i0, 84
	call	vecset.2589
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ld	%i0, 0, %i2
	add	%i2, 1, %i3
	sll	%i3, 2, %i3
	ld	%i0, 32, %i4
	ld	%i4, %i3, %i3
	mov	%i3, %i2
	st	%o7, %i0, 84
	call	d_vec.2696
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 56, %f0
	st	%i2, %i0, 80
	st	%o7, %i0, 84
	call	min_caml_fneg
	add	%i0, 88, %i0
	sub	%i0, 88, %i0
	ld	%i0, 84, %o7
	ldd	%i0, 48, %f2
	std	%f0, %i0, 88
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 100
	call	min_caml_fneg
	add	%i0, 104, %i0
	sub	%i0, 104, %i0
	ld	%i0, 100, %o7
	ldd	%i0, 40, %f2
	std	%f0, %i0, 96
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 108
	call	min_caml_fneg
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	fmovs	%f0, %f4
	fmovs	%f1, %f5
	ldd	%i0, 88, %f0
	ldd	%i0, 96, %f2
	ld	%i0, 80, %i2
	st	%o7, %i0, 108
	call	vecset.2589
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ld	%i0, 0, %i2
	add	%i2, 41, %i3
	sll	%i3, 2, %i3
	ld	%i0, 32, %i4
	ld	%i4, %i3, %i3
	mov	%i3, %i2
	st	%o7, %i0, 108
	call	d_vec.2696
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ldd	%i0, 56, %f0
	st	%i2, %i0, 104
	st	%o7, %i0, 108
	call	min_caml_fneg
	add	%i0, 112, %i0
	sub	%i0, 112, %i0
	ld	%i0, 108, %o7
	ldd	%i0, 40, %f2
	std	%f0, %i0, 112
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 124
	call	min_caml_fneg
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 112, %f0
	ldd	%i0, 48, %f4
	ld	%i0, 104, %i2
	st	%o7, %i0, 124
	call	vecset.2589
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ld	%i0, 0, %i2
	add	%i2, 81, %i2
	sll	%i2, 2, %i2
	ld	%i0, 32, %i3
	ld	%i3, %i2, %i2
	st	%o7, %i0, 124
	call	d_vec.2696
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 40, %f0
	st	%i2, %i0, 120
	st	%o7, %i0, 124
	call	min_caml_fneg
	add	%i0, 128, %i0
	sub	%i0, 128, %i0
	ld	%i0, 124, %o7
	ldd	%i0, 56, %f2
	ldd	%i0, 48, %f4
	ld	%i0, 120, %i2
	b	vecset.2589
	nop
bge_else.8676:
	std	%f4, %i0, 128
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	std	%f6, %i0, 136
	st	%i2, %i0, 144
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	fmovs	%f4, %f2
	fmovs	%f5, %f3
	st	%o7, %i0, 148
	call	adjust_position.3013
	add	%i0, 152, %i0
	sub	%i0, 152, %i0
	ld	%i0, 148, %o7
	ld	%i0, 144, %i2
	add	%i2, 1, %i2
	ldd	%i0, 136, %f2
	std	%f0, %i0, 152
	st	%i2, %i0, 160
	st	%o7, %i0, 164
	call	adjust_position.3013
	add	%i0, 168, %i0
	sub	%i0, 168, %i0
	ld	%i0, 164, %o7
	fmovs	%f0, %f2
	fmovs	%f1, %f3
	ldd	%i0, 152, %f0
	ldd	%i0, 128, %f4
	ldd	%i0, 136, %f6
	ld	%i0, 160, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	calc_dirvec.3016
	nop
calc_dirvecs.3024:
	cmp	%i2, 0
	bl	bge_else.8682
	nop
	st	%i2, %i0, 0
	std	%f0, %i0, 8
	st	%i4, %i0, 16
	st	%i3, %i0, 20
	st	%o7, %i0, 28
	call	min_caml_float_of_int
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	l.6914, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	l.6916, %i2
	ldd	%i2, 0, %f2
	fsubd	%f0, %f2, %f4
	set	0, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	set	l.6247, %i3
	ldd	%i3, 0, %f2
	ldd	%i0, 8, %f6
	ld	%i0, 20, %i3
	ld	%i0, 16, %i4
	st	%o7, %i0, 28
	call	calc_dirvec.3016
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 0, %i2
	st	%o7, %i0, 28
	call	min_caml_float_of_int
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	l.6914, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	l.6781, %i2
	ldd	%i2, 0, %f2
	faddd	%f0, %f2, %f4
	set	0, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	set	l.6247, %i3
	ldd	%i3, 0, %f2
	ld	%i0, 16, %i3
	add	%i3, 2, %i4
	ldd	%i0, 8, %f6
	ld	%i0, 20, %i5
	mov	%i5, %i3
	st	%o7, %i0, 28
	call	calc_dirvec.3016
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 0, %i2
	sub	%i2, 1, %i2
	set	1, %i3
	ld	%i0, 20, %i4
	st	%i2, %i0, 24
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	add_mod5.2586
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i3
	ldd	%i0, 8, %f0
	ld	%i0, 24, %i2
	ld	%i0, 16, %i4
	b	calc_dirvecs.3024
	nop
bge_else.8682:
	retl
	nop
calc_dirvec_rows.3029:
	cmp	%i2, 0
	bl	bge_else.8685
	nop
	st	%i2, %i0, 0
	st	%i4, %i0, 4
	st	%i3, %i0, 8
	st	%o7, %i0, 12
	call	min_caml_float_of_int
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	l.6914, %i2
	ldd	%i2, 0, %f2
	fmuld	%f0, %f2, %f0
	set	l.6916, %i2
	ldd	%i2, 0, %f2
	fsubd	%f0, %f2, %f0
	set	4, %i2
	ld	%i0, 8, %i3
	ld	%i0, 4, %i4
	st	%o7, %i0, 12
	call	calc_dirvecs.3024
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i2
	sub	%i2, 1, %i2
	set	2, %i3
	ld	%i0, 8, %i4
	st	%i2, %i0, 12
	mov	%i4, %i2
	st	%o7, %i0, 20
	call	add_mod5.2586
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	mov	%i2, %i3
	ld	%i0, 4, %i2
	add	%i2, 4, %i4
	ld	%i0, 12, %i2
	b	calc_dirvec_rows.3029
	nop
bge_else.8685:
	retl
	nop
create_dirvec.3033:
	set	3, %i2
	set	l.6247, %i3
	ldd	%i3, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i3
	set	min_caml_n_objects, %i2
	ld	%i2, 0, %i2
	st	%i3, %i0, 0
	st	%o7, %i0, 4
	call	min_caml_create_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i1, %i3
	add	%i1, 8, %i1
	st	%i2, %i3, 4
	ld	%i0, 0, %i2
	st	%i2, %i3, 0
	mov	%i3, %i2
	retl
	nop
create_dirvec_elements.3035:
	cmp	%i3, 0
	bl	bge_else.8687
	nop
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	create_dirvec.3033
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i0, 0, %i5
	st	%i2, %i5, %i4
	sub	%i3, 1, %i3
	mov	%i5, %i2
	b	create_dirvec_elements.3035
	nop
bge_else.8687:
	retl
	nop
create_dirvecs.3038:
	cmp	%i2, 0
	bl	bge_else.8689
	nop
	set	min_caml_dirvecs, %i3
	set	120, %i4
	st	%i3, %i0, 0
	st	%i2, %i0, 4
	st	%i4, %i0, 8
	st	%o7, %i0, 12
	call	create_dirvec.3033
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	mov	%i2, %i3
	ld	%i0, 8, %i2
	st	%o7, %i0, 12
	call	min_caml_create_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i0, 0, %i5
	st	%i2, %i5, %i4
	set	min_caml_dirvecs, %i2
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i2
	set	118, %i4
	mov	%i4, %i3
	st	%o7, %i0, 12
	call	create_dirvec_elements.3035
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	sub	%i2, 1, %i2
	b	create_dirvecs.3038
	nop
bge_else.8689:
	retl
	nop
init_dirvec_constants.3040:
	cmp	%i3, 0
	bl	bge_else.8691
	nop
	sll	%i3, 2, %i4
	ld	%i2, %i4, %i4
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	setup_dirvec_constants.2825
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i2
	sub	%i2, 1, %i3
	ld	%i0, 0, %i2
	b	init_dirvec_constants.3040
	nop
bge_else.8691:
	retl
	nop
init_vecset_constants.3043:
	cmp	%i2, 0
	bl	bge_else.8693
	nop
	set	min_caml_dirvecs, %i3
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i3
	set	119, %i4
	st	%i2, %i0, 0
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 4
	call	init_dirvec_constants.3040
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i2
	sub	%i2, 1, %i2
	b	init_vecset_constants.3043
	nop
bge_else.8693:
	retl
	nop
init_dirvecs.3045:
	set	4, %i2
	st	%o7, %i0, 4
	call	create_dirvecs.3038
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	9, %i2
	set	0, %i3
	set	0, %i4
	st	%o7, %i0, 4
	call	calc_dirvec_rows.3029
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	4, %i2
	b	init_vecset_constants.3043
	nop
add_reflection.3047:
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	std	%f0, %i0, 8
	std	%f6, %i0, 16
	std	%f4, %i0, 24
	std	%f2, %i0, 32
	st	%o7, %i0, 44
	call	create_dirvec.3033
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	st	%i2, %i0, 40
	st	%o7, %i0, 44
	call	d_vec.2696
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ldd	%i0, 32, %f0
	ldd	%i0, 24, %f2
	ldd	%i0, 16, %f4
	st	%o7, %i0, 44
	call	vecset.2589
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	ld	%i0, 40, %i2
	st	%o7, %i0, 44
	call	setup_dirvec_constants.2825
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	set	min_caml_reflections, %i2
	mov	%i1, %i3
	add	%i1, 16, %i1
	ldd	%i0, 8, %f0
	std	%f0, %i3, 8
	ld	%i0, 40, %i4
	st	%i4, %i3, 4
	ld	%i0, 4, %i4
	st	%i4, %i3, 0
	ld	%i0, 0, %i4
	sll	%i4, 2, %i4
	st	%i3, %i2, %i4
	retl
	nop
setup_rect_reflection.3054:
	set	4, %i4
	st	%i3, %i0, 0
	mov	%i4, %i3
	st	%o7, %i0, 4
	call	min_caml_imul
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	min_caml_n_reflections, %i3
	ld	%i3, 0, %i3
	set	l.6249, %i4
	ldd	%i4, 0, %f0
	ld	%i0, 0, %i4
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	std	%f0, %i0, 16
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	o_diffuse.2659
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	fsubd	%f2, %f0, %f0
	set	min_caml_light, %i2
	ldd	%i2, 0, %f2
	std	%f0, %i0, 24
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 36
	call	min_caml_fneg
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	min_caml_light, %i2
	ldd	%i2, 8, %f2
	std	%f0, %i0, 32
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 44
	call	min_caml_fneg
	add	%i0, 48, %i0
	sub	%i0, 48, %i0
	ld	%i0, 44, %o7
	set	min_caml_light, %i2
	ldd	%i2, 16, %f2
	std	%f0, %i0, 40
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	st	%o7, %i0, 52
	call	min_caml_fneg
	add	%i0, 56, %i0
	sub	%i0, 56, %i0
	ld	%i0, 52, %o7
	fmovs	%f0, %f6
	fmovs	%f1, %f7
	ld	%i0, 8, %i2
	add	%i2, 1, %i3
	set	min_caml_light, %i4
	ldd	%i4, 0, %f2
	ldd	%i0, 24, %f0
	ldd	%i0, 40, %f4
	ld	%i0, 4, %i4
	std	%f6, %i0, 48
	mov	%i4, %i2
	st	%o7, %i0, 60
	call	add_reflection.3047
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 4, %i2
	add	%i2, 1, %i3
	ld	%i0, 8, %i4
	add	%i4, 2, %i5
	set	min_caml_light, %l0
	ldd	%l0, 8, %f4
	ldd	%i0, 24, %f0
	ldd	%i0, 32, %f2
	ldd	%i0, 48, %f6
	mov	%i3, %i2
	mov	%i5, %i3
	st	%o7, %i0, 60
	call	add_reflection.3047
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ld	%i0, 4, %i2
	add	%i2, 2, %i3
	ld	%i0, 8, %i4
	add	%i4, 3, %i4
	set	min_caml_light, %i5
	ldd	%i5, 16, %f6
	ldd	%i0, 24, %f0
	ldd	%i0, 32, %f2
	ldd	%i0, 40, %f4
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 60
	call	add_reflection.3047
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	set	min_caml_n_reflections, %i2
	ld	%i0, 4, %i3
	add	%i3, 3, %i3
	st	%i3, %i2, 0
	retl
	nop
setup_surface_reflection.3057:
	set	4, %i4
	st	%i3, %i0, 0
	mov	%i4, %i3
	st	%o7, %i0, 4
	call	min_caml_imul
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	add	%i2, 1, %i2
	set	min_caml_n_reflections, %i3
	ld	%i3, 0, %i3
	set	l.6249, %i4
	ldd	%i4, 0, %f0
	ld	%i0, 0, %i4
	st	%i2, %i0, 4
	st	%i3, %i0, 8
	std	%f0, %i0, 16
	mov	%i4, %i2
	st	%o7, %i0, 28
	call	o_diffuse.2659
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ldd	%i0, 16, %f2
	fsubd	%f2, %f0, %f0
	set	min_caml_light, %i2
	ld	%i0, 0, %i3
	std	%f0, %i0, 24
	st	%i2, %i0, 32
	mov	%i3, %i2
	st	%o7, %i0, 36
	call	o_param_abc.2651
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	mov	%i2, %i3
	ld	%i0, 32, %i2
	st	%o7, %i0, 36
	call	veciprod.2610
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	set	l.6384, %i2
	ldd	%i2, 0, %f2
	ld	%i0, 0, %i2
	std	%f0, %i0, 40
	std	%f2, %i0, 48
	st	%o7, %i0, 60
	call	o_param_a.2645
	add	%i0, 64, %i0
	sub	%i0, 64, %i0
	ld	%i0, 60, %o7
	ldd	%i0, 48, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_light, %i2
	ldd	%i2, 0, %f4
	fsubd	%f0, %f4, %f0
	set	l.6384, %i2
	ldd	%i2, 0, %f4
	ld	%i0, 0, %i2
	std	%f0, %i0, 56
	std	%f4, %i0, 64
	st	%o7, %i0, 76
	call	o_param_b.2647
	add	%i0, 80, %i0
	sub	%i0, 80, %i0
	ld	%i0, 76, %o7
	ldd	%i0, 64, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_light, %i2
	ldd	%i2, 8, %f4
	fsubd	%f0, %f4, %f0
	set	l.6384, %i2
	ldd	%i2, 0, %f4
	ld	%i0, 0, %i2
	std	%f0, %i0, 72
	std	%f4, %i0, 80
	st	%o7, %i0, 92
	call	o_param_c.2649
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	ldd	%i0, 80, %f2
	fmuld	%f2, %f0, %f0
	ldd	%i0, 40, %f2
	fmuld	%f0, %f2, %f0
	set	min_caml_light, %i2
	ldd	%i2, 16, %f2
	fsubd	%f0, %f2, %f6
	ldd	%i0, 24, %f0
	ldd	%i0, 56, %f2
	ldd	%i0, 72, %f4
	ld	%i0, 8, %i2
	ld	%i0, 4, %i3
	st	%o7, %i0, 92
	call	add_reflection.3047
	add	%i0, 96, %i0
	sub	%i0, 96, %i0
	ld	%i0, 92, %o7
	set	min_caml_n_reflections, %i2
	ld	%i0, 8, %i3
	add	%i3, 1, %i3
	st	%i3, %i2, 0
	retl
	nop
setup_reflections.3060:
	cmp	%i2, 0
	bl	bge_else.8701
	nop
	set	min_caml_objects, %i3
	sll	%i2, 2, %i4
	ld	%i3, %i4, %i3
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	mov	%i3, %i2
	st	%o7, %i0, 12
	call	o_reflectiontype.2639
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 2
	bne	be_else.8702
	nop
	ld	%i0, 4, %i2
	st	%o7, %i0, 12
	call	o_diffuse.2659
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	set	l.6249, %i2
	ldd	%i2, 0, %f2
	st	%o7, %i0, 12
	call	min_caml_fless
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 0
	bne	be_else.8703
	nop
	retl
	nop
be_else.8703:
	ld	%i0, 4, %i2
	st	%o7, %i0, 12
	call	o_form.2637
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	cmp	%i2, 1
	bne	be_else.8705
	nop
	ld	%i0, 0, %i2
	ld	%i0, 4, %i3
	b	setup_rect_reflection.3054
	nop
be_else.8705:
	cmp	%i2, 2
	bne	be_else.8706
	nop
	ld	%i0, 0, %i2
	ld	%i0, 4, %i3
	b	setup_surface_reflection.3057
	nop
be_else.8706:
	retl
	nop
be_else.8702:
	retl
	nop
bge_else.8701:
	retl
	nop
rt.3062:
	set	min_caml_image_size, %i4
	st	%i2, %i4, 0
	set	min_caml_image_size, %i4
	st	%i3, %i4, 4
	set	min_caml_image_center, %i3
	set	64, %i4
	st	%i4, %i3, 0
	set	min_caml_image_center, %i3
	set	64, %i4
	st	%i4, %i3, 4
	set	min_caml_scan_pitch, %i3
	set	l.6965, %i4
	ldd	%i4, 0, %f0
	st	%i3, %i0, 0
	std	%f0, %i0, 8
	st	%o7, %i0, 20
	call	min_caml_float_of_int
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ldd	%i0, 8, %f2
	fdivd	%f2, %f0, %f0
	ld	%i0, 0, %i2
	std	%f0, %i2, 0
	st	%o7, %i0, 20
	call	create_pixelline.3009
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%i2, %i0, 16
	st	%o7, %i0, 20
	call	create_pixelline.3009
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	st	%i2, %i0, 20
	st	%o7, %i0, 28
	call	create_pixelline.3009
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%i2, %i0, 24
	st	%o7, %i0, 28
	call	read_parameter.2727
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%o7, %i0, 28
	call	write_ppm_header.2970
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	st	%o7, %i0, 28
	call	init_dirvecs.3045
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	min_caml_light_dirvec, %i2
	st	%o7, %i0, 28
	call	d_vec.2696
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	min_caml_light, %i3
	st	%o7, %i0, 28
	call	veccpy.2599
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	min_caml_light_dirvec, %i2
	st	%o7, %i0, 28
	call	setup_dirvec_constants.2825
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	min_caml_n_objects, %i2
	ld	%i2, 0, %i2
	sub	%i2, 1, %i2
	st	%o7, %i0, 28
	call	setup_reflections.3060
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	0, %i3
	set	0, %i4
	ld	%i0, 20, %i2
	st	%o7, %i0, 28
	call	pretrace_line.2986
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	set	0, %i2
	set	2, %l0
	ld	%i0, 16, %i3
	ld	%i0, 20, %i4
	ld	%i0, 24, %i5
	b	scan_line.2996
	nop
min_caml_start:
	set	128, %i2
	set	128, %i3
	st	%o7, %i0, 4
	call	rt.3062
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
