/* В массиве хранится информация о результатах 22 спортсменов, участвовавших в соревнованиях по бегу на 100 м.
Определить результаты спортсменов, занявших первое и второе места. */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int *a, i, min, min2;
	a = (int*)malloc(22 * sizeof(int));
	for (i = 0; i<22; i++) {
		a[i] = 600 + rand() % 200;
		printf("id[%d] - %d(s)\n",i , a[i]);
	}
	printf("\n");
	min = 1000;
	min2 = 1000;
	for (i = 0; i<22; i++)
	{
		if (a[i] > min && a[i] < min2)
			min2 = a[i];
		if (a[i] < min) {
			min2 = min;
			min = a[i];
		}
	}
	free(a);
	printf("Первое место - %d(s)\nВторое место - %d(s)\n", min, min2);
	getch();
	return 0;
}