
/* определить знаяения переменных a и b */
#include<stdio.h>
#include<conio.h>
int main()
{
    int a, b;
    a=3+8*4; b=a%10+14; a=b%10+2;
    printf("a = %d\n", a);
    printf("b = %d\n", b);
    getch();
    return 0;
}
