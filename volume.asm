
#
#	Data declarations go here!
.data

#variables
	radius: .word 2
	volume: .word 1
	fourdivthreetimespi: .word 3
	radiuscubed: .word 1
	
#strings
	askForRadius: .asciiz "Please enter radius: "
	result: .asciiz "The volume is: "
	
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here


	# ouput: 
	# printf("Enter radius: ");
	li $v0, 4
	la $a0, askForRadius
	syscall
	
	# store input into radius
	li $v0, 5	# read int 
	syscall
	sw $v0, radius

	#cube radius
	lw $t0, radius
	lw $t1, radiuscubed
	mul $t1, $t0, $t0
	mul $t1, $t1, $t0
	#write it to radiuscubed
	sw $t1, radiuscubed

	lw $t0, radiuscubed
	lw $t1, fourdivthreetimespi
	mul $t2, $t0, $t1
	# print volume
	sw $t2, volume
	
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	lw $a0, volume
	syscall
	

#	-------
#	Done terminate program
	li $v0, 10		# exit system call
	syscall

.end	main








