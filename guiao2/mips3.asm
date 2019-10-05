.data
.text
.globl main
main:	li $t0, 0x12345678	# save a number to t0 with 32 bits (8 digits, 2^8 = 32)  -> virtual instruction -> 2 native instructions
	or $t4, $0, $t0
	sll $t1, $t0, 1		# Shift left logical
	srl $t2, $t0, 1		# Shift right logical
	sra $t3, $t0, 1		# Shift right arithmetic
	
	## b -> binary to gray codification
	li $t5, 0x00000001	# t5 = x
	sra $t6, $t5, 1		# t6 = t5 (with shift to right)
	xor $t7, $t6,$t5	# t7 = t6 xor t5
	nor $t8, $t7, $0	# t8 = ! t7 (negaçao de t7) ->objetivo : completar um xnor para 00 == 1 e 11 == 1 enquanto que 01 == 0 e 10 == 0 
	
	# c -> gray to binary condification
	#or $t0, $0, $t8	# t0 = t8
	li $t0, 0xfffffffe
	sra $t1, $t0, 8		# t1 = t0 with 8 right shifts
	xor $t2, $t0, $t1	# xor
	nor $t0, $t2, $0	# nor to completate xnor from before
	
	sra $t1, $t0, 4		# t1 = t0 with 4 right shifts
	xor $t2, $t0, $t1	# xor
	nor $t0, $t2, $0	# nor to completate xnor from before
	
	sra $t1, $t0, 2		# t1 = t0 with 2 right shifts
	xor $t2, $t0, $t1	# xor
	nor $t0, $t2, $0	# nor to completate xnor from before
	
	sra $t1, $t0, 1		# t1 = t0 with 1 right shifts
	xor $t2, $t0, $t1	# xor						--> a ficar com o valor final PORQUE??
	nor $t7, $t2, $0	# nor to completate xnor from before
	
	
	
	jr $ra