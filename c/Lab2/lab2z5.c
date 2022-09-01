
/* убрать избыточные скобки */
#include<stdio.h>
#include<conio.h>
int main()
{
    int x=5, y=3;
    y = (x == y) ? (x + ((y * 2) + (y / x))) : (y + x + (x * 3));
    printf("%d\n",y);
    y = 3;
    y = (x == y) ? (x + y * 2 + y / x) : (y + x + x * 3);
    printf("%d\n",y);
    getch();
    return 0;
}
