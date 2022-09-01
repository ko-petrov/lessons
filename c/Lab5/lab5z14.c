/* Определить что будет напечатано в результате работы программы */
#include <stdio.h>
#include<conio.h>

int main() {
	int a=4, *p=&a;
	char b='d',*q=&b;
	q=p;
	printf("%d %d %c\n",*p,*q,b);
	getch();
	return 0;
}
