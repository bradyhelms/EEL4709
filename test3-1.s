# Simple assembly program for function call and return 
# This program calls a simply function addfun to calculate the sum of two integers
# No stack is used
	
	# Start .data segment
	.data
	
	x:	.word 10
	y:	.word 20
	msg:	.asciiz	"x+y="
	lf:     .asciiz	"\n"

# ------------------------------------------------------------------
	.text
	.globl	main
main:

	# Initialize registers
	lw	$s0, x		# Reg $s0 = x
	lw	$s1, y		# Reg $s1 = y

	# Call function
	move	$a0, $s0	# Argument 1: x ($s0)
	move	$a1, $s1	# Argument 1: x ($s0)
	jal	addfun		    # Save current PC in $ra, and jump to addfun
	move	$t1,$v0		# Return value saved in $v0. 

	# Print msg1
	li	$v0, 4		# print_string syscall code = 4
	la	$a0, msg
	syscall

	# Print result (y)
	li		$v0,1		# print_int syscall code = 1
	move	$a0, $t1	# Load integer to print in $a0
	syscall

	# Print newline
	li	$v0,4		# print_string syscall code = 4
	la	$a0, lf
	syscall

	# Exit
	li	$v0,10		# exit
	syscall

# ------------------------------------------------------------------
	# FUNCTION: int addfun(int a, int b)
	# Arguments are stored in $a0, $a1
	# Return value is stored in $v0
	# Return address is stored in $ra (put there by jal instruction)
	
addfun:	# Do the function math
	add $t0,$a0,$a1		#  $t0 = $a0 + $a1  

	# Save the return value in $v0
	move $v0,$t0

	# Return from function
	jr $ra			# Jump to addr stored in $ra
	
# ------------------------------------------------------------------
