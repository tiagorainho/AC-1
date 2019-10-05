.data 
.text
.globl main
main:   
	#ori $t0,$0,2
	#ori $t2,$0,-8
	#add $t1,$t0,$t0
	#add $t1,$t1,$t2
	
	ori $v0,$0,5		# alocar espaço para escrever valor
	syscall			# escrever valor
	or $t0,$0,$v0		# guardar o valor em t0
	
	ori $t2,$0,8,		# guardar o valor 8 em t2
	add $t1,$t0,$t0		# multiplicar t0 e guardar em t1
	sub $t1,$t1,$t2		# subtrair t1 por t2 e guardar em t1
	
	or $a0,$0,$t1		# guardar t1 em a0
	ori $v0,$0,1		# preparar para escrever resultado de v0
	syscall			# escrever resultado
	
	jr $ra