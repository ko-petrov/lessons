/* Определить что будет напечатано в результате работы программы */
#include <stdio.h>
#include<conio.h>

int main() {
	int *p=NULL,
	    **q=&p,
	    ***r=&q;
	p = (int *)&r;
	printf("&r = %p &r = %p &q = %p &q = %p &p = %p &p = %p &q = %p\n",
		p, *q, r, *p, q, *r, ***r);

	getch();
	return 0;
}
