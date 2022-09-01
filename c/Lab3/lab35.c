#include<stdio.h>
#include<conio.h>
main() 
{
	int i, x1, x3, x8, x1995;
	for(i=1; i<=99; i++)
	{
		x8=i*i;
		x1=i/10;
		x3=i-x1*10;
		x1995=x1+x3;
		x1995=x1995*x1995*x1995;
		if (x1995==x8)
			printf( "\n%d", i);
	}
	getch();
	return 0;
}
