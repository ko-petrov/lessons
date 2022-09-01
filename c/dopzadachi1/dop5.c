
#include <stdio.h>
#include <conio.h>
int main()
{
	int x, a, sum, pr;
	printf("Enter x: ");
	scanf("%d", &x);
	printf("Enter a: ");
	scanf("%d", &a);
	sum = (x % 10) + (x / 10 % 10) + (x / 100);
	pr = (x % 10) * (x / 10 % 10) * (x / 100);
	printf("sum = %d pr = %d\n", sum, pr);
	if (sum > 9)
		printf("(a)Yes\n");
	else
		printf("(a)No\n");
	if (pr > 99)
		printf("(b)Yes\n");
	else
		printf("(b)No\n");
	if (pr > a)
		printf("(v)Yes\n");
	else
		printf("(v)No\n");
	if (sum % 5 == 0)
		printf("(g)Yes\n");
	else
		printf("(g)No\n");
	if (sum % a == 0)
		printf("(d)Yes\n");
	else
		printf("(d)No\n");
	getch();
	return 0;
}
