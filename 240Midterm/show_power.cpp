// Name: Daniel Avila
// Email; deadanny31@csu.fullerton.edu
// Section: 09

extern "C" float receivedQuantities(float volt, float resistance);

#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

float receivedQuantities(float volt, float resistance)
{
	float work = 0.0;
	float newVolt = 0.0;
	
	newVolt = pow(volt, 2);
	work = newVolt/resistance;
	
	cout << "The work performed is " << fixed << setprecision(3);
	cout << work << "Joules" << endl;
	
	return work;
}

