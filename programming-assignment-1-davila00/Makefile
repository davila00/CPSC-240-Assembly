# This file contains a basic structure to help you get started,
# but is still incomplete!
# You need to fill in the following things:
# - C_FLAGS            ==> Flags for compilation of C source files
# - YASM_FLAGS         ==> Flags for compilation of assembly source files
# - LINK_FLAGS         ==> Flags for the linking stage
# - The "build" target ==> Needs commands to compile and link your program

# Keep the following in mind:
# - Make sure to build a 64-bit program
# - Make sure to generate debug symbols when compiling, if you intent to use the gdb debugger
# - You may need to include the -no-pie argument when compiling a source file, to avoid issues with Ubuntu
# - Do not change the name of the generated program (found in the variable BIN_NAME)!
# - You can build and run your program with the following command: make


# TODO
C_FLAGS := -Wall -m64 -gdwarf-2 -c
YASM_FLAGS :=  -f elf64 -gdwarf2
LINK_FLAGS := -Wall -m64 -gdwarf-2 -no-pie


#
BIN_NAME := my-program


#
default:	run


# Enter your build commands here
build:
	
	yasm -f elf64 -gdwarf2 area.asm -o area.o
	gcc -Wall -m64 -gdwarf-2 -c main.c -o main.o
	gcc -Wall -m64 -gdwarf-2 -no-pie *.o *.so -o my-program 

#
run:	build
	./$(BIN_NAME)
	
clean:
	-rm *.o
	-rm $(BIN_NAME)


# This target is just for your convenience.
# You may create a text file named gdb-commands.txt and stuff it with
#   commands you wish to execute when gdb launches.
# This is useful to save time when you expect to launch the debugger
#   many times with many debug commands.
debug:	build
	gdb $(BIN_NAME) -x gdb-commands.txt



