# string_to_int.s
# Implementação em Assembly AMD64 (sintaxe AT&T) para converter uma string numérica com sinal para inteiro
# Usa a convenção de chamada System V AMD64:
# - Entrada: RDI = ponteiro para string terminada em null
# - Saída: RAX = valor inteiro resultante

.data

# Definição das strings de teste
    str_teste1: .string "123"
    str_teste2: .string "-456"
    str_teste3: .string "+789"
    str_teste4: .string "0"
    str_teste5: .string ""

.text

# Exportação símbolo da função
.globl _start
.globl _string_to_int
.globl _processa_digitos

# Função principal para converter string para inteiro
# Entrada: RDI = ponteiro para string
# Saída: RAX = resultado inteiro
_string_to_int:
    # Prólogo - salva registradores callee-saved
    pushq %rbx
    pushq %r12                

    # Inicializa resultado (rax) com 0
    movq $0, %rax   
    # Multiplicador de sinal (r12) (1 para positivo, -1 para negativo)
    movq $1, %r12

    # Verifica se a string está vazia (primeiro byte é null)
    movb (%rdi), %bl
    testb %bl, %bl
    # Se a string é vazia, retorna 0   
    jz _fim

    # Verifica se o primeiro caractere é '+'
    cmpb $'+', %bl            
    # Se sim, ignora o sinal
    je _ignora_sinal

    # Verifica se o primeiro caractere é '-'
    cmpb $'-', %bl
    # Se não há sinal, começa a processar dígitos
    jne _processa_digitos

    # Trata sinal negativo e define multiplicador de sinal como -1
    movq $-1, %r12

    _ignora_sinal:
        # Move o ponteiro após o caractere de sinal
        incq %rdi

    _processa_digitos:
        # Chama função auxiliar para processar dígitos
        call _processar_digitos                            

    # Aplica o sinal e multiplica o resultado pelo sinal                   
    imulq %r12, %rax

    _fim:
        # Epílogo - restaura registradores callee-saved
        popq %r12
        popq %rbx          
        ret

# Função auxiliar para processar dígitos
# Entrada: RDI = ponteiro para string (começando no primeiro dígito)
# Saída: RAX = resultado inteiro não-sinalizado
_processar_digitos:
    # Prólogo - salva registrador callee-saved
    pushq %rbx

    # Inicializa resultado em RAX, limpando RAX (resultado = 0)
    xorq %rax, %rax

    _loop_digito:
        # Carrega byte do caractere e estende para quad com zeros
        movzbq (%rdi), %rbx
        
        # Verifica se chegou fim da string
        testb %bl, %bl
        # Se o byte é nulo, encerra
        jz _fim_loop_digitos

        # Verifica se o caractere é um dígito (entre '0' e '9')
        # Se for menor que '0', não é dígito
        cmpb $'0', %bl
        jl _fim_loop_digitos     

        cmpb $'9', %bl
        # Se for maior que '9', não é dígito     
        jg _fim_loop_digitos

        # Calcula: resultado = resultado * 10 + (digito_atual - '0')
        # resultado *= 10
        imulq $10, %rax           
        # Converte ASCII para valor numérico
        subb $'0', %bl
        # Adiciona o dígito ao resultado            
        addq %rbx, %rax
        
        # Move para o próximo caractere
        incq %rdi
        jmp _loop_digito

        _fim_loop_digitos:
            # Epílogo - restaura registradores callee-saved
            popq %rbx
            ret       

# Funcao main
_start:
    # Carrega o endereço da string "+789" em RDI
    leaq str_teste3(%rip), %rdi    
    call _string_to_int           

    # O resultado está em RAX agora (789 para "+789")
    # Move o resultado para RDI para ser o código de saída
    # Move o resultado para RDI (código de retorno)
    movq %rax, %rdi                

    movq $60, %rax
    syscall
