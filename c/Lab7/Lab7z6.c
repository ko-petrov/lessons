/* Напишите программу с рекуррентным соотношением */
#include <stdio.h>
#include <conio.h>
#include <math.h>

int f(int x) {
	if (x == 0) return 0;
	if (x == 1) return 5;
	return -f(x-1) + 6 * f(x - 2);
}

int p(int x) {
	return pow(2, x) - pow(-3, x);
}

int main() {
	int n;
	printf("x = ");
	scanf("%d", &n);
	printf("a(%d) = %d\n", n, f(n));
	printf("a(%d) = %d\n", n, p(n));
	getch();
	return 0;
}