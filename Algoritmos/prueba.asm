




inicio:
	addi r1, r0, (0) #contador de letras acertadas
	addi r2, r0, (0) #contador de bytes del texto leídos
	addi r3, r0, (0) #conador de palabras
	addi r4, r0, (11) #cantidad de letras del patron
	addi r5, r5, (36) #cantidad de letras en el texto
	sub r5, r5, r10
	add r7, r6, r10 #para acceder al primer byte del bloque de memoria
	addi r8, r0, (20) #posicion de memoria inicial en la cual esta guardado el patron

comparacion:	
	beq r2, r5, final #compara si ya se revisaron todas las letras
	lb r14, r8 #tomo la letra correspondiente al patron
	lb r15, r7 #tomo la letra correspondiente al texto
	addi r2, r2, (1) #actualiza la cantidad de letras accedidas
	addi r7, r7, (1)
	bne r14, r15, comparacion #si son diferentes las letras obtenidas	
	addi r1, r1, (1) #aumenta la cantidad de letras acertadas
	addi r8, r8, (1)
	beq r1, r4, sumar #si la cantidad deletras acertadas = 11
	j comparacion
	
sumar:
	addi r3, r3, (1) #actualiza la cantidad de patrones acertados
	and r1, r1, r0 #actualiza la cantidad de letras acertadas a 0
	and r8, r0, r0
	addi r8, r0, (20) #posicion de memoria inicial en la cual esta guardado el patron
	j comparacion
	
final: