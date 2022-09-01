// Кодирование Голомба
// Автор: Петров Константин (21.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <cmath>
using namespace std;

string toBIN(int n, int size) {
	string BIN = "";
	while (size) {
		if (n % 2) BIN += '1';
		else BIN += '0';
		n /= 2;
		size--;
	}
	reverse(BIN.begin(),BIN.end());
	return BIN;
}

string toGolomb(int n, int m) {
	string code = "";
	for (int i = 0; i != n / m; i++) {
		code += '1';
	}
	code += '0';
	bool f = 0;
	for (int m1 = 2; m1 <= m; m1 *= 2) {
		if (m1 == m) f = 1;
	}
	if (f == 1) {
		int size = (int)ceil(log(m) / log(2));
		code += toBIN(n % m,size);
	}
	else {
		int r = n % m;
		int b = (int)ceil(log(m) / log(2));
		if (r < pow(2, b) - m) {
			code += toBIN(r, b - 1);
		}
		else {
			code += toBIN(int(r + pow(2, b) - m), b);
		}
	}
	return code;
}

int toDec(string code, int m) {
	int gamma = 0, i;
	for (i = 0; code[i] != '0'; i++) {
		gamma++; 
	}
	i++;
	bool f = 0;
	for (int m1 = 2; m1 <= m; m1 *= 2) {
		if (m1 == m) f = 1;
	}
	int log2m = (int)ceil(log(m) / log(2));
	int delta = 0;
	if (f == 1) {
		for (int j = i; j != i + log2m; j++) {
			if (code[j] == '1')
				delta += (int)pow(2,(i + log2m - j - 1));
		}
		return gamma * m + delta;
	}
	else {
		int b = log2m;
		int rpdbm = 0;
		for (int j = i; j != i + log2m; j++) {
			if (code[j] == '1')
				rpdbm += (int)pow(2,(i + log2m - j - 1));
		}
		int r = rpdbm - ((int)pow(2, b) - m);
		if (r >= (int)pow(2, b) - m) return gamma * m + r;
		else {
			int rpdbm = 0;
			for (int j = i; j != i + log2m - 1; j++) {
				if (code[j] == '1')
					rpdbm += (int)pow(2,(i + log2m - j - 2));
			}
			r = rpdbm;
			return gamma * m + r;
		}
	}
}

bool test(int n1, int n2, int m1, int m2) {
	for (int i = n1; i != n2; i++) {
		string gol;
		for (int j = m1; j != m2; j++) {
			gol = toGolomb(i,j);
			cout << i << "(Dec) => " << gol << "(Golomb) => " << toDec(gol, j) << "(Dec) m = " << j << endl;
			if (i != toDec(gol, j)) {
				cout << "error n = " << i << " m = " << j << endl;
				return 0;
			}
		}
	}
	return 1;
}

int main(int argc, char const *argv[])
{
	cout << "Enter n m: ";
	int n, m;
	cin >> n >> m;
	if (n < 0 || m < 1) return 1;
	string s = toGolomb(n,m);
	cout << n << "(Dec) => " << s << "(Golomb) => " << toDec(s, m) << "(Dec)" << endl;
	cout << "Enter n1 n2: ";
	int n1, n2, m1, m2;
	cin >> n1 >> n2;
	cout << "Enter m1 m2: ";
	cin >> m1 >> m2;
	cout << "Result:" << test(n1,n2,m1,m2) << endl;
	return 0;
}