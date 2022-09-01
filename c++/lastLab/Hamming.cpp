#include <iostream>
#include <string>
#include <vector>
using namespace std;

vector<int> toHamming(string a) {
	// ����塞 ����� ���� ������
	int l = a.size();
	int l2 = 1 << l;
	int ldrob = l2 / (l + 1);
	while ((1 << a.size()) > ldrob) {
		l++;
		l2 *= 2;
		ldrob = l2 / (l + 1);
	}
	cout << "m = " << a.size() << " l = " << l << " k = " << l - a.size() << endl;
	vector<int> b(l);
	// ����㦥��� ���ଠ樮���� ����⮢ � ���
	for (int i = 2, j = 0; i < l; i++)
		if ((i + 1) & i) { // �᫨ ������ �� �⥯��� ������
			if (a[j] == '1') b[i] = 1;
			else b[i] = 0;
			j++;
		}
	// ����㦥��� ����஫��� ����⮢
	unsigned int mask = 1; // ��᪠ ��� �ࠢ����� ������� �ᥫ
	for (int i = 1; i < l; i += i) {
		int sum = 0;
		for (int j = i; j < l; j++)
			if (((j + 1) & mask) && b[j]) sum++;
		mask = mask << 1;
		b[i - 1] = sum % 2;
	}
	return b;
}

int fix(const vector<int> &a) {
	// ����塞 ������⢮ ����஫��� ����⮢
	int l = a.size();
	int m = l;
	int m2 = 1 << m;
	int l2 = 1 << l;
	int ldrob = l2 / (l + 1);
	while (m2 > ldrob) {
		m--;
		m2 /= 2;
	}
	int  k = l - m;
	// ��室�� s
	vector<int> sbin(k);
	unsigned int mask = 1;
	for (int i = 0; i < k; i++) {
		int sum = 0;
		for (int j = i; j < l; j++)
			if (((j + 1) & mask) && a[j]) sum++;
		mask = mask << 1;
		sbin[i] = sum % 2;
	}
	int s = 0;
	for (int i = 0; i < k; i++)
		if (sbin[i]) s += 1 << i;
	return s;
}

void print(vector<int> b) {
	for (int i = 0; i != b.size(); i++)
		cout << b[i];
}

int main() {
	cout << "Enter message: ";
	string a = "";
	getline(cin,a);
	vector<int> b = toHamming(a);
	print(b); cout << endl;
	cout << "Enter s: ";
	int s;
	cin >> s;
	b[s - 1] = !b[s - 1];
	print(b); cout << " => ";
	int sfix = fix(b);
	if (sfix) b[sfix - 1] = !b[sfix - 1];
	print(b); cout << endl;
	return 0;
}