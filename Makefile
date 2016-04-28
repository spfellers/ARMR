all: encoded

encoded: encoded.c
	gcc -ggdb -fno-stack-protector -z execstack -std=gnu11 encoded.c -o weapon -lm
