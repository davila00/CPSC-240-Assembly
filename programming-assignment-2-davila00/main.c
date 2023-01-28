// Name: Daniel Avila
// CWID: 887755916
// Email: deadanny31@csu.fullerton.edu

#include <stdio.h>

extern long manager();

int main()

{
	printf("\nWelcome to Arrays of Integers\n");
	printf("Brought to you by Daniel Avila\n");
	
	long returnValue;
	returnValue = manager();
	
	printf("Main received this number: %ld\n", returnValue);
	printf("Main will now return 0 to the operating system. Bye!\n\n");
	
	return 0;
}
