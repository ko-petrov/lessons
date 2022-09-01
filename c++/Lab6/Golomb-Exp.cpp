// Экспоненциальное кодирование Голомба
// Автор: Петров Константин (22.12.2020)
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

string unar(int n) {
	string code2 = "";
	for (int i = 0; i != n; i++)
		code2 += '1';
	code2 += '0';
	return code2;
}

string toGolomb(int n, int m) {
	int w = 1 + (int)floor(n / (int)pow(2,m));
	int f = (int)ceil((double)(1 + n) / (double)pow(2,m));
	f = (int)floor(log10(f) / log10(2));
	string code = unar(f) + toBIN(w,f) + toBIN(n,m);
	return code;
}

int toDec(string code, int m) {
	int dec = 0, f = 0, i;
	for (i = 0; code[i] != '0'; i++)
		f++;
	i++;
	int size = f + f + 1 + m;
	int r = 0;
	for (int j = i; j != size; j++)
		if (code[j] == '1') r += (int)pow(2,size - j - 1);
	dec = ((int)pow(2,f) - 1) * (int)pow(2,m) + r;
	return dec;
}

bool test(int n1, int n2, int m1, int m2) {
	for (int i = n1; i != n2; i++) {
		string gol;
		for (int j = m1; j != m2; j++) {
			gol = toGolomb(i,j);
			cout << i << "(Dec) => " << gol << "(Golomb-Exp) => " << toDec(gol, j) << "(Dec) m = " << j << endl;
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
	if (n < 0 || m < 0) return 1;
	string s = toGolomb(n,m);
	cout << s << endl;
	cout << n << "(Dec) => " << s << "(Golomb-Exp) => " << toDec(s, m) << "(Dec)" << endl;
	cout << "Enter n1 n2: ";
	int n1, n2, m1, m2;
	cin >> n1 >> n2;
	cout << "Enter m1 m2: ";
	cin >> m1 >> m2;
	cout << "Result:" << test(n1,n2,m1,m2) << endl;
	return 0;
}