/* �ணࠬ�� ��।���� �ਭ������� �� �窠 � ���न��⠬� (x,y) �����客����� ������ (�) */
#include<stdio.h>
#include<conio.h>
int main() 
{
	float x,y;
	printf("Enter x: ");
	scanf("%f", &x);
	printf("Enter y: ");
	scanf("%f", &y);
	if ((y<-x+6) && (y>-2*x) && (x>0) && (y>0))
		printf("The point in the area\n");
	else
		printf("The point outside the area\n");
	getch();
	return 0;
}
