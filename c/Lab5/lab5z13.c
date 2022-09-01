/* Написать программный фрагмент, представленный графически в 13 задании */
#include <stdio.h>
#include<conio.h>

int main() {
	int *s, **p, ***q, ****r;
	p = &s;
	q = &p;
	r = &q;
	s = (int *)&r;
	getch();
	return 0;
}
