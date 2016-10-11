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
msg1:	.asciiz "\nÉ PAR, O NÚMERO É: "
msg2:	.asciiz "\nÉ ÍMPAR, O NÚMERO É: "
vetor:  .word 2,1,2,3,4,5,6,7,8,9
	.text
	la $s0, 0 	#Indice do vetor[x]
	li $t0, 0	#Inicializa contador do laço com 0 (início)
	li $t1, 10 	#Inicializa contador do laço com 10 (final)
	li $t4, 0	#Inicializa contador para quantidade de pares com 0
	li $t3, 0 	#Inicializa contador para quantidade de ímpares com 0
	li $t5, 2
loop:
	lw $t2, vetor($s0) #carregando valor da memória vetor[x]
	div $t0, $t2, $t5
	mul $t3, $t0, $t5
	bne $t3, $t2, nPar
	la $a0, msg1	
	addi $t4, $t4, 1 #Contador de pares
	li $v0, 4
	syscall
	lw $a0, vetor($s0)#Pegando o valor do vetor
	li $v0, 1 #Para printar
	syscall
	
	addi $s0, $s0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o indíce	
	bne $t1, $zero, loop #Condição para continuar


nPar:
	la $a0, msg2
	li $v0, 4
	addi $t3, $t3, 1 #Contador de Ímpares
	syscall
	lw $a0, vetor($s0)
	li $v0, 1
	syscall	
