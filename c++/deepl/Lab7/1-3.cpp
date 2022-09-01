// Нейрон с двумя входами и одним выходом, 
// "рассматривающий" (на основании описания) 
// и оцениваюций подносимые ему цветки.
// Автор: Петров К. (24.11.2021)
// Компилятор g++.exe (mingw, std=c++11)
// --------------------------------
#include <iostream>
#include <vector>
#include <utility>
#include <cmath>

using namespace std;

const int N = 2;

double neuron(const vector<double> &u,const vector<double> &w)
{
	double sum = 0;
	for (int i = 0; i < N; i++)
	{
		sum += u[i] * w[i];
	}
	return sum;
}

void interp(double r, const vector<double> &u)
{
	double sum = 0;
	for (auto &i : u) 
	{
		sum += abs(i);
	}
	if (abs(r) < 0.2 * sum)
		cout << "] Indifferent" << endl;
	else 
		if (r < 0)
			cout << "] Negative" << endl;
		else
			cout << "] Positive" << endl;
}

int main()
{
	vector<pair<string,vector<double> > > u = { {"(1)", {0,10.0} },
	                                            {"(2)", {10.0,0.0} },
	                                            {"(3)", {-10.0,-10.0} },
	                                            {"(4)", {-10.0,10.0} },
	                             {"lily of the valley", {3.0,0.0} },
	                                      {"carnation", {5.0,7.0} },
	                                         {"sundew", {-3.3,-5.6} },
	                                           {"rose", {5.0,9.0} } };
	cout << "Enter weights:" << endl;
	vector<double> w(N);
	for (auto &i : w)
	{
		cin >> i;
	}
	for (auto &i : u)
	{
		double sum = neuron(i.second,w);
		cout << i.first << " [" << sum;
		interp(sum,i.second);
	}
	return 0;
}