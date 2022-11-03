# LABORATÓRIO DE ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES I
# Professor: Mateus Felipe Tymburibá Ferreira
# Prática 6
# Thamiris Souza e Hugo Barbosa

	.data
vetor:	.word	0 : 9		# Vetor de n posições para guardar a sequência de fibonacci
tamanho:.word	9		# Define o tamanho do vetor
	
	.text
main:
	la   $s0, vetor		# Carrega o endereço base do vetor em s0
	la   $s1, tamanho	# Carrega o endereço do reg que armazena o tamanho do vetor
	lw   $s1, 0($s1)	# Carrega o conteudo do reg que armazena o tamanho do vetor
	
	li   $t0, 1          	# Carrega em t0 o primeiro e segundo valor da sequencia (1)
	
      	sw   $t0, 0($s0)      	# Faz F[0] = 1
      	sw   $t0, 4($s0)      	# Faz F[1] = 1
      	
      	addi $t1, $s1, -2     	# t1 = contador
      				# Como já temos os dois primeiros termos, 
      				# precisamos decrementar 2 do tamanho 					
loop:  
	slt  $t4, $0, $t1	# Se t1 > 0, t4 = 1
				# se não,    t4 = 0
	beq  $t4, 0, fim	# Se t4 = 0, fim do loop
	
	lw   $t2, 0($s0)      	# Carrega o valor F[n] da sequencia
      	lw   $t3, 4($s0)      	# Carrega o valor F[n + 1] da sequencia
      	
      	add  $t0, $t2, $t3    	# $t0 = F[n] + F[n + 1]
      	sw   $t0, 8($s0)      	# Carrega F[n + 2] = F[n] + F[n + 1] no vetor
      	
      	addi $s0, $s0, 4      	# Avança o índice do array
      	addi $t1, $t1, -1     	# Decrementa 1 no contador do loop
      	j    loop
fim:
	la   $a0, vetor      	# Primeiro argumento que sera impresso
      	add  $a1, $0, $s1  	# Segundo argumento que sera impresso
      	jal  print            	# Chama a instrucao de impressao
      	
      	li   $v0, 10          	# Para a chamada da instrucao call
      	syscall 
      	
	.data
	
espaco:		.asciiz  	" "          # Espaco inserido entre os numeros da sequencia
cabecalho: 	.asciiz  	"A sequência de Fibonacci é:\n"
      		.text
print:
	add  $s0, $0, $a0  	# Carrega o endereco do array
      	add  $t1, $0, $a1  	# Inicializar o contador de loop com o tamanho do array
      	la   $a0, cabecalho   	# Carrega o endereco do cabecalho
      	li   $v0, 4           	# Codigo para imprimir string
      	syscall               	# Printa o cabecalho
saida:  
	lw   $a0, 0($s0)    	# Carregar número fibonacci no syscall
      	li   $v0, 1           	# Codigo para imprimir inteiro
      	syscall               	# Printa a sequencia
      	la   $a0, espaco      	# Carregar o endereco do space no syscall
      	li   $v0, 4           	# Codigo para imprimir string
      	syscall               	# Saida da string
      	addi $s0, $s0, 4      	# Incrementa mais um (4 bytes) no endereco fonte do array
      	addi $t1, $t1, -1     	# Decrementa o contador do loop
      	bgtz $t1, saida       	# Repete se nao terminou
      	jr   $ra              	# Retorna
		