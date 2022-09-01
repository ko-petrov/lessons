predicates
   nondeterm xyi(integer,integer,integer,integer)
   
clauses
   xyi(1,1,1,0).
   xyi(I,X,Y,S):- I > 1, I1 = I - 1, xyi(I1,X1,Y1,S1), X = 3 + X1, Y = X1 + Y1,
               S = S1 + (X - Y) * (X - Y).
goal
   write("¬ведите N: "), readint(N),
   xyi(N,_,_,S), write("—умма равна: ", S), nl.