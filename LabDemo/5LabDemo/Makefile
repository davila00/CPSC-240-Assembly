# Compile and Link Variables
CC := gcc
CC_FLAGS := -Wall -m64 -gdwarf-2 -c
ASM := yasm
ASM_FLAGS := -f elf64 -gdwarf2
LINKER := gcc
LINKER_FLAGS := -Wall -m64 -gdwarf-2 -no-pie


# Executable name
BIN_NAME := my-program
BIN := ./$(BIN_NAME)

run:	build
	@echo "Running program!"
	$(BIN)
.PHONY: run

build:	$(BIN)
.PHONY: build


$(BIN):	main.o
	$(LINKER) $(LINKER_FLAGS) *.o *.so -o "$@"


main.o: main.asm
	$(ASM) $(ASM_FLAGS) main.asm -o "$@"


clean:
	-rm *.o
	-rm $(BIN)
.PHONY: clean



# page 173-174 in book about register calling conventions
