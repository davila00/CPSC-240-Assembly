# Name: Daniel Avila
# CWID: 887755916
# Email; deadanny31@csu.fullerton.edu


# TODO: Fill most of this in
# Some parts have been filled in for you

ASM := yasm
ASM_FLAGS := -f elf64 -gdwarf2

#
CC := gcc
CC_FLAGS:= -Wall -pedantic -m64 -gdwarf-2 -c

#
CPP := g++
CPP_FLAGS := -Wall -std=c++17 -pedantic -m64 -gdwarf-2 

#
LINKER := gcc
LINKER_FLAGS := -m64 -gdwarf-2 -no-pie

# Your executable must be named my-program
BIN_NAME := my-program
BIN := ./$(BIN_NAME)


# For this assignment, we're going to create an individual Makefile target for each source file.
# Don't alter the structure of the Makefile; Just fill it in.


# Filled in for you
default:	run


# Filled in for you
clean:
	-rm *.o
	-rm $(BIN)
.PHONY: clean


# Filled in for you
run:	build
	@echo
	@echo "Running: $(BIN)"
	$(BIN)
.PHONY: run


# Filled in for you
debug:	build
	@echo
	@echo "Debugging: $(BIN)"
	gdb $(BIN) -x gdb-commands.txt
.PHONY: debug


# Filled in for you
build:	$(BIN)
	@echo "Done building"
.PHONY: build



# The rest of this needs to be filled in


# TODO: Fill this in
$(BIN): largest.o manager.o input_array.o output_array.o find_largest.o
	@echo
	@echo "Linking: $@"
	$(LINKER) $(LINKER_FLAGS) *.o *.so -o $@

# TODO: Fill this in
largest.o: largest.cpp
	@echo
	@echo "Building: $@"
	$(CPP) $(CPP_FLAGS) $< -o $@

# TODO: Fill this in
manager.o: manager.asm
	@echo
	@echo "Building: $@"
	$(ASM) $(ASM_FLAGS) $< -o $@

# TODO: Fill this in
input_array.o: input_array.cpp
	@echo
	@echo "Building: $@"
	$(CPP) $(CPP_FLAGS) $< -o $@

# TODO: Fill this in
output_array.o: output_array.asm
	@echo
	@echo "Building: $@"
	$(ASM) $(ASM_FLAGS) $< -o $@

# TODO: Fill this in
find_largest.o: find_largest.asm
	@echo
	@echo "Building: $@"
	$(ASM) $(ASM_FLAGS) $< -o $@




