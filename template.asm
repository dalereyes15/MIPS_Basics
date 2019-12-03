
#
#	Data declarations go here!
.data

#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here


#	-------
#	Done terminate program
	li $v0, 10		# exit system call
	syscall

.end	main








