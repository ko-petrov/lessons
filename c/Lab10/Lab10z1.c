/* заменить положительные элементы массива a[6] нулями */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int *a, i, min, max;
	a = (int*)malloc(6 * sizeof(int));
	for (i = 0; i<6; i++) {
		a[i] = -100 + rand() % 200;
		printf("a[%d] - %d\n", i, a[i]);
	}
	printf("\n");
	for (i = 0; i<6; i++)
	{
		if (a[i] > 0)
			a[i] = 0;
		printf("a[%d] - %d\n", i, a[i]);
	}
	free(a);
	getch();
	return 0;
}