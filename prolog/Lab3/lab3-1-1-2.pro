predicates
    nondeterm vi(integer, integer)
clauses
    vi(1, 1).
    vi(2, 2).
    vi(I, R):- I > 2, V1 = I - 1, V2 = I - 2, 
               vi(V1, R1), vi(V2, R2), R = 2*R1+3*R2.    
goal
    write("¬ведите I: "), readint(I),
    N = I mod 3, N = 0, vi(I, R),
    write("v(i) = ", R), nl.          
