// Name: Daniel Avila
// Email; deadanny31@csu.fullerton.edu
// Section: 09

extern "C" void showQuantities(float volt, float resistance);

#include <iostream>
#include <iomanip>
using namespace std;

void showQuantities(float volt, float resistance)
{
	cout << "You have entered:" << endl;
	cout << fixed;
	cout << setprecision(3) << volt << " volts" << endl;
	cout << setprecision(3) << resistance << " ohms" << endl;
}

