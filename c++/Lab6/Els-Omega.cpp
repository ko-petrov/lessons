// Омега-код Элайеса
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
#include <algorithm>
using namespace std;

string toEls(int n) {
	string code = "0";
	while (n > 1) {
		string BIN = "";
		while(n) {
			if (n % 2) BIN += "1";
			else BIN += "0";
			n /= 2;
		}
		reverse(BIN.begin(),BIN.end());
		code = BIN + code;
		n = BIN.size() - 1;
	}
	return code;
}

int toDec(string code) {
	int a = 0, b = 2, i, dec = 1, n;
	while (code[a] == '1') {
		if (code[a] == '0') return dec;
		dec = 0;
		for (i = a; i != b; i++) {
			if (code[i] == '1')
				dec += pow(2,(b - i - 1));
		}
		n = dec;
		n++;
		a = b;
		b += n;
	}
	return dec;
}

bool test(int a, int b) {
	for (int i = a; i != b; i++) {
		string s = toEls(i);
		if (i != toDec(s)) return false;
	}
	return true;
}

int main(int argc, char const *argv[]) {
	cout << "Enter number: ";
	int n;
	cin >> n;
	if (n < 1) return 1;
	string s = toEls(n);
	cout << n << "(Dec) => " << s << "(Els-Omega) => " << toDec(s) << "(Dec)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 1 || b < a) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}