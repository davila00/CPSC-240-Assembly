// Name: Daniel Avila
// Email; deadanny31@csu.fullerton.edu
// Section: 09

extern "C" float get_electricity();

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
	int value = 0;
	cout << "Welcome to Power Computation by Daniel Avila" << endl;
	cout << "We handle all your electricity" << endl;
	
	value = get_electricity();
	
	cout << "Ampere received this unrecognized value";
	cout << fixed << setprecision(2) << value << " and will keep it." << endl;
	cout << "Zero will now be returned to the OS...Bye" << endl;
	
	return 0;
}


