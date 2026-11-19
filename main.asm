.data

# ----------------------------- ERROS -------------------------------
msg_erro_input:		.asciiz "Entrada invalida. Apenas palavras com 5 letras.\n"
msg_erro_caractere:	.asciiz "Entrada invalida. Nao utilize caractere maiusculo ou especial.\n"
msg_game_over:          .asciiz "Fim de jogo. A palavra era: "
msg_vitoria: 		.asciiz "\nParabens! Voce acertou a palavra!\n"

# ----------------------------- UTILS -------------------------------
nova_linha: 		.asciiz "\n"
novo_tab: 		.asciiz " "
lista_palavras: 	.asciiz "palavras.txt"
buffer_banco:      	.space 7000
buffer_input:		.space 100
palavra_escolhida:	.space 6
palavra_tentativa:	.space 6
cores_vitoria:		.asciiz "CCCCC"

copia_palavra:		.space 6
cores:			.space 6

# ----------------------------- DEBUG -------------------------------
db_rng:			.asciiz "Numero aleatorio: "
db_palavra:		.asciiz "Palavra escolhida: "
db_tentativa:		.asciiz "Tentativa: "


# ----------------------------- BITMAP -------------------------------

base_addr: .word 0x10040000
color_red: .word 0x00ff0000
color_green: .word 0x0000bb00
color_yellow: .word 0x00ffff00
color_gray: .word 0x00cccccc


letra_A: .byte 0x18, 0x3C, 0x66, 0x66, 0x7E, 0x7E, 0x66, 0x66
letra_B: .byte 0x1e, 0x3e, 0x66, 0x3e, 0x3e, 0x66, 0x3e, 0x1e
letra_C: .byte 0x3c, 0x7e, 0x66, 0x06, 0x06, 0x66, 0x7e, 0x3c
letra_D: .byte 0x1e, 0x3e, 0x66, 0x66, 0x66, 0x66, 0x3e, 0x1e
letra_E: .byte 0x7e, 0x7e, 0x06, 0x7e, 0x7e, 0x06, 0x7e, 0x7e
letra_F: .byte 0x7E, 0x7E, 0x06, 0x7E, 0x7E, 0x06, 0x06, 0x06
letra_G: .byte 0x3C, 0x7E, 0x66, 0x06, 0x76, 0x66, 0x7E, 0x3C
letra_H: .byte 0x66, 0x66, 0x66, 0x7E, 0x7E, 0x66, 0x66, 0x66
letra_I: .byte 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18
letra_J: .byte 0x60, 0x60, 0x60, 0x60, 0x66, 0x66, 0x7E, 0x3C
letra_K: .byte 0x66, 0x76, 0x3E, 0x1E, 0x36, 0x76, 0x66, 0x66 
letra_L: .byte 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x7E, 0x7E
letra_M: .byte 0x42, 0x66, 0x7E, 0x7E, 0x66, 0x66, 0x66, 0x66
letra_N: .byte 0x66, 0x6E, 0x6E, 0x7E, 0x7E, 0x76, 0x76, 0x66
letra_O: .byte 0x18, 0x3C, 0x66, 0x66, 0x66, 0x66, 0x3C, 0x18
letra_P: .byte 0x3E, 0x7E, 0x66, 0x7E, 0x3E, 0x06, 0x06, 0x06
letra_Q: .byte 0x18, 0x3C, 0x66, 0x66, 0x66, 0x76, 0x3C, 0x58
letra_R: .byte 0x3E, 0x7E, 0x66, 0x7E, 0x3E, 0x36, 0x76, 0x66
letra_S: .byte 0x3C, 0x7E, 0x06, 0x3E, 0x7C, 0x60, 0x7E, 0x3C
letra_T: .byte 0x7E, 0x7E, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18
letra_U: .byte 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x7E, 0x3C
letra_V: .byte 0x66, 0x66, 0x66, 0x66, 0x66, 0x7E, 0x3C, 0x18
letra_W: .byte 0x66, 0x7E, 0x7E, 0x66, 0x66, 0x66, 0x66, 0x42 
letra_X: .byte 0x66, 0x66, 0x66, 0x3C, 0x3C, 0x66, 0x66, 0x66
letra_Y: .byte 0x66, 0x66, 0x7E, 0x3C, 0x18, 0x18, 0x18, 0x18 
letra_Z: .byte 0x7E, 0x7E, 0x30, 0x38, 0x1C, 0x0C, 0x7E, 0x7E

