# numeric_string_to_integer_assembly

# Trabalho Prático de Arquitetura e Organização de Computadores

## Conversão de String Numérica com Sinal para Inteiro em Assembly AMD64 – Parte I

### Objetivo do trabalho:

Implementar, em linguagem Assembly (padrão AT&T) para a arquitetura
AMD64, um algoritmo que converta uma String representando um número
inteiro com sinal (por exemplo, "-1234", "+567", "42") em um valor inteiro
armazenado em registrador ou variável. O algoritmo deve seguir os princípios
da programação estruturada, utilizando procedimentos (funções), passagem de

parâmetros por registradores, e a convenção de chamada com uso de caller-
saved e callee-saved registers.

### Descrição do Problema:

Dado um ponteiro para uma String válida em memória (terminada em NULL, ou
seja, byte 0), que representa um número inteiro com sinal opcional (+ ou -),
implementar um procedimento que converta essa String para o valor numérico
correspondente (char, short, int ou long int) e o retorne em registrador.

### Requisitos Técnicos:

#### Procedimentos:

- Dividir o algoritmo em pelo menos dois procedimentos (funções):
- Um procedimento string_to_int (ou nome similar), que realiza a
conversão da string para inteiro.
- Um ou mais procedimentos auxiliares chamados pela função
string_to_int.

#### Passagem de Parâmetros:

- O ponteiro para a String será passado via o registrador RDI
(seguindo a convenção System V AMD64).
- O resultado inteiro convertido deve ser retornado no registrador RAX.

#### Conjunto de Registradores:

- Utilizar corretamente os registradores caller-saved (ex: RAX, RCX,
RDX, RSI, RDI, R8–R11) e callee-saved (ex: RBX, RBP, R12–R15)
conforme a convenção de chamada AMD64 (System V).

#### Exemplo de Entrada/Saída Esperada:

##### Entrada (String)
"123"

"-456"

"+789"                  

##### Saída (Inteiro)
123

-456

"0”                     

#### Tabela de Codificação ASCII:

##### Caractere  
'0'

'1'

'3'

'4'

'5'

'6'

'7'

'8'

'9'

'+'

'-'

NULL

##### Código ASCII
48

49

51

52

53

54

55

56

57

43

45

0
