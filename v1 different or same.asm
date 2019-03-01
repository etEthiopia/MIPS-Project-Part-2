.data
	prompt: .asciiz "Enter a number: "
	same: .asciiz "The numbers are equal."
	different: .asciiz "The numbers are different."
.text
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 5
		syscall
		
	move $t0, $v0
	li $v0, 4
	la $a0, prompt
		syscall
		
	li $v0, 5
		syscall
	
	move $t1, $v0
	beq $t1,$t0, Equal
	li $v0, 4
	la $a0, different
		syscall
		
	j Exit
		
	Equal:
		li $v0, 4
		la $a0, same
			syscall
	Exit:
		li $v0, 10
			syscall	
	