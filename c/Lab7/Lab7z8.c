/* Напишите программу с рекуррентным соотношением */
#include <stdio.h>
#include <conio.h>
#include <math.h>

int f(int x) {
	if (x == 0) return 3;
	if (x == 1) return 21;
	return 4 * f(x-1) - 4 * f(x - 2);
}

int p(int x) {
	return 15 * pow(2, x - 1) * x + 6 * pow(2, x - 1);
}

int main() {
	int n, y;
	printf("x = ");
	scanf("%d", &n);
	printf("a(%d) = %d\n", n, f(n));
	printf("a(%d) = %d\n", n, p(n));
	getch();
	return 0;
}