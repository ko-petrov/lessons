
/* ���� ��姭�筮� �᫮. */
/*� ��� ���ભ㫨 ����� ᫥�� ���� � �ਯ�ᠫ� �� � ����. */
/*������ �ணࠬ��, ����� ��室�� ����祭��� �᫮.   */
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
