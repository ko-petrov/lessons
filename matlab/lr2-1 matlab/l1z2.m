n=input('Введите длину векторов: ');
a=input('Введите вектор a: ');
b=input('Введите вектор b: ');
c=[a,b]
max=c(1);
min=c(1);
max1=1;
min1=1;
for i = 2 : 2*n
    if c(i) > max
        max=c(i);
        max1=i;
    end
    if c(i) < min
        min=c(i);
        min1=i;
    end
end
c(max1)=c(min1);
c(min1)=max;
c