
#
#	Data declarations go here!
.data
	
	#Strings
	firstPrompt: .asciiz "Please enter first integer: "
	secondPrompt: .asciiz "Please enter second integer : "
	resultingMessage: .asciiz "The larger number is: "
	
	#Values
	firstIntegerValue: .word 0
	secondIntegerValue: .word 0

#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here

	#display first prompt
	li $v0, 4
	la $a0, firstPrompt
	syscall
	
	#store input in first value
	li $v0, 5
	syscall
	sw $v0, firstIntegerValue
	
	#display second prompt
	li $v0, 4
	la $a0, secondPrompt
	syscall
	
	#store input in second value
	li $v0, 5
	syscall
	sw $v0, secondIntegerValue
	
	#load first and second integer
	lw $t0, firstIntegerValue
	lw $t1, secondIntegerValue
	
	#do the branch if greater than
	bgt $t0, $t1, firstNumberIsGreater	
		
	#display resulting Message
	li $v0, 4	
	la $a0, resultingMessage
	syscall	
	
	#display secondIntegerValue
	li $v0, 1
	lw $a0, secondIntegerValue
	syscall
	
	#Terminate Program
	li $v0, 10		# exit system call
	syscall
	
	#Will only enter if first number is greater than 2nd
	firstNumberIsGreater:
		
		li $v0, 4
		la $a0, resultingMessage
		syscall
		
		li $v0, 1
		lw $a0, firstIntegerValue
		syscall
		
		li $v0, 10		# exit system call
		syscall
		

.end	main








