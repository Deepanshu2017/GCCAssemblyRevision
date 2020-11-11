# PURPOSE: Program to illustrate how functions work
# This program will compute the value of
# 2^3 + 5^2
#

# Everything in the main program is stored in registers,
# so the data section doesn’t have anything.
.section .data
.section .text

.globl _start
_start:

	pushl $3		# Push Second Argument
	pushl $2		# Push First Argument
	call power		# Call the function
	addl $8, %esp		# move the stack pointer back
	pushl %eax		# Save the first answer before calling the function
	pushl $2		# Push Second Argument
	pushl $5		# Push First Argument
	call power
	addl $8, %esp		# Move the stack pointer back

	popl %ebx		# The second answer is already in %eax. We saved the first answer onto the stack.
				# So now we can just pop it out into %ebx

	addl %eax, %ebx		# Result is in %ebx
	movl $1, %eax		# Exit (%ebx is returned)
	int $0x80


# PURPOSE: This function is used to compute
# the value of a number raised to
# a power.
#
# INPUT: First argument - the base number
# Second argument - the power to
# raise it to
#
# OUTPUT: Will give the result as a return value
#
# NOTES: The power must be 1 or greater
#
# VARIABLES:
# %ebx - holds the base number
# %ecx - holds the power
# -4(%ebp) - holds the current result
#
# %eax is used for temporary storage
#

.type power, @function
power:
	pushl %ebp		# Save the old base pointer
	movl %esp, %ebp		# Make stack pointer, the base pointer
	subl $4, %esp		# Get room for our local storage
	movl 8(%ebp), %ebx	# Put first argument in %ebx
	movl 12(%ebp), %ecx	# Put second argument in %ecx
	movl %ebx, -4(%ebp)	# Store current result
	
power_loop_start:
	cmpl $1, %ecx		# If the power is 1, we are done
	je end_power

	movl -4(%ebp), %eax	# Move the current result in %eax
	imul %ebx, %eax		# Multiply the current number is base number
	movl %eax, -4(%ebp)	# Store the current result
	decl %ecx		# Decrement the power
	jmp power_loop_start	# Run for the next power

end_power:
	movl -4(%ebp), %eax	# return value goes in %eax
	movl %ebp, %esp		# Restore Stack pointer
	popl %ebp		# Restore the previous base pointer
	ret
