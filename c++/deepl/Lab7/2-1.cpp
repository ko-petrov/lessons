// Алгоритм Д.О. Хебба обучения нейрона
// с пороговой активационной функцией
// Автор: Петров К.А. (08.12.2021, 15.12.2021)
// Компилятор g++.exe (mingw, std=c++11)
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

// Персептрон принимает на вход вектор биполярных входных сигналов
// и вектор весовых коэффициентов, выраженных вещественным числом.
// Возвращает взвешенную сумму, пропущенную через пороговую
// функцию активации.
double neuron(const vector<double> &u, const vector<double> &w)
{
	double x = 0;
	for (int i = 0; i < u.size(); i++)
	{
		x += u[i] * w[i]; 
	}
	cout << x << endl;
	return (x >= -1) ? 1.0 : -1.0; // пороговая функция
}


int main()
{
	vector<double> w1 = {-0.5, 1.0, 1.0};
	vector<double> w2 = {1.5, -1.0, -1.0};
	vector<double> w3 = {-1.5, 1.0, 1.0};
	vector<double> u1 = {1.0, -1.0, -1.0}; // 00
	vector<double> u2 = {1.0, -1.0, 1.0};  // 01
	vector<double> u3 = {1.0, 1.0, -1.0};  // 10
	vector<double> u4 = {1.0, 1.0, 1.0};   // 11
	double y1 = neuron(u4,w1);
	cout << y1 << endl;
	double y2 = neuron(u4,w2);
	cout << y2 << endl;
	vector<double> u5 = {1.0, y1, y2};
	double y3 = neuron(u5,w3);
	cout << y3 << endl;
	return 0;
}