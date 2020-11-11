.section .data
.section .text

.globl _start

_start:
	pushl $5		# Push number 5 in stack
	call fact
	# popl %ebx		# Always pop whatever you pushed (same as addl $4, %esp
	addl $4, %esp
	movl %eax, %ebx
	movl $1, %eax
	int $0x80


.type fact, @function
fact:

	pushl %ebp		# Move base pointer to stack
	movl %esp, %ebp		# Make Base pointer, stack pointer
	movl 8(%ebp), %eax	# Pop the argument
	cmpl $1, %eax		# Compare if equal to 1
	je base_condition	# If true exit fact
	decl %eax		# Decrement number by 1
	pushl %eax		# Push the new number
	call fact		# Call fact
	popl %ebx		# Pop the value
	incl %ebx
	imul %ebx, %eax		# Store in %eax

base_condition:
	movl %ebp, %esp
	popl %ebp
	ret
