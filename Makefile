CC:= arm-none-eabi-gcc
#LD:= arm-none-eabi-gcc-ld
CFLAGS := -S -mcpu=cortex-m4 -mthumb
SRC := $(wildcard src/*.c src/*.s)

#all: build/test_program.s
#build/blink.elf: main.o startup.o
#	$(LD) main.o startup.o -o $@

#main.o: main.c registers.h
#	$(CC) main.c -o $@
#Question: where do .h files lie in the recipe? are they necessary in
#the ingredients?

#startup.o: startup.c
#	$(CC) startup.c -o $@

build/test_program.s: $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@

clean:
	rm -f build/*.s

#How to make a Makefile more generic such that new files included to the project
#don't necessitate a lot of editing of the Makefile. Some wildcard of some
#sort? So how does each line know which file to fill the wildcard with? I mean
#if I put *.c *.h as the incredients for *.o, how does main.c not get mapped
#to startup.o or how does startup.c not get mapped to main.o?

#Check out the following links:
#https://stackoverflow.com/questions/2514903/what-does-all-stand-for-in-a-makefile
#https://stackoverflow.com/questions/22545029/makefile-how-to-correctly-include-header-file-and-its-directory
