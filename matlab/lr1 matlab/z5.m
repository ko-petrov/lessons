fileID = fopen('z5.txt','r');
A = fscanf(fileID,'%f %f', [1 Inf]);
fclose(fileID);
c = size(A);
c = c(1,2);
A = [1:c;A]
x=0;
for i = 1:c
    if A(2,i) < 1
        x = x + 1;
    end
end
fprintf('Элементов меньше единицы: %d\n',x);