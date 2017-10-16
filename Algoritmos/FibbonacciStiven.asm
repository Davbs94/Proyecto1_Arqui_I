addi $1, $1 (0) #int a = 0;
addi $2, $2 (1) #int b = 1;
addi $3, $3 (0) # i = 0
addi $4, $4 (8) # Se define "n", nume$o de iteraciones

Loop:
	cmp   $17, $4, $3
	beq   $4, $3, fin
	addi  $5, $1, (0)
	addi  $1, $2, (0)
	add   $2, $5, $2
	addi  $3, $3 (1)
	j Loop
fin:
