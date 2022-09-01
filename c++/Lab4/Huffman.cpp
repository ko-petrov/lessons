// ������ ����஢���� ���䬠��
// ����: ���஢ �.�. (12.12.2020)
// ��������� g++.exe (gcc-2.95.2)
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

// �㭪�� ��室�� ��� ��������� ������� ���ᨢ� � �����頥� �� �������
pair<int,int> min2(const double* p, int size) {
	pair<int,int> min(0,0);
	for (int i = 1; i != size; i++) { // �饬 ᠬ� ���� �����
		if (p[i] <= p[min.first]) min.first = i;
	}
	if (min.first == 0) min.second = 1;
	for (int i = 1; i != size; i++) { // �饬 ��ன  �� ������ �����
		if ((p[i] <= p[min.second]) && (i != min.first)) min.second = i;
	}
	if (p[min.second] == 999) min.second = min.first; // �᫨ ��ன �� ������ 999 �, ��⠫��
	return min;                                       // ⮫쪮 ���� ������� �����
}

// �㭪�� ��� ���᫥��� ���� ���䬠��
vector< pair<char,string> > Haffman(const vector< pair<char,double> > &v) {
	int sizev = v.size();
	vector< pair<char,string> > r(v.size()); // �����-१����
	for (int i = 0; i != sizev; i++) r[i].first = v[i].first;
	double p[v.size()]; // ���ᨢ ��� ����権 ��� ���⠬�
	for (int i = 0; i != sizev; i++) p[i] = v[i].second;
	pair<int,int> min(min2(p,sizev).first,min2(p,sizev).second);
	int mem[sizev]; // ��ᨢ ��� �裡 ����権 ��� ���⠬� � ��䠢��
	for (int i = 0; i != sizev; i++) mem[i] = i;
	while (min.first != min.second) { // �த������ ���� ����⮢ ����� 1
		for (int i = 0; i != sizev; i++) {
			if (mem[i] == min.first) r[i].second += '0'; // ��������㥬 ����
			if (mem[i] == min.second) r[i].second += '1'; //
		}
		p[min.second] = p[min.first] + p[min.second]; // �㬬� ���������� ����⮢ �
		p[min.first] = 999; // ��ࠥ� ���������� ����� 
		int mem0 = mem[min.first];  // ���࠭塞 ���ଠ�� � ��㯯�
		for (int i = 0; i != sizev; i++) { // �㪢 � ����襩 ���⮩ 
			if (mem0 == mem[i]) mem[i] = min.second;
		}
		min.first = min2(p,sizev).first; // ������塞 ������� ����
		min.second = min2(p,sizev).second;
	} // ��ॢ��稢��� ����
	for (int i = 0; i != sizev; i++) reverse(r[i].second.begin(),r[i].second.end());
	return r;
}

// �㭪�� �뢮�� �� �࠭
template< typename T >
void print(vector< pair<char,T> > &r) {
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
		if (n < 2) return 1;
		vector< pair<char,double> > v(n);
		vector< pair<char,string> > r;
		cout << "���� ��� �����⢫���� �१ �஡��" << endl;
		for (int i = 0; i != n; i++) {
			cout << "��� " << i+1 << ": ";
			cin >> a >> b;
			v[i].first = a;
			v[i].second = b;
		}
		r = Haffman(v);
		cout << "�������:" << endl;
		print(v);
		print(r);
		cout << "�த������ ����?(y/n) > ";
		cin >> k;
		} while (k == 'y');
	return 0;
}