 .data    
    x1:        .word         0x7f7fffff
    x2:        .word         0x01000000	
    y1:        .word         0x7f7f0000
    y2:        .word         0x01100000
    x1_Text:    .asciiz      	"The result of x1 is: "
    x2_Text:    .asciiz      	"The result of x2 is: "
    y1_Text:    .asciiz       	"The result of y1 is: "
    y2_Text:    .asciiz       	"The result of y2 is: "
    result1Text:    .asciiz     "The result of x1+y1 is: "
    result2Text:    .asciiz     "The result of x2-y2 is: "
    
 .text
.globl main
main:

    l.s $f0, x1        		#loading x1 to f0 
    l.s $f2, x2        		#loading x2 to f2 

    l.s $f4, y1        		#loading y1 to f4 
    l.s $f6, y2        		#loading y1 to f6 

    add.s $f8,$f0,$f4       #this adds the values stored in $f0 and $f4 and assigns it to the temporary register $f8
    sub.s $f10,$f2,$f6      #this adds the values stored in $f2 and $f6 and assigns it to the temporary register $f10

    #The following line of code is to print x1
    li $v0,4    #this is the command for printing a string
    la $a0,x1_Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command

    #the following line of code prints out the result of x1
    li $v0,2
    mov.s $f12, $f0
    syscall

    #The following line of code is to print x2
    li $v0,4    #this is the command for printing a string
    la $a0,x2_Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command

    #the following line of code prints out the result of x2
    li $v0,2
    mov.s $f12, $f2
    syscall

    #The following line of code is to print y1
    li $v0,4    #this is the command for printing a string
    la $a0,y1_Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command

    #the following line of code prints out the result of y1
    li $v0,2
    mov.s $f12, $f4
    syscall

    #The following line of code is to print y2
    li $v0,4    #this is the command for printing a string
    la $a0,y2_Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command

    #the following line of code prints out the result of y2
    li $v0,2
    mov.s $f12, $f6
    syscall
	
    #The following line of code is to print the results x1+y1
    li $v0,4    #this is the command for printing a string
    la $a0,result1Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command
    
    #the following line of code prints out the result of x1+y1
    li $v0,2
    mov.s $f12, $f8
    syscall

    #The following line of code is to print the results x2-y2
    li $v0,4    #this is the command for printing a string
    la $a0,result2Text    #this loads the string to print into the argument $a0 for printing
    syscall      #executes the command
    
    #the following line of code prints out the result of x2+y1
    li $v0,2
    mov.s $f12, $f10
    syscall

    li $v0,10 #This is to terminate the program
    syscall
