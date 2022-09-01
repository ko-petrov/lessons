/* Подсчёт комбинаций "нн" в слове. ннн считать за одну комбинацию*/
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, s = 0;
	char a[21];
	printf("Введите слово до 20 букв:\n");
	gets(a);
	for (i = 0; a[i]; i++)
		if (a[i] == 'n' && a[i + 1] == 'n') {
			s++; i++;
		}
	if (s) printf("Количество подслов 'нн': %d ", s);
	else printf("В слове нет подслов 'нн'.");
	getch();
	return 0;
}