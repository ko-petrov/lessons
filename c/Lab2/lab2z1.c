/* даны три числа найти наибольшее */
#include<stdio.h>
#include<conio.h>
int main()
{
	int a, b, c, max;
	printf("Enter 3 numbers:\n");
	scanf("%d", &a);
	scanf("%d", &b);
	scanf("%d", &c);
	max = a;
	if (max < b)
		max = b;
	if (max < c)
		max = c;
	printf("a=%d, b=%d, c=%d, max=%d\n",a,b,c,max);
	getch();
	return 0;
}
