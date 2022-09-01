// Коды Ивэн-Родэ
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
#include <algorithm>
using namespace std;

string toEvRod(int n) {
	if (n == 0) return "000";
	if (n == 1) return "001";
	if (n == 2) return "010";
	if (n == 3) return "011";
	string code = "0";
	while (n > 3) {
		string BIN = "";
		while(n) {
			if (n % 2) BIN += "1";
			else BIN += "0";
			n /= 2;
		}
		reverse(BIN.begin(),BIN.end());
		code = BIN + code;
		n = BIN.size();
	}
	return code;
}

int toDec(string code) {
	if (code == "000") return 0;
	if (code == "001") return 1;
	if (code == "010") return 2;
	if (code == "011") return 3;

	int a = 0, b = 3, dec;
	while (code[a] != '0') {
		dec = 0;
		for (int i = a; i != b; i++) {
			if (code[i] == '1')
				dec += pow(2,(b - i - 1));
		}
		a = b;
		b += dec;
	}
	return dec;
}

bool test(int a, int b) {
	for (int i = a; i != b; i++) {
		string s = toEvRod(i);
		if (i != toDec(s)) return false;
	}
	return true;
}

int main(int argc, char const *argv[]) {
	cout << "Enter number: ";
	int n;
	cin >> n;
	if (n < 0) return 1;
	string s = toEvRod(n);
	cout << n << "(Dec) => " << s << "(Ev-Rod) => " << toDec(s) << "(Dec)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 0 || b < 0 || a > b) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}