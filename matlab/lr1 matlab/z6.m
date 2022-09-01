i=-2;
A=[];
t=[];
n=0;
while i<=4
    if i<=-1
        y=2*log(1+i^2);
        A=[A,y];
    else
        y=(1+(cos(i))^2)^(3/5);
        A=[A,y];
    end
    i=i+0.1;
    t=[t,i];
end
plot(t,A)