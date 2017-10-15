
	addi R1, R0, (0)
	addi R2, R0, (4)
	addi R3, R0, (5)

inicio:
	addi R2, R2, (4)
	addi R1, R1, (1)
	cmp  R19, R1,R3
	bne  R1, R3, inicio
	
final: