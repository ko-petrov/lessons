
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
	float t;
	printf("Enter t: ");
	scanf("%f", &t);
	if (fmod(t, 5) < 3)
		printf("Green\n");
	else
		printf("Red\n");
	getch();
	return 0;
}
