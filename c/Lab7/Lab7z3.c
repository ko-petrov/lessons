/* Вычислить (в выражении присутствуют n радикалов) */
#include <stdio.h>
#include <conio.h>
#include <math.h>

float koreshok(int x) {
	if (x == 1) return sqrt(2); 
	return sqrt(koreshok(x - 1) + 2);
}

int main() {
	int n;
	printf("n = ");
	scanf("%d", &n);
	printf("%.4f", koreshok(n));
	getch();
	return 0;
}