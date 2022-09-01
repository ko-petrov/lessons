/* определить количество элементов 0<a[i]<i в массиве a[10] */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int *a, i, sum = 0;
	a = (int*)malloc(10 * sizeof(int));
	for (i = 0; i<10; i++) {
		a[i] = -5 + rand() % 20;
		printf("a[%d]= %d\n", i, a[i]);
	}
	printf("\n");
	for (i = 0; i<10; i++)
		if (a[i] > 0 && a[i] < i)
			sum++;
	printf("Количество: %d\n", sum);
	free(a);
	getch();
	return 0;
}