
/* найти последнюю цифру натурального числа А */
#include<stdio.h>
#include<conio.h>
int main()
{
	int a;
	printf("Enter number: ");
	scanf("%d", &a);
	a %= 10;
	printf("Result is %d", a);
	getch();
	return 0;
}
