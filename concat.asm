
#
#	Data declarations go here!
.data
	string1: .space 100
	string2: .space 100
	
	
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here

	#load first string
	li $v0, 8
	la $a0, string1
	li $a1, 100
	syscall
	
	#load second string
	li $v0, 8
	la $a0, string2
	li $a1, 100
	syscall
	
	#print second string
	li $v0, 4
	la $a0, string2
	syscall
	
	#print first string
	li $v0, 4
	la $a0, string1
	syscall
	

#	-------
#	Done terminate program
	li $v0, 10		# exit system call
	syscall

.end	main








