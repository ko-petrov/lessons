/* �ணࠬ�� ������, �室�� �� ��� 1 � ������� ������ ����ࠫ쭮�� �᫠ */
#include <stdio.h>
#include <conio.h>

int main() {
	int x;
	printf("������ ����ࠫ쭮� �᫮: ");
	scanf("%d", &x);
	if (x | 0)
		printf("1 �室�� � ������� ������");
	else
		printf("1 �� �室�� � ������� ������ �᫠");
	getch();
	return 0;
}