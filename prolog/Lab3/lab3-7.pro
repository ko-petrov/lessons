predicates
   nondeterm f(integer)
clauses
   f(X):- 2 * X = 0, write("Деление на ноль"), nl, X1 = X + 1, f(X1).
   f(X):- X >= 3, X<=10, Y = X * X + 2 * X, write("f(",X,")=",Y), nl, X1 = X + 1, f(X1).
   f(X):- X < 3, X>=0, Y = (X * X + 3 * X + 1) / (2 * X), write("f(",X,")=",Y), nl, X1 = X + 1, f(X1).
   f(X):- X > 10.
goal
   f(0).