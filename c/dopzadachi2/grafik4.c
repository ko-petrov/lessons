/* Программа определяет принадлежит ли точка с координатами (x,y) заштрихованной области (г) */
#include<stdio.h>
#include<conio.h>
int main()
{
	float x,y;
	printf("Enter x: ");
	scanf("%f", &x);
	printf("Enter y: ");
	scanf("%f", &y);
	if (((y*y+x*x<25) && (x>0) && (y>0)) || ((y<x+5) && (y>-x-5) && (x<0)))
		printf("The point in the area\n");
	else
		printf("The point outside the area\n");
	_getch();
	return 0;
}