   % 3. Ќапишите программу,  позвол€ющую по трЄм заданным числам  x0,
   % y0 и  z0 вычислить значение терма (при невозможности вычислений вы-
   % дать сообщение об ошибке):
   
   %constants
   
   %domains
   
   predicates
      f(real,real,real,real)
      test
      pr(real,real,real)
   clauses
      pr(_,_,Z):- Z=0.0,write("«наменатель ноль"), nl, !.
      pr(X,Y,Z):- (X/Z-Y-1)=0.0,write("«наменатель ноль"), nl, !.
      pr(X,Y,Z):- f(X,Y,Z,_).
      f(X,Y,Z,W):-write("f(",X,",",Y,",",Z,") = "),(X/Z-Y-1)<>0.0,W=(arctan(Y/4+28)*Z)/(X/Z-Y-1),write(W),nl.
      test:-write("¬ведите X: "),readreal(X),
            write("¬ведите Y: "),readreal(Y),
            write("¬ведите Z: "),readreal(Z),
            pr(X,Y,Z).
   goal
      %f(1.0,2.0,3.0,W).
      test.