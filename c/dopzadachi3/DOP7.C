/* Заполнить массив размером 6х6 так, как показано на рисунке */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int **a;
	int i, j, m = 6;
	a = (int**)malloc(m * sizeof(int*));

	for (i = 0; i < m; i++)
		a[i] = (int*)malloc(m * sizeof(int));

	for (i = 0; i < m; i++) {
		a[i][0] = 1;
		a[0][i] = 1;
	}

	for (i = 1; i < m; i++)
		for (j = 1; j < m; j++)
			a[i][j] = a[i - 1][j] + a[i][j - 1];

	for (i = 0; i < m; i++) {
		for (j = 0; j < m; j++)
			printf("%3d ", a[i][j]);
		printf("\n");
	}

	for (i = 0; i < m; i++)
		free(a[i]);
	free(a);
	getch();
	return 0;
}