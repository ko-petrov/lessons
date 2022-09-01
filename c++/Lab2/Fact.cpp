// Лабораторная работа №2. Факториальная система
// Автор: Петров К. (04.12.2020)
// Компилятор: g++.exe (gcc-2.95.2)
// --------------------------------

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// Десятичная -> Факториальная

vector<int> toFact(int x) {
	vector<int> v;
	if (!x) v.push_back(0);
	for (int i = 2; x; x /= i, i++) v.push_back(x % i);
	reverse(v.begin(), v.end());
	return v;
}

// Факториальная -> Десятичная

int toDec(vector<int>& f) {
	int dec = 0, f0 = 1;
	for (int i = f.size()-1; i >= 0; i--) {
		f0 = f0 * (f.size() - i);
		dec = dec + (f[i] * f0);
	}
	return dec;
}

// Вывод факториального числа на экран

void showVector(vector<int>& f) {
	for (int i = 0; i != f.size(); i++)
		cout << f[i] << " ";
}

// Функция для тестов

bool test(int a, int b) {
	for (int i = a; i <= b; i++) {
		vector<int> c = toFact(i);
		if (i != toDec(c) ) return false;
	}
	return true;
}

// ------------------------------------

int main(int argc, char *argv[]) {
	int n, a, b;
	cout << "Enter nunber(a): ";
	cin >> n;
	cout << n << " > [ ";
	vector<int> v = toFact(n);
	showVector(v);
	cout << "] > " << toDec(v) << endl;
	cout << "Enter test range(a b): ";
	cin >> a >> b;
	cout << test(a,b);
	return 0;
}