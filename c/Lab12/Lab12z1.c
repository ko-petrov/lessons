/* �������� � ᫮�� �� �㪢� "�" �� ��⠭�� "��", � ��⠭�� "��" �� �㪢� "�".  */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, j;
	char a[21], b[41];
	printf("������ ᫮�� �� 20 �㪢:\n");
	gets(a);
	for (i = j = 0; i<=strlen(a); i++, j++)
		if (a[i] == 'a') {
			b[j++] = 'k';
			b[j] = 'y';
		}
		else if (a[i] == 'k' && a[i + 1] == 'y') {
			b[j] = 'b';
			i++;
		}
		else
			b[j] = a[i];
      //	b[j] = 0;
	puts(b);
	getch();
	return 0;
}
