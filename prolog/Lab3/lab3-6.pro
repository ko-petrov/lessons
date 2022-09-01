   domains
     term = prog(integer)
   
   predicates
     famil(term,integer,integer,integer)
     gettime(integer,integer,integer)
     
   clauses
     famil(prog(1),10,25,45).
     famil(prog(2),15,30,20).
     famil(prog(3),12,27,35).
     famil(prog(4),20,30,30).

       
     gettime(N,M,Res):- N<=M,famil(prog(N),A,P,O),
                        Z=A+P+O,N1=N+1,
                        gettime(N1,M,Res1),
                        Res=Z+Res1.
     gettime(N,M,0):- N>M.   

   
   goal
     gettime(1,3,R).