/* Напишите программу вычисления конечной суммы */
#include <stdio.h>
#include <conio.h>

int f(int x) {
	if (x == 1) return -x;
	if (x == 2) return x;
	return f(x - 2) * x;	
}

int main() {
	int n, k, s = 0;
	printf("n = ");
	scanf("%d", &n);
	for (k = 1; k <= n; k++)
		s += f(k);
	printf("s = %d", s);
	getch();
	return 0;
}