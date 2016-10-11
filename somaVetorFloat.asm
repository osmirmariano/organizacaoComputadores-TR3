#Projetar um programa em assembly do Mips que fa�a a soma de todos elementos de um vetor de n�meros float (vetor com 10 elementos) e
#imprima o resultado final;
#IMPLEMENTA��O EM C++
#float vetor[10], soma = 0;
#for(int x = 0; x < 10; x++){
# 	soma = soma+vetor[x];
#}
#cout << "SOMA: " << soma;

	.data
vetor: .word 0,1,2,3,4,5,6,7,8,9

	.text
	la $s0, 0 #Indice do vetor[x]
	li $t0, 0 #Inicializa soma com 0
	li $t1, 10 #Inicializa contador com 10
loop:
	lw $t2, vetor($s0) #carregando valor da mem�ria vetor[x]
	add $t0, $t0, $t2 #soma = soma+vetor[x]
	addi $s0, $s0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o ind�ce
	bne $t1, $zero, loop #Condi��o para continuar