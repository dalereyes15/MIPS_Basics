
#
#	Data declarations go here!
.data

	#Strings
	firstPrompt: .asciiz "Please enter first integer: "
	secondPrompt: .asciiz "Please enter second integer : "
	errorMessage: .asciiz "ERROR"
	
	#Values
	firstIntegerValue: .word 0
	secondIntegerValue: .word 0
	divisionResult: .word 0

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
	
	#divide the two values
	div $t2, $t0, $t1
	
	#check if value is equal to 0 if so branch to error
	beq $t2, 0, errorBranch
	
	#store result into divisionResult
	sw $t2, divisionResult
	
	li $v0, 1
    lw $a0, divisionResult
    syscall
	
	#	Done terminate program
	li $v0, 10		# exit system call
	syscall
	
	errorBranch:
		li $v0, 4
		la $a0, errorMessage
		syscall
		
		li $v0, 10		# exit system call
		syscall


.end	main








