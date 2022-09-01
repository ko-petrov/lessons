// Кодирование Фибоначчи
// Автор: Петров Константин (22.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> toFib(int n) {
	vector<int> a, b;
	if (n == 0) { b.push_back(0); return b;}
	a.push_back(1); a.push_back(1);
	for (int i = 2; a[i - 1] <= n; i++)
		a.push_back(a[i - 1] + a[i - 2]);
	for (int i = a.size() - 2; i; i--)
		if (a[i] <= n) {
			 b.push_back(1);
			 n -= a[i];
		}
		else b.push_back(0);
	reverse(b.begin(),b.end());
	b.push_back(1);
	return b;
}

int toDec(vector<int> v) {
	v.pop_back();
	//reverse(v.begin(), v.end());
	vector<int> fib;
	fib.push_back(1); fib.push_back(2);
	int n = 0;
	for (int i = 0; i != v.size(); i++) {
		if (v[i] == 1)
			n += fib[i];
		fib.push_back(fib[i] + fib[i + 1]);
	}
	return n;
} 

void showVector(vector<int>& f) {
	for (int i = 0; i != f.size(); i++)
		cout << f[i] << " ";
}

bool test(int a, int b) {
	for (int i = a; i <= b; i++) {
		vector<int> c = toFib(i);
		if (i != toDec(c) ) return false;
	}
	return true;
}

int main(int argc, char *argv[]) {
	int n, a, b;
	cout << "Enter nunber(a): ";
	cin >> n;
	cout << n << " > [ ";
	vector<int> v = toFib(n);
	showVector(v);
	cout << "] > " << toDec(v) << endl;
	cout << "Enter test range(a b): ";
	cin >> a >> b;
	cout << test(a,b);
	return 0;
}