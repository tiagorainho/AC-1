.data
str1: .asciiz "Insert 2 numbers"
str2: .asciiz "Sum: "
str3: .asciiz "AC1 – P"

.eqv read_int, 5
.eqv print_int10, 1
.eqv print_string, 4				# x = 4
.text
.globl main
main:   # la $a0, str3				# String a0 = str3 -> virtual instruction decomposed in 2 native instructions
	# ori $v0, $0, print_string		# v0 = x
	# syscall				# print(str3)
	
	
		# print(str1)
	la $a0, str1
	ori $v0, $0, print_string
	syscall
	
		# read first value
	ori $v0, $0, read_int
	syscall
	or $t1, $0, $v0				# storing it in t1
	
		# read second value
	ori $v0, $0, read_int
	syscall
	or $t2, $0, $v0				# storing it in t2
	
	add $t3, $t1, $t2			# t3 = t1 + t2
	
	la $a0, str2
	ori $v0, $t0, print_string		
	syscall					# print(str1)
	
	move $a0, $t3
	ori $v0, $0, print_int10
	syscall					# print(t3)
	
	jr $ra 
