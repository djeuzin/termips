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

jal LimpaBitmap

# ----------------------------- SETUP -------------------------------
	# Flag para debug. 
	# 0 - Falso. Modo normal
	# 1 - Verdadeiro. Mostra opcoes.
	li $s6, 0
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
	
	# cohpia da tentativa
	la $a0, palavra_escolhida
	la $a1, copia_palavra
	jal PalavraParaRotulo
	
	la $a0, palavra_tentativa
	la $a1, copia_palavra
	jal ComparaCertas
	

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

	# aqui eu tenho a string com as certas
	la $a0, palavra_tentativa
	la $a1, copia_palavra
	la $a2, cores
	jal ComparaResto
	
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
	
		
	li $a0, 0
	jal LimpaBitmap
	
	la $a0, palavra_escolhida
	la $a1, cores_vitoria
	li $a2, 3
	jal DesenhaBitmap
	
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

.globl ComparaCertas
.ent ComparaCertas
ComparaCertas:
	move $t0, $a0
	move $t1, $a1
	la $t2, cores
	
loop_comparacao1:
	lb $t3, 0($t0)
	lb $t4, 0($t1)
	
	beq $t3, $zero, fim_comparacao
	
	beq $t3, $t4, iguais
	# se estiver errado, poe _
	li $t5, 95
	sb $t5, 0($t2)
	
continua:
	
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j loop_comparacao1
	
iguais:
	# C em cores
	li $t5, 67
	sb $t5, 0($t2)
	
	# poe * na tentativa
	li $t5, 42
	sb $t5, 0($t1)
	
	j continua
	
fim_comparacao:
	sb $zero, 0($t2)
	la $v0, cores
	jr $ra
.end ComparaCertas

# ----------------------------- PROCEDIMENTO compare the rest of the attempt -------------------------------
.globl ComparaResto
.ent ComparaResto
ComparaResto:
	move $t0, $a0 #tentativa
	move $t1, $a1 #copia
	move $t2, $a2 #cores
	li $t3, 0
	
loop_ext:
	beq $t3, 5, fim_resto
	
	lb $t4, ($t2)
	beq $t4, 67, skip_int
	
	# nao eh 'C'
	# pego a letra em palavra_tentativa e um aux para o comeco da palavra
	lb $t5, ($t0)
	move $t6, $a1
	li $t7, 0
	
	
loop_int:
	beq $t7, 5, nao_encontrou
	
	# t8 � a letra da iteracao
	lb $t8, ($t6)
	beq $t5, $t8, encontrou
	
	addi $t6, $t6, 1
	addi $t7, $t7, 1
	
	j loop_int
	
encontrou:
	# poe o 'Q'
	li $t9, 81
	sb $t9, ($t2)
	
	# poe '*' na copia
	li $t9, 42
	sb $t9, ($t6)
	j skip_int
	
nao_encontrou:
	# poe 'E' na letra errada
	li $t9, 69
	sb $t9, ($t2)
	
	
skip_int:
	addi $t0, $t0, 1
	addi $t2, $t2, 1
	addi $t3, $t3, 1
	j loop_ext
	
fim_resto:
	move $v0, $a2
	jr $ra
.end

# ----------------------------- PROCEDIMENTO verify result equals "CCCCC" -------------------------------
.globl CondicaoVitoria
.ent CondicaoVitoria
CondicaoVitoria:
	move $t0, $a0
	li $t1, 1
	
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
