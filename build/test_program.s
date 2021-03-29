	.syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"test_prog.c"
	.section	.rodata
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	7
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	8
	.bss
	.align	2
sum:
	.space	4
	.align	2
reg:
	.space	4
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	movs	r2, #7
	ldr	r3, .L2
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L2+4
	str	r3, [r2]
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	b
	.word	sum
	.size	main, .-main
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
