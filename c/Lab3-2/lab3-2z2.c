/* Программа моделирует бросание трех игральных кубиков каждым из двух игроков
и определяет, кто из игроков получил большую сумму очков */
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
		printf("1 игрок кинул кубик: %d\n", x);
	}
	for (i = 1; i < 4; i++)
	{
		x = 1 + rand() % 6;
		s2 += x;
		printf("2 игрок кинул кубик: %d\n", x);
	}
	printf("Сумма очков 1 игрока: %d\n", s1);
	printf("Сумма очков 2 игрока: %d\n", s2);
	if (s1 > s2)
		printf("1 игрок победил\n");
	else if (s1 < s2)
		printf("2 игрок победил\n");
	else
		printf("Ничья\n");
	getch();
	return 0;
}
