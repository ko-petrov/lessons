#include<stdio.h>
#include<conio.h>
int main()
{
	int x, max, min;
	printf("Enter x: ");
	scanf("%d", &x);
	min = max = x % 10;
	x /= 10;
	while (x>0)
	{
		if (max < x % 10)
			max = x % 10;
		if (min > x % 10)
			min = x % 10;
		x /= 10;
	}
	printf("max = %d min = %d\n", max, min);
	printf("max - min = %d\n", max - min);
	printf("max + min = %d\n", max + min);
	getch();
	return 0;
}
