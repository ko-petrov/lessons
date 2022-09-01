
/* программа определяет принадлежит ли точка введенная с клавиатуры шару с заданными значениями*/
#include<stdio.h>
#include<conio.h>
int main()
{
	float x = 1.5, y = 200, z = -4.12, r = 72.8, xn, yn, zn;
	printf("Enter the coordinates of the point(x,y,z):\n");
	scanf("%f", &xn);
	scanf("%f", &yn);
	scanf("%f", &zn);
	if ((xn - x) * (xn - x) + (yn - y) * (yn - y) + (zn - z) * (zn - z) < r*r)
		printf("The point belongs to the ball");
	else
		printf("The point does not belong to the ball");
	getch();
	return 0;
}
