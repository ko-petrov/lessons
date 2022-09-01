// ������ ���⭮�� �����࠭����
// ����: ���஢ �.�. (08.12.2021, 15.12.2021)
// ��������� g++.exe (mingw, std=c++11)
#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <cmath>

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

double neuron(const vector<double> &u, const vector<double> &w)
{
	double x = 0;
	for (int i = 0; i < u.size(); i++)
	{
		x += u[i] * w[i]; 
	}
	x += w[u.size()];
	return x;
}

double sigmoid(double x)
{
	return 1.0 / (1.0 + exp(-x) );
}

vector<double> prohod(const vector<pair<vector<double>,vector<double> > > &u, const vector<vector<vector<double> > > &w)
{
	vector<vector<double> >  gamma(w.size()); // १���� ᫮�����
	vector<vector<double> > y(w.size()); // १���� ᫮�����
	// ��אַ� ��室
			for (int i = 0; i < w.size(); ++i)
			{
				for (int j = 0; j < w[i].size(); ++j)
				{
					if (i == 0) gamma[i].push_back(neuron(u[0].second, w[i][j]) );
					else gamma[i].push_back(neuron(y[i-1], w[i][j]) );
					y[i].push_back(sigmoid(gamma[i][j]) ); 
				}
			}
			cout << "\n����� ��室��� ᨣ�����: ";
			printv(y[w.size()-1]);
			cout << endl;
}

void backProp(const vector<pair<vector<double>,vector<double> > > &u, vector<vector<vector<double> > > &w, int n, double alpha)
{
	vector<int> ind; // ����� ��� ��砩���� ��६�饭�� �� ����⠬ �����饩 �롮ન
	for (int i = 0; i < u.size(); ++i)
	{
		ind.push_back(i);
	}
	
	for (int i = 0; i < n; ++i) // ���樨 ���祭��
	{
		random_shuffle(ind.begin(), ind.end()); // ��६�訢��� ������� �����饩 �롮ન
		for (auto ii : ind) // ��६�饭�� �� �롮ઠ�
		{
			vector<vector<double> >  gamma(w.size()); // १���� ᫮�����
			vector<vector<double> > y(w.size()); // १���� ᫮�����
			// ��אַ� ��室
			for (int i = 0; i < w.size(); ++i)
			{
				for (int j = 0; j < w[i].size(); ++j)
				{
					if (i == 0) gamma[i].push_back(neuron(u[ii].second, w[i][j]) );
					else gamma[i].push_back(neuron(y[i-1], w[i][j]) );
					y[i].push_back(sigmoid(gamma[i][j]) ); 
				}
			}
			vector<vector<double> > delta(w.size());
			// ����� ��室
			for (int n = w.size() - 1; n >= 0; --n)
			{
				for (int j = 0; j < w[n].size(); ++j)
				{
					double sum = 0;
					if (n == w.size() - 1)
					{
						sum = u[ii].first[j] - y[n][j];
					}
					else
					{
						for (int k = 0; k < w[n+1].size(); ++k)
						{
							sum += delta[n+1][k] * w[n+1][k][j];
						}
					}
					double sigmoid0 = sigmoid(gamma[n][j]);
					delta[n].push_back(sum * (sigmoid0 * (1.0 - sigmoid0)) );
					
				}
			}
			// ���४�஢�� ��ᮢ
			for (int n = 0; n < w.size(); ++n)
			{
				for (int j = 0; j < w[n].size(); ++j)
				{
					for (int i = 0; i < w[n][j].size() - 1; ++i)
					{
						if (n == 0)
							w[n][j][i] += alpha * delta[n][j] * u[ii].second[i];
						else
							w[n][j][i] += alpha * delta[n][j] * y[n-1][i];
					}
				}
			}
			// ���४�஢�� ᬥ饭��
			for (int n = 0; n < w.size(); ++n)
			{
				for (int j = 0; j < w[n].size(); ++j)
				{
					int size = w[n][j].size();
					w[n][j][size - 1] += alpha * delta[n][j];
				}
			}
		}
	}
}

int main()
{
	srand(time(NULL));
	// ���: ��. ���祭�� + ����� �室��� ᨣ�����
	vector<pair<vector<double>, vector<double> > > u = { { {1.0}, {0.0, 1.0} } };
	// ��ᮢ� �����. � ᬥ饭�� ��᫥���� ����⮬
	vector<vector<vector<double> > > w = 
	                 { { {1.0, 0.5, 1.0},       // ᫮� 0, ���஭ 0
	                     {-1.0, 2.0, 1.0} },    // ᫮� 0, ���஭ 1
	                   { {1.5, -1.0, 1.0} } };  // ᫮� 1, ���஭ 0

	int n;
	cout << "������ ���ᨬ��쭮� ������⢮ ���権 ���祭��: ";
	cin >> n;
	cout << "������ �����樥�� ���祭��: ";
	double alpha;
	cin >> alpha;
	printv(w[0][0]);
	printv(w[0][1]);
	printv(w[1][0]);
	prohod(u,w);
	backProp(u, w, n, alpha);
	cout << "\n����祭� ���祭�� ��ᮢ:" << endl;
	printv(w[0][0]);
	printv(w[0][1]);
	printv(w[1][0]);
	prohod(u,w);
	// cout << endl << "�஢�ઠ:" << endl;
	// double test;
	// bool flag = 0;
	// for (auto &i : u)
	// {
		
	// 	test = neuron(i.second,w);
	// 	printv(i.second);
	// 	cout << "���������: " << i.first << " ������� �뤠��: " << test;
	// 	if (i.first != test)
	// 	{
	// 		flag = 1;
	// 		cout << " (�訡��)" << endl;
	// 	}
	// 	else
	// 	{
	// 		cout << endl;
	// 	}
	// }
	// if (flag)
	// {
	// 	cout << "������� ࠡ�⠥� �����४⭮. ���஡�� 㢥����� ������⢮ ���権." << endl;
	// }
	// else
	// {
	// 	cout << "������� �ᯥ譮 ���祭�!" << endl;
	// }
	return 0;
}