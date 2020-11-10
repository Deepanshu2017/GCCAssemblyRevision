.section .data

data_items:
	.long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text

.globl _start
_start:
	movl $0, %edi				# Move 0 into the index register
	movl data_items(, %edi, 4), %eax	# Load first byte of data
	movl %eax, %ebx				# Since it is the beginning, %eax is biggest
	
start_loop:
	cmpl $0, %eax				# Check if we have hit end
	je loop_exit
	incl %edi				# Load next value
	movl data_items(, %edi, 4), %eax
	cmpl %ebx, %eax				# Compare value
	jle  start_loop				# Jump if <=
	
	movl %eax, %ebx				# Move the large value
	jmp start_loop

loop_exit:
	movl $1, %eax				# System call  to exit
	int $0x80
