/* Перевести с паскаля на си */
#include <stdio.h>
#include <conio.h>
#include <math.h>

float E_i_g_h_t(int n, float a, float b) {
	if (n == 1) return sqrt(6.0);
	return sqrt(a + b * E_i_g_h_t(n - 1, a + 1.0, b + 1.0));
}

int main() {
	int n;
	printf("Введите значение аргумента n: ");
	scanf("%d", &n);
	printf("Результат: %.4f", E_i_g_h_t(n, 6.0, 2.0));
	getch();
	return 0;
}