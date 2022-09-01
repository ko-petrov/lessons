domains
  bool=integer
  
predicates
  nondeterm not_(bool,bool)
  nondeterm and_(bool,bool,bool)
  nondeterm or_(bool,bool,bool)
  
  nondeterm f(bool,bool,bool,bool)
  nondeterm f1(bool,bool,bool,bool)
  nondeterm f2(bool,bool,bool,bool)
  nondeterm f3(bool,bool,bool,bool)
  nondeterm f4(bool,bool,bool,bool)
  
  nondeterm sr1
  nondeterm sr2
  nondeterm sr3
  nondeterm sr4
  nondeterm what(bool)
  
clauses
  not_(1,0).
  not_(0,1).
  
  and_(0,0,0).
  and_(0,1,0).
  and_(1,0,0).
  and_(1,1,1).

  or_(0,0,0).
  or_(0,1,1).
  or_(1,0,1).
  or_(1,1,1).
  
  f(A, B, C, R):- not_(B, Pr1), or_(Pr1, C, Pr2), not_(Pr2, Pr3), and_(A, Pr3, R).
  f1(A, B, C, R):- not_(A, Pr1), not_(B, Pr3), not_(C, Pr2), or_(Pr1, Pr3, Pr4), or_(Pr4, Pr2, R).
  f2(A, B, C, R):- not_(B, Pr1), not_(C, Pr3), and_(A, Pr1, Pr4), and_(Pr4, Pr3, R).
  f3(A, B, C, R):- not_(C, Pr1), and_(A, B, Pr4), and_(Pr4, Pr1, R).
  f4(A, B, C, R):- not_(B, Pr1), and_(A, Pr1, Pr4), and_(Pr4, C, R).
 
  sr1:- f(A, B, C, R1), f1(A, B, C, R2), R1 <> R2.
  sr2:- f(A, B, C, R1), f2(A, B, C, R2), R1 <> R2.
  sr3:- f(A, B, C, R1), f3(A, B, C, R2), R1 <> R2.
  sr4:- f(A, B, C, R1), f4(A, B, C, R2), R1 <> R2.
  
  what(Sr):- not(sr1), Sr = 1;
             not(sr2), Sr = 2;
             not(sr3), Sr = 3;
             not(sr4), Sr = 4.

goal
  what(Sr).