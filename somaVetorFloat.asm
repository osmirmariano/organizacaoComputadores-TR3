#Projetar um programa em assembly do Mips que faça a soma de todos elementos de um vetor de números float (vetor com 10 elementos) e
#imprima o resultado final;
#IMPLEMENTAÇÃO EM C++
#float vetor[10], soma = 0;
#for(int x = 0; x < 10; x++){
# 	soma = soma+vetor[x];
#}
#cout << "SOMA: " << soma;

	.data
vetor: 	.float 0,1.7,2,3,4,5,6,7.5,8,9

	.text
	li $v0, 2 #Indice do vetor[x]
	li $t0, 0 #Inicializa soma com 0
	li $t1, 10 #Inicializa contador com 10
loop:
	lwcl $f12, vetor($v0) #carregando valor da memória vetor[x]
	mov.s $f1, $f0
	add.s $f3, $f3, $f0 #soma = soma+vetor[x]
	addi $t0, $t0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o indíce
	bne $t1, $zero, loop #Condiçãoo para continuar