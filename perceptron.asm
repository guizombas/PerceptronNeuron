			.data # Daqui pra frente cadastra variaveis

inicio:			.asciiz "Neuronio perceptron somador de dois numeros iguais\n"		
msg1:			.asciiz "\nDigite a taxa de aprendizado no neuronio: "
msg2:			.asciiz "\nDigite o numero de epocas que deseja treinar: "
msg3:			.asciiz "\nDigite o numero de dados para treinamento: "
								
			.text # Daqui pra frente faz o codigo

			# imprime mensagem
			addi $v0, $zero, 4 # registrador $v0 recebe 4
			la $a0, inicio # Coloca o endereco da variavel dentro do registrador
			syscall # Chama o sistema operacional para rodar

			addi $v0, $zero, 43 #Gera numero aleatorio entre 0 e 1 float
			syscall
			s.s $f0, 0($zero)
			
			l.s $f12, 0($zero)
			addi $v0, $zero, 2
			syscall
			
			# imprime mensagem
			addi $v0, $zero, 4 # registrador $v0 recebe 4
			la $a0, msg1 # Coloca o endereco da variavel dentro do registrador
			syscall # Chama o sistema operacional para rodar
                         
                         # le float
			addi $v0, $zero, 6 # Chama o registrador e coloca um valor nele
			syscall #  Chama o sistema operacional para rodar
			
			sub.s $f1, $f1, $f1 # Zera o registrador f1
			add.s $f12, $f0, $f1
			addi $v0, $zero, 2
			syscall
			
			# imprime mensagem
			addi $v0, $zero, 4 # registrador $v0 recebe 4
			la $a0, msg2 # Coloca o endereco da variavel dentro do registrador
			syscall # Chama o sistema operacional para rodar
			
			# le inteiro
			addi $v0, $zero, 5 # Chama o registrador e coloca um valor nele
			syscall #  Chama o sistema operacional para rodar
			
			# imprime inteiro
			add $a0, $zero, $v0 # Coloca no a0 o v0
			addi $v0, $zero, 1
			syscall #  Chama o sistema operacional para rodar
			
			# imprime mensagem
			addi $v0, $zero, 4 # registrador $v0 recebe 4
			la $a0, msg3 # Coloca o endereco da variavel dentro do registrador
			syscall # Chama o sistema operacional para rodar
			
			# le inteiro
			addi $v0, $zero, 5 # Chama o registrador e coloca um valor nele
			syscall #  Chama o sistema operacional para rodar
			
			# imprime inteiro
			add $a0, $zero, $v0 # Coloca no a0 o v0
			addi $v0, $zero, 1
			syscall #  Chama o sistema operacional para rodar
                        
                        jr $ra # finaliza
