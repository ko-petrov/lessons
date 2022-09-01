n=10;
a=-0.2;
b=4;
s=abs(a-b)/n;
x=a;
y=log(x+1)*sqrt((exp(1)^x)+(exp(1)^(-x)));
fprintf('x=%.2f y=%.2f\n',x,y);
while x<=b-s
    x=x+s;
    y=log(x+1)*sqrt((exp(1)^x)+(exp(1)^(-x)));
    fprintf('x=%.2f y=%.2f\n',x,y);
end