alfabeto_sprites: .word letra_A, letra_B, letra_C, letra_D, letra_E, letra_F, letra_G, letra_H, letra_I, letra_J, letra_K, letra_L, letra_M, letra_N, letra_O, letra_P, letra_Q, letra_R, letra_S, letra_T, letra_U, letra_V, letra_W, letra_X, letra_Y, letra_Z


digito_0: .byte 0x1C, 0x22, 0x32, 0x2A, 0x26, 0x22, 0x1C, 0x00
digito_1: .byte 0x08, 0x0C, 0x08, 0x08, 0x08, 0x08, 0x1C, 0x00
digito_2: .byte 0x1C, 0x22, 0x20, 0x10, 0x08, 0x04, 0x3E, 0x00
digito_3: .byte 0x1E, 0x20, 0x20, 0x1C, 0x20, 0x20, 0x1E, 0x00
digito_4: .byte 0x10, 0x18, 0x14, 0x12, 0x3E, 0x10, 0x10, 0x00
digito_5: .byte 0x3E, 0x02, 0x1E, 0x20, 0x20, 0x22, 0x1C, 0x00
digito_6: .byte 0x18, 0x04, 0x02, 0x1E, 0x22, 0x22, 0x1C, 0x00
digito_7: .byte 0x3E, 0x20, 0x10, 0x08, 0x04, 0x04, 0x04, 0x00
digito_8: .byte 0x1C, 0x22, 0x22, 0x1C, 0x22, 0x22, 0x1C, 0x00
digito_9: .byte 0x1C, 0x22, 0x22, 0x3C, 0x20, 0x10, 0x0C, 0x00

digitos_sprites: .word digito_0, digito_1, digito_2, digito_3, digito_4, digito_5, digito_6, digito_7, digito_8, digito_9



# ----------------------------- RANK -------------------------------
msg_pontuacao:		.asciiz "Pontuacao: "
msg_rank_titulo:	.asciiz "\n===== RANK (TOP 5) =====\n"
msg_rank_ponto:		.asciiz ". "
msg_nome:		.asciiz "Novo rank! Digite seu nome (3 letras): "
msg_erro_nome:		.asciiz "Nome invalido. Use exatamente 3 letras minusculas.\n"
arquivo_rank:		.asciiz "rank.bin"
comando_rank:		.asciiz "ranks"
rank_scores:		.word 0, 0, 0, 0, 0
rank_nomes:		.space 20
buffer_nome:		.space 8

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
	li $a0, 0
	jal LimpaBitmap

# ----------------------------- SETUP -------------------------------
	# Flag para debug. 
	# 0 - Falso. Modo normal
	# 1 - Verdadeiro. Mostra opcoes.
	li $s6, 0
	li $s5, 0 # Tentativas
	li $s4, 0 # pontuacao
	jal CarregaRank

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

	# comando "ranks": mostra o rank sem gastar tentativa
	jal ComandoRank
	beq $v0, 0, tentativa_normal
	jal ImprimirRank
	j game_loop
tentativa_normal:
	
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

############################## ANALISAR PALAVRA ###############################	
	
	# copia da escolhida
	la $a0, palavra_escolhida
	la $a1, copia_palavra
	jal PalavraParaRotulo
	
	la $a0, palavra_tentativa
	la $a1, copia_palavra
	la $a2, cores
	jal CompararPalavras2
	

# DEBUG - qual cores e copia pos CERTAS
	beq $s6, 0, debug4
	# linha das cores
	la $a0, 0($v0)
	jal ImprimirPalavra
	
	li $v0, 4
	la $a0, novo_tab
	syscall
	
	# copia da tentativa
	la $t0, copia_palavra
	la $a0, 0($t0)
	jal ImprimirPalavra	
	
	li $v0, 4
	la $a0, nova_linha
	syscall
# DEBUG - fim
debug4:

	# imprimr comparacoes
	la $a0, palavra_tentativa
	la $a1, cores
	move $a2, $s5
	jal DesenhaBitmap
	
	
	la $a0, cores
	jal CondicaoVitoria
	beq $v0, 1, game_won
	
	# linha das cores
	#la $a0, 0($v0)
	#jal ImprimirPalavra
	
	#li $v0, 4
	#la $a0, nova_linha
	#syscall
	
