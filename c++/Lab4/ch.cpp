#include <iostream> 
#include <map>
#include <string>
#include <vector>
#include <iterator>
using namespace std;

vector<pair<char,double> > analiz(string a) {
	vector< pair<char,double> > result;
	map<char, double> ch;
	for (int i = 0; i != a.size(); ++i) {
		ch[a[i]] += 1;
	}
	for (map<char, double>::iterator it = ch.begin(); it != ch.end(); ++it) {
		pair<char, double> p;
		p.first = it->first;
		p.second = it->second;
		result.push_back(p);
	}
	return result;
}

template< typename T >
void print(vector< pair<char,T> > &r) {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

int main() {
	string a;
	cin >> a;
	vector<pair<char,double> > res = analiz(a);
	print(res);
	return 0;
}