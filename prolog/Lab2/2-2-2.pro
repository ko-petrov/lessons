domains
  bool=integer

predicates
  nondeterm not_(bool,bool)
  nondeterm and_(bool,bool,bool)
  nondeterm or_(bool,bool,bool)
  nondeterm eq_(bool,bool,bool)
  nondeterm f(bool,bool,bool)
 
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
  
  eq_(A,B,R):- and_(A,B,X),not_(A,Y),
               not_(B,Z),and_(Y,Z,W),or_(X,W,R).
  
  f(A, B, Res):- 
        or_(A, B, Pr1), % A \/ B
  	not_(A, Pr2), not_(B, Pr3), and_(Pr2, Pr3, Pr4), % ~A /\ ~B
  	or_(Pr1, Pr4, Pr5),
  	
  	not_(Pr1, Pr6), not_(Pr4, Pr7), or_(Pr6, Pr7, Pr8),
  	
  	and_(Pr5, Pr8, Pr9),
  	
  	or_(A, Pr2, Pr10), % A /\ ~A
  	
  	eq_(Pr9, Pr10, Res), write("f=",Res," ").
  	
goal
   f(A,B,1).