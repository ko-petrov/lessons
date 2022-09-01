/* вычеслить косинус пр вершине А в треугольнике со сторонами а=5 b=3 c=7*/
#include<stdio.h>
#include<conio.h>
int main()
{
    int a = 5, b = 3, c = 7;
    double cosa;
    cosa = (double)(b * b + c * c - a * a) / (2 * b * c);
    printf("cosA = %.2f\n", cosa);
    getch();
    return 0;
}
