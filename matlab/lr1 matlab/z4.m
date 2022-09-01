x=input('Введите x: ');
res=(1+x)^(-5/2);
res1=1-(5/2)*x;
a=7;
b=4;
a1=35;
b1=8;
c=1;
xx=x*x;
pogr=abs(res1-res);
n=0;
fileID = fopen('table.txt','w');
fprintf(fileID,'%6s %12s %12s\n','n','a(n)','res(n)');
while pogr>10^(-5)
    respr=(a1/b1)*xx*c;
    res1=res1+respr;
    pogr=abs(res1-res);
    a=a+2;
    b=b+2;
    a1=a1*a;
    b1=b1*b;
    xx=xx*x;
    c=c*(-1);
    n=n+1;
    fprintf(fileID,'%6.0f %12.7f %12.7f\n', n, respr, res1);
end
fclose(fileID);
fprintf('res=%.7f\nres1=%.7f\nПогрешность: %.7f\n',res,res1,pogr);