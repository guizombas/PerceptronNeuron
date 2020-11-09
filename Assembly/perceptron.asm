			.data # Daqui pra frente cadastra variaveis

mensagem1:	.asciiz "Digite o valor de A: " # .asciiz é tipo de variavel string
mensagem2:	.asciiz "Digite o valor de B: "
mensagem3:	.asciiz "Digite o valor de C: "
mensagem4:	.asciiz "Digite o valor de D: "
res1:	.asciiz "\nB: "
res2:	.asciiz "\nE = "
		
			.text # Daqui pra frente faz o codigo

			# imprime mensagem
			addi $v0, $zero, 4 # Chama o registrador v0 de valor 4, o que imprime string
			la $a0, mensagem1 # Coloca o endereco da variavel dentro do registrador
			syscall # Chama o sistema operacional para rodar
			# le inteiro
			addi $v0, $zero, 5 # Chama o registrador v0 de valor 5, o que le string
			syscall #  Chama o sistema operacional para rodar
			
			add $s0, $v0, $zero # s0 = A
			

			addi $v0, $zero, 4
			la $a0, mensagem2
			syscall
			addi $v0, $zero, 5 
			syscall
			add $s1, $v0, $zero # s1 = B
			
			addi $v0, $zero, 4
			la $a0, mensagem3
			syscall
			addi $v0, $zero, 5 
			syscall
			add $s2, $v0, $zero # s2 = C
		
			addi $v0, $zero, 4
			la $a0, mensagem4
			syscall
			addi $v0, $zero, 5 
			syscall
			add $s3, $v0, $zero # s3 = D
			
			beq $s0, $s1, ELSE
			mul $s1, $s2, $s3 # B = C*D
			addi $s4, $s1, 4 # E = B + 4

			add $s6, $s1, $zero
			add $s7, $s4, $zero

			# imprime inteiro
			addi $v0, $zero, 4
			la $a0, res1
			syscall
			add $a0, $zero, $s6 # Chama o registrador a0 com valor de s7, que sera passado para o syscall
			addi $v0, $zero, 1 # Chama o registrador v0 de valor 1, o que imprime inteiro
			syscall #  Chama o sistema operacional para rodar
			
			# imprime inteiro
			addi $v0, $zero, 4
			la $a0, res2
			syscall
			add $a0, $zero, $s7 # Chama o registrador a0 com valor de s7, que sera passado para o syscall
			addi $v0, $zero, 1 # Chama o registrador v0 de valor 1, o que imprime inteiro
			syscall #  Chama o sistema operacional para rodar
                       
                       	j FIM
                       	
                        	ELSE:
                        	div.s $s4, $s0, $s2 # E = A/C 
                       	
			# imprime inteiro
			addi $v0, $zero, 4
			la $a0, res2
			syscall
			add $a0, $zero, $s4 # Chama o registrador a0 com valor de s0, que sera passado para o syscall
			addi $v0, $zero, 2 # Chama o registrador v0 de valor 1, o que imprime inteiro
			syscall #  Chama o sistema operacional para rodar
                         
                        
                        FIM:
                        jr $ra # finaliza
