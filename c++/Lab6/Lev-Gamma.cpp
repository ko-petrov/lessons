// Гамма кодирование Левенштейна
// Автор: Петров Константин (20.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <string>
#include <cmath>
using namespace std;

string toLev(int n) {
	string code = "";
	while (n != 1) {
		if (n % 2) code += "01";
		else code += "00";
		n /= 2;
	}
	code += "1";
	return code;
}

int toDec(string code) {
	int n = 0, i;
	for (i = 1; code[i-1] == '0'; i += 2) {
		if (code[i] == '1') n += pow(2,i/2);
	}
	n+= pow(2,(i-1)/2);
	return n;
}

bool test(int a, int b) {
	for (int i = a; i != b; i++) {
		string s = toLev(i);
		if (i != toDec(s)) return false;
	}
	return true;
}

int main(int argc, char const *argv[])
{
	cout << "Enter number: ";
	int n;
	cin >> n;
	if (n < 1) return 1;
	string s = toLev(n);
	cout << n << "(Dec) => " << s << "(Lev-Gamma) => " << toDec(s) << "(Dec)" << endl;
	cout << "Enter range for tests: ";
	int a,b;
	cin >> a >> b;
	if (a < 1 || b < a) return 1;
	cout << "Result:" << test(a,b) << endl;
	return 0;
}