# DEBUG - qual cores e copia pos resto
	beq $s6, 0, debug5
	
	li $v0, 4
	la $a0, novo_tab
	syscall
	
	# copia da tentativa
	la $t0, copia_palavra
	la $a0, 0($t0)
	jal ImprimirPalavra	
	
	li $v0, 4
	la $a0, nova_linha
	syscall
# DEBUG - fim
debug5:	

	
	# ############################# FIM ANALISAR PALAVRA ###############################
	
	addi $s5, $s5, 1
	j game_loop
	
game_won:
	li $v0, 4
	la $a0, msg_vitoria
	syscall

	# pontuacao = (6 - tentativas) * 100
	li $t0, 6
	sub $t0, $t0, $s5
	mul $s4, $t0, 100

	li $a0, 0
	jal LimpaBitmap

	la $a0, palavra_escolhida
	la $a1, cores_vitoria
	li $a2, 3
	jal DesenhaBitmap

	# void DesenhaPontuacao($a0 pontuacao, $a1 cor);
	move $a0, $s4
	lw $a1, color_gray
	jal DesenhaPontuacao

	# console: pontuacao
	li $v0, 4
	la $a0, msg_pontuacao
	syscall
	li $v0, 1
	move $a0, $s4
	syscall
	li $v0, 4
	la $a0, nova_linha
	syscall

	# $v0 InsereRank(a0 pontuacao);
	move $a0, $s4
	jal InsereRank

	# se entrou no top 5, pede o nome
	beq $v0, 0, sem_nome
	move $a0, $v0
	jal LerNome
	
sem_nome:
	jal SalvaRank
	jal ImprimirRank

	j exit

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
	
	lw $a0, color_red
	jal LimpaBitmap
	
	la $a0, palavra_escolhida
	la $a1, cores_vitoria
	li $a2, 3
	jal DesenhaBitmap
	
	li $s4, 0
	move $a0, $s4
	lw $a1, color_gray
	jal DesenhaPontuacao

	jal ImprimirRank
	
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

# ----------------------------- PROCEDIMENTO compare the correct characters -------------------------------

.globl CompararPalavras2
.ent CompararPalavras2
CompararPalavras2:
	move $t0, $a0 # Palpite do usuário
	move $t1, $a1 # Palavra alvo
	la $t2, cores

passada_1:
	lb $t3, 0($t0)
	lb $t4, 0($t1)

	beq $t3, $zero, passada_1_fim

	li $t6, 'E'
	sb $t6, 0($t2)

	bne $t3, $t4, passada_1_prox

	li $t6, '*'
	sb $t6, 0($t1)

	li $t6, 'C'
	sb $t6, 0($t2)

passada_1_prox:
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t2, $t2, 1

	j passada_1

passada_1_fim:
	sb $zero, 0($t2)

	move $t0, $a0 # Palpite do usuário
	move $t1, $a1 # Palavra alvo
	la $t2, cores

passada_2:
	lb $t3, 0($t0)
	lb $t4, 0($t1)
	lb $t5, 0($t2)

	beq $t3, $zero, passada_2_fim

	beq $t5, 'C', passada_2_prox

	li $t6, 0 # j

passada_2_inner:
	beq $t6, 5, passada_2_prox

	add $t8, $a1, $t6
	lb $t7, 0($t8) 		# alvo[j]

	bne $t3, $t7, passada_2_inner_prox

	li $t7, 'Q'
	sb $t7, 0($t2)
	
	li $t7, '*'
	sb $t7, 0($t8)
	
	j passada_2_prox

passada_2_inner_prox:
	addi $t6, $t6, 1
	j passada_2_inner
	
passada_2_prox:
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j passada_2

passada_2_fim:
	la $v0, cores

	jr $ra

.end CompararPalavras2

# ----------------------------- PROCEDIMENTO verify result equals "CCCCC" -------------------------------
.globl CondicaoVitoria
.ent CondicaoVitoria
CondicaoVitoria:
	move $t0, $a0
	li $t1, 0
	
