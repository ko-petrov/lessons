
/* программа получает шесть чисел образованных при перестановке цифр числа */
#include<stdio.h>
#include<conio.h>
int main() 
{
	int x, a, b, c;
	printf("Enter number: ");
	scanf("%d", &x);
	a=x%10;
	x/=10;
	b=x%10;
	x/=10;
	c=x;
	
	x=(a*10+c)*10+b;
	printf("1 number is %d\n",x);
	
	x=(a*10+b)*10+c;
	printf("2 number is %d\n",x);
	
	x=(b*10+a)*10+c;
	printf("3 number is %d\n",x);
	
	x=(b*10+c)*10+a;
	printf("4 number is %d\n",x);
	
	x=(c*10+a)*10+b;
	printf("5 number is %d\n",x);
	
	x=(c*10+b)*10+a;
	printf("6 number is %d",x);
	getch();
	return 0;
}

