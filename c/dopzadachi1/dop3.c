
/* Дано трехзначное число. */
/*В нем зачеркнули первую слева цифру и приписали ее в конце. */
/*Напишите программу, которая находит полученное число.   */
#include<stdio.h>
#include<conio.h>
int main()
{
	int x;
	printf("Enter number: ");
	scanf("%d", &x);
	x = x%100 * 10 + (x/100);
	printf("Result is %d",x);
	getch();
	return 0;
}
