.data
	prompt: .asciiz "Enter a number: "
	zero: .asciiz "The number is zero."
	positive: .asciiz "The number is positive."
	negative: .asciiz "The number is negative."
.text
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 5
		syscall
		
	move $t0, $v0
	
	beq $t0,0, Equal
	
	
	bgt $t0,0 Greater
	li $v0, 4
	la $a0, negative
		syscall
	j Exit
	
	Greater:
		li $v0, 4
		la $a0, positive
			syscall
	j Exit
		
	Equal:
		li $v0, 4
		la $a0, zero
			syscall
	Exit:
		li $v0, 10
			syscall	
	