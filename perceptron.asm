			.data # Daqui pra frente cadastra variaveis

inicio:			.asciiz "Neuronio perceptron somador de dois numeros iguais\n"		
msg1:			.asciiz "\nDigite a taxa de aprendizado no neuronio: "
msg2:			.asciiz "\nDigite o numero de epocas que deseja treinar: "
msg3:			.asciiz "\nDigite o numero de dados para treinamento: "
preencheDados: 		.asciiz "\nDado: "
	
pesoUm: 			.float 0 # Onde vai salvar o valor aleatorio
txAprendizado: 		.float 0 # Onde vai salvar a taxa de aprendizado
qtdEpocas: 		.word 0 # Onde vai salvar a quantidade de epocas desejadas para treinar
qtdDados: 		.word 0 # Quantidade de dados que seram informados para o treinamento
dados:			.word 0 # Vetor de dados
								
			.text # Daqui pra frente faz o codigo

			# imprime mensagem
			addi $v0, $zero, 4
			la $a0, inicio
			syscall

			# Gera e salva numero aleatorio/peso um
			addi $v0, $zero, 43 #Gera numero aleatorio entre 0 e 1 float
			syscall
			swc1 $f0, pesoUm # Salvar o numero aleatorio no endereco da data float
			lwc1 $f12, pesoUm # TESTE para ver o numero aleatorio gerado
			addi $v0, $zero, 2 # TESTE Printar o numero aleatorio
			syscall
			
			# Solicita taxa de aprendizado
			addi $v0, $zero, 4
			la $a0, msg1
			syscall
                         # le e armazena taxa de aprendizado
			addi $v0, $zero, 6
			syscall
			swc1 $f0, txAprendizado
			lwc1 $f12, txAprendizado # TESTE carregar a taxa no registrador f12 para imprimir
			addi $v0, $zero, 2 # TESTE imprimir a taxa
			syscall
			
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
			
			lw $s0, qtdDados
			add $t0, $zero, $zero
			addi $t4, $zero, 4
			
                        FOR0:
                        		slti $t1, $t0, $s0
                        		beq $t1, $zero, FIMFOR0
                        		mul $t2, $t0, $t4
				# Solicita o dado atual do vetor de dados
				addi $v0, $zero, 4
				la $a0, preencheDados
				syscall
				# le e armazena o dado no vetor
				addi $v0, $zero, 5
				syscall
				sw $v0, qtdDados
				lw $t3, qtdDados # TESTE carregar a qtdDados no registrador f12 para imprimir
				addi $v0, $zero, 1 # TESTE imprimir a qtdDados
				syscall	
				addi $t0, $t0, 1
                        		j FOR0	
                        FIMFOR0: 
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        jr $ra # finaliza
