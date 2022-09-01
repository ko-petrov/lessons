#include<stdio.h>
#include<conio.h>
int main() 
{
	int b = 1, c = 0, n, a;
	for (n = 1, a = 0; n <= 10; n++, a = c + b)
	{
		c = b; b = a;
	}
	printf("%d", b);
	getch();
	return 0;
}
