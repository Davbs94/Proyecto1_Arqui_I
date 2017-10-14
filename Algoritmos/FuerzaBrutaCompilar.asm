addi $3, $3,  0

addi $3, $3, 0x4
addi $5, $zero, 0 
addi $6, $zero, 4 
div $7, $7,$6

div $8, $5, $6 
mul $8, $8, $6 
sub $8, $5, $8

add $9, $3, $7 

inicio:
	addi $10, $zero, 0
	addi $11, $zero, 0
	addi $12, $zero, 0
	addi $13, $zero, 11
	addi $14, $14, 36 
	sub $14, $14, $5
	add $16, $9, $5 
	addi $18, $zero, 

comparacion:	
	beq $11, $14, final
	lb $17, ($18) 
	lb $15, ($16) 
	addi $11, $11, 1
	addi $16, $16, 1
	bne $17, $15, comparacion 
	addi $10, $10, 1 
	addi $18, $18, 1
	beq $10, $13, sumar 
	j comparacion
	
sumar:
	addi $12, $12, 1 
	andi $10, $10, 0 
	andi $18, $zero, 0
	addi $18, $zero, 0
	j comparacion
	
final:
