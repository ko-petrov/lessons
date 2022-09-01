/* Вычислить значение функции по вещественному значению x */
#include <stdio.h>
#include <conio.h>
#include <math.h>

float f(float x) {
	return sinh(x) * tan(x + 1) - pow(tan(2 + sinh(x - 1)), 2);
}

int main() {
	float x;
	printf("x = ");
	scanf("%f", &x);
	printf("f(%.4f) = %.4f\n", x, f(x));
	getch();
	return 0;
}