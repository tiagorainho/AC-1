.data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "valor menor que zero, logo ignorado\n"
str3: .asciiz "A soma dos positivos: "

.text
.globl main

.eqv read_int, 5
.eqv print_int10, 1
.eqv print_string, 4

main:
	li $t1 , 0
	li $t2 , 0
	while:  bge $t1, 5, endw
	
		# print(str1)
		la $a0, str1
		ori $v0, $0, print_string
		syscall
		
		# read first value
		ori $v0, $0, read_int
		syscall
		or $t3, $0, $v0
		
		bgt $t3, $0, else
			la $a0, str2
			ori $v0, $0, print_string
			syscall
			j endif
			
		else: 	
			add $t2, $t2, $t3
	endif:					
		addi $t1, $t1, 1
		j while
	endw:
	
	la $a0, str3
	ori $v0, $0, print_string
	syscall
	
	move $a0, $t2
	ori $v0, $0, print_int10
	syscall	
		
	jr $ra
		