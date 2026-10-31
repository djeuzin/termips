.data

nova_linha: 		.asciiz "\n"
lista_palavras: 	.asciiz "palavras.txt"
buffer_banco:      	.space 7000
db_rng:			.asciiz "Numero aleatorio: "
db_palavra:		.asciiz "Palavra escolhida: "
buffer_input:		.space 100
msg_erro_input:		.asciiz "Entrada invalida. Tente novamente.\n"
msg_game_over:          .asciiz "Fim de jogo. A palavra era: "


# ------ Como declarar uma função ------
# .globl <nome da funcao>
# .ent <nome da funcao>
# <nome da funcao>:
# 	corpo da função
#
#	jr $ra
# .end <nome da funcao>

# ------ Como chamar uma função -------
# jal <nome da funcao>

.text 
.globl main
main:
# ----------------------------- SETUP -------------------------------
	# Flag para debug. 
	# 0 - Falso. Modo normal
	# 1 - Verdadeiro. Mostra opções.
	li $s6, 0
	li $s5, 0 # Tentativas
	
	# 42 - gera numero aleatorio
	# 13 - abre arquivo
	# 14 - le arquivo
	# 16 - fecha arquivo
	# lista_palavras -> buffer
	# acessa a palavra numero X * 6 (tamanho das palavras)
	# carrega o vetor de caracteres em $s1
	# 11 - imprime caractere

# ----------------------------- NUMERO ALEATORIO -------------------------------
gera_numero:
	# syscall 42 gera um numero aleatorio 0-1004
	# a0 eh limite inferior
	# a1 eh limite superior
	li $v0, 42
	li $a0, 0
	li $a1, 1004 #1004
	syscall
	
	move $t0, $a0

	# qual numero foi escolhido
	beq $s6, 0, carrega_palavra
	
	la $a0, db_rng
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, nova_linha
	li $v0, 4
	syscall

# ----------------------------- CARREGAR PALAVRAS -------------------------------
carrega_palavra:
	# open file 13 (ponteiro a0, modo de abertura a1, permissão, a2)
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
	la $a1, buffer_banco
	li $a2, 7000
	syscall
	
	# close file 16
	li $v0, 16
	move $a0, $s0
	syscall

# ----------------------------- PEGAR PALAVRA ALEATORIA -------------------------------
			
	# aqui eu tenho todas as palavras em buffer e em $t0 tenho a palavra aleatória
	# como temos palavras de 5 letras e cada letra é 1 byte
	# vamos pular de 7 em 7 bytes para pegar as palavras (CRLF)

	# se estiver em CRLF do Windows, mude o valor abaixo para 7 
	# se estiver em LF (unix), mude o valor a baixo para 6 
	
	li $t1, 6
	mul $t0, $t0, $t1
	
	# carrega a lista e acessa a palavra selecionada
	la $s7, buffer_banco
	add $s7, $s7, $t0
	# agora $s7 aponta para a primeira palavra
	
	li $t0, 0 
	
# ----------------------------- IMPRESSAO -------------------------------
	beq $s6, 0, game_loop
	
	la $a0, db_palavra
    	li $v0, 4
    	syscall

imprimir_letras:
    	beq $t0, 5, game_loop
    
    	# 11 - imprime char
    	lb $a0, 0($s7)
	li $v0, 11
	syscall

	# $s7 é o vetor de caracteres
	addi $s7, $s7, 1
    	addi $t0, $t0, 1
    	j imprimir_letras

# ----------------------------- LOOP PRINCIPAL -------------------------------
game_loop:
	beq $s5, 6, game_over
	
	jal LerEntrada
	
	addi $s5, $s5, 1
	j game_loop

game_over:
	li $v0, 4
	la $a0, msg_game_over
	syscall

	li $t4, 0
	li $v0, 11
	
quick_print:
	beq $t4, 5, exit_quick_print

	lb $a0, 0($s7)
	syscall
	addi $s7, $s7, 1
	addi $t4, $t4, 1
	
	j quick_print
exit_quick_print:

	li $v0, 4
	la $a0, nova_linha
	syscall

exit:	
	li $v0, 10
	syscall
.end main

.globl LerEntrada
.ent LerEntrada

read_from_erro_a:
	# print("Erro de input. Tente de novo")
	li $v0, 4
	la $a0, msg_erro_input
	syscall

LerEntrada:
	li $v0, 8
	la $a0, buffer_input
	syscall
	
	li $t1, 0

check_size_a:
	la $t2, buffer_input
	add $t2, $t2, $t1
	lb $t3, 0($t2)
	
	beq $t3, 10, end_check_size_a
	
	addi $t1, $t1, 1
	j check_size_a

end_check_size_a:
	beq $t1, 5, end_ler_entrada
	j read_from_erro_a
	
end_ler_entrada:
	jr $ra	

.end LerEntrada