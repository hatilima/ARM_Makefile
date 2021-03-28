CC:= arm-none-eabi-gcc
CFLAGS := -S -mcpu=cortex-m4 -mthumb
SRC := $(wildcard src/*.c src/*.s)

all: build/test_program.s

build/test_program.s: $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@

clean:
	rm -f build/*.s
