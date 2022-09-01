// ������ ����஢���� �������-��������
// ����: ���஢ �.�. (10.12.2020)
// ��������� g++.exe (gcc-2.95.2)

#include <iostream>
#include <vector>
#include <string>
#include <cmath>
using namespace std;

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

//  �㭪�� ��� ���᫥��� ���� �������-���

vector<pair<char,string> > GilbMoor(const vector< pair<char,double> > &v) {
	vector<pair<char,string> > a;
	vector<double> q;
	vector<double> b;
	q.push_back(0); b.push_back(v[0].second/2);
	for (int i = 1; i != v.size(); i++) {
		q.push_back(q[i-1] + v[i-1].second);
		b.push_back(q[i] + (v[i].second/2));
	}
	int l;
	for (int i = 0; i != v.size(); i++) {
		l = 1 + (int)ceil(-(log10(v[i].second)/log10(2)));
		string BIN = toBIN(b[i],l);
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

// �㭪�� �뢮�� �� �࠭ ᯨ᪠ ����

void print0(const vector< pair<char,double> > &r) {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

// �᭮���� �㭪��

int main() {
	int n; char a, k; double b, s;
	do {
		cout << "������ ���-�� �㪢: ";
		cin >> n;
		if (n < 1) return 1;
		vector< pair<char,double> > v(n);
		vector< pair<char,string> > r;
		cout << "���� ��� �����⢫���� �१ �஡��" << endl;
		for (int i = 0; i != n; i++) {
			cout << "��� " << i+1 << ": ";
			cin >> a >> b;
			v[i].first = a;
			v[i].second = b;
		}
		r = GilbMoor(v);
		cout << "�������:" << endl;
		print0(v);
		print(r);
		cout << "�த������ ����?(y/n) > ";
		cin >> k;
		} while (k == 'y');
	return 0;
}