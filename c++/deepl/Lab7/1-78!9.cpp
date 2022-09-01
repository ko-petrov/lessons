// Нейронная сеть по распознаванию живых существ.
// Автор: Петров К. (24.11.2021)
// Компилятор g++.exe (mingw, std=c++11)
// --------------------------------
#include <iostream>
#include <vector>
#include <utility>
#include <cmath>
#include <algorithm>
#include <iterator>

using namespace std;

const double threshold = 10; 

double neuron(const vector<double> &u,const vector<double> &w)
{
	double sum = 0;
	for (int i = 0; i < u.size(); i++)
	{
		sum += u[i] * w[i];
	}
	return sum;
}

int main()
{
	vector<pair<string,vector<double> > > u = { {"(7-1)", {4.0, -1.0, -1.0, -1.0, -1.0} },
	                                            {"(7-2)", {2.0, -1.0, 2.0, 2.0, 1.0} },
	                                            {"(7-3)", {0.0, 2.0, -1.0, -1.0, 2.0} },
	                                            {"(8-1)", {4.0, -1.0, -1.0, -0.9, -1.0} },
	                                            {"(8-2)", {8.0, -6.0, -3.0, -5.0, -9.0} },
	                                             {"bear", {4.0, -1.0, -1.0, -1.0, -1.5} },
	                                           {"salmon", {-1.0, 3.5, -1.0, -2.0, 1.5} },
	                                           {"parrot", {2.0, -1.0, 2.0, 2.5, 2.0} },
	                                          {"dolphin", {-1.0, 2.5, -1.0, -2.0, -2.5} },
	                                            {"snake", {0.0, -1.0, -1.0, -1.0, 1.5} } };

	vector<pair<string,vector<double> > > w = { {"mammal", {4.0, 0.01, 0.01, -1.0, -1.5} },
	                                              {"bird", {2.0, -1.0, 2.0, 2.5, 2.0} },
	                                              {"fish", {-1.0, 3.5, 0.01, -2.0, 1.5} } };
	for (auto &i : u)
	{
		vector<double> s;
		cout << i.first << " ( ";
		for (int j = 0; j < w.size(); j++)
		{
			double neu = neuron(i.second,w[j].second);
			cout << neu << " ";
			s.push_back(neu);
		}
		int d = distance(s.begin(), max_element(s.begin(),s.end()));
		if (s[d] < threshold)
		{
			cout << ") Recognition error" << endl;
		}
		else
		{
			cout << ") It is " << w[d].first << endl;
		}
	}
	return 0;
}