// Лабораторная работа №2. Нега-двоичная
// Автор: Петров К. (04.12.2020)
// Компилятор: g++.exe (gcc-2.95.2)
// --------------------------------

#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

// Десятичная -> Нега-двоичная

vector<int> toNega(int n) {
	vector<int> v;
	while (n) {
		v.push_back(abs(n % 2));
		if (n < 0) n -= 1;
		n /= (-2);
	}
	reverse(v.begin(), v.end());
	return v;
}

// Нега-двоичная -> Десятичная

int toDec(vector<int> v) {
	int n = 0, p, size = v.size() - 1;
	for (int i = 0; i != v.size(); i++) {
		n += v[size-i] * (int)pow(-2,i);
	}
	return n;
} 

// Вывод нега-двоичного числа на экран

void showVector(vector<int>& f) {
	for (int i = 0; i != f.size(); i++)
		cout << f[i] << " ";
}

// Функция для тестов

bool test(int a, int b) {
	for (int i = a; i <= b; i++) {
		vector<int> c = toNega(i);
		if (i != toDec(c) ) return false;
	}
	return true;
}

int main(int argc, char *argv[]) {
	int n, a, b;
	cout << "Enter nunber(a): ";
	cin >> n;
	cout << n << " > [ ";
	vector<int> v = toNega(n);
	showVector(v);
	cout << "] > " << toDec(v) << endl;
	cout << "Enter test range(a b): ";
	cin >> a >> b;
	cout << test(a,b);
	return 0;
}