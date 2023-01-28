// Name: Daniel Avila
// CWID: 887755916
// Email; deadanny31@csu.fullerton.edu

//print welcome message
//call on assembly function inside of manager.asm
//print returned result

extern "C" int main();

#include <iostream>
using namespace std;

extern long manager();

int main ()
{
	cout << "Welcome to CPSC 240 Assignment 3 brought to you by Daniel Avila" << endl;

	long returnValue = 10;
//	returnValue = manager();

	cout << "The driver received this value: " << returnValue << endl;
	cout << "Have a nice day. The program will return control to the operating system." << endl;

	return 0;
}
