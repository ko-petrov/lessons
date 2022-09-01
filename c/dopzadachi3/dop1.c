/* Задан массив целых чисел. Найти номера элементов, оканчивающихся цифрой 0. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main() {
	srand(time(NULL));
	int *a, i, x, f;
	printf("Размер массива: ");
	scanf("%d", &x);
	a = (int*)malloc(x * sizeof(int));
	for (i = 0; i<x; i++) {
		a[i] = rand() % 100;
		printf("a[%d] = %d\n", i, a[i]);
	}
	f = 0;
	printf("\nНа 0 заканчивается");
	for (i = 0; i<x; i++) {
		if (a[i] % 10 == 0) {
			printf(" a[%d]", i);
			f = 1;
		}
	}
	if (f==0)
		printf(" ничего.");
	else
		printf(".");
	free(a);
	getch();
	return 0;
}