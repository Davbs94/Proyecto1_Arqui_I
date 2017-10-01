addi $v0, $v0, 0x10010000 #posicion inicial de memoria

#guardar en memoria el texto
#Lorem ipsum0Lorem ipsum0Lorem ipsum
addi $v1, $zero, 0x65726f4c
sw $v1, ($v0)
addi $v1,$zero, 0x7069206d
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x006d7573 
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1, $zero, 0x65726f4c
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x7069206d
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x006d7573 
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1, $zero, 0x65726f4c
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x7069206d
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x006e7573 
addi $v0, $v0, 0x4
sw $v1, ($v0)


inicio:
	
	addi $s7, $zero, 0 #contador de palabras
	
	addi $a0, $zero, 7741639 #se almacena el valor has de Lorem ipsum porque siempre es el mismo
	addi $a1, $zero, 11 #almacena el tamano del patron
	addi $a2, $zero, 3 #almacena la base por la cual se multiplica
	addi $t6, $zero, 3 #almacena la base por la cual se multiplica (temporal)
	addi $a3, $zero, 59049 #guarda el valor de 101**10	
	subi $t4, $a1, 1 #temporal de n -1 = 10 - para iterar en preHash
	subi $t5, $a1, 1 #temporal de n -1 = 10 - para iterar en elevar
	subi $s2, $a1, 1 
	
	addi $t0, $zero, 11 #almacena el offset
	addi $t1, $t0, 0x10010000 #direccion de memoria en la cual se inicial con el offset
	addi $t3,$t1, 0 #temporal de la posicion inicial de memoria
	
	addi $t2, $zero, 37 #tamano del texto
	sub $t2, $t2, $t0 #se itera tamano texto - offset
	
	#sub $t2, $t2, $a1 #condicion de terminacion $t2 = cant texto - offset - cantLetrasPatron
	
	addi $t9, $zero, 0 #guarda el hash
	addi $s6, $zero, 1	
	addi $s5, $zero, 1
elevar:
	beq $t5, $s6, preHash
	mul $t6, $t6, $a2 #101*101
	subi $t5, $t5, 1
	j elevar	
	
preHash:
	lb $t7, ($t3) #carga letra en hex de memoria
	addi $t3, $t3, 1 #actualiza la pos de memoria en +1
	mul $t7, $t7, $t6 #posMemoria*elevar
	add $t9, $t9, $t7 
	subi $t4, $t4, 1
	addi $t5, $t4, 0 #t5 = t4
	addi $t6, $a2, 0
	bne $t4, $s5, elevar
	
	lb $t7, ($t3) #carga letra en hex de memoria
	addi $t3, $t3, 1 #actualiza la pos de memoria en +1
	mul $t7, $t7, $a2 #posMemoria*base
	add $t9, $t9, $t7 
	lb $t7, ($t3) #carga letra en hex de memoria
	addi $t3, $t3, 1 #actualiza la pos de memoria en +1
	add $t9, $t9, $t7  #suma texto[10]*Base^0 = oldHash
	
	beq $t9, $a0, sumar

KarpRobin:
	beq $t2, $s2, end
	### newHash = Base*[oldHash - a*base^(n-1)] + d
	lb $t6, ($t1) #con la posicion texto[m] = a
	addi $t1, $t1, 1 #actualiza la pos de memoria en +1	
	mul $t6, $t6, $a3 #t6 = text[m]*base^(n-1) = a*base^(n-1)
	sub $t9, $t9, $t6 #oldHash - a*base^(n-1)
	mul $t9, $t9, $a2 #Base*[oldHash - a*base^(n-1)]
	lb $t6, ($t3) #con la posicion de memoria text[m'] = d
	addi $t3, $t3, 1 #actualiza la pos de memoria en +1
	add $t9, $t9, $t6 #newHash = Base*[oldHash - a*base^(n-1)] + d
	subi $t2, $t2, 1
	bne $t9, $a0, KarpRobin

sumar:
	addi $s7, $s7, 1 #actualiza la cantidad de patrones acertados
	j KarpRobin	
	
end:	
