.section	".rodata"
.align	8
.section	".text"
ack.15:
	cmp	%i2, 0
	bg	ble_else.34
	nop
	add	%i3, 1, %i2
	retl
	nop
ble_else.34:
	cmp	%i3, 0
	bg	ble_else.35
	nop
	sub	%i2, 1, %i2
	set	1, %i3
	b	ack.15
	nop
ble_else.35:
	sub	%i2, 1, %i4
	sub	%i3, 1, %i3
	st	%i4, [%i0 + 0]
	st	%o7, [%i0 + 4]
	call	ack.15
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	mov	%i2, %i3
	ld	[%i0 + 0], %i2
	b	ack.15
	nop
.global	min_caml_start
min_caml_start:
	save	%sp, -112, %sp
	set	3, %i2
	set	10, %i3
	st	%o7, [%i0 + 4]
	call	ack.15
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	st	%o7, [%i0 + 4]
	call	min_caml_print_int
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	ret
	restore
