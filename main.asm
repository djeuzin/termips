.data

paragrafo: 		.asciiz "\n"
lista_palavras: 	.asciiz "palavras.txt"
buffer:      		.space 7000

.text 
.globl main
main:
	# 42 - gera numero aleatorio
	# 13 - abre arquivo
	# 14 - le arquivo
	# 16 - fecha arquivo
	# lista_palavras -> buffer
	# acessa a palavra numero X * 6 (tamanho das palavras)
	# carrega o vetor de caracteres em $s1
	# 11 - imprime caractere

# ----------------------------- NUMERO ALEATORIO -------------------------------

	# syscall 42 gera um numero aleatorio 0-1004
	# a0 eh limite inferior
	# a1 eh limite superior
	li $v0, 42
	li $a0, 0
	li $a1, 1004 #1004
	syscall
	
	move $t0, $a0

	# qual numero foi escolhido
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, paragrafo
	li $v0, 4
	syscall

# ----------------------------- CARREGAR PALAVRAS -------------------------------
	
	# open file 13 (ponteiro, modo de abertura, permissão)
	# 1005 palavras, leitura, (MARS ignora parece)
	li $v0, 13
	la $a0, lista_palavras
	li $a1, 0
	li $a2, 0
	syscall
		
	# read file 14 (chave, onde guardar, espaço a ser lido)
	# $v0 tem o acesso ao arquivo txt
	move $s0, $v0
	
	li $v0, 14
	move $a0, $s0	
	la $a1, buffer
	li $a2, 7000
	syscall
	
	# close file 16
	li $v0, 16
	move $a0, $s0
	syscall

# ----------------------------- PEGAR PALAVRA ALEATORIA -------------------------------
			
	# aqui eu tenho todas as palavras em buffer e em $t0 tenho a palavra aleatória
	# como temos palavras de 5 letras e cada letra é 1 byte
	# vamos pular de 7 em 7 bytes para pegar as palavras
	# considerando que o arquivo "palavras.txt" termine em CRLF do Windows e não em LF (unix) 
	
	li $t1, 7
	mul $t0, $t0, $t1
	
	# carrega a lista e acessa a palavra selecionada
	la $s7, buffer
	add $s7, $s7, $t0
	# agora $s1 aponta para a primeira palavra
	
	li $t0, 0 
	
# ----------------------------- IMPRESSAO -------------------------------
	
imprimir_letras:
    	beq $t0, 5, fim
    
    	# 11 - imprime char
    	lb $a0, 0($s7)
	li $v0, 11
	syscall

	# $s1 é o vetor de caracteres
	addi $s7, $s7, 1
    	addi $t0, $t0, 1
    	j imprimir_letras


fim:	
	li $v0, 10
	syscall
