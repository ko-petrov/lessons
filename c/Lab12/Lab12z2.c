/* ���ભ��� �� ᫮�� �� �㪢� "�" � "�", ���騥 �� ����� �����. */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, j;
	char a[21];
	printf("������ ᫮�� �� 20 �㪢:\n");
	gets(a);
	for (i = j = 0; a[i]; i++)
		if ((a[i] != '�' && a[i] != '�') || !(i % 2))
			a[j++] = a[i];
	a[j] = 0;
	puts(a);
	getch();
	return 0;
}
