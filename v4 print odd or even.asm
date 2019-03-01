.data
	prompt: .asciiz "Enter a number: "
	zero: .asciiz "The number is zero."
	odd: .asciiz "The number is odd."
	even: .asciiz "The number is even."
.text
	addi $t2, $zero, 2
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 5
		syscall
		
	move $t0, $v0
	
	beq $t0,0, Equal
	
	div $t0, $t2
	mflo $s0
	mfhi $t1
	#move $t1, $s1
	
	
	
	
	beq $t1,0 Even
	li $v0, 4
	la $a0, odd
		syscall
	j Exit
	
	Even:
		li $v0, 4
		la $a0, even
			syscall
	j Exit
		
	Equal:
		li $v0, 4
		la $a0, zero
			syscall
	Exit:
		li $v0, 10
			syscall	
	
