CC = gcc

CFLAGS = -Wall -g
LDFLAGS = # Linkerflags

.PHONY: clean install

Editor: main.o input.o
	$(CC) $(LDFLAGS) -o Editor main.o input.o

main.o: main.c utils.h types.h defs.h
	$(CC) $(CFLAGS) -c main.c

input.o: input.c types.h input.h

clean:
	rm -f Editor *.o

install: Editor
	install -m555 Editor /usr/bin/

