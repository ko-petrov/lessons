// Автор: Петров К.А.
// Компилятор g++.exe (mingw, -std=c++11)
#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <cmath>

using namespace std;

double evkl(const vector<double> &v1, const vector<double> &v2)
{
	double sum = 0;
	for (int i = 0; i < v1.size(); ++i)
	{
		sum += (v1[i] - v2[i]) * (v1[i] - v2[i]);
	}
	return sqrt(sum);
}

double skalar(const vector<double> &v1, const vector<double> &v2)
{
	double sum = 0;
	for (int i = 0; i < v1.size(); ++i)
	{
		sum += v1[i] * v2[i];
	}
	return sum;
}

double module(const vector<double> &v)
{
	double sum = 0;
	for (int i = 0; i < v.size(); ++i)
	{
		sum += v[i] * v[i];
	}
	return sqrt(sum);
}

double ugol(const vector<double> &v1, const vector<double> &v2)
{
	double p = skalar(v1,v2) / (module(v1) * module(v2));
	return acos(p);
}

int obnov(int x, int y, int x0, int y0, int r, int n)
{
	for (int i = 1; i <= n; ++i)
	{
		if (i % 200 == 0)
			r--;
	}
	int sum = 0;
	for (int i = 1; i <= x; ++i)
	{
		for (int j = 1; j <= y; ++j)
		{
			if ((abs(x0 - i) <= r) && (abs(y0 - j) <= r))
			{
				sum++;
			}
		}
	}
	return sum;
}

int main()
{
	vector<double> x = {0.2, -1.4, 2.3};
	vector<double> p1 = {0.6, -0.4, 7.0};
	vector<double> p2 = {0.1, -0.1, 2.2};
	cout << "(a)" << endl;
	cout << evkl(x,p1) << endl;
	cout << evkl(x,p2) << endl;
	if (evkl(x,p1) > evkl(x,p2))
		cout << "Winner p2" << endl;
	else
		cout << "Winner p1" << endl; 

	vector<double> sx = {0.2, -1.4, 0.3, 0.8};
	vector<double> sp1 = {0.3, -3.0, 1.0, 0.2};
	vector<double> sp2 = {0.4, -1.4, -2.0, 3.0};
	cout << evkl(sx,sp1) << endl;
	cout << evkl(sx,sp2) << endl;
	if (evkl(sx,sp1) > evkl(sx,sp2))
		cout << "Winner p2" << endl;
	else
		cout << "Winner p1" << endl; 

	cout << "(b)" << endl;
	cout << skalar(x,p1) << endl;
	cout << skalar(x,p2) << endl;
	if (skalar(x,p1) > skalar(x,p2))
		cout << "Winner p2" << endl;
	else
		cout << "Winner p1" << endl; 

	cout << skalar(sx,sp1) << endl;
	cout << skalar(sx,sp2) << endl;
	if (skalar(sx,sp1) > skalar(sx,sp2))
		cout << "Winner p2" << endl;
	else
		cout << "Winner p1" << endl; 


   
	cout << obnov(10,10,10,10,6,1000) << endl;
	return 0;
}