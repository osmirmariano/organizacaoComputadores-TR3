#Projetar um programa em assembly do Mips que faça a soma de todos elementos de um vetor de números float (vetor com 10 elementos) e
#imprima o resultado final;
#IMPLEMENTAÇÃO EM C++
#float vetor[10], soma = 0;
#for(int x = 0; x < 10; x++){
# 	soma = soma+vetor[x];
#}
#cout << "SOMA: " << soma;

	.data
vetor: 	.float 0,1,2,3,4,5,6,7,8,9

	.text
	l.s $f0, 0 #Indice do vetor[x]
	li $t0, 0 #Inicializa soma com 0
	li $t1, 10 #Inicializa contador com 10
loop:
	l.d $f2, vetor($f0) #carregando valor da memória vetor[x]
	add $t0, $t0, $f2 #soma = soma+vetor[x]
	addi $f0, $f0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o indíce
	bne $t1, $zero, loop #Condiçãoo para continuar
