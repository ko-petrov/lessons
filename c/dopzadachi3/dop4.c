/* � ���ᨢ� �࠭���� ���ଠ�� � ��� 25 祫����.
��।�����, �� ᪮�쪮 ��� ᠬ��� ��᮪��� 祫����� �ॢ�蠥� ��� ᠬ��� �������. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int *a, i, min, max;
	a = (int*)malloc(25 * sizeof(int));
	for (i = 0; i<25; i++) {
		a[i] = 120 + rand() % 100;
		printf("id[%d] - %d(sm)\n",i , a[i]);
	}
	printf("\n");
	min = a[0];
	max = a[0];
	for (i = 0; i<25; i++)
	{
		if (a[i] > max)
			max = a[i];
		if (a[i] < min)
			min = a[i];
	}
	free(a);
	printf("��������� ��� - %d(�) ���ᨬ���� - %d(�)\n", min, max);
	printf("����� ���� ࠧ��� %d(�)\n", max - min);
	getch();
	return 0;
}