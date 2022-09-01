// ������ ����஢���� ����
// ����: ���஢ �.�. (10.12.2020)
// ��������� g++.exe (gcc-2.95.2)

#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

// �����-१����

vector< pair<char,string> > r;

// �㭪�� ��� ���஢�� ����� �� ��஬� ��㬥��� ����

bool comp(const pair<char,double> &a, const pair<char,double> &b) {
	return a.second > b.second;
}

// �㭪�� ��� ��宦����� �㬬� ����� ��㬥�⮢ ���� � �����

double summa(const vector< pair<char,double> > &v, int s1, int s2) {
	double sum = 0;
	for (int i = s1; i != s2; i++) sum += v[i].second;
	return sum;
}

// �����ᨢ��� �㭪�� ��� ���᫥��� ���� ����

void Fano(const vector< pair<char,double> > &v, int s1, int s2, string BIN) {
	if (s2 - s1 == 1) {
		pair<char,string> t(v[s1].first, BIN);
		r.push_back(t);
	}
	else {
		double sum = 0, sumpr = 0; int j;
		double sumsr = summa(v, s1, s2)/2;
		for (j = s1; sum < sumsr; j++) {
			sumpr = sum;
			sum += v[j].second;
		}
		if (sum - sumsr > sumsr - sumpr) j--;
		Fano(v, s1, j, BIN + '0');
		Fano(v, j, s2, BIN + '1');
	}
}

// �㭪�� �뢮�� ���� �� �࠭

void print() {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

// ���⮢� �ਬ��

void test() {
	vector<pair<char,double> > v;
	pair<char,double> a('a', 0.5);
	v.push_back(a);
	pair<char,double> b('b', 0.3);
	v.push_back(b);
	pair<char,double> c('b', 0.2);
	v.push_back(c);
	r.clear();
	Fano(v, 0, 3, "");
	print();
}

// �᭮���� �㭪��

int main() {
	int n; char a; double b, s;
	cout << "������ ���-�� �㪢: ";
	cin >> n;
	if (n < 1) return 1;
	vector< pair<char,double> > v(n);
	cout << "���� ��� �����⢫���� �१ �஡��" << endl;
	for (int i = 0; i != n; i++) {
		cout << "��� " << i+1 << ": ";
		cin >> a >> b;
		v[i].first = a;
		v[i].second = b;
	}
	sort(v.begin(),v.end(),comp);
	string BIN = "";
	Fano(v, 0, n, BIN);
	print();
	cout << "���⮢� �ਬ��:" << endl;
	test();
	return 0;
}