# Makefile para o programa string_to_int em assembly

# Configurações do compilador e vinculador
CC = gcc
AS = as
CFLAGS = -Wall -Wextra -g

# Executável alvo
TARGET = test

# Arquivos objeto
OBJS = string_to_int.o test.o

# Alvo padrão
all: $(TARGET)

# Vincula arquivos objeto para criar o executável
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Compila fonte C para arquivo objeto
teste_string_to_int.o: test.c
	$(CC) $(CFLAGS) -c $<

# Monta fonte assembly para arquivo objeto
string_to_int.o: main.s
	$(AS) -o $@ $<

# Limpa os arquivos gerados
clean:
	rm -f $(TARGET) $(OBJS)

# Executa o programa
run: $(TARGET)
	./$(TARGET)