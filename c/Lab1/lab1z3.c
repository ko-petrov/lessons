
/* вычеслить результат значения функции по введенным значениям */
#include<stdio.h>
#include<conio.h>
int main()
{
	float f, x, y;
	printf("Enter x\n");
	scanf("%f", &x);
	printf("Enter y\n");
	scanf("%f", &y);
	f = (x + y) * (x - y);
	printf("Result is %.3f\n", f);
	getch();
	return 0;
}
