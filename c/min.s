	.file	"min.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$10, -48(%rbp)
	movl	$9, -44(%rbp)
	movl	$2, -40(%rbp)
	movl	$3, -36(%rbp)
	movl	$5, -32(%rbp)
	movl	$11, -28(%rbp)
	movl	$9, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -56(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, -52(%rbp)
	jmp	.L2
.L4:
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L3
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -52(%rbp)
.L3:
	addl	$1, -56(%rbp)
.L2:
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L4
	movl	-52(%rbp), %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
