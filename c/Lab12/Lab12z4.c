/* ������� �㪢 "�" �� ������� �����. */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, s = 0;
	char a[21];
	printf("������ ᫮�� �� 20 �㪢:\n");
	gets(a);
	if (a[0] == 'y') s++;
	for (i = 2; a[i] && a[i-1]; i += 2)
		if (a[i] == 'y') s++;
	if (s) printf("������⢮ �㪢 '�' �� ������� �����: %d", s);
	else printf("� ᫮�� ��� �㪢 '�' �� ������ �����.");
	getch();
	return 0;
}
