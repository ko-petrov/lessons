/* �ணࠬ�� ��������� ��ᠭ�� ��� ��ࠫ��� �㡨��� ����� �� ���� ��ப��
� ��।����, �� �� ��ப�� ����稫 ������� �㬬� �窮� */
#include <stdio.h>
#include <conio.h>
#include <time.h>
#include <stdlib.h>

int main()
{
	srand(time(NULL));
	int i, x, s1 = 0, s2 = 0;
	for (i = 1; i < 4; i++)
	{
		x = 1 + rand() % 6;
		s1 += x;
		printf("1 ��ப ���� �㡨�: %d\n", x);
	}
	for (i = 1; i < 4; i++)
	{
		x = 1 + rand() % 6;
		s2 += x;
		printf("2 ��ப ���� �㡨�: %d\n", x);
	}
	printf("�㬬� �窮� 1 ��ப�: %d\n", s1);
	printf("�㬬� �窮� 2 ��ப�: %d\n", s2);
	if (s1 > s2)
		printf("1 ��ப �������\n");
	else if (s1 < s2)
		printf("2 ��ப �������\n");
	else
		printf("�����\n");
	getch();
	return 0;
}
