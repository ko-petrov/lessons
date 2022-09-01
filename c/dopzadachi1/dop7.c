
#include<stdio.h>
#include<conio.h>
int main()
{
	int m, k;
	printf("Vvedite m (ot 1 do 4): ");
	scanf("%d", &m);
	printf("Enter k (ot 6 do 14): ");
	scanf("%d", &k);
	if (k == 2)
		printf("Dvoika ");
	else if (k == 6)
		printf("Shesterka ");
	else if (k == 7)
		printf("Semerka ");
	else if (k == 8)
		printf("Vosmerka ");
	else if (k == 9)
		printf("Devyatka ");
	else if (k == 10)
		printf("Desyatka ");
	else if (k == 11)
		printf("Valet ");
	else if (k == 12)
		printf("Dama ");
	else if (k == 13)
		printf("Korol ");
	else if (k == 14)
		printf("Tuz ");
	else
		printf("Chto-to ");
	
	if (m == 1)
		printf("pik.\n");
	else if (m == 2)
		printf("tref.\n");
	else if (m == 3)
		printf("buben.\n");
	else if (m == 4)
		printf("chervei.\n");
	else
		printf("chego-to.");
	getch();
	return 0;
}
