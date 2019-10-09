.data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "valor em binario: "

.text
.globl main

.eqv read_int, 5
.eqv print_int10, 1
.eqv print_string, 4
.eqv print_char, 11

main:
	# print(str1)
	la $a0, str1
	li $v0, print_string
	syscall
		
	# read first value
	li $v0, read_int
	syscall
	move $t4, $v0		# t4 = value to converto into binary

	li $t1, 0
	#li $t2 , 32		# value to interate throw, mips has 32 bits so we go throw this process 32 times
	while:  bge $t1, 32, endw
		andi $t5, $t4, 0x80000000	# t5 = t4 && t3		
		beqz $t5, else		# if
		
		#move $a0, $1
		li $a0, '1'
		li $v0,  print_char
		syscall
		j endif
	else: 				# else
		#move $a0, $1
		li $a0, '0'
		li $v0,  print_char
		syscall
	endif:				#endif
		sll $t4, $t4, 1
		addi $t1, $t1, 1
		
		rem $t6, $t1, 4		# t6 = t1 % 4
		beq $t6, $0, else2	# if (t1 % 4 == 0)	
			j endif2
	else2:		
			li $a0, ' '
			li $v0, print_char
			syscall
	endif2:
		j while
	endw:
	
	jr	$ra