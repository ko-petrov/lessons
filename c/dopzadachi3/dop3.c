/* ��� ���ᨢ 楫�� �ᥫ. ��।����� ������⢮ ���� ����⮢ � ������⢮ ����⮢, 
����稢������ �� ���� 5. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int *a, i, x, ch = 0, na5 = 0;
	printf("������ ���ᨢ�: ");
	scanf("%d", &x);
	a = (int*)malloc(x * sizeof(int));
	for (i = 0; i<x; i++) {
		a[i] = rand() % 100;
		printf("a[%d] = %d\n",i , a[i]);
	}
	printf("\n");
	for (i = 0; i<x; i++)
	{
		if (a[i] % 10 == 5)
			na5++;
		if (a[i] % 2 == 0)
			ch++;
	}
	free(a);
	printf("����� ����⮢: %d\n", ch);
	printf("�����稢����� �� 5: %d\n", na5);
	getch();
	return 0;
}