#3 = 3 = R1
#4 = 4 = R2
#5 = 5 = R3
#6 = 6 = R4
addi $3, $3, 0x10010000 #posicion inicial de memoria

#guardar en memoria el texto
#Lorem ipsum0Lorem ipsum0Lorem ipsum
addi $4, $zero, 0x65726f4c
sw $4, ($3)
addi $4,$zero, 0x7069206d
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x006d7573 
addi $3, $3, 0x4
sw $4, ($3)
addi $4, $zero, 0x65726f4c
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x7069206d
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x006d7573 
addi $3, $3, 0x4
sw $4, ($3)
addi $4, $zero, 0x65726f4c
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x7069206d
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x006d7573 
addi $3, $3, 0x4
sw $4, ($3)


inicio:
	
	addi $5, $zero, 0 #contador de palabras
	
	addi $6, $zero, 7741639 #se almacena el valor has de Lorem ipsum porque siempre es el mismo
	addi $7, $zero, 11 #almacena el tamano del patron
	addi $8, $zero, 3 #almacena la base por la cual se multiplica
	addi $9, $zero, 3 #almacena la base por la cual se multiplica (temporal)
	addi $10, $zero, 59049 #guarda el valor de 3**10	
	subi $11, $7, 1 #temporal de n -1 = 10 - para iterar en preHash
	subi $12, $7, 1 #temporal de n -1 = 10 - para iterar en elevar
	subi $13, $7, 1 
	
	addi $14, $zero, 0 #almacena el offset
	addi $15, $14, 0x10010000 #direccion de memoria en la cual se inicial con el offset
	addi $16,$15, 0 #temporal de la posicion inicial de memoria
	
	addi $17, $zero, 36 #tamano del texto
	sub $17, $17, $14 #se itera tamano texto - offset
	
	#sub $17, $17, $7 #condicion de terminacion $17 = cant texto - offset - cantLetrasPatron
	
	addi $18, $zero, 0 #guarda el hash
	addi $19, $zero, 1	
	addi $20, $zero, 1
elevar:
	beq $12, $19, preHash
	mul $9, $9, $8 #101*101
	subi $12, $12, 1
	j elevar	
	
preHash:
	lb $21, ($16) #carga letra en hex de memoria
	addi $16, $16, 1 #actualiza la pos de memoria en +1
	mul $21, $21, $9 #posMemoria*elevar
	add $18, $18, $21 
	subi $11, $11, 1
	addi $12, $11, 0 #12 = 11
	addi $9, $8, 0
	bne $11, $20, elevar
	
	lb $21, ($16) #carga letra en hex de memoria
	addi $16, $16, 1 #actualiza la pos de memoria en +1
	mul $21, $21, $8 #posMemoria*base
	add $18, $18, $21 
	lb $21, ($16) #carga letra en hex de memoria
	addi $16, $16, 1 #actualiza la pos de memoria en +1
	add $18, $18, $21  #suma texto[10]*Base^0 = oldHash
	
	beq $18, $6, sumar

KarpRobin:
	beq $17, $13, end
	### newHash = Base*[oldHash - a*base^(n-1)] + d
	lb $9, ($15) #con la posicion texto[m] = a
	addi $15, $15, 1 #actualiza la pos de memoria en +1	
	mul $9, $9, $10 #9 = text[m]*base^(n-1) = a*base^(n-1)
	sub $18, $18, $9 #oldHash - a*base^(n-1)
	mul $18, $18, $8 #Base*[oldHash - a*base^(n-1)]
	lb $9, ($16) #con la posicion de memoria text[m'] = d
	addi $16, $16, 1 #actualiza la pos de memoria en +1
	add $18, $18, $9 #newHash = Base*[oldHash - a*base^(n-1)] + d
	subi $17, $17, 1
	bne $18, $6, KarpRobin

sumar:
	addi $5, $5, 1 #actualiza la cantidad de patrones acertados
	j KarpRobin	
	
end:	
