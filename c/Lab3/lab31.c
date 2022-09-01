#include<stdio.h>
#include<conio.h>
int main() 
{
	int k, n, a;
	printf("k = ");
	scanf("%d", &k);
	for (n = 1, a = 1; n <= k; n++, a += 2)
	{
		printf("a(%d) = %d\n", n-1, a);
	}
	getch();
	return 0;
}
