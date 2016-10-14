#Fazer um programa leia um vetor, mostre todos os números pares desse vetor, depois mostre todos
#os números ímpares e diga se no vetor há mais números pares ou números ímpares.
#int vetor[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}, cont1 = 0, cont2 = 0;
#Implementação em C
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
#Implementação em Assembly
		.data
msg1:		.asciiz "\nÉ PAR, O NÚMERO É: "
msg2:		.asciiz "\nÉ ÍMPAR, O NÚMERO É: "
quantPar:	.asciiz "\nEXISTEM MAIS NÚMEROS PARES: "
quantImpar:	.asciiz "\nEXISTEM MAIS NÚMEROS ÍMPARES: "
vetor:  .word 8,2,6,4,3,4,6,7,8,9
	.text
	la $s0, 0 	#Indice do vetor[x]
	li $t0, 0	#Inicializa contador do laço com 0 (início)
	li $t1, 10 	#Inicializa contador do laço com 10 (final)
	li $t4, 0	#Inicializa contador para quantidade de pares com 0
	li $t3, 0 	#Inicializa contador para quantidade de ímpares com 0
	li $t5, 2	#Inicializando com valor $t5 para realizar a divisão
loop:
	lw $t2, vetor($s0) 	#carregando valor da memória vetor[x]
	div $t0, $t2, $t5 	#Realizando a divisão entre o valor que está na posição do vetor e 2 $t5
	mul $t3, $t0, $t5 	#Realiza a multiplicação entre o resultado da divisão e 2 $t5
	bne $t3, $t2, nPar 	#Se $t3 != $t2 é impar, então entra no nPar
	la $a0, msg1		#$a0 recebendo a variável msg1 dizendo que é par
	addi $t4, $t4, 1 	#Contar a quantidade de números que são pares
	li $v0, 4
	syscall
	lw $a0, vetor($s0)	#Pegando o valor do vetor
	li $v0, 1 		#Para printar
	syscall
	
	addi $s0, $s0, 4 	#Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 	#decrementando o indíce	
	bne $t1, $zero, loop 	#Condição para continuar

nPar:
	la $a0, msg2
	li $v0, 4
	addi $t3, $t3, 1 	#Contador de Ímpares
	syscall
	lw $a0, vetor($s0)	#Pegando o valor do vetor
	li $v0, 1
	syscall	
	addi $s0, $s0, 4 	#Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 	#decrementando o indíce	
	beq $t1, $zero, quantMaior
	j loop
quantMaior:
	slt $t6, $t4, $t3	#Fazendo o teste de quem é o maior
	beq $t6, 1, par		#Condição caso não seja, desvia para a par
	la $a0, quantImpar	#$a0 recebendo quantImpar
	li $v0, 4		#Para printar string
	syscall
	j final			#Jump para encerrar aplicação
par:
	la $a0, quantPar	#$a0 recebendo quantPar
	li $v0, 4		#Para printar string
	syscall
	j final
final:
	
