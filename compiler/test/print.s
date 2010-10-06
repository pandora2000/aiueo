.section	".rodata"
.align	8
.section	".text"
.global	min_caml_start
min_caml_start:
	save	%sp, -112, %sp
	set	123, %i2
	st	%o7, [%i0 + 4]
	call	min_caml_print_int
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	set	-456, %i2
	st	%o7, [%i0 + 4]
	call	min_caml_print_int
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	set	789, %i2
	st	%o7, [%i0 + 4]
	call	min_caml_print_int
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	ret
	restore
