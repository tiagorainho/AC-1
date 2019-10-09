.data
.text
.globl main
main:	ori $t0, $0, 0x0F1E	# t0 = 0
	nor $t1, $t0, $0	# t1 = not(t0) (bit a bit)
	jr $ra