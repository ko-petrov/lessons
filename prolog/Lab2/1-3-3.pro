   % 3. �������� ���������,  ����������� �� ��� �������� ������  x0,
   % y0 �  z0 ��������� �������� ����� (��� ������������� ���������� ��-
   % ���� ��������� �� ������):
   
   %constants
   
   %domains
   
   predicates
      f(real,real,real,real)
      test
      pr(real,real,real)
   clauses
      pr(_,_,Z):- Z=0.0,write("����������� ����"), nl, !.
      pr(X,Y,Z):- (X/Z-Y-1)=0.0,write("����������� ����"), nl, !.
      pr(X,Y,Z):- f(X,Y,Z,_).
      f(X,Y,Z,W):-write("f(",X,",",Y,",",Z,") = "),(X/Z-Y-1)<>0.0,W=(arctan(Y/4+28)*Z)/(X/Z-Y-1),write(W),nl.
      test:-write("������� X: "),readreal(X),
            write("������� Y: "),readreal(Y),
            write("������� Z: "),readreal(Z),
            pr(X,Y,Z).
   goal
      %f(1.0,2.0,3.0,W).
      test.