// Name: Daniel Avila
// CWID: 887755916
// Email: deadanny31@csu.fullerton.edu

#include <stdio.h>

extern int area();

int main()
{
	printf("\nWelcome to your friendly area calculator\n");
	printf("The main program will now call the area function.\n\n\n");

	int returnValue;
	returnValue = area();

	printf("\n\nThe main program received this integer: %d\n", returnValue);

	printf("Have a nice day. Main will now return 0 to the operating system.\n");

	return 0;
}
