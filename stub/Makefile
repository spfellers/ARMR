all: stub helloWorld

stub: main.c
	gcc -ggdb -fno-stack-protector -z execstack main.c -o main

helloWorld: helloWorld.asm
	as -mthumb -o helloWorld.o helloWorld.asm
	ld -o helloWorld helloWorld.o

