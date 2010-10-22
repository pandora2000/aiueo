l.135:	! 7.000000
	.long	0x0
	.long	0x401c0000
l.132:	! 6.000000
	.long	0x0
	.long	0x40180000
l.129:	! 5.000000
	.long	0x0
	.long	0x40140000
l.126:	! 4.000000
	.long	0x0
	.long	0x40100000
l.123:	! 3.000000
	.long	0x0
	.long	0x40080000
l.120:	! 2.000000
	.long	0x0
	.long	0x40000000
l.117:	! 0.000000
	.long	0x0
	.long	0x0
.section	".text"
vm.54:
	cmp	%i2, 0
	bne	be_else.153
	nop
	retl
	nop
be_else.153:
	sub	%i2, 1, %i2
	add	%i3, 1, %l0
	sll	%i3, 3, %l1
	ldd	%i4, %l1, %f2
	sll	%i3, 3, %i3
	ldd	%i5, %i3, %f4
	fmuld	%f2, %f4, %f2
	faddd	%f0, %f2, %f0
	mov	%l0, %i3
	b	vm.54
	nop
min_caml_start:
	set	6, %i2
	set	l.117, %i3
	ldd	%i3, 0, %f0
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	set	6, %i3
	set	l.117, %i4
	ldd	%i4, 0, %f0
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	min_caml_create_float_array
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	mov	%i2, %i5
	set	l.120, %i2
	ldd	%i2, 0, %f0
	ld	%i0, 0, %i4
	std	%f0, %i4, 0
	set	l.123, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i4, 8
	set	l.126, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i4, 16
	set	l.129, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i4, 24
	set	l.132, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i4, 32
	set	l.135, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i4, 40
	set	l.120, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 0
	set	l.123, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 8
	set	l.126, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 16
	set	l.129, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 24
	set	l.132, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 32
	set	l.135, %i2
	ldd	%i2, 0, %f0
	std	%f0, %i5, 40
	set	10, %i2
	set	0, %i3
	set	l.117, %l0
	ldd	%l0, 0, %f0
	st	%o7, %i0, 4
	call	vm.54
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	min_caml_print_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
