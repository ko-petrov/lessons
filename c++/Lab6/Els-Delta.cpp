// Дельта-код Элайеса
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
#include <algorithm>
using namespace std;

string toBIN(int n) {
	string code = "";
	while(n != 1) {
		if (n % 2) code += "1";
		else code += "0";
		n /= 2;
	}
	reverse(code.begin(),code.end());
	return code;
}

string toEls(int n) {
	if (n == 1) return "1";
	string code = "";
	code = toBIN(n);
	int L = code.size() + 1;
	string M = '1' + toBIN(L);
	string unar = "";
	for (int i = 0; i != M.size() - 1; i++)
		unar += '0';
	code = unar + M + code;
	return code;
}

int toDec(string code) {
	if (code == "1") return 1;
	int count = 0, i;
	for (i = 0; code[i] == '0'; i++)
		count++;
	int dec = 0;
	for (int j = i; j != i + i + 1; j++)
		if (code[j] == '1')
			dec += pow(2,(i + i - j));
	int dec2 = 0;
	for (int j = i + i + 1; j != i + i + dec; j++)
		if (code[j] == '1')
			dec2 += pow(2,(i + i + dec - 1 - j));
	dec2 += pow(2,(dec - 1));
	return dec2;
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
	cout << n << "(Dec) => " << s << "(Els-Delta) => " << toDec(s) << "(Dec)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 1 || b < a) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}