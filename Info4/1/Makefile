CC = gcc
CFLAGS = -Wall
LDLIBS = -lreadline

.PHONY: all default clean

default: myecho myenv isset exec fork shell

all: myecho myenv isset exec fork

myecho: myecho.c

myenv: myenv.c

isset: isset.c

exec: exec.c

fork: fork.c

shell: shell.c

test: myecho myenv isset exec fork
	./myecho
	./myenv
	./isset
	./exec
	./fork

clean:
	rm -f myecho myenv isset exec fork
