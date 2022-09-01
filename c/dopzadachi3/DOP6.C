/* Задан массив вещественных чисел. 
Определить, есть ли в нем отрицательные числа и в случае положительного ответа определить 
номер первого из них и напечатать все следующие за ним элементы. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	float *a;
	int i, x, f = 0;
	printf("Размер массива: ");
	scanf("%d", &x);
	a = (float*)malloc(x * sizeof(float));
	for (i = 0; i<x; i++) {
		a[i] = rand()*(100-(-100))/(float)RAND_MAX;
		printf("a[%d] = %.2f\n", i, a[i]);
	}
	printf("\n");
	for (i = 0; i < x; i++) {
		if (a[i] < 0)
			f = 1;
		if (f == 1)
			printf("a[%d] = %.2f\n", i, a[i]);
	}
	if (f == 0)
		printf("Отрицацельных чисел нет");
	free(a);
	getch();
	return 0;
}
