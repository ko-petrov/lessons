// Гамма-код Элайеса
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
#include <algorithm>
using namespace std;

string toEls(int n) {
	if (n == 1) return "1";
	string code = "";
	while(n) {
		if (n % 2) code += "1";
		else code += "0";
		n /= 2;
	}
	reverse(code.begin(),code.end());
	string unar = "";
	for (int i = 0; i != code.size() - 1; i++)
		unar += '0';
	code = unar + code;
	return code;
}

int toDec(string code) {
	int count = 0, i;
	for (i = 0; code[i] == '0'; i++)
		count++;
	int dec = 0;
	for (int j = i; j != count + i + 1; j++)
		if (code[j] == '1')
			dec += pow(2,(count + i - j));
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
	cout << n << "(Dec) => " << s << "(Els-Gamma) => " << toDec(s) << "(Dec)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 1 || b < a) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}