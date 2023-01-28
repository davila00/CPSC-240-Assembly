cc := gcc
CC_FLAGS := -Wall -m64 -gdwarf-2 -c
ASM := yasm
ASM_FLAGS := -f elf64 -gdwarf2
LINKER := gcc
LINKER_FLAGS := -Wall -m64 -gdwarf-2 -no-pie


BIN_NAME := my-program
BIN := ./$(BIN_NAME)


#run:	build
#		@echo "Running program"
#		./my-program

#build:
	
#		yasm -f elf64 -gdwarf2 my-hybrid.asm -o my-hybrid.o
#		gcc -WAll -m64 -gdwarf-2 -c my-c-stuff.c -o my-c-stuff.o 
#		gcc -Wall -m64 -gdwarf-2 -no-pie *.o -o my-program
#		@echo "Done"


run: 	build
		@echo "Running program!"
		./my-program
.PHONY: run


build: $(BIN)
.PHONY: build

$(BIN): driver.o cool-assembly.o

# remove from here	@echo $(ASM) $(ASM_FLAGS) my-hybrid-main.asm -o my-hybrid-main.o
#remove from here	@echo $(CC) $(CC_FLAGS) -c my-c-stuff.c -o my-c-stuff.o
	@echo $(LINKER) $(LINKER_FLAGS) *.o *.so -o my-program
	@echo "Done"
	
cool-assembly.o: cool-assembly.asm
	$(ASM) $(ASM_FLAGS) cool-assembly.asm -o cool-assembly.o
	
driver.o: driver.c
	$(CC) $(CC_FLAGS) -c driver.c -o driver.o

clean:
	-rm *.o
	-rm $(BIN)
	
#temp-target:
#	@echo Hello, the ASM variable is: $(ASM)
