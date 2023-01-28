// Name: Daniel Avila
// CWID: 887755916
// Email; deadanny31@csu.fullerton.edu

#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

extern "C" int main1();

float sideA, sideB, sideC, computedArea, sp;

float heron();

int	main2()
{
	
	
	cout << "The area of a triangle with sides " << fixed << setprecision(10) << sideA;
	cout << ", " << fixed << setprecision(10) << sideB << ", and " << fixed << setprecision(10);
	
	computedArea = heron();
	
	cout << " is " << computedArea << "sqaure units." << endl;
	
	return 0;
}

float heron()
{
	sp = (sideA + sideB + sideC) / 2.0;
	computedArea = sqrt(sp * (sp - sideA) * (sp - sideB) * (sp - sideC));
	
	return computedArea;
}
