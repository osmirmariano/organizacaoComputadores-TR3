#Projetar um programa em assembly do Mips que faça a soma de todos elementos de um vetor de números float (vetor com 10 elementos) e
#imprima o resultado final;
#IMPLEMENTAÇÃO EM C++
#float vetor[10], soma = 0;
#for(int x = 0; x < 10; x++){
# 	soma = soma+vetor[x];
#}
#cout << "SOMA: " << soma;

	.data
msg:	.asciiz "\nSOMA DO VETOR É: "
vetor: 	.word 6,1,2,3,4,5,6,7,8,9
soma:	.word
	.text
		
	la $s0, 0 	#Indice do vetor[x]
	li $t0, 0 	#Inicializa soma com 0
	li $t1, 10 	#Inicializa contador com 10
loop:
	lw $t2, vetor($s0) 	#carregando valor da memória vetor[x]
	add $t0, $t0, $t2 	#soma = soma+vetor[x]
	addi $s0, $s0, 4 	#Incrementando s0 mais 4 bytes
	sw $t0, soma 		# armazena em soma o conte�do de $t2  
	addi $t1, $t1, -1 	#decrementando o indíce
	bne $t1, $zero, loop 	#Condição para continuar
	jal print		# chama a rotina print
	
print:  

	la $a0, msg		#$a0 recebendo a variável msg para escrever ela
	li $v0, 4		#printando string
	syscall
	lw $a0, soma		#Pegando o valor do vetor
	li $v0, 1 		#Para printar inteiro
	syscall
	