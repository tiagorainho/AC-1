.data
.text
.globl main
main:   ori $t0, $0, 1		# save value x in position t0
	ori $t1, $0, 2		# save value y in position t1
	and $t2, $t0, $t1	# and operation (bit to bit)
	or $t3, $t0, $t1	# or operation (bit to bit)
	nor $t4, $t0, $t1	# nor operation (bit to bit)
	xor $t5, $t0, $t1	# xor operation (bit to bit)
	jr $ra