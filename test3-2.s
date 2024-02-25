# Assembly program for function call and return using stack
# This program calls a simple function (addfun) to calculate the sum of six integers
# According to MIPS register usage convention, there are four registers, i.e., a0-a3, are used
# for passing parameters. If a function is taking more than four parameters, one possible way to pass parameter is to use stack
# This assembly program implements the following C program with several parameters passed from stack.  
# #include <stdio.h>
#  int calc(int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8)
#  {
#	return (x1 + x2) - (x3 - x4) + (x5 - x6) + (x7 + x8); 
#  }
#  int main()
#  {
#	int x1, x2, x3, x4, x5, x6, x7, x8;
#	int output; 
#	
#	output = calc(x1, x2, x3, x4, x5, x6, x7, x8);
#
#	printf("Your results is %d\n", output);	
#  }
	
	# Start .data segment
	.data
	
	x1:	.word 10
	x2:	.word 2
	x3:	.word 15
	x4:	.word 9
	x5:	.word 30
	x6:	.word 5
	x7:	.word 16
	x8:	.word 9

	msg:	.asciiz	"(x1 + x2) - (x3 - x4) + (x5 - x6) + (x7 + x8)="
	lf:     .asciiz	"\n"

# ------------------------------------------------------------------
	.text
	.globl	main
main:

	# Call function
	lw	$a0, x1			# Argument 1: x1
	lw	$a1, x2			# Argument 2: x2
	lw	$a2, x3			# Argument 3: x3
	lw	$a3, x4			# Argument 4: x4
	
	addi $sp, $sp, -16     # adjust stack to store 4 integers

	#PUSH four arguments into stack
	lw	 $t0, x5		   # Argument 5: x5	
	sw   $t0, 12($sp)
	lw	 $t0, x6		   # Argument 6: x6	
	sw   $t0, 8($sp)
	lw	 $t0, x7		   # Argument 7: x7	
	sw   $t0, 4($sp)
	lw	 $t0, x8		   # Argument 8: x12	
	sw   $t0, 0($sp)
	
	jal	calc		    # Save current PC in $ra, and jump to calc
	move	$t1,$v0		# Return value saved in $v0. 
	addi $sp, $sp, 16     # POP 4 integers out of stack	
	
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
	# FUNCTION: int calc(int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8)
	# Arguments x1, x2, x3, x4 are stored in $a0, $a1
	# Arguments x5, x6, x7, x8 are stored in stack
	# Return value is stored in $v0
	# Return address is stored in $ra (put there by jal instruction)
	
calc:	# Do the function math
	lw   $t3, 0($sp)            # retrive x8
	lw   $t2, 4($sp)			# retrive x7
	lw   $t1, 8($sp)			# retrive x6	
	lw   $t0, 12($sp)			# retrive x5

	addi $sp, $sp, -4     		# adjust stack to store the callee save register s0, which will be used inside the function
	sw   $s0, 12($sp)			# store the callee save register s0
	
	add $v0, $zero, $zero
	add $s0, $a0, $a1 
	add $v0, $v0, $s0           #v0= (x1+x2) 

	sub $s0, $a2, $a3 
	sub $v0, $v0, $s0           #v0= (x1+x2) - (x3 - x4) 

	sub $s0, $t0, $t1 
	add $v0, $v0, $s0           #v0= (x1+x2) - (x3 - x4) + (x5 - x6)
	
	add $s0, $t2, $t3 
	add $v0, $v0, $s0           #v0= (x1+x2) - (x3 - x4) + (x5 - x6) + (x7 + x8)
	
	lw   $s0, 12($sp)			# restore the value of $s0
	addi $sp, $sp, -4     		# adjust stack

	# Return from function
	jr $ra			# Jump to addr stored in $ra
	
# ------------------------------------------------------------------
