
#include <stdio.h>

void int my_c_function_by_value(long int a, long int b)
{
	printf("Hello from my_c_function_by_value()\n");
	printf(">The value of a is: %ld\n", a);
	printf(">The value of b is: %ld\n", b);
	
	
	a = a +1;
	b = b +1;
	
	printf(">The modified value of a is: %ld\n", a);
	printf(">The modified value of b is: %ld\n", b);
	
	return;
	
}

long int my_c_function_with_pointers(long int *a, long int *b)
{
	printf("Hello from my_c_function_wiht_pointers()\n");
	printf(">The value of a is: %ld\n", *a);
	printf(">The value of b is: %ld\n", *b);
	
	*a = *a +1;
	*b = *b +1;
	
	printf(">The modified value of a is: %ld\n", *a);
	printf(">The modified value of b is: %ld\n", *b);
	
	return 0;
}

void my_c_function_with_floats (long int a, long int b, double c, double d)

{
	printf("Hello from my_c_function_with_floats()\n");
	printF("The value of a is: %ld
	
}

