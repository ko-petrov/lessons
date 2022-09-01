
/* вычислить значение функции */
#include<stdio.h>
#include<conio.h>
int main()
{
	printf("Enter x: ");
	float x, y;
	scanf("%f", &x);
	if (x <= 0)
	{
		float a = x - 1;
		y = 5 * a - a * a * x;
	}
	else
	{
		float b = x + 1;
		float k = b + 2 * x;
		y = 7 * k*b*x - 20 - k / x;
	}
	printf("y = %.3f", y);
	getch();
	return 0;
}
