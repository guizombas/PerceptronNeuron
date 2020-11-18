			.data # Daqui pra frente cadastra variaveis
		
			.text # Daqui pra frente faz o codigo

			addi $v0, $zero, 43 #Gera numero aleatorio entre 0 e 1 float
			syscall
			sub.s $f1, $f1, $f1 # Zera o registrador f1
			add.s $f12, $f0, $f1
			
			addi $v0, $zero, 2
			syscall
                         
                        
                        jr $ra # finaliza
