   %constants
   
   %domains
   
   predicates
      f(real,real,real,real,real)
      test
      pr(real,real,real)
   clauses
      pr(A,B,C):- B*B-4.0*A*C < 0,write("Корней нет"), nl, !.
      pr(A,B,C):- f(A,B,C,_,_).
      f(A,B,C,X1,X2):-write(A,"x^2+",B,"x+",C,"=0) = "),nl,D=B*B-4.0*A*C,X1=(-B-sqrt(D))/(2*A),X2=(-B+sqrt(D))/(2*A),write("X1 = ",X1,", X2 = ",X2),nl.
      test:-write("Введите a: "),readreal(A),
            write("Введите b: "),readreal(B),
            write("Введите c: "),readreal(C),
            pr(A,B,C).
   goal.
      test.