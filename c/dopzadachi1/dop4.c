
/* �� �᫠ �ணࠬ�� ��室�� �᫮, ���⠭��� �ࠢ� ������, �� ����⠭���� */
/* ��ࢮ� � ��ன  ���쥩 � �⢥�⮩ ���. �� ����⠭���� ��ன � ���쥩 ��� */
#include<stdio.h>
#include<conio.h>
int main() 
{
	int a,b,c,d,x;
	printf("Enter number: ");
	scanf("%d", &x);
	a=x%10;
	x/=10;
	b=x%10;
	x/=10;
	c=x%10;
	x/=10;
	d=x%10;

	x=(((a*10+b)*10+c)*10+d);
	printf("(a) - %d\n",x);
	x=(((c*10+d)*10+a)*10+b);
	printf("(b) - %d\n",x);
	x=(((d*10+b)*10+c)*10+a);
	printf("(v) - %d\n",x);
	getch();
	return 0;
}
