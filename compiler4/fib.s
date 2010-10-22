.section	".text"
fib.11:
	cmp	%i2, 0
	bne	be_else.26
	nop
	set	0, %i2
	retl
	nop
be_else.26:
	cmp	%i2, 1
	bne	be_else.27
	nop
	set	1, %i2
	retl
	nop
be_else.27:
	sub	%i2, 1, %i3
	st	%i2, %i0, 0
	mov	%i3, %i2
	st	%o7, %i0, 4
	call	fib.11
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	ld	%i0, 0, %i3
	sub	%i3, 2, %i3
	st	%i2, %i0, 4
	mov	%i3, %i2
	st	%o7, %i0, 12
	call	fib.11
	add	%i0, 16, %i0
	sub	%i0, 16, %i0
	ld	%i0, 12, %o7
	ld	%i0, 4, %i3
	add	%i3, %i2, %i2
	retl
	nop
min_caml_start:
	set	10, %i2
	st	%o7, %i0, 4
	call	fib.11
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
	st	%o7, %i0, 4
	call	min_caml_print_int
	add	%i0, 8, %i0
	sub	%i0, 8, %i0
	ld	%i0, 4, %o7
