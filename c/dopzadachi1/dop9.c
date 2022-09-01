
#include<stdio.h>
#include<conio.h>
int main()
{
	int x, a;
	printf("Enter x: ");
	scanf("%d", &x);
	a = x % 10;
	x /= 10;
	while ((x > 9) && (x % 10 > a))
	{
		a = x % 10;
		x /= 10;
	}
	if (x % 10 > a)
		printf("Otvet polozhitelniy");
	else
		printf("Otvet otricatelniy");
	getch();
	return 0;
}
