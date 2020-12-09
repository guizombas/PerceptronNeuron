.data # Daqui pra frente cadastra variaveis

	#textos
	inicio:		.asciiz "Neuronio perceptron somador de dois numeros iguais\n"		
	msg1:		.asciiz "\nDigite a taxa de aprendizado no neuronio: "
	msg2:		.asciiz "\nDigite o numero de epocas que deseja treinar: "
	msg3:		.asciiz "\nDigite o numero de dados para treinamento: "
	msg4:		.asciiz "\nPesos iniciais: "
	espaco:		.asciiz " "
	preencheDados: 	.asciiz "\nDado: "
	
	#variaveis
	pesoUm: 	.float 0 # Onde vai salvar o peso um do neuronio
	pesoDois:	.float 0 # Onde vai salvar o peso dois do neuronio 
	txAprendizado: 	.float 0 # Onde vai salvar a taxa de aprendizado
	qtdEpocas: 	.word 0 # Onde vai salvar a quantidade de epocas desejadas para treinar
	qtdDados: 	.word 0 # Quantidade de dados que seram informados para o treinamento
	vetorDados:	.word 0 # Vetor de dados
		
														
.text # Daqui pra frente faz o codigo

	# imprime mensagem
	addi $v0, $zero, 4
	la $a0, inicio
	syscall
			
	# Solicita taxa de aprendizado
	addi $v0, $zero, 4
	la $a0, msg1
	syscall
        # le e armazena taxa de aprendizado
	addi $v0, $zero, 6
	syscall
	swc1 $f0, txAprendizado
			
	# Solicita quantidade de epocas
	addi $v0, $zero, 4
	la $a0, msg2
	syscall
	# le e armazena a quantidade de epocas
	addi $v0, $zero, 5
	syscall
	sw $v0, qtdEpocas
	lw $a0, qtdEpocas # TESTE carregar a epoca no registrador f12 para imprimir
	addi $v0, $zero, 1 # TESTE imprimir a epoca
	syscall
			
	# Solicita quantidade de dados para treinar
	addi $v0, $zero, 4
	la $a0, msg3
	syscall
	# le e armazena a quantidade de epocas
	addi $v0, $zero, 5
	syscall
	sw $v0, qtdDados
	lw $a0, qtdDados # TESTE carregar a qtdDados no registrador f12 para imprimir
	addi $v0, $zero, 1 # TESTE imprimir a qtdDados
	syscall
			
			
	# Inicializa o FOR0
	lw $s0, qtdDados
	add $t0, $zero, $zero
	addi $t4, $zero, 4
		
	# For para preencher vetor de dados de entrada	
        FOR0:
        	# Condição de parada do FOR0
        	slt $t1, $t0, $s0
                beq $t1, $zero, FIMFOR0
                # Controle da posição atual do vetor
                mul $t2, $t0, $t4
                        	
		# Solicita o dado atual do vetor de dados
		addi $v0, $zero, 4
		la $a0, preencheDados
		syscall
				
		# le e armazena o dado no vetor
		addi $v0, $zero, 5
		syscall
		sw $v0, vetorDados($t2)	
				
		#i++
		addi $t0, $t0, 1
                j FOR0	
       FIMFOR0:
       
       	# Gera e salva numero aleatorio/peso um e peso dois
	addi $v0, $zero, 43 #Gera numero aleatorio entre 0 e 1 float
	syscall
	swc1 $f0, pesoUm # Salvar o numero aleatorio no endereco da data float
	syscall
	swc1 $f0, pesoDois # Salvar o numero aleatorio no endereco da data float
       
        # Mostra pesos inicias do neuronio
	addi $v0, $zero, 4
	la $a0, msg4
	syscall
       
        lwc1 $f12, pesoUm 
	addi $v0, $zero, 2
	syscall
	
	addi $v0, $zero, 4
	la $a0, espaco
	syscall
	
	lwc1 $f12, pesoDois
	addi $v0, $zero, 2 
	syscall
       
       
        # Inicializa o FOR1
	lw $s0, qtdEpocas
	add $t0, $zero, $zero
		
	# For para executar todas as épocas
        FOR1:
        	# Condição de parada do FOR1
        	slt $t1, $t0, $s0
                beq $t1, $zero, FIMFOR1
		
		
		# Inicializa o FOR2
		lw $s1, qtdDados
		add $t5, $zero, $zero
		# For para treinar todos os dados
        	FOR2:
        		# Condição de parada do FOR0
        		slt $t6, $t5, $s1
                	beq $t6, $zero, FIMFOR2
                	# Controle da posição atual do vetor
                	mul $t2, $t5, $t4
				
			# le e armazena o dado no vetor
			#addi $v0, $zero, 5
			#syscall
			#sw $v0, vetorDados($t2)	
				
			#i++
			addi $t5, $t5, 1
                	j FOR2	
       		FIMFOR2:
		
				
		#i++
		addi $t0, $t0, 1
                j FOR1	
       FIMFOR1:
       
       
       
       
       
       #depois resolve
                        
                        
     #            lw $s0, qtdDados
      #      add $t0, $zero, $zero
     #       addi $t4, $zero, 4
#
         #               FOR1:
                 #               slt $t1, $t0, $s0
       #                         beq $t1, $zero, FIMFOR1
               #                 mul $t2, $t0, $t4
             #   # le e armazena o dado no vetor
             #   lw $a0, vetor($t2) # TESTE carregar a qtdDados no registrador f12 para imprimir
            #    addi $v0, $zero, 1 # TESTE imprimir a qtdDados
             #   syscall
              #  addi $t0, $t0, 1
                #                j FOR1
                #        FIMFOR1:        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        jr $ra # finaliza
