   /* ������������ ������ � ����� ������, ���������� �������� */
   /* ------------------------------------------------------- */ 
   domains
      type = proc; quest; alt; contr
      conditional_part = list_of_part*
      list_of_part=al(string);
                   eq(string,string);
                   ne(string,string);
                   gt(string,string);
                   lt(string,string);
                   ge(string,string);
                   ind(string)
      
      
      
   facts
      rule(integer,type,conditional_part,string,integer)
      value(string,string,integer)

   predicates
      nondeterm zagruzka
      nondeterm redact
      nondeterm action(integer)
      nondeterm group(integer)
      nondeterm edit(integer,integer)
      nondeterm vyzov1
      nondeterm vyzov2(integer)
      nondeterm vyzov(type,integer)
      nondeterm writelst(conditional_part)
      nondeterm checklst(conditional_part,string)
      nondeterm cond(conditional_part)
      nondeterm rewrite(conditional_part,conditional_part)
      nondeterm compute(string)
      nondeterm oper(string,string,string,string)

   clauses
      /* --------------------- */
      /* �������� ���� ������. */
      /* --------------------- */
      zagruzka:-
         % �������� ���� ������ � ������
         consult("G:\\Lab8\\08-05.kbe"),
         write("���� ���������"),nl,nl,
         % ����� � ����� ��������������
         redact.
      zagruzka:-
         write("������ ��������� ���� ������, Y/N"),
         readchar(C),
         upper_lower(C1,C),C1='Y',
         redact.
      zagruzka.

      /* ------------------------------------------ */
      /* ����� � �������������� ������ ���� ������. */
      /* ------------------------------------------ */
      redact:-
        write(" 1. �������� �������\n \
2. ����� ������� �� ������\n \
3. ���������� �������\n \
4. ���������� � �����\n \
5. ����� �� ������\n \
6. ��������������\n \
7. ������ �����"),nl,
        write("��� ����� => "),
        readint(N),nl,
        action(N),   % ����� �� ��������� ��������� �����
        redact.         
      redact.   

      /* --------------------------------------- */
      /* �������� �������                        */
      /* --------------------------------------- */
      action(1):- write("������� ����� �������: "),
                  readint(N), 
                  rule(N,X,Y,Z,_),
                  write("�����: ",N),nl,
                  write("���: ",X),nl,
                  write("�������� �����: ",Y),
                  write("������������ �����: ",Z),nl,nl,
                  write("������ ������� (y/n) => "),
                  readchar(C),
                  upper_lower(C1,C),C1='Y',
                  retract(rule(N,_,_,_,_)).
      action(1).

      /* ----------------------- */
      /* ����� ������� �� ������ */
      /* ----------------------- */
      action(2):-
        write("������� ����� ������� - ����� ����� => "),
        readint(N),
        rule(N,X,Y,Z,_),
        %assert(rule(N,X,Y,Z,S)),nl,
        write("�����: ",N),nl,
        write("���: ",X),nl,
        write("�������� �����: ",Y),nl,
        write("������������ �����: ",Z),nl,
        write("���������. ������� ����."),nl,
        readchar(_).
      action(2):-
        write("��� ������� � ��������� �������."),nl,
        readchar(_).

      /* ------------------ */
      /* ���������� ������� */
      /* ------------------ */
      action(3):-
        write("\n������� ����� ������� => "),
        readint(N),nl,
        not(rule(N,_,_,_,_)),
        write("������� ��� �������: "),
        readterm(type,Typ),
        % ���� �������� ����� �������
        write("������� �������� ����� ������� � �������: "),nl,
        write("[(f(i,j),...], ���"),nl,
        write("f - �������: eq, gt, lt, ge, ind, al\n"),
        write("i - ��� ��������; j - ��������\n"),
        readterm(conditional_part,NewCond),
        % ���� ������������ ����� �������
        write("������� ������������ ����� �������: "),
        readln(NewAct),
        assert(rule(N,Typ,NewCond,NewAct,0)),nl,
        write("������� �������. ������� ����"),nl,
        readchar(_).
      action(3):- write("������� � ����� ������� ��� ����!"),nl.
      
      /* ---------------------------------------------- */
      /* ����� �� ��������� � �������� ���������� ����� */
      /* ---------------------------------------------- */
      action(4):-
        write("���������? Y/N"),
        readchar(C),
        upper_lower(C1,C),C1='Y',
        write("\n������� ��� ����� => "),
        readln(File),
        save(File),
        retractall(_), exit.
      action(4):-
        retractall(_), exit.
      /* ---------------------------------------------- */
      /* ����� -                                        */
      /* ������� 7. ����� - ������ ����������           */
      /* ����� ������ �� ������ */
      /* ---------------------------------------------- */
      action(5):-
         write("�������� ��� �������:\n \
              1. ������ \n \
              2. ������������ \n \
              3. ���������� \n \
              4. ���������"),nl,
         write("��� ����� => "),
         readint(N),nl,
         group(N).
         
      /* ---------------------------------------------- */
      /* �������������� */
      /* ---------------------------------------------- */
      action(6):-
         write("�������� ����� ������� => "),
         readint(N),nl,
         write("��� �����������?\n \
              1. ����� \n \
              2. ��� \n \
              3. �������� ����� \n \
              4. ������������ �����"),nl,
         readint(X),nl,
         edit(X,N).
      
      %������ �����
      action(7):- vyzov2(0).
      %������ ������� �� ������ (������� �����������)
      action(8):- vyzov1.
      
      % ����� ������ �� ������
      
      group(1):- rule(N,quest,Y,Z,_),
                 write("�����: ",N),nl,
                 write("�������� �����: ",Y),nl,
                 write("������������ �����: ",Z),nl,nl,fail.
      group(1).
      group(2):- rule(N,alt,Y,Z,_),
                 write("�����: ",N),nl,
                 write("�������� �����: ",Y),nl,
                 write("������������ �����: ",Z),nl,nl,fail.
      group(2).
      group(3):- rule(N,contr,Y,Z,_),
                 write("�����: ",N),nl,
                 write("�������� �����: ",Y),nl,
                 write("������������ �����: ",Z),nl,nl,fail.
      group(3).
      group(4):- rule(N,proc,Y,Z,_),
                 write("�����: ",N),nl,
                 write("�������� �����: ",Y),nl,
                 write("������������ �����: ",Z),nl,nl,fail.
      group(4).
      
      % ��������������
      
      edit(1,N):-rule(N,X,Y,Z,S),
                 write("\n������� ����� ������� => "),
                 readint(N1),nl,
                 not(rule(N1,_,_,_,_)),
                 retract(rule(N,_,_,_,_)),
                 assert(rule(N1,X,Y,Z,S)).
      edit(1,_):-write("������� � ����� ������� ��� ����!"),nl.
      
      edit(2,N):-rule(N,_,Y,Z,S),
                 retract(rule(N,_,_,_,_)),
                 write("������� ��� �������: "),
                 readterm(type,X1),
                 assert(rule(N,X1,Y,Z,S)).
      edit(3,N):-rule(N,X,_,Z,S),
                 retract(rule(N,_,_,_,_)),
                 write("������� �������� ����� ������� � �������: "),nl,
                 write("[(f(i,j),...], ���"),nl,
                 write("f - �������: eq, gt, lt, ge, ind, al\n"),
                 write("i - ��� ��������; j - ��������\n"),
                 readterm(conditional_part,Y1),
                 assert(rule(N,X,Y1,Z,S)).
      edit(4,N):-rule(N,X,Y,_,S),
                 retract(rule(N,_,_,_,_)),
                 write("������� ������������ ����� �������: "),
                 readln(Z1),
                 assert(rule(N,X,Y,Z1,S)).
                 
      /* ---------------------------------------------- */
      /* ������� 8                                      */
      /* ---------------------------------------------- */
      
      vyzov1:- write("����� ������� ��������? => "),
               readint(N),nl,
               rule(N,X,_,_,_),vyzov(X,N).
      vyzov2(N):- rule(N,X,_,_,_),vyzov(X,N).
      vyzov2(-1).
      
      vyzov(alt,N):-rule(N,X,[ind(H)|T],Z,_),
                  write(Z),nl,
                  writelst(T),
                  readln(H1),
                  checklst(T,H1),
                  assert(value(H,H1,1)),
                  retract(rule(N,_,_,_,_)),
                  assert(rule(N,X,[ind(H1)|T],Z,1)),
                  NEXT = 1 + N,
                  vyzov2(NEXT).
      vyzov(alt,N):-write("������������ �����"),nl,
                    vyzov2(N).
      
      vyzov(quest,N):-rule(N,_,[],Z,_),
                      write(Z),nl,
                      NEXT = 1 + N,
                      vyzov2(NEXT).
      vyzov(quest,N):-rule(N,X,[ind(H)|T],Z,_),
                      write(Z),nl,
                      readln(H1),
                      assert(value(H,H1,1)),
                      retract(rule(N,_,_,_,_)),
                      assert(rule(N,X,[ind(H1)|T],Z,1)),
                      NEXT = 1 + N,
                      vyzov2(NEXT).
                      
      vyzov(proc,N):-rule(N,X,Y,Z,_),
                      cond(Y),
                      rewrite(Y,Y1),
                      retract(rule(N,_,_,_,_)),
                      assert(rule(N,X,Y1,Z,1)),
                      compute(Z),
                      NEXT = 1 + N,
                      vyzov2(NEXT).
                      
      vyzov(proc,N):-NEXT = 1 + N,
                      vyzov2(NEXT).
      
      vyzov(contr,N):-rule(N,X,Y,Z,_),
                      cond(Y),
                      rewrite(Y,Y1),
                      retract(rule(N,_,_,_,_)),
                      assert(rule(N,X,Y1,Z,1)),
                      str_int(Z,Z1),
                      vyzov2(Z1).
      vyzov(contr,N):-NEXT = 1 + N,
                      vyzov2(NEXT).
      
      writelst([]).
      writelst([al(H)|T]):-write(H),nl,writelst(T).
      
      checklst([],_):- fail.
      checklst([al(H)|T],H1):- H=H1; checklst(T,H1).
      
      cond([]).
      cond([eq(I,X)|T]):- value(I,X1,_), X=X1, cond(T).
      cond([ne(I,X)|T]):- value(I,X1,_), X<>X1, cond(T).
      cond([gt(I,X)|T]):- value(I,X1,_), X<X1, cond(T).
      cond([lt(I,X)|T]):- value(I,X1,_), X>X1, cond(T).
      cond([ge(I,X)|T]):- value(I,X1,_), X<=X1, cond(T).
      
      rewrite([],[]).
      rewrite([eq(H,A)|T],[eq(H1,A)|T1]):- value(H,X,_), rewrite(T,T1), H1 = X.
      rewrite([ne(H,A)|T],[ne(H1,A)|T1]):- value(H,X,_), rewrite(T,T1), H1 = X.
      rewrite([gt(H,A)|T],[gt(H1,A)|T1]):- value(H,X,_), rewrite(T,T1), H1 = X.
      rewrite([lt(H,A)|T],[lt(H1,A)|T1]):- value(H,X,_), rewrite(T,T1), H1 = X.
      rewrite([ge(H,A)|T],[ge(H1,A)|T1]):- value(H,X,_), rewrite(T,T1), H1 = X.
      
      %������ ���������� �� ������
      compute(Z):- fronttoken(Z,Z1,Z2), oper(Z1,Z2,_,_).
      
      %�������� "=" ��������� ������ ��������� ��� ���������� � ������� ���� �������� ��������� ���������� ������� ��������
      oper("=",Z,Res,Tale):- fronttoken(Z,Z1,Z2), fronttoken(Z2,Z3,Z4), oper(Z3,Z4,Res2,Tale), assert(value(Z1,Res2,1)), Res = Res2.
      
      %��������� �������� � ������� �������� �������� ����������� �������� ��������� � ��������� ��� ���� ���� �� �����. ��������
      % Res - ��������� ��������, Tale - ����� ������, ��� �������� ��� ��������� ��������� ��������
      oper("+",Z,Res,Tale):- fronttoken(Z,Z1,Z2), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i + Res2i, str_real(Res,Resi).
      
      oper("-",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i - Res2i, str_real(Res,Resi).
      oper("*",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i * Res2i, str_real(Res,Resi).
      oper("/",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i / Res2i, str_real(Res,Resi).
      % ���� ������ ����� ������ �� �������� ����������, ���������� ����, �� �������� �����, ��� ��� ���������� � ����������� � ��������
      oper(X,X1,Res,X1):- value(X,Res,_).
      oper(_,X1,"0",X1).
      
   goal
      zagruzka.