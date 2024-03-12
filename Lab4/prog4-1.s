.data
    inputStr:       .asciiz     "Input a number to calculate factorial: "
    outputStr:      .asciiz     "The result is: "

.text
.globl main
main:
    # Prompt user for integer
    li $v0, 4
    la $a0, inputStr
    syscall

    # Get user input
    li $v0, 5
    syscall
    move $a0, $v0

    # Convert integer to floating point
    #   1. use mtc to move integer into fp register 
    #   2. convert the int to fp
    mtc1 $a0, $f0
    cvt.s.w $f0, $f0

    # Load some values into floating point registers for use 
    # in the factorial subroutine
    li.s $f1, 1.0
    li.s $f2, -1.0
    li.s $f3, 0.0 

factorial:
   
    # Multiply the user value by the value in $f1 (begins with 1)
    mul.s $f1, $f1, $f0

    # Subtract 1 from user value 
    add.s $f0, $f0, $f2

    # Check if user value is == 0, set flag if so
    c.eq.s $f0, $f3

    # If flag not set, jump to factorial subroutine
    bc1f factorial

    # If flag was set, continue from this point
    # Load and print the output string
    li $v0, 4
    la $a0, outputStr
    syscall

    # Load and print the floating point result
    li $v0, 2
    mov.s $f12, $f1
    syscall

    # Exit
    li $v0, 10
    syscall
