/* ????? ???ᨬ?????? ??????? ? ?????? ?⮫??? ??㬥୮?? ???ᨢ? */
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int **a;
	int i, j, n, m, max;
	printf("???????⢮ ??ப: ");
	scanf("%d", &m);
	printf("???????⢮ ?⮫?殢: ");
	scanf("%d", &n);
	a = (int**)malloc(m * sizeof(int*));
	for (i = 0; i<m; i++) {
		a[i] = (int*)malloc(n * sizeof(int));
		for (j = 0; j < n; j++) {
			a[i][j] = 10 + rand() % 90;
			printf("a[%d][%d]=%d  ", i, j, a[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	for (i = 0; i < n; i++) {
		max = a[0][i];
		for (j = 1; j < m; j++)
			if (a[j][i] > max)
				max = a[j][i];
		printf("? ?⮫??? %d ???ᨬ?????? ??????? %d\n", i, max);
	}
	for (i = 0; i < m; i++)
		free(a[i]);

	free(a);
	getch();
	return 0;
}
