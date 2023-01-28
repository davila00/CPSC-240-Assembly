// Name: Daniel Avila
// CWID: 887755916
// Email; deadanny31@csu.fullerton.edu

//function named input_array
//argument 1 -- pointer to an array of ints
//argument 2 -- max numb of ints (that can be inputted)
//will initialize the array to the user's input values
//return the number of ints as 64-bit signed int
//64-bit int will be used in manager() function

extern "C" signed long input_array(signed long *, long );

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
	long *input;
	cout << "Input your integer data one line at a time and enter 'q' when finished." << endl;
	input_array(input, 100);
	
	return 0;
}

signed long input_array(signed long *, long )
{
	long in;
	long counter = 100;
	while (!(cin.fail()))
	{
		for (auto i = 0; i < counter; i++)
		{
			cout << "Enter the next integer: ";
			cin >> in;
			cin.clear();
			cout << endl << "You entered: " << in << endl;

			cout << "You can enter up to " << (counter - 1) << "more integers" << endl;
		}
	}
	if (cin.fail())
	{
		cout << "You have entered nonsense! Assuming you are done." << endl;
		cout << "Total numbers entered: " << counter << endl;
	}
	else if (counter == 100)
	{
		return counter;
	}

	return counter;
}
//return back to manager()
