s=0.1;
x = 0 : s : 2*pi;
y = 1 : s : 10;
[X,Y]=meshgrid(x,y);
Z = ((sin(X-2.*Y)).^2).*(exp(1).^(-abs(Y)));
plot3(X,Y,Z);

