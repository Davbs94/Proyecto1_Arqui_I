addi $v0, $v0, 0x10010000 #posicion inicial de memoria

#guarda Lorem ipsum0 en memoria
addi $v1, $zero, 0x65726f4c
sw $v1, ($v0)
addi $v1,$zero, 0x7069206d
addi $v0, $v0, 0x4
sw $v1, ($v0)
addi $v1,$zero, 0x006d7573 
addi $v0, $v0, 0x4
sw $v1, ($v0)

addi $v0, $v0, 0x4
addi $t5, $zero, 20 #offset
addi $t4, $zero, 4 #b
div $t3, $t3,$t4

div $t7, $t5, $t4 #a/b
mul $t7, $t7, $t4 
sub $t7, $t5, $t7

add $s4, $v0, $t3 #posicion de memoria desde que voy a evaluar el texto


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
addi $v1,$zero, 0x006d7573 
addi $v0, $v0, 0x4
sw $v1, ($v0)

inicio:
	addi $a0, $zero, 0 #contador de letras acertadas
	addi $a1, $zero, 0 #contador de bytes del texto leídos
	addi $a2, $zero, 0 #conador de palabras
	addi $a3, $zero, 11 #cantidad de letras del patron
	addi $t8, $t8, 36 #cantidad de letras en el texto
	sub $t8, $t8, $t5
	add $s5, $s4, $t5 #para acceder al primer byte del bloque de memoria
	addi $s6, $zero, 0x10010000 #posicion de memoria inicial en la cual esta guardado el patron

comparacion:	
	beq $a1, $t8, final #compara si ya se revisaron todas las letras
	lb $t0, ($s6) #tomo la letra correspondiente al patron
	lb $t1, ($s5) #tomo la letra correspondiente al texto
	addi $a1, $a1, 1 #actualiza la cantidad de letras accedidas
	addi $s5, $s5, 1
	bne $t0, $t1, comparacion #si son diferentes las letras obtenidas	
	addi $a0, $a0, 1 #aumenta la cantidad de letras acertadas
	addi $s6, $s6, 1
	beq $a0, $a3, sumar #si la cantidad deletras acertadas = 11
	j comparacion
	
sumar:
	addi $a2, $a2, 1 #actualiza la cantidad de patrones acertados
	andi $a0, $a0, 0 #actualiza la cantidad de letras acertadas a 0
	andi $s6, $zero, 0
	addi $s6, $zero, 0x10010000 #posicion de memoria inicial en la cual esta guardado el patron
	j comparacion
	
final: