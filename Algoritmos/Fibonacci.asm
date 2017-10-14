
inicio:
	addi R1, R1, (6)  #Numero de la secuencia
	addi R2, R2, (0)  #Numero A
	addi R3, R3, (1)  #Numero B y Resultado
	addi R4, R4, (0)  #contador

	beq R1,R2, cero
	beq R1,R3, final
	addi R4, R4, (2)


fibo: 
	addi R5, R3, (0)
	add R3, R3, R2
	addi R2, R5, (0)
	beq R1,R4, final
	addi R4, R4, (1)
	j fibo
cero:
	addi R3, R2, (0)
	j final


final:	