// Name: Daniel Avila
// CWID: 887755916
// Email; deadanny31@csu.fullerton.edu

//prints welcome message
//call on triangle.asm
//print the result returned

#include <iostream>
#include <iomanip>
#include "show_results.cpp"
using namespace std;

//extern "C" float heron();

int	main()
{
	float receivedNumber = heron();
	cout << "Welcome to CPSC 240 Assignment 4 brought to you by Daniel Avila" << endl;
	
	cout << "Heron received his number: " << receivedNumber << endl;
	
	cout << "Have a nice day. The program will return control to the operating system." << endl;
	
	return 0;
}
