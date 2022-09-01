/* Программа дял проверки, есть ли в слове буквы "в". Если есть, то определяет первую из них */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i;
	char a[21];
	printf("Введите слово до 20 букв:\n");
	gets(a);
	for (i = 0; a[i]; i++)
		if (a[i] == 'v') break;
	if (a[i]) printf("Буква 'в' расположена на %d месте.", i + 1);
	else printf("В слове нет букв 'в'.");
	getch();
	return 0;
}
