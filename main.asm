.data

# ----------------------------- ERROS -------------------------------
msg_erro_input:		.asciiz "Entrada invalida. Apenas palavras com 5 letras.\n"
msg_erro_caractere:	.asciiz "Entrada invalida. N�o utilize caractere maiusculo ou especial.\n"
msg_game_over:          .asciiz "Fim de jogo. A palavra era: "

# ----------------------------- UTILS -------------------------------
nova_linha: 		.asciiz "\n"
novo_tab: 		.asciiz " "
lista_palavras: 	.asciiz "palavras.txt"
buffer_banco:      	.space 7000
buffer_input:		.space 100
palavra_escolhida:	.space 6
palavra_tentativa:	.space 6

# ----------------------------- DEBUG -------------------------------
db_rng:			.asciiz "Numero aleatorio: "
db_palavra:		.asciiz "Palavra escolhida: "
db_tentativa:		.asciiz "Tentativa: "

# ----------------------------- INSTRUCOES -------------------------------

# ------ Como declarar uma funcao ------
# .globl <nome da funcao>
# .ent <nome da funcao>
# <nome da funcao>:
# 	corpo da funcao
#
#	jr $ra
# .end <nome da funcao>

# ------ Como chamar uma funcao -------
# jal <nome da funcao>



.text 
.globl main
main:

# ----------------------------- SETUP -------------------------------
	# Flag para debug. 
	# 0 - Falso. Modo normal
	# 1 - Verdadeiro. Mostra opcoes.
	li $s6, 1
	li $s5, 0 # Tentativas
	

# ----------------------------- NUMERO ALEATORIO -------------------------------
gera_numero:
	# syscall 42 gera um numero aleatorio 0-1004
	# a0 eh limite inferior
	# a1 eh limite superior
	li $v0, 42
	li $a0, 0
	li $a1, 995 #995
	syscall
	
	move $t0, $a0



	# DEBUG - qual numero foi escolhido
	beq $s6, 0, debug1
	
	la $a0, db_rng
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, nova_linha
	li $v0, 4
	syscall
	# DEBUG - fim
	
debug1:
# ----------------------------- PEGA PALAVRA SORTEADA -------------------------------

	# $v0 LocalizaPalavra($a0 numero_aleatorio)
	move $a0, $t0
	jal LocalizaPalavra
	# $v0 aponta para o primeiro caractere da palavra na lista


	# void PalavraParaRotulo();
	move $a0, $v0
	la $a1, palavra_escolhida
	jal PalavraParaRotulo
	# string adicionada ao rotulo palavra_escolhida
	
# ----------------------------- IMPRESSAO -------------------------------

	# DEBUG - qual palavra foi escolhida
	beq $s6, 0, debug2
	la $a0, db_palavra
    	li $v0, 4
    	syscall
	
	# void ImprimirPalavra(a0 palavra);
	la $a0, palavra_escolhida
	jal ImprimirPalavra
	
	li $v0, 4
	la $a0, nova_linha
	syscall
	# DEBUG - fim
debug2:
# ----------------------------- LOOP PRINCIPAL -------------------------------
game_loop:
	beq $s5, 6, game_over
	
	# $v0 LerEntrada();
	jal LerEntrada
	# le e valida se a entrada tem o tamanho correto
	
	# $a0 ja tem a tentativa
	la $a0, buffer_input
	la $a1, palavra_tentativa
	jal PalavraParaRotulo
	
	
	
	# DEBUG - qual palavra esta no input
	beq $s6, 0, debug3
	
	move $a0, $s5
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, novo_tab
	syscall
	
	la $a0, db_tentativa
    	li $v0, 4
    	syscall
	
	la $a0, palavra_tentativa
	jal ImprimirPalavra

	li $v0, 4
	la $a0, nova_linha
	syscall
	# DEBUG - fim
debug3:

	# ############################# ANALISAR PALAVRA ###############################	
	
	
	
	
	
	
	
	
	
	
	# ############################# FIM ANALISAR PALAVRA ###############################
	addi $s5, $s5, 1
	j game_loop

game_over:
	li $v0, 4
	la $a0, msg_game_over
	syscall

	# void ImprimirPalavra(a0 palavra);
	la $a0, palavra_escolhida
	jal ImprimirPalavra
	
	li $v0, 4
	la $a0, nova_linha
	syscall

exit:	
	li $v0, 10
	syscall
.end main



# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# ------------------------------------- PROCEDIMENTOS ---------------------------------------
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------


# ----------------------------- PROCEDIMENTO search word -------------------------------
.globl LocalizaPalavra
.ent LocalizaPalavra
LocalizaPalavra:
	move $t0, $a0
	
	# open file 13 (ponteiro a0, modo de abertura a1, permissão, a2)
	# 995 palavras, leitura, (MARS ignora parece)
	li $v0, 13
	la $a0, lista_palavras
	li $a1, 0
	li $a2, 0
	syscall
	
	# read file 14 (chave, onde guardar, espaco a ser lido)
	# $v0 tem o acesso ao arquivo txt
	move $t2, $v0
	
	li $v0, 14
	move $a0, $t2
	la $a1, buffer_banco
	li $a2, 7000
	syscall

	# close file 16
	li $v0, 16
	move $a0, $t2
	syscall
	
				
	# aqui eu tenho todas as palavras em buffer e em $t0 tenho a palavra aleatória
	# como temos palavras de 5 letras e cada letra eh 1 byte
	# vamos pular de 7 em 7 bytes para pegar as palavras (CRLF)

	# se estiver em CRLF do Windows, mude o valor abaixo para 7 
	# se estiver em LF (unix), mude o valor a baixo para 6 
	
	li $t1, 6
	mul $t0, $t0, $t1
	
	# carrega a lista e acessa a palavra selecionada
	# agora $v0 aponta para a primeira letra
	la $v0, buffer_banco
	add $v0, $v0, $t0
	jr $ra

.end LocalizaPalavra

# ----------------------------- PROCEDIMENTO print word -------------------------------
.globl ImprimirPalavra
.ent ImprimirPalavra
ImprimirPalavra:
	# $t0 eh a palavra
	la $t0, 0($a0)
	
loop_print:
	lb $a0, 0($t0)
	
	# se o byte for um 0 sai
	beq $a0, $zero, end_func
		
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1
	j loop_print
		
end_func:
	jr $ra

.end ImprimirPalavra


# ----------------------------- PROCEDIMENTO read input -------------------------------

.globl LerEntrada
.ent LerEntrada

erro_tamanho:
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
	
	blt $t3, 97, caractere_diferente
	bgt $t3, 122, caractere_diferente
	
	addi $t1, $t1, 1
	j check_size_a

caractere_diferente:
	li $v0, 4
	la $a0, msg_erro_caractere
	syscall
	j LerEntrada

end_check_size_a:
	beq $t1, 5, end_ler_entrada
	j erro_tamanho
	
end_ler_entrada:
	la $v0, buffer_input
	jr $ra

.end LerEntrada

# ----------------------------- PROCEDIMENTO register to label -------------------------------

.globl PalavraParaRotulo
.ent PalavraParaRotulo
PalavraParaRotulo:
	move $t0, $a0
	move $t1, $a1
	li $t3, 0
	
loop_conversion:
	lb $t2, 0($t0)
	sb $t2, 0($t1)
	
	beq $t3, 4, fim_conversion
	
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t3, $t3, 1
	j loop_conversion
	
fim_conversion:
	# $t0 ta na 5 letra, entao pula pra proxima
	sb $zero, 1($t1)
	jr $ra
	
.end PalavraParaRotulo
