// Алгоритм кодирования Хаффмана
// Автор: Петров К.А. (12.12.2020)
// Компилятор g++.exe (gcc-2.95.2)
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <iterator>
#include <map>
using namespace std;

// Частотный анализ

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

// Функция находит два наименьших елемента массива и возвращает их индексы
pair<int,int> min2(const double* p, int size) {
	pair<int,int> min(0,0);
	for (int i = 1; i != size; i++) { // Ищем самый малый элемент
		if (p[i] <= p[min.first]) min.first = i;
	}
	if (min.first == 0) min.second = 1;
	for (int i = 1; i != size; i++) { // Ищем второй  по малости элемент
		if ((p[i] <= p[min.second]) && (i != min.first)) min.second = i;
	}
	if (p[min.second] == 999) min.second = min.first; // Если второй по малости 999 то, остался
	return min;                                       // только один валидный элемент
}

// Функция для вычисления кода Хаффмана
vector< pair<char,string> > Haffman(const vector< pair<char,double> > &v) {
	int sizev = v.size();
	vector< pair<char,string> > r(v.size()); // Вектор-результат
	for (int i = 0; i != sizev; i++) r[i].first = v[i].first;
	double p[v.size()]; // Массив для операций над частотами
	for (int i = 0; i != sizev; i++) p[i] = v[i].second;
	pair<int,int> min(min2(p,sizev).first,min2(p,sizev).second);
	int mem[sizev]; // Масив для связи операций над частотами и алфавита
	for (int i = 0; i != sizev; i++) mem[i] = i;
	while (min.first != min.second) { // Продолжаем пока элементов больше 1
		for (int i = 0; i != sizev; i++) {
			if (mem[i] == min.first) r[i].second += '0'; // Конструируем коды
			if (mem[i] == min.second) r[i].second += '1'; //
		}
		p[min.second] = p[min.first] + p[min.second]; // Сумму минимальных элементов сюда
		p[min.first] = 999; // Стираем минимальную частоту 
		int mem0 = mem[min.first];  // Сохраняем информацию о группе
		for (int i = 0; i != sizev; i++) { // букв с меньшей частотой 
			if (mem0 == mem[i]) mem[i] = min.second;
		}
		min.first = min2(p,sizev).first; // Обновляем минимумы частот
		min.second = min2(p,sizev).second;
	} // Переворачиваем коды
	for (int i = 0; i != sizev; i++) reverse(r[i].second.begin(),r[i].second.end());
	return r;
}

// Функция вывода на экран
template< typename T >
void print(vector< pair<char,T> > &r) {
	cout << "[ ";
	for (int i = 0; i != r.size(); i++)
		cout << "('" << r[i].first << "'," << r[i].second << ") ";
	cout << "]" << endl;
}

// Основная функция
int main() {
	vector< pair<char,double> > v;
	vector< pair<char,string> > r;
	cout << "Введите строку:" << endl;
	string s;
	cin >> s;
	v = analiz(s);
	r = Haffman(v);
	cout << "Результат:" << endl;
	print(v);
	print(r);
	return 0;
}