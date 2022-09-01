domains
  list = symbol*
  
predicates
  read_list(list)
  nondeterm remove(list, list)
  
clauses
  read_list([H|T]):- readln(H), read_list(T), !.
  read_list([]).
  
  remove([H|[E|[_|T]]], R):- remove(T, RT), R = [H|[E|RT]].
  remove([H|[E|[_]]], R):- R = [H|[E]].
  remove([H|[E]], R):- R = [H|[E]].
  remove([H|[]], R):- R = [H|[]].
  
goal
  read_list(L), remove(L, R).
