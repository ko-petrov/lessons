/* Подсчёт букв "у" на нечётных местах. */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, s = 0;
	char a[21];
	printf("Введите слово до 20 букв:\n");
	gets(a);
	if (a[0] == 'y') s++;
	for (i = 2; a[i] && a[i-1]; i += 2)
		if (a[i] == 'y') s++;
	if (s) printf("Количество букв 'у' на нечётных местах: %d", s);
	else printf("В слове нет букв 'у' на нечетных местах.");
	getch();
	return 0;
}
