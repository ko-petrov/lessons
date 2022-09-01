
/* вычислить значение функции при любых x y */
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main() 
{
	float z, q, x, y;
	printf("Enter x: ");
	scanf("%f",&x);
	printf("Enter y: ");
	scanf("%f",&y);
	z = (x + (2 + y)/(x*x))/(y + 1/sqrt(x*x+10));
	q = 2.8*sin(x)+fabs(y);
	printf("z = %.3f q = %.3f", z, q);
	getch();
	return 0;
}
