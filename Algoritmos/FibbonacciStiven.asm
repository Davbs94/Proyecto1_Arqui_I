addi R1, R1 (0) #int a = 0;
addi R2, R2 (1) #int b = 1;
addi R3, R3 (0) # i = 0
addi R4, R4 (4) # Se define "n", numero de iteraciones

Loop:
	cmp   R17, R4, R3
	beq   R4, R3, fin
	addi  R5, R1, (0)
	addi  R1, R2, (0)
	add   R2, R5, R2
	addi  R3, R3 (1)
	j Loop
fin:
