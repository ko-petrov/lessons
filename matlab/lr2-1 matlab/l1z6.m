a=input('Введите вектор: ');
s=0;
for i = 1:length(a)
    s=s+a(i);
end
sr=s/length(a);
a(1)=sr