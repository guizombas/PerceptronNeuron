			.data # Daqui pra frente cadastra variaveis

inicio:			.asciiz "Neuronio perceptron somador de dois numeros iguais\n"		
msg1:			.asciiz "\nDigite a taxa de aprendizado no neuronio: "
msg2:			.asciiz "\nDigite o numero de epocas que deseja treinar: "
msg3:			.asciiz "\nDigite o numero de dados para treinamento: "
pesoUm: .float 0 # Onde vai salvar o valor aleatorio
txAprendizado: .float 0 # Onde vai salvar a taxa de aprendizado
qtdEpocas: .word 0 # Onde vai salvar a quantidade de epocas desejadas para treinar
qtdDados: .word 0 # Quantidade de dados que seram informados para o treinamento
								
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
                        
                        jr $ra # finaliza
