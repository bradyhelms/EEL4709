# This program let the user input a number n, with n>0, then calculate and output n!. If n < 0, print an error message  
 
 .data    
    prompt1:    	.asciiz    	"Enter your number: "
    resultText:    	.asciiz   	"Your result is: "
    WrongInput:    	.asciiz   	"Invalid choice! "
	
 .text
.globl main
main:
 #asking the user to provide a number
    li $v0, 4     	#command for printing a string
    la $a0, prompt1 #loading the string to print into the argument to enable printing
    syscall      	#executing the command
        
    #the next block of code is for reading the number provided by the user
    li $v0, 5    #command for reading an integer
    syscall      #executing the command for reading an integer

	slti $t0, $v0, 0      # test for n < 0    
	beq  $t0, $zero, LS     
    #otherwise, the input is invalid
    li $v0, 4         		#command for printing a string
    la $a0, WrongInput    	#loading the string into the argument to enable printing
    syscall      			#executing the command
    li $v0,10 #This is to terminate the program
    syscall 

LS: move $a0, $v0     	#moving the number read from the user input into argument register $a0
	jal fact
	move	$t1, $v0	# store the result in $t1 
	
    li $v0, 4     		#command for printing a string
    la $a0, resultText 	#loading the string to print into the argument to enable printing
    syscall      		#executing the command

	li		$v0,1		# print_int syscall code = 1
	move	$a0, $t1	# Load integer to print in $a0
	syscall
	
    li $v0,10 #This is to terminate the program
    syscall 

fact:
	addi $sp, $sp, -8     # adjust stack for 2 items
    sw   $ra, 4($sp)      # save return address    
	sw   $a0, 0($sp)      # save argument    
	slti $t0, $a0, 1      # test for n < 1    
	beq  $t0, $zero, L1    
	addi $v0, $zero, 1    # if so, result is 1    
	addi $sp, $sp, 8      # pop 2 items from stack    
	jr   $ra              #   and return
L1: addi $a0, $a0, -1     # else decrement n  
	jal  fact             # recursive call    
	lw   $a0, 0($sp)      # restore original n    
	lw   $ra, 4($sp)      #   and return address    
	addi $sp, $sp, 8      # pop 2 items from stack    
	mul  $v0, $a0, $v0    # multiply to get result    
	jr   $ra              # and return