
/* Напишите программу с рекуррентным соотношением */
#include <stdio.h>
#include <conio.h>
#include <math.h>

int f(int x) {
	if (x == 0) return 1;
	return -4 * f(x - 1);
}

int p(int x) {
	return pow(-4, x);
}

int main() {
	int n;
	printf("n = ");
	scanf("%d", &n);
	printf("a(%d) = %d\n", n, f(n));
	printf("a(%d) = %d\n", n, p(n));
	getch();
	return 0;
}