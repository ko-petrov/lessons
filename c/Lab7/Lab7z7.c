/* Напишите программу с рекуррентным соотношением */
#include <stdio.h>
#include <conio.h>
#include <math.h>

int f(int x) {
	if (x == 0) return 2;
	if (x == 1) return 5;
	return 2 * f(x-1) + 8 * f(x - 2);
}

int p(int x) {
	return pow(2, x-1) * pow(-1, x) + 3 * pow(2, 2 * x - 1);
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