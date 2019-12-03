
#
#	Data declarations go here!
.data
	#variables
	userValue: .word 0
	
	#text
	prompt: .asciiz "Please enter an integer: "
	printIfOdd: .asciiz "ODD"
	printIfEven: .asciiz "EVEN"
	
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here
	
	#display prompt
	li $v0, 4
	la $a0, prompt
	syscall

	#read and store integer
	li $v0, 5
	syscall
	sw $v0, userValue
	
	lw $t0, userValue
    li $t1, 2

    div $t0, $t1        # divide number by 2
    mfhi $t2           # store result in t2
    beq $t2, 0, even
	
	li $v0, 4
	la $a0, printIfOdd
	syscall
	
	#terminate since odd has been printed
	li $v0, 10		# exit system call
	syscall
	
	even:
		li $v0, 4
		la $a0, printIfEven
		syscall
	
		#terminate because even has been printed
		li $v0, 10		
		syscall


.end	main








