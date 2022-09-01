/* Программа определяет принадлежит ли точка с координатами (x,y) заштрихованной области (б) */
#include<stdio.h>
#include<conio.h>
int main() 
{
	float x,y;
	printf("Enter x: ");
	scanf("%f", &x);
	printf("Enter y: ");
	scanf("%f", &y);
	if ((y*y+x*x<36) && (y>-x+3) && (x>0) && (y>0))
		printf("The point in the area\n");
	else
		printf("The point outside the area\n");
	getch();
	return 0;
}