loop_vitoria:
	beq $t1, 5, venceu
	
	lb $t2, ($t0)
	bne $t2, 67, nao_venceu
	
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j loop_vitoria
	
venceu:
	li $v0, 1
	jr $ra

nao_venceu:
	li $v0, 0
	jr $ra

.end CondicaoVitoria

# ----------------------------- PROCEDIMENTO draw a letter -------------------------------
.globl DesenhaLetra
.ent DesenhaLetra
DesenhaLetra:
	# $a0 bitMap
	# $a1 letra
	# $a2 cor
	
	li $t0, 0 # linhas
	move $t1, $a0 

loop_linhas_letra:
	beq $t0, 8, fim_desenho_letra
	
	lb $t2, 0($a1)
	li $t3, 0 # colunas
	move $t4, $t1

loop_colunas_letra:
	beq $t3, 8, proxima_linha_letra
	andi $t5, $t2, 1
	
	# se for 0 nao pinta
	beq $t5, $zero, pula_pixel
	
	sw $a2, 0($t4)

pula_pixel:
	srl $t2, $t2, 1
	addi $t4, $t4, 4   # proximo espaco no bitMap
	addi $t3, $t3, 1   # incrementa colunas
	j loop_colunas_letra

proxima_linha_letra:
	addi $a1, $a1, 1   # prox espaco no bitmap
	addi $t1, $t1, 256 # desce a linha
	addi $t0, $t0, 1   # incrementa linha
	j loop_linhas_letra

fim_desenho_letra:
	jr $ra
.end DesenhaLetra



# ----------------------------- PROCEDIMENTO draw in bitmap -------------------------------
.globl DesenhaBitmap
.ent DesenhaBitmap
DesenhaBitmap:
	# co ter que chamar outro procedimento dentro, entao pilha
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $s0, 4($sp) # tentativa
	sw $s1, 8($sp) # cores
	sw $s2, 12($sp) # i do loop (0 a 4)
	sw $s3, 16($sp) # espaco da letra atual
	sw $s4, 20($sp) # tentativa atual
	
	move $s0, $a0
	move $s1, $a1
	li $s2, 0
	move $s4, $a2
	
loop_renderiza:
	beq $s2, 5, fim_renderiza
	
	# endereco com base na tentativa
	# EIXO Y
	mul $t0, $s4, 10 # 8 da letra + 2 da margem
	addi $t0, $t0, 2 # margem do lado
	mul $t0, $t0, 256
	
	# EIXO X
	mul $t1, $s2, 10
	addi $t1, $t1, 8
	sll $t1, $t1, 2 # vezes 4 basicamente
	
	li $s3, 0x10040000
	add $s3, $s3, $t0
	add $s3, $s3, $t1
	# $s3 ta no bit certo
	
	
	# letra de cores
	lb $t2, ($s1)
	
	
	lw $a1, color_green # C
	beq $t2, 67, pinta_fundo
	
	lw $a1, color_yellow # Q
	beq $t2, 81, pinta_fundo
	
	lw $a1, color_red # E
	
	
pinta_fundo:
	move $a0, $s3
	jal DesenhaFundoBloco
	
	lb $t3, 0($s0)     # letra de tentativa
	subi $t3, $t3, 97  # -97 para pegar como indice de vetor
	sll $t3, $t3, 2    
	
	la $t4, alfabeto_sprites
	
	# pega a sprite na matriz
	add $t4, $t4, $t3  
	lw $a1, 0($t4)
	
	
	move $a0, $s3
	lw $a2, color_gray
	jal DesenhaLetra
	
	# proxima: letra_tentativa, resultado_comparacao e iteracao
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	addi $s2, $s2, 1
	j loop_renderiza
	
fim_renderiza:
	# pega a pilha de volta
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addi $sp, $sp, 24
	jr $ra			

.end DesenhaBitmap

# ----------------------------- PROCEDIMENTO draw background -------------------------------
.globl DesenhaFundoBloco
.ent DesenhaFundoBloco
DesenhaFundoBloco:
	
	li $t0, 0 # para cada uma das linhas
	move $t1, $a0 # $t1 e a tela
	
loop_fundo_linha:
	beq $t0, 8, fim_fundo
	
	li $t2, 0 # para cada uma das colunas
	move $t3, $t1
	
