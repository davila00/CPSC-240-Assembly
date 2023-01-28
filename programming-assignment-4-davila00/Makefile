# Name: Daniel Avila
# CWID: 887755916
# Email; deadanny31@csu.fullerton.edu

##########################################

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

# 
BIN_NAME := my-program
BIN := ./$(BIN_NAME)


default:	run

clean:
	-rm *.o
	-rm $(BIN)
.PHONY: clean

run:	build
	@echo
	@echo "Running: $(BIN)"
	$(BIN)
.PHONY: run

build:	$(BIN)
	@echo "Done building"
.PHONY: build

##########################################

$(BIN): compute_area.o get_sides.o heron.o show_results.o triangle.o
	@echo
	@echo "Linking: $@"
	$(LINKER) $(LINKER_FLAGS) *.o *.so -o $@

compute_area.o: compute_area.asm
	@echo
	@echo "Building: $@"
	$(ASM) $(ASM_FLAGS) $< -o $@

get_sides.o: get_sides.c
	@echo
	@echo "Building: $@"
	$(CC) $(CC_FLAGS) $< -o $@

heron.o: heron.cpp
	@echo
	@echo "Building: $@"
	$(CPP) $(CPP_FLAGS) $< -o $@

show_results.o: show_results.cpp
	@echo
	@echo "Building: $@"
	$(CPP) $(CPP_FLAGS) $< -o $@

triangle.o: triangle.asm
	@echo
	@echo "Building: $@"
	$(ASM) $(ASM_FLAGS) $< -o $@




