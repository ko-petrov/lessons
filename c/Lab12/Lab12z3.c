/* �ணࠬ�� �� �஢�ન, ���� �� � ᫮�� �㪢� "�". �᫨ ����, � ��।���� ����� �� ��� */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i;
	char a[21];
	printf("������ ᫮�� �� 20 �㪢:\n");
	gets(a);
	for (i = 0; a[i]; i++)
		if (a[i] == 'v') break;
	if (a[i]) printf("�㪢� '�' �ᯮ������ �� %d ����.", i + 1);
	else printf("� ᫮�� ��� �㪢 '�'.");
	getch();
	return 0;
}
