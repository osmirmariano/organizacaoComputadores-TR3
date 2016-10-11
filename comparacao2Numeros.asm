#Fazer um programa que compare dois números (a,b) e diga se a>b, ou b>a, ou ainda se a==b
	.data
msg1:	.asciiz "A é maior que C"
msg2:	.asciiz "C é maior que A"
msg3: 	.asciiz "A é igual a C"

a: 	.word 2
c: 	.word 9
	
	.text
	lw $a0, a
	lw $a1, c
	li $v0, 1

	ble $a0, $a1, Amaior #Maior
	la $a0, msg1
	li $v0, 4
	syscall
	jr $ra
	
Amaior:
	ble $a1, $a0,  Bmaior#Maior
	la $a0, msg2
	li $v0, 4
    	syscall
    	jr $ra
    	
Bmaior:
	la $a0, msg3
	li $v0, 4
    	syscall
    	jr $ra