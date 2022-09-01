// ������ �.�. ����� ���祭�� ���஭�
// � ��ண���� ��⨢�樮���� �㭪樥�
// ����: ���஢ �.�. (08.12.2021, 15.12.2021)
// ��������� g++.exe (mingw, std=c++11)
#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>

using namespace std;

// ����� �����
template <typename T>
void printv(const vector<T> &v)
{
	cout << "[ ";
	for (auto i : v)
	{
		cout << i << " ";
	}
	cout << "] ";
}

// ���᥯�஭ �ਭ����� �� �室 ����� ��������� �室��� ᨣ�����
// � ����� ��ᮢ�� �����樥�⮢, ��ࠦ����� ����⢥��� �᫮�.
// �����頥� ����襭��� �㬬�, �ய�饭��� �१ ��ண����
// �㭪�� ��⨢�樨.
bool neuron(const vector<bool> &u, const vector<double> &w)
{
	double x = 0;
	for (int i = 0; i < u.size(); i++)
	{
		x += u[i] * w[i]; 
	}
	return (x >= 0); // ��ண���� �㭪��
}

// �㭪��, �믮������ ������, �ਭ����� ������ �室��� ᨣ�����
// � ��� � �������묨 १���⠬�,
vector<double> hebb(const vector<pair<bool,vector<bool> > > &u, int n)
{
	vector<double> w; // ����� ��ᮢ�� �����樥�⮢
	for (int i = 0; i < u.front().second.size() ; ++i) // ��������� ࠧ��� ����� �室��� ᨣ�����
	{
		w.push_back((rand() % 3) - 1); // ���������� ��ᮢ ���묨 ��砩��� ���祭�ﬨ
	}
	cout << "����� ���४�஢�� ��ᮢ:" << endl;
	cout << "(0) ";
	printv(w);
	cout << endl;
	vector<int> ind; // ����� ��� ��砩���� ��६�饭�� �� �����⠬ �����饩 �롮ન
	for (int i = 0; i < u.size(); ++i)
	{
		ind.push_back(i);
	}
	bool y; // १���� ᫮�����
	for (int i = 0; i < n; ++i) // ���樨 ���祭��
	{
		random_shuffle(ind.begin(), ind.end()); // ��६�訢��� ������� �����饩 �롮ન
		bool flag = 1; // �஢���� �����﫨 �� �� ���
		for (auto j : ind) // ��६�饭�� �� �롮ઠ�
		{
			y = neuron(u.at(j).second,w);
			if (y != u.at(j).first)
			{
				flag = 0;
				if (y)
				{
					for (int k = 0; k < w.size(); ++k) // ���४�஢�� ��ᮢ � ������� ��஭�
					{
						w.at(k) -= u.at(j).second.at(k);
					}
				}
				else
				{
					for (int k = 0; k < w.size(); ++k) // ���४�஢�� ��ᮢ � ������� ��஭�
					{
						w.at(k) += u.at(j).second.at(k);
					}
				}
			}
		}
		cout << "(" << i + 1 << ") ";
		printv(w);
		cout << endl;
		if (flag) break; // ��室 �� 横��, �᫨ ������� �롮ઠ �� ����������
	}
	return w;
}

int main()
{
	vector<pair<bool, vector<bool> > > u = { { 1, { 1, 0, 1, 1, 1, 1 } },
	                                         { 0, { 1, 1, 1, 1, 0, 1 } },
	                                         { 1, { 1, 0, 0, 0, 1, 1 } },
	                                         { 0, { 1, 0, 1, 0, 1, 1 } } };

	srand(time(NULL));
	int n;
	cout << "������ ���ᨬ��쭮� ������⢮ ���権 ���祭��: ";
	cin >> n;
	vector<double> w = hebb(u,n);
	cout << "����祭� ���祭�� ��ᮢ:" << endl;
	printv(w);
	cout << endl << "�஢�ઠ:" << endl;
	bool test;
	bool flag = 0;
	for (auto &i : u)
	{
		
		test = neuron(i.second,w);
		printv(i.second);
		cout << "���������: " << i.first << " ������� �뤠��: " << test;
		if (i.first != test)
		{
			flag = 1;
			cout << " (�訡��)" << endl;
		}
		else
		{
			cout << endl;
		}
	}
	if (flag)
	{
		cout << "������� ࠡ�⠥� �����४⭮. ���஡�� 㢥����� ������⢮ ���権." << endl;
	}
	else
	{
		cout << "������� �ᯥ譮 ���祭�!" << endl;
	}

	return 0;
}