# Compile and Link Variables
CC := gcc
CC_FLAGS := -Wall -pedantic -m64 -gdwarf-2 -c
ASM := yasm
ASM_FLAGS := -f elf64 -gdwarf2
LINKER := gcc
LINKER_FLAGS := -Wall -pedantic -m64 -gdwarf-2 -no-pie


# Executable name
BIN_NAME := my-program
BIN := ./$(BIN_NAME)

run:	build
	@echo "Running program!"
	$(BIN)
.PHONY: run

build:	$(BIN)
.PHONY: build

$(BIN): main.o c.o
	$(LINKER) $(LINKER_FLAGS) *.o *.so -o "$@"

main.o: main.asm
	$(ASM) $(ASM_FLAGS) $< -o "$@"

c.o: c.c
	$(CC) $(CC_FLAGS) $< -o "$@"


clean:
	-rm *.o
	-rm $(BIN)
.PHONY: clean

#Efficiency and low level access to hardware


#cmp 

#jmp

# if you let instruction fall through then it is not costing efficacy
