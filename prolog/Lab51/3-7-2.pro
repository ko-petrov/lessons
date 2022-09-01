domains
  list = symbol*

predicates
  read_list(list)
  nondeterm remove(list, list)

clauses
  read_list([H|T]):- readln(H), read_list(T), !.
  read_list([]).
  
  remove([], []).
  remove([_|[]], []).
  remove([_|[T]], [T]).
  remove([_|[TH|TT]], R):- remove(TT, Rn), R = [TH|Rn], !.

goal
  %remove(["1","2","3","4","5","6","7","8"], R).
  %remove(["1","2","3","4","5","6","7"], R).
  read_list(L), remove(L, R).
