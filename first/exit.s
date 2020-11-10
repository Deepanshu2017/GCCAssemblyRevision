.section .data
.section .text
.globl _start

_start:
	mov $1,   %rax
	mov $10,  %rbx
	int  $0x80
