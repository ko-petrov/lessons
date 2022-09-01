/* реализовать сжатие массива выбрасывая каждый
второй его эелемент */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main() {
	srand(time(NULL));
	int *a, i, x;
	printf("Размер массива: ");
	scanf("%d", &x);
	a = (int*)malloc(x * sizeof(int));
	for (i = 0; i < x; i++) {
		a[i] = rand() % 20;
		printf("a[%d] = %d\n", i, a[i]);
	}
	for (i = 1; i + i < x; i++)
		a[i] = a[i + i];
	x = (x + 1) / 2;
	(int*)realloc(a, x * sizeof(int));
	printf("\n");
	for (i = 0; i < x; i++)
		printf("a[%d] = %d\n", i, a[i]);
	free(a);
	getch();
	return 0;
}