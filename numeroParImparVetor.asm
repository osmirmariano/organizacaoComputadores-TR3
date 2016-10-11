#Fazer um programa leia um vetor, mostre todos os números pares desse vetor, depois mostre todos
#os números ímpares e diga se no vetor há mais números pares ou números ímpares.
#int vetor[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}, cont1 = 0, cont2 = 0;
#for(int x = 0; x < 10; x++){
#	if(vetor[x]/2 == 0){
#		printf ("PARES: %d", vetor[x]);
#		cont1++;
#	}
#	else{
#		printf("IMPARES: %d", vetor[x]);
#		cont2++;
#	}
#}
#printf ("TOTAL DE PARES: %d", cont1);
#printf ("TOTAL DE IMPARES: %d", cont2);

	.data
msg1:	.asciiz "É PAR: "
msg2:	.asciiz "É ÍMPAR: "
vetor:  .word 0,1,2,3,4,5,6,7,8,9
	.text
	la $s0, 0 	#Indice do vetor[x]
	li $t0, 0	#Inicializa contador do laço com 0 (início)
	li $t1, 10 	#Inicializa contador do laço com 10 (final)
	li $t2, 0	#Inicializa contador para quantidade de pares com 0
	li $t3, 0 	#Inicializa contador para quantidade de ímpares com 0
	li $t5, 2
loop:
	lw $t2, vetor($s0) #carregando valor da memória vetor[x]
	div $t0, $t2, $t5
	mul $t3, $t0, $t5
	beq $t3, $t5, nPar
	la $a0, msg1
	li $v0, 4
	syscall
	nPar:
		#mul $t3, $t0, $t2
		#beq $t3, $zero, label
		#li $v0, 4
	#	jr $ra
	addi $s0, $s0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o indíce
	bne $t1, $zero, loop #Condição para continuar
