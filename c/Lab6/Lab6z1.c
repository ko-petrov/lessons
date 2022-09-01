/* Вычислить (знаки перед корнями повторяются группами по три) */
#include <stdio.h>
#include <conio.h>
#include <math.h>

float f(int x) {
	if (x == 1) return 0;
	return sqrt(8 - sqrt(8 + sqrt(8 - f(x - 1))));
}

float p() {
	return 1 + 2 * sqrt(3) * sin(20 * M_PI / 180);
}

int main() {
	int n, y;
	printf("x = ");
	scanf("%d", &n);
	printf("a(%d) = %.4f\n", n, f(n));
	printf("a = %.4f\n", p());
	getch();
	return 0;
}