loop_fundo_coluna:
	beq $t2, 8, prox_fundo_linha
	
	sw $a1, 0($t3) # pinta o pixel
	
	addi $t3, $t3, 4 # proximo pixel
	addi $t2, $t2, 1
	j loop_fundo_coluna
	
prox_fundo_linha:
	addi $t1, $t1, 256
	addi $t0, $t0, 1
	j loop_fundo_linha
	
fim_fundo:
	jr $ra
.end DesenhaFundoBloco

# ----------------------------- LIMPANDO O BITMAP -------------------------------
.globl LimpaBitmap
.ent LimpaBitmap
LimpaBitmap:
	li $t0, 0x10040000 # bitmap
	li $t1, 4096 # total no 512 x 512
loop_limpa:
	beq $t1, $zero, fim_limpa
	sw $a0, 0($t0)
	addi $t0, $t0, 4 # prox pixel
	subi $t1, $t1, 1
	j loop_limpa
fim_limpa:
	jr $ra
.end LimpaBitmap

# ----------------------------- PROCEDIMENTO draw score -------------------------------
.globl DesenhaPontuacao
.ent DesenhaPontuacao
DesenhaPontuacao:
	# $a0 pontuacao (0 a 999)
	# $a1 cor
	# desenha 3 digitos na parte de baixo da tela
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $s0, 4($sp)  # i do loop (0 a 2)
	sw $s1, 8($sp)  # resto da pontuacao
	sw $s2, 12($sp) # cor
	sw $s3, 16($sp) # espaco do digito atual
	sw $s4, 20($sp) # divisor (100, 10, 1)

	move $s1, $a0
	move $s2, $a1
	li $s0, 0
	li $s4, 100

loop_pontuacao:
	beq $s0, 3, fim_pontuacao

	# digito = resto / divisor ; resto = resto % divisor
	div $s1, $s4
	mflo $t0
	mfhi $s1

	# divisor = divisor / 10
	li $t1, 10
	div $s4, $t1
	mflo $s4

	# EIXO Y: linha 50
	li $t2, 50
	mul $t2, $t2, 256

	# EIXO X: 18 + i*10
	mul $t3, $s0, 10
	addi $t3, $t3, 18
	sll $t3, $t3, 2

	li $s3, 0x10040000
	add $s3, $s3, $t2
	add $s3, $s3, $t3
	# $s3 ta no pixel certo

	# pega a sprite do digito
	sll $t0, $t0, 2
	la $t4, digitos_sprites
	add $t4, $t4, $t0
	lw $a1, 0($t4)

	move $a0, $s3
	move $a2, $s2
	jal DesenhaLetra

	addi $s0, $s0, 1
	j loop_pontuacao

fim_pontuacao:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addi $sp, $sp, 24
	jr $ra

.end DesenhaPontuacao

# ----------------------------- PROCEDIMENTO insert in rank -------------------------------
.globl InsereRank
.ent InsereRank
InsereRank:
	# $a0 pontuacao
	# $v0 posicao (1 a 5) ou 0 se nao entrou no top 5
	la $t0, rank_scores
	li $t1, 0 # i

loop_insere:
	beq $t1, 5, nao_entrou

	sll $t2, $t1, 2
	add $t2, $t0, $t2
	lw $t3, 0($t2)

	bgt $a0, $t3, achou_posicao

	addi $t1, $t1, 1
	j loop_insere

achou_posicao:
	# empurra os piores para baixo: rank[j] = rank[j-1], de j=4 ate j=i+1
	li $t4, 4

loop_desloca:
	ble $t4, $t1, grava_posicao

	sll $t5, $t4, 2
	add $t5, $t0, $t5
	lw $t6, -4($t5)
	sw $t6, 0($t5)

	# nome: rank_nomes fica 20 bytes depois de rank_scores
	lw $t6, 16($t5)
	sw $t6, 20($t5)

	addi $t4, $t4, -1
	j loop_desloca

grava_posicao:
	sw $a0, 0($t2)
	addi $v0, $t1, 1
	jr $ra

nao_entrou:
	li $v0, 0
	jr $ra

.end InsereRank

# ----------------------------- PROCEDIMENTO print rank -------------------------------
.globl ImprimirRank
.ent ImprimirRank
ImprimirRank:
	li $v0, 4
	la $a0, msg_rank_titulo
	syscall

	la $t0, rank_scores
	li $t1, 1 # posicao

