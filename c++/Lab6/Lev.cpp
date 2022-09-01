// Кодирование Левенштейна
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <cmath>
using namespace std;

string toBIN(int n);
string toLev(int n);
int toDec(string code);

string toBIN(int n) {
	string BIN = "";
	if (!n) return BIN;
	while (n != 1) {
		if (n % 2) BIN += '1';
		else BIN += '0';
		n /= 2;
	}
	reverse(BIN.begin(),BIN.end());
	return BIN;
}

string toLev(int n) {
	if (!n) return "0";
	string code = "";
	string BIN = toBIN(n);
	int m = 1, c = 0;
	while (m) { 
		c++;
		code = BIN + code;
		m = BIN.size();
		BIN = toBIN(m);
	}
	string str = "";
	for (int i = 0; i != c; i++) {
		str += "1";
	}
	str += "0";
	code = str + code;
	return code;
}

int BINtoDec(string BIN) {
	int n = 0, size = BIN.size();
	for (int i = 0; i != size; i++) {
		if (BIN[size - i - 1] == '1') n += (int)pow(2,i);
	}
	return n;
}

int toDec(string code) {
	if (code[0] == '0') return 0;
	int i = 0;
	while (code[i] == '1') i++;
	int p = i - 1, n = 1;
	i++;
	while (p) {
		if (!p) return n;
		string z = "";
		int j;
		for (j = i; j != i + n; j++)
			z += code[j];
		i = j;
		z = '1' + z;
		n = BINtoDec(z);
		p--;
	}
	return n;
}

bool test(int a, int b) {
	for (int i = a; i != b; i++) {
		string s = toLev(i);
		if (i != toDec(s)) return false;
	}
	return true;
}

int main() {
	int n; string code;
	cout << "Enter number: ";
	cin >> n;
	code = toLev(n);
	int n2 = toDec(code);
	cout << n << "(10) => " << code << "(Lev) =>" << n2 << "(10)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 1 || b < a) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}