// ������ୠ� ࠡ�� �2. ����-����筠�
// ����: ���஢ �. (04.12.2020)
// ���������: g++.exe (gcc-2.95.2)
// --------------------------------

#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

// �����筠� -> ����-����筠�

vector<int> toNega(int n) {
	vector<int> v;
	while (n) {
		v.push_back(abs(n % 2));
		if (n < 0) n -= 1;
		n /= (-2);
	}
	reverse(v.begin(), v.end());
	return v;
}

// ����-����筠� -> �����筠�

int toDec(vector<int> v) {
	int n = 0, p, size = v.size() - 1;
	for (int i = 0; i != v.size(); i++) {
		n += v[size-i] * (int)pow(-2,i);
	}
	return n;
} 

// �뢮� ����-����筮�� �᫠ �� �࠭

void showVector(vector<int>& f) {
	for (int i = 0; i != f.size(); i++)
		cout << f[i] << " ";
}

// �㭪�� ��� ��⮢

bool test(int a, int b) {
	for (int i = a; i <= b; i++) {
		vector<int> c = toNega(i);
		if (i != toDec(c) ) return false;
	}
	return true;
}

int main(int argc, char *argv[]) {
	int n, a, b;
	cout << "Enter nunber(a): ";
	cin >> n;
	cout << n << " > [ ";
	vector<int> v = toNega(n);
	showVector(v);
	cout << "] > " << toDec(v) << endl;
	cout << "Enter test range(a b): ";
	cin >> a >> b;
	cout << test(a,b);
	return 0;
}