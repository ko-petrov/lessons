/* ������� �������権 "��" � ᫮��. ��� ����� �� ���� ���������*/
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, s = 0;
	char a[21];
	printf("������ ᫮�� �� 20 �㪢:\n");
	gets(a);
	for (i = 0; a[i]; i++)
		if (a[i] == 'n' && a[i + 1] == 'n') {
			s++; i++;
		}
	if (s) printf("������⢮ ���᫮� '��': %d ", s);
	else printf("� ᫮�� ��� ���᫮� '��'.");
	getch();
	return 0;
}