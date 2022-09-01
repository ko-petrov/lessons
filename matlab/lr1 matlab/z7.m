A=readmatrix('z7.txt');
fileID = fopen('z7-2.txt','w');
c=size(A);
c1=c(1);
c2=c(2);
if c1==c2
fprintf(fileID,'ИСХОДНАЯ МАТРИЦА\n');
for i = 1:c1
    for j = 1:c2
        fprintf(fileID,'%6d',A(i,j));
    end
    fprintf(fileID,'\n');
end
for i = 1:c2
    g=1;
    for j = 1:c1
        
        g=g*A(j,i);
    end
    g=g^(1/c1);
    A(i,i)=g;
end
fileID2 = fopen('z7-3.txt','w');
fprintf(fileID2,'ИЗМЕНЁННАЯ МАТРИЦА\n');
for i = 1:c1
    for j = 1:c2
        fprintf(fileID2,'%6.2f',A(i,j));
    end
    fprintf(fileID2,'\n');
end
fclose(fileID2);
else
    fprintf('Ошибка, матрица должна быть квадратной по условию задачи\n');
end
fclose(fileID);