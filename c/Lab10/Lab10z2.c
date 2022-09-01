/* определить сколько различных чисел в массиве */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main() {
	srand(time(NULL));
	int *a, i, j, x, s = 1;
	printf("Размер массива: ");
	scanf("%d", &x);
	a = (int*)malloc(x * sizeof(int));
	for (i = 0; i < x; i++) {
		a[i] = rand() % 20;
		printf("a[%d] = %d\n", i, a[i]);
	}

	for (i = 1; i<x; i++) {
		for (j = i - 1; j >= 0; j--)
			if (a[i] == a[j]) break;
		if (!(j+1)) s++;
	}
	printf("Различных чисел %d", s);
	free(a);
	getch();
	return 0;
}
