#v0 = 3 = R1
#$v1 = 4 = R2
#t5 = 5 = R3
#$t4 = 6 = R4
#t3 = 7 =R5
#t7 = 8 = R6
#s4 = 9 = R7
#$a0 = 10 = R8
#a1 = 11 = R9
#a2 = 12 = R10
#a3 = 13 = R11
#t8 = 14 = R12
#t1 = 15 = R13
#s5 = 16 = R14
#t0 = 17 = R15
#s6 = 18 = R16

addi $3, $3,  0x10010000 #posicion inicial de memoria

#guarda Lorem ipsum0 en memoria
addi $4, $4, 0x65726f4c
sw $4, ($3)
addi $4,$zero, 0x7069206d
addi $3, $3, 0x4
sw $4, ($3)
addi $4,$zero, 0x006d7573 
addi $3 $3, 0x4
sw $4, ($3)

addi $3, $3, 0x4
addi $5, $zero, 0 #offset
addi $6, $zero, 4 #b
div $7, $7,$6

div $8, $5, $6 #a/b
mul $8, $8, $6 
sub $8, $5, $8

add $9, $3, $7 #posicion de memoria desde que voy a evaluar el texto


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
	addi $10, $zero, 0 #contador de letras acertadas
	addi $11, $zero, 0 #contador de bytes del texto leídos
	addi $12, $zero, 0 #conador de palabras
	addi $13, $zero, 11 #cantidad de letras del patron
	addi $14, $14, 36 #cantidad de letras en el texto
	sub $14, $14, $5
	add $16, $9, $5 #para acceder al primer byte del bloque de memoria
	addi $18, $zero, 0x10010000 #posicion de memoria inicial en la cual esta guardado el patron

comparacion:	
	beq $11, $14, final #compara si ya se revisaron todas las letras
	lb $17, ($18) #tomo la letra correspondiente al patron
	lb $15, ($16) #tomo la letra correspondiente al texto
	addi $11, $11, 1 #actualiza la cantidad de letras accedidas
	addi $16, $16, 1
	bne $17, $15, comparacion #si son diferentes las letras obtenidas	
	addi $10, $10, 1 #aumenta la cantidad de letras acertadas
	addi $18, $18, 1
	beq $10, $13, sumar #si la cantidad deletras acertadas = 11
	j comparacion
	
sumar:
	addi $12, $12, 1 #actualiza la cantidad de patrones acertados
	andi $10, $10, 0 #actualiza la cantidad de letras acertadas a 0
	andi $18, $zero, 0
	addi $18, $zero, 0x10010000 #posicion de memoria inicial en la cual esta guardado el patron
	j comparacion
	
final:
