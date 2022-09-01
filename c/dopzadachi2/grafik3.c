/* Программа определяет принадлежит ли точка с координатами (x,y) заштрихованной области (в) */
#include<stdio.h>
#include<conio.h>
int main() 
{
	float x,y;
	printf("Enter x: ");
	scanf("%f", &x);
	printf("Enter y: ");
	scanf("%f", &y);
	if ((y*y+x*x<36) && (x>2))
		printf("The point in the area\n");
	else
		printf("The point outside the area\n");
	getch();
	return 0;
}
