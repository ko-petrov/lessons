
#include<stdio.h>
#include<conio.h>
int main()
{
	int x, a, b, c;
	printf("Enter x: ");
	scanf("%d", &x);
 	printf("Enter a: ");
	scanf("%d", &a);
	printf("Enter b: ");
	scanf("%d", &b);
	c = x % 10;
	while ((c != a) && (c != b) && (x > 0))
	{
		x /= 10;
		c = x % 10;
	}
	if (c == a)
		printf("Pravee a");
	else if (c == b)
		printf("Pravee b");
	else
		printf("Takih cifr net");
	getch();
	return 0;
}
