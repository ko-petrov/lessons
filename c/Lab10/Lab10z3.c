/* переставляя столбцы заданной матрицы, расположите
их в соответствии с ростом характеристик. Характеристика столбца:
сумма модулей его отрицательных нечетных элементов*/
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
int main()
{
	srand(time(NULL));
	int **a, *b;
	int i, j, k, n, m, sum, tmp;
	printf("Количество строк: ");
	scanf("%d", &m);
	printf("Количество столбцов: ");
	scanf("%d", &n);
	// заполнение массива случайными числами
	a = (int**)malloc(m * sizeof(int*));
	for (i = 0; i<m; i++) {
		a[i] = (int*)malloc(n * sizeof(int));
		for (j = 0; j < n; j++) {
			a[i][j] = 10 + rand() % 90;
			if (rand() % 2 == 0) {
				a[i][j] = -a[i][j];
				printf("a[%d][%d]=", i, j);
			}
			else
				printf("a[%d][%d]= ", i, j);
			printf("%d  ",a[i][j]);
		}
		printf("\n");
	}
	// исследуем характеристики стобцов
	b = (int*)malloc(n * sizeof(int));
	printf("\nХарактеристики столбцов: ");
	for (i = 0; i < n; i++) {
		b[i] = 0;
		for (j = 0; j < m; j++)
			if ((a[j][i] < 0) && ((abs(a[j][i]) % 2) == 1))
				b[i] += abs(a[j][i]);
		printf("b[%d]=%d ", i, b[i]);
	}
	printf("\n");
	// сортировка 
	for (i = 0; i < n - 1; i++) {
		for (j = 0; j < n - i - 1; j++)
			if (b[j] > b[j + 1]) {
				tmp = b[j];
				b[j] = b[j + 1];
				b[j + 1] = tmp;
				for (k = 0; k < m; k++) {
					tmp = a[k][j];
					a[k][j] = a[k][j + 1];
					a[k][j + 1] = tmp;
				}
			}
	}
	printf("Отсортированные характеристики: ");
	for (i = 0; i < n; i++)
		printf("b[%d]=%d ", i, b[i]);
	printf("\n\n");
	//вывод матрицы
	for (i = 0; i<m; i++) {
		for (j = 0; j < n; j++) {
			if (a[i][j] < 0) {
				printf("a[%d][%d]=", i, j);
			}
			else
				printf("a[%d][%d]= ", i, j);
			printf("%d  ", a[i][j]);
		}
		printf("\n");
	}
	// освобождение памяти
	for (i = 0; i < m; i++)
		free(a[i]);
	free(a);
	free(b);
	getch();
	return 0;
}