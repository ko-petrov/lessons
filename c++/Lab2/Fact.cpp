// ������ୠ� ࠡ�� �2. ����ਠ�쭠� ��⥬�
// ����: ���஢ �. (04.12.2020)
// ���������: g++.exe (gcc-2.95.2)
// --------------------------------

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// �����筠� -> ����ਠ�쭠�

vector<int> toFact(int x) {
	vector<int> v;
	if (!x) v.push_back(0);
	for (int i = 2; x; x /= i, i++) v.push_back(x % i);
	reverse(v.begin(), v.end());
	return v;
}

// ����ਠ�쭠� -> �����筠�

int toDec(vector<int>& f) {
	int dec = 0, f0 = 1;
	for (int i = f.size()-1; i >= 0; i--) {
		f0 = f0 * (f.size() - i);
		dec = dec + (f[i] * f0);
	}
	return dec;
}

// �뢮� 䠪�ਠ�쭮�� �᫠ �� �࠭

void showVector(vector<int>& f) {
	for (int i = 0; i != f.size(); i++)
		cout << f[i] << " ";
}

// �㭪�� ��� ��⮢

bool test(int a, int b) {
	for (int i = a; i <= b; i++) {
		vector<int> c = toFact(i);
		if (i != toDec(c) ) return false;
	}
	return true;
}

// ------------------------------------

int main(int argc, char *argv[]) {
	int n, a, b;
	cout << "Enter nunber(a): ";
	cin >> n;
	cout << n << " > [ ";
	vector<int> v = toFact(n);
	showVector(v);
	cout << "] > " << toDec(v) << endl;
	cout << "Enter test range(a b): ";
	cin >> a >> b;
	cout << test(a,b);
	return 0;
}