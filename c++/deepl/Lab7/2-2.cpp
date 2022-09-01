#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>

using namespace std;

// печать вектора
template <typename T>
void printv(const vector<T> &v)
{
	cout << "[ ";
	for (auto i : v)
	{
		cout << i << " ";
	}
	cout << "] ";
}

double neuron(const vector<double> &u, const vector<double> &w)
{
	double x = 0;
	for (int i = 0; i < u.size(); i++)
	{
		x += u[i] * w[i]; 
	}
	//cout << x << endl;
	return (x >= 0) ? 1.0 : 0.0; // пороговая функция
}

int main()
{
	vector<double> w1 = {1.5, -1.0, -1.0};
	vector<double> w2 = {0.5, -1.0, -1.0};
	vector<double> w3 = {-0.5, 1.0, -1.0};
	vector<vector<double> > u = {{1.0, 0.0, 0.0}, // 00
	                             {1.0, 0.0, 1.0},  // 01
	                             {1.0, 1.0, 0.0},  // 10
	                             {1.0, 1.0, 1.0}};   // 11
	cout << "XOR ELEMENT:" << endl;
	for (int i = 0; i < u.size(); ++i)
	{
		printv(u[i]);
		double y1 = neuron(u[i],w1);
		//cout << y1 << endl;
		double y2 = neuron(u[i],w2);
		//cout << y2 << endl;
		vector<double> u5 = {1.0, y1, y2};
		double y3 = neuron(u5,w3);
		cout << y3 << endl;
	}
	return 0;
}