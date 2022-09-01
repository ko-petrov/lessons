/* Вычеркнуть из слова все буквы "ш" и "л", стоящие на чётных местах. */
#include <stdio.h>
#include <conio.h>
#include <string.h>

int main() {
	int i, j;
	char a[21];
	printf("Введите слово до 20 букв:\n");
	gets(a);
	for (i = j = 0; a[i]; i++)
		if ((a[i] != 'ш' && a[i] != 'л') || !(i % 2))
			a[j++] = a[i];
	a[j] = 0;
	puts(a);
	getch();
	return 0;
}
