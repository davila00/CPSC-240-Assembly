# Name: Daniel Avila
# Email; deadanny31@csu.fullerton.edu
# Section: 09

rm *.o
rm *.out

echo "Assemble get_electricity.asm"
nasm -f elf64  get_electricity.asm -o get_electricity.o

echo "compile ampere.cpp using g++"
g++ -c -Wall -no-pie -m64 -gdwarf-2 -std=c++17 ampere.cpp -o ampere.o 

echo "compile show_electricity.cpp using g++"
g++ -c -Wall -no-pie -m64 -gdwarf-2 -std=c++17 show_electricity.cpp -o show_electricity.o 

echo "compile show_power.cpp using g++"
g++ -c -Wall -no-pie -m64 -gdwarf-2 -std=c++17 show_power.cpp -o show_power.o 

echo "Assemble faraday.asm"
nasm -f elf64  faraday.asm -o faraday.o 

echo "Link the objects files using g++"
g++ -m64 -no-pie -o work.out get_electricity.o ampere.o show_electricity.o show_power.o get_electricity.o -std=c++17

echo "Run the program"
./work.out
