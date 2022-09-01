// ������ ����஢���� �������-����
// ����: ���஢ �.�. (10.12.2020)
// ��������� g++.exe (gcc-2.95.2)

#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <cmath>

using namespace std;

// �㭪�� ��� ���஢�� ����� �� ��஬� ��㬥��� ����

bool comp(const pair<char,double> &a, const pair<char,double> &b) {
	return a.second > b.second;
}

// ���� l ��� ����筮� ����� ����⢥����� �᫠

string toBIN(double x, int l) {
	string BIN = "";
	for (int i = 0; i != l; i++) {
		x = x * 2;
		if (x < 1) BIN += '0'; 
		else {
			BIN += '1';
			x -= 1;
		}
	}
	return BIN;
} 

//  �㭪�� ��� ���᫥��� ���� �������-����

vector<pair<char,string> > ShFano(const vector< pair<char,double> > &v) {
	vector<pair<char,string> > a;
	vector<double> q;
	q.push_back(0); 
	for (int i = 1; i != v.size(); i++) {
		q.push_back(q[i-1] + v[i-1].second);
	}
	int l;
	for (int i = 0; i != v.size(); i++) {
		l = (int)ceil(-(log10(v[i].second)/log10(2)));
		string BIN = toBIN(q[i],l);
		pair<char,string> t(v[i].first,BIN);
		a.push_back(t);
	}
	return a;
}

// �㭪�� �뢮�� ���� �� �࠭

void print(const vector< pair<char,string> > &r) {
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
	vector<pair<char,string> > v1 = ShFano(v);
	print(v1);
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
	vector< pair<char,string> > c = ShFano(v);
	print(c);
	cout << "���⮢� �ਬ��:" << endl;
	test();
	return 0;
}

