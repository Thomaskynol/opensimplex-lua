CC = gcc
CFLAGS = -O3 -Wall -Wextra -fPIC
SRC = open-simplex-noise.c
OBJ = open-simplex-noise.o

.PHONY: linux windows clean

linux: $(OBJ)
	$(CC) -shared -o open_simplex.so $(OBJ)

windows: $(OBJ)
	$(CC) -shared -o open_simplex.dll $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	del /Q $(OBJ) open_simplex.so open_simplex.dll 2>nul || true
