/* ����� ���ᨢ ����⢥���� �ᥫ.
(�) ����� �����, ����訩 10, �������� ��� ������� ��୥�.
(�) �� ������ ���ᨢ� � ��묨 ����ࠬ� �������� �� ��᮫�⭮� ����稭��. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
#include <math.h>
int main()
{
	srand(time(NULL));
	float *a;
	int i, x;
	printf("������ ���ᨢ�: ");
	scanf("%d", &x);
	a = (float*)malloc(x * sizeof(float));
	for (i = 0; i<x; i++) {
		a[i] = ((float)(-5000 + rand() % 10000))/100;
		printf("a[%d] = %.2f\n", i, a[i]);
	}
	printf("\n");
	for (i = 0; i < x; i++) {
		if (a[i] > 10)
			a[i] = sqrtf(a[i]);
		if (i % 2 == 0)
			a[i] = fabs(a[i]);
		printf("a[%d] = %.2f\n", i, a[i]);
	}
	free(a);
	getch();
	return 0;
}