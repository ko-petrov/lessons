// Алгоритм словарного сжатия lz78
// Автор: Петров К.А. (27.12.2020)
// Компилятор: gcc-2.95.2 (g++.exe)

#include <iostream>
#include <vector>
#include <string>
using namespace std;

void print(const vector<pair<int,char> > &encodes,
			const vector<string> &entries) {
	cout << " Encodes     Index    Entry" << endl;
	for (int i = 1; i < entries.size(); i++) {
		cout.width(2);
		cout << "<" << encodes[i - 1].first << ",'" << encodes[i - 1].second << "'>";
		cout.width(10);
		cout << i;
		cout.width(3);
		cout << "     " << entries[i] << endl;
	}
}

vector<pair<int,char> > encode(string a) {
	vector<string> entries;
	vector<pair<int,char> > encodes;
	int size = a.size();
	int i = 0, index = 0;
	string entry = "";
	entries.push_back(entry);
	while (i < size) {
		entry += a[i];
		int j = 1;
		for ( ; j < entries.size(); j++)
			if (entry == entries[j]) break;
		if (j != entries.size()) index = j;
		if (j == entries.size()) {
			encodes.push_back(make_pair(index,a[i]));
			entries.push_back(entry);
			entry = "";
			index = 0;
		}
		i++;
	}
	if (entry != "") {
		encodes.push_back(make_pair(index,' '));
		entries.push_back(entry);
	}
	print(encodes,entries);
	return encodes;
}

string decode(const vector<pair<int,char> > &encodes) {
	vector<string> entries;
	string entry;
	int size = encodes.size();
	for (int i = 0; i < size; i++) {
		if (encodes[i].first) {
			entry = entries[encodes[i].first - 1] + encodes[i].second;
			entries.push_back(entry);
		}
		else {
			entry = encodes[i].second;
			entries.push_back(entry);
		}
	}
	string decodestring = "";
	for (int i = 0; i < size; i++) {
		decodestring += entries[i];
	}
	if (decodestring[decodestring.size() - 1] == ' ')
		decodestring.resize(decodestring.size() - 1);
	return decodestring;
}

int main() {
	char x = 'y';
	do {
		cout << "Enter message: ";
		string a;
		getline(cin,a);
		vector<pair<int,char> > b = encode(a);
		string decodestring = decode(b);
		cout << decodestring << endl;
		if (a != decodestring) {
			cout << "ERROR" << endl;
			return 1;
		}
		cout << "New message? (y/n) > ";
		cin >> x;
		cin.ignore();
	} while (x == 'y');
	return 0;
}