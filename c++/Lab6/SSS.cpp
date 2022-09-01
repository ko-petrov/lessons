// SSS кодирование
// Автор: Петров Константин (22.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
#include <algorithm>

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

string SSS(int i, int j, int k, int t) {
	string code = "";
	int r = 1, n = 1, rnew = 1;
	do {
		r = rnew;
		rnew += (int)pow(2, i + (n - 1) * j);
		n++;
	} while (rnew <= t);
	n--;
	for (int iter = 0; iter != n - 1; iter++)
		code += '1';
	code += '0';
	code += toBIN(t - r, i + (n - 1) * j);
	return code;
}

int toDec(int i, int j, int k, string code) {
	int n = 0, dec = 0, iter;
	for (iter = 0; code[iter] != '0'; iter++){
		n++;
	}
	n++;
	iter++; 
	int size = i + (n - 1) * j;
	for (int iter2 = iter; iter2 != iter + size; iter2++) {
		if (code[iter2] == '1') dec += (int)pow(2,iter + size - iter2 - 1);
	}
	int r = 1, n1 = 1, rnew = 1;
	 do {
	 	r = rnew;
	 	rnew += (int)pow(2, i + (n1 - 1) * j);
		n1++;
	} while (n1 <= n);
	dec += r;
	return dec;
}

bool test(int i, int j, int k, int a, int b) {
	for (int it = a; it != b; it++) {
		string s = SSS(i,j,k,it);
		if (it != toDec(i,j,k,s)) return false;
	}
	return true;
}


int main()
{
	cout << "Enter i j k: ";
	int i, j, k;
	cin >> i >> j >> k;
	cout << "Enter t: ";
	int t;
	cin >> t;
	string code = SSS(i,j,k,t);
	cout << t << "(10) => " << code << "(SSS) => ";
	cout << toDec(i,j,k,code) << "(10)" << endl;
	cout << "Enter range for t: ";
	int a, b;
	cin >> a >> b;
	cout << test(i,j,k,a,b);
	return 0;
}