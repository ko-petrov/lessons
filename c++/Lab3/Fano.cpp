// €«£®à¨â¬ ª®¤¨à®¢ ­¨ï ” ­®
// €¢â®à: ¥âà®¢ Š.€. (10.12.2020)
// Š®¬¯¨«ïâ®à g++.exe (gcc-2.95.2)

#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

// ”ã­ªæ¨ï ¤«ï á®àâ¨à®¢ª¨ ¢¥ªâ®à  ¯® ¢â®à®¬ã  à£ã¬¥­âã ¯ àë

bool comp(const pair<char,double> &a, const pair<char,double> &b) {
	return a.second > b.second;
}

// ”ã­ªæ¨ï ¤«ï ­ å®¦¤¥­¨ï áã¬¬ë ¢â®àëå  à£ã¬¥­â®¢ ¯ àë ¢ ¢¥ªâ®à¥

double summa(const vector< pair<char,double> > &v, int s1, int s2) {
	double sum = 0;
	for (int i = s1; i != s2; i++) sum += v[i].second;
	return sum;
}

// ¥ªãàá¨¢­ ï äã­ªæ¨ï ¤«ï ¢ëç¨á«¥­¨ï ª®¤  ” ­®

void Fano(const vector< pair<char,double> > &v, int s1, int s2, string BIN,
				vector< pair<char,string> > &r) {
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
		Fano(v, s1, j, BIN + '0', r);
		Fano(v, j, s2, BIN + '1', r);
	}
}

// ”ã­ªæ¨ï ¢ë¢®¤  ­  íªà ­ ª®¤ 

void print(vector< pair<char,string> > &r) {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

// ”ã­ªæ¨ï ¢ë¢®¤  ­  íªà ­ á¯¨áª  ç áâ®â

void print0(vector< pair<char,double> > &r) {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

// Žá­®¢­ ï äã­ªæ¨ï

int main() {
	int n; char a, k; double b, s;
	do {
		cout << "‚¢¥¤¨â¥ ª®«-¢® ¡ãª¢: ";
		cin >> n;
		if (n < 1) return 1;
		vector< pair<char,double> > v(n);
		vector< pair<char,string> > r;
		cout << "‚¢®¤ ¯ à ®áãé¥áâ¢«ï¥âáï ç¥à¥§ ¯à®¡¥«" << endl;
		for (int i = 0; i != n; i++) {
			cout << " à  " << i+1 << ": ";
			cin >> a >> b;
			v[i].first = a;
			v[i].second = b;
		}
		sort(v.begin(),v.end(),comp);
		string BIN = "";
		Fano(v, 0, n, BIN, r);
		cout << "¥§ã«ìâ â:" << endl;
		print0(v);
		print(r);
		cout << "à®¤®«¦¨âì ¢¢®¤?(y/n) > ";
		cin >> k;
		} while (k == 'y');
	return 0;
}