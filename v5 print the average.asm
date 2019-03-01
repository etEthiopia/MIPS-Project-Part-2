.data
	prompt: .asciiz "Enter a grade: "
	resultA: .byte 'A'
	resultB: .byte 'B'
	resultC: .byte 'C'
	subFloat: .float 3.0
	A: .float 90.0
	B: .float 80.0
	even: .asciiz "Your average is : "
	grade: .asciiz "Your grade is : "
.text
	
	
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 6
		syscall
		
	mov.s $f4, $f0
	
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 6
		syscall
		
	mov.s $f8, $f0
	
	li $v0, 4
	la $a0, prompt
		syscall
	
	li $v0, 6
		syscall
		
	
	
	add.s $f4, $f4, $f8
	add.s $f4, $f4, $f0
	lwc1 $f8, subFloat
	div.s $f0,$f4,$f8
	
	
	li $v0, 4
	la $a0, even
		syscall
	
	li $v0, 2
	
	mov.s $f12, $f0
		syscall
		
	lwc1 $f8, A
	lwc1 $f4, B
	mov.s $f16, $f12
	bgt $f16,$f8, GradeA
	bgt $f16,$f4, GradeB
		li $v0, 4
		la $a0, resultC
			syscall
		
	j Exit
	
	GradeA: 
		li $v0, 4
		la $a0, resultA
			syscall
	j Exit
	
	GradeB:
		li $v0, 4
		la $a0, resultB
			syscall
			
	Exit:
		li $v0, 10
			syscall	
	
	
	
	
	