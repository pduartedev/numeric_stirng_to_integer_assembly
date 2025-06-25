#include <stdio.h>

// Declaração da função externa em assembly
extern long string_to_int(const char* str);

int main() {
    // Casos de teste
    char* teste1 = "123";
    char* teste2 = "-456";
    char* teste3 = "+789";
    char* teste4 = "0";
    char* teste5 = "";  // String vazia para testar caso extremo
    char* teste6 = "+139127312391282";
    
    printf("Teste 1: \"%s\" -> %ld\n", teste1, string_to_int(teste1));
    printf("Teste 2: \"%s\" -> %ld\n", teste2, string_to_int(teste2));
    printf("Teste 3: \"%s\" -> %ld\n", teste3, string_to_int(teste3));
    printf("Teste 4: \"%s\" -> %ld\n", teste4, string_to_int(teste4));
    printf("Teste 5: \"%s\" -> %ld\n", teste5, string_to_int(teste5));
    printf("Teste 6: \"%s\" -> %ld\n", teste6, string_to_int(teste6));
    
    return 0;
}