/* Выполнить задачи из задания 9 */
#include <stdio.h>
#include <conio.h>

int main() {
	float number1 = 7.3, number2;
	float *fptr;
	fptr = &number1;
	printf("%f\n", *fptr);
	number2 = *fptr;
	printf("%f\n", number2);
	printf("0x%p\n", &number1);
	printf("0x%p\n", fptr);
	getch();
	return 0;
}