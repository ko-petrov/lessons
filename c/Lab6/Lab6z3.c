/* Найти числа близнецы из отрезка [n,2n] */
#include <stdio.h>
#include <conio.h>
#include <math.h>

int f(int x) {
	int i;
	if (x == 1) return 0;
	for (i = 2; i*i <= x; i++)
		if (x % i == 0) return 0;
	return 1;
}

int main() {
	int i, n;
	printf("n = ");
	scanf("%d", &n);
	for (i = n; i < 2 * n - 1; i++)
		if (f(i) && f(i + 2))
			printf("(%d,%d) ", i, i + 2);
	getch();
	return 0;
}