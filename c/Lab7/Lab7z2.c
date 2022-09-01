/* Найти все трехзначные числа, представимые в виде сумм
факториалов своих цифр*/
#include <stdio.h>
#include <conio.h>

int f(int x) {
	if (x == 0) return 1;
	return f(x - 1) * x;
}

int main() {
	int n, k, sum, s = 0;
	for (k = 100; k < 660; k++) {
		sum = f(k % 10) + f(k / 10 % 10) + f(k / 100);
		if (sum == k) printf("%d ", k);
	}
	getch();
	return 0;
}