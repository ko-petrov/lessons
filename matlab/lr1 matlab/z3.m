a=input('Введите a: ');
b=input('Введите b: ');
c=input('Введите c: ');
d=input('Введите d: ');
x=1;
f=0;
if a<0
    x=x*a;
    f=1;
end
if b<0
    x=x*b;
    f=1;
end
if c<0
    x=x*c;
    f=1;
end
if d<0
    x=x*d;
    f=1;
end
if f==0
    fprintf('Нет отрицательных чисел\n');
else
    disp(x);
end