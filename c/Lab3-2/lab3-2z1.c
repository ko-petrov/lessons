/* Программа генерирует 8 случайных вещественных чисел в диапазоне от 0 до 1 */
#include <stdio.h>
#include <conio.h>
#include <time.h>
#include <stdlib.h>

int main()
{
	srand(time(NULL));
	int i, x;
	float y;
	for (i = 1; i < 9; i++)
	{
		x = 1 + rand() % 999;
		y = (float)x / 1000;
		printf("%.3f\n", y);
	}
	getch();
	return 0;
}