loop_rank:
	beq $t1, 6, fim_rank

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, msg_rank_ponto
	syscall

	# nome (20 bytes depois da pontuacao)
	li $v0, 4
	addi $a0, $t0, 20
	syscall

	li $v0, 4
	la $a0, novo_tab
	syscall

	li $v0, 1
	lw $a0, 0($t0)
	syscall

	li $v0, 4
	la $a0, nova_linha
	syscall

	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j loop_rank

fim_rank:
	jr $ra

.end ImprimirRank

# ----------------------------- PROCEDIMENTO command rank -------------------------------
.globl ComandoRank
.ent ComandoRank
ComandoRank:
	# $v0 1 se buffer_input == "ranks", senao 0
	la $t0, buffer_input
	la $t1, comando_rank
	li $t4, 0

loop_comando:
	beq $t4, 5, eh_comando

	lb $t2, 0($t0)
	lb $t3, 0($t1)
	bne $t2, $t3, nao_eh_comando

	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t4, $t4, 1
	j loop_comando

eh_comando:
	li $v0, 1
	jr $ra

nao_eh_comando:
	li $v0, 0
	jr $ra

.end ComandoRank

# ----------------------------- PROCEDIMENTO load rank from file -------------------------------
.globl CarregaRank
.ent CarregaRank
CarregaRank:
	# open file 13 (modo 0 = leitura)
	li $v0, 13
	la $a0, arquivo_rank
	li $a1, 0
	li $a2, 0
	syscall

	# se nao existe ainda, o rank fica zerado
	bltz $v0, fim_carrega

	move $t2, $v0

	# read file 14 (5 words = 20 bytes)
	li $v0, 14
	move $a0, $t2
	la $a1, rank_scores
	li $a2, 40
	syscall

	# close file 16
	li $v0, 16
	move $a0, $t2
	syscall

fim_carrega:
	jr $ra

.end CarregaRank

# ----------------------------- PROCEDIMENTO save rank to file -------------------------------
.globl SalvaRank
.ent SalvaRank
SalvaRank:
	# open file 13 (modo 1 = escrita)
	li $v0, 13
	la $a0, arquivo_rank
	li $a1, 1
	li $a2, 0
	syscall

	bltz $v0, fim_salva

	move $t2, $v0

	# write file 15
	li $v0, 15
	move $a0, $t2
	la $a1, rank_scores
	li $a2, 40
	syscall

	# close file 16
	li $v0, 16
	move $a0, $t2
	syscall

fim_salva:
	jr $ra

.end SalvaRank

# ----------------------------- PROCEDIMENTO read name -------------------------------
.globl LerNome
.ent LerNome
LerNome:
	# $a0 posicao no rank (1 a 5)
	# le 3 letras minusculas e grava em maiusculo em rank_nomes
	addi $t0, $a0, -1
	sll $t0, $t0, 2
	la $t1, rank_nomes
	add $t6, $t1, $t0 # $t6 = espaco do nome no rank

pede_nome:
	li $v0, 4
	la $a0, msg_nome
	syscall

	# read string 8 (a1 = 4: le no maximo 3 letras)
	li $v0, 8
	la $a0, buffer_nome
	li $a1, 4
	syscall

	li $t2, 0

check_nome:
	beq $t2, 3, grava_nome

	la $t3, buffer_nome
	add $t3, $t3, $t2
	lb $t4, 0($t3)

	blt $t4, 97, nome_invalido
	bgt $t4, 122, nome_invalido

	addi $t2, $t2, 1
	j check_nome

nome_invalido:
	li $v0, 4
	la $a0, msg_erro_nome
	syscall
	j pede_nome

grava_nome:
	li $t2, 0

loop_grava_nome:
	beq $t2, 3, fim_nome

	la $t3, buffer_nome
	add $t3, $t3, $t2
	lb $t4, 0($t3)
	subi $t4, $t4, 32 # minuscula -> maiuscula

	add $t5, $t6, $t2
	sb $t4, 0($t5)

	addi $t2, $t2, 1
	j loop_grava_nome

fim_nome:
	sb $zero, 3($t6)
	jr $ra

.end LerNome
