/* �ணࠬ�� ��室�� ����訩 ���� ����筮�� ࠧ������� 楫��� �᫠ */
#include <stdio.h>
#include <conio.h>

int main() {
	int x, i, y;
	printf("������ 楫�� �᫮: ");
	scanf("%d", &x);
	for (i = 3; i >= 0; --i) {
		if (((x >> i) & 1) == 1)
			y = 1;
		else
			y = 0;
		printf("%d", y);
	}
	getch();
	return 0;
}