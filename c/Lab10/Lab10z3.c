/* ����⠢��� �⮫��� �������� ������, �ᯮ�����
�� � ᮮ⢥��⢨� � ��⮬ �ࠪ���⨪. ��ࠪ���⨪� �⮫��:
�㬬� ���㫥� ��� ����⥫��� ������ ����⮢*/
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
	printf("������⢮ ��ப: ");
	scanf("%d", &m);
	printf("������⢮ �⮫�殢: ");
	scanf("%d", &n);
	// ���������� ���ᨢ� ��砩�묨 �᫠��
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
	// ��᫥�㥬 �ࠪ���⨪� �⮡殢
	b = (int*)malloc(n * sizeof(int));
	printf("\n��ࠪ���⨪� �⮫�殢: ");
	for (i = 0; i < n; i++) {
		b[i] = 0;
		for (j = 0; j < m; j++)
			if ((a[j][i] < 0) && ((abs(a[j][i]) % 2) == 1))
				b[i] += abs(a[j][i]);
		printf("b[%d]=%d ", i, b[i]);
	}
	printf("\n");
	// ���஢�� 
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
	printf("�����஢���� �ࠪ���⨪�: ");
	for (i = 0; i < n; i++)
		printf("b[%d]=%d ", i, b[i]);
	printf("\n\n");
	//�뢮� ������
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
	// �᢮�������� �����
	for (i = 0; i < m; i++)
		free(a[i]);
	free(a);
	free(b);
	getch();
	return 0;
}