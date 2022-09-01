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
bool neuron(const vector<bool> &u, const vector<double> &w)
{
	double x = 0;
	for (int i = 0; i < u.size(); i++)
	{
		x += u[i] * w[i]; 
	}
	return (x >= 0); // пороговая функция
}

// Функция, выполняющая алгоритм, принимает векторы входных сигналов
// в паре с ожидаемыми результатами,
vector<double> hebb(const vector<pair<bool,vector<bool> > > &u, int n)
{
	vector<double> w; // вектор весовых коэффициентов
	for (int i = 0; i < u.front().second.size() ; ++i) // извлекаем размер вектора входных сигналов
	{
		w.push_back((rand() % 3) - 1); // заполнение весов малыми случайнми значениями
	}
	cout << "Процесс корректировки весов:" << endl;
	cout << "(0) ";
	printv(w);
	cout << endl;
	vector<int> ind; // вектор для случайного перемещения по эелементам обучающей выборки
	for (int i = 0; i < u.size(); ++i)
	{
		ind.push_back(i);
	}
	bool y; // результат сложения
	for (int i = 0; i < n; ++i) // итериции обучения
	{
		random_shuffle(ind.begin(), ind.end()); // перемешиваем индексы обучающей выборки
		bool flag = 1; // проверяет изменяли ли мы веса
		for (auto j : ind) // перемещение по выборкам
		{
			y = neuron(u.at(j).second,w);
			if (y != u.at(j).first)
			{
				flag = 0;
				if (y)
				{
					for (int k = 0; k < w.size(); ++k) // корректировка весов в меньшую сторону
					{
						w.at(k) -= u.at(j).second.at(k);
					}
				}
				else
				{
					for (int k = 0; k < w.size(); ++k) // корректировка весов в большую сторону
					{
						w.at(k) += u.at(j).second.at(k);
					}
				}
			}
		}
		cout << "(" << i + 1 << ") ";
		printv(w);
		cout << endl;
		if (flag) break; // выход из цикла, если обучающая выборка не изменилась
	}
	return w;
}

int main()
{
	vector<pair<bool, vector<bool> > > u = { { 1, { 1, 0, 1, 1, 1, 1 } },
	                                         { 0, { 1, 1, 1, 1, 0, 1 } },
	                                         { 1, { 1, 0, 0, 0, 1, 1 } },
	                                         { 0, { 1, 0, 1, 0, 1, 1 } } };

	srand(time(NULL));
	int n;
	cout << "Введите максимальное количество итераций обучения: ";
	cin >> n;
	vector<double> w = hebb(u,n);
	cout << "Получены значения весов:" << endl;
	printv(w);
	cout << endl << "Проверка:" << endl;
	bool test;
	bool flag = 0;
	for (auto &i : u)
	{
		
		test = neuron(i.second,w);
		printv(i.second);
		cout << "Ожидается: " << i.first << " Нейросеть выдала: " << test;
		if (i.first != test)
		{
			flag = 1;
			cout << " (ошибка)" << endl;
		}
		else
		{
			cout << endl;
		}
	}
	if (flag)
	{
		cout << "Нейросеть работает некорректно. Попробуйте увеличить количество итераций." << endl;
	}
	else
	{
		cout << "Нейросеть успешно обучена!" << endl;
	}

	return 0;
}