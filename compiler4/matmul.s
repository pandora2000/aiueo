l.332:	! 3.000000
	.long	0x0
	.long	0x40080000
l.319:	! 2.000000
	.long	0x0
	.long	0x40000000
l.306:	! 1.000000
	.long	0x0
	.long	0x3ff00000
l.292:	! 0.000000
	.long	0x0
	.long	0x0
.section	".text"
subinit.126:
	set	10, %i4
	cmp	%i3, 10
	bne	be_else.391
	nop
	retl
	nop
be_else.391:
	set	l.292, %i5
	ldd	%i5, 0, %f0
	st	%i2, %i0, 0
	st	%i3, %i0, 4
	mov	%i4, %i2
	st	%o7, %i0, 12
	call	min_caml_create_float_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	sll	%i3, 2, %i4
	ld	%i0, 0, %i5
	st	%i2, %i5, %i4
	add	%i3, 1, %i3
	mov	%i5, %i2
	b	subinit.126
	nop
init.129:
	set	0, %i3
	b	subinit.126
	nop
sssmatmul.131:
	cmp	%l0, 10
	bne	be_else.392
	nop
	retl
	nop
be_else.392:
	sll	%i5, 2, %l2
	ld	%i4, %l2, %l2
	sll	%i5, 2, %l3
	ld	%i4, %l3, %l3
	sll	%l1, 3, %l4
	ldd	%l3, %l4, %f0
	sll	%i5, 2, %l3
	ld	%i2, %l3, %l3
	sll	%l0, 3, %l4
	ldd	%l3, %l4, %f2
	sll	%l0, 2, %l3
	ld	%i3, %l3, %l3
	sll	%l1, 3, %l4
	ldd	%l3, %l4, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	sll	%l1, 3, %l3
	std	%f0, %l2, %l3
	add	%l0, 1, %l0
	b	sssmatmul.131
	nop
ssmatmul.138:
	cmp	%l0, 10
	bne	be_else.394
	nop
	retl
	nop
be_else.394:
	set	0, %l1
	st	%i5, %i0, 0
	st	%i4, %i0, 4
	st	%i3, %i0, 8
	st	%i2, %i0, 12
	st	%l0, %i0, 16
	mov	%l1, %o4
	mov	%l0, %l1
	mov	%o4, %l0
	st	%o7, %i0, 20
	call	sssmatmul.131
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 16, %i2
	add	%i2, 1, %l0
	ld	%i0, 12, %i2
	ld	%i0, 8, %i3
	ld	%i0, 4, %i4
	ld	%i0, 0, %i5
	b	ssmatmul.138
	nop
smatmul.144:
	cmp	%i5, 10
	bne	be_else.396
	nop
	retl
	nop
be_else.396:
	set	0, %l0
	st	%i4, %i0, 0
	st	%i3, %i0, 4
	st	%i2, %i0, 8
	st	%i5, %i0, 12
	st	%o7, %i0, 20
	call	ssmatmul.138
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i2
	add	%i2, 1, %i5
	ld	%i0, 8, %i2
	ld	%i0, 4, %i3
	ld	%i0, 0, %i4
	b	smatmul.144
	nop
matmul.149:
	set	0, %i5
	b	smatmul.144
	nop
fid.153:
	set	l.292, %i2
	ldd	%i2, 0, %f2
	faddd	%f0, %f2, %f0
	retl
	nop
min_caml_start:
	set	10, %i2
	set	l.292, %i3
	ldd	%i3, 0, %f0
	st	%i2, %i0, 0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i3
	ld	%i0, 0, %i2
	st	%i3, %i0, 4
	st	%o7, %i0, 12
	call	min_caml_create_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i3
	ld	%i0, 4, %i4
	st	%i2, %i0, 8
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 12
	call	min_caml_create_array
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 0, %i3
	ld	%i0, 4, %i4
	st	%i2, %i0, 12
	mov	%i3, %i2
	mov	%i4, %i3
	st	%o7, %i0, 20
	call	min_caml_create_array
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 8, %i3
	st	%i2, %i0, 16
	mov	%i3, %i2
	st	%o7, %i0, 20
	call	init.129
	add	%i0, 24, %i0
	sub	%i0, 24, %i0
	ld	%i0, 20, %o7
	ld	%i0, 12, %i3
	st	%i2, %i0, 20
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	init.129
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	ld	%i0, 16, %i3
	st	%i2, %i0, 24
	mov	%i3, %i2
	st	%o7, %i0, 28
	call	init.129
	add	%i0, 32, %i0
	sub	%i0, 32, %i0
	ld	%i0, 28, %o7
	mov	%i2, %i4
	ld	%i0, 20, %i2
	ld	%i2, 0, %i3
	set	l.306, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 0
	ld	%i2, 0, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 8
	ld	%i2, 0, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 16
	ld	%i2, 4, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 0
	ld	%i2, 4, %i3
	set	l.319, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 8
	ld	%i2, 4, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 16
	ld	%i2, 8, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 0
	ld	%i2, 8, %i3
	set	l.292, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 8
	ld	%i2, 8, %i3
	set	l.332, %i5
	ldd	%i5, 0, %f0
	std	%f0, %i3, 16
	ld	%i0, 24, %i3
	ld	%i3, 0, %i5
	set	l.306, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 0
	ld	%i3, 0, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 8
	ld	%i3, 0, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 16
	ld	%i3, 4, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 0
	ld	%i3, 4, %i5
	set	l.319, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 8
	ld	%i3, 4, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 16
	ld	%i3, 8, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 0
	ld	%i3, 8, %i5
	set	l.292, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 8
	ld	%i3, 8, %i5
	set	l.332, %l0
	ldd	%l0, 0, %f0
	std	%f0, %i5, 16
	st	%i4, %i0, 28
	st	%o7, %i0, 36
	call	matmul.149
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	ld	%i0, 28, %i2
	ld	%i2, 8, %i2
	ldd	%i2, 16, %f0
	st	%o7, %i0, 36
	call	fid.153
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
	st	%o7, %i0, 36
	call	min_caml_print_float
	add	%i0, 40, %i0
	sub	%i0, 40, %i0
	ld	%i0, 36, %o7
