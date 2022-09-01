   /* Демонстрация работы с базой знаний, содержащей функторы */
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
      /* Загрузка базы знаний. */
      /* --------------------- */
      zagruzka:-
         % Загрузка базы знаний в память
         consult("G:\\Lab8\\08-05.kbe"),
         write("База загружена"),nl,nl,
         % Выход в режим редактирования
         redact.
      zagruzka:-
         write("Будете создавать базу знаний, Y/N"),
         readchar(C),
         upper_lower(C1,C),C1='Y',
         redact.
      zagruzka.

      /* ------------------------------------------ */
      /* Поиск и редактирование правил базы знаний. */
      /* ------------------------------------------ */
      redact:-
        write(" 1. Удаление правила\n \
2. Выбор правила по номеру\n \
3. Добавление правила\n \
4. Сохранение и Выход\n \
5. Поиск по группе\n \
6. Редактирование\n \
7. Запуск теста"),nl,
        write("Ваш выбор => "),
        readint(N),nl,
        action(N),   % Выход на процедуру обработки опции
        redact.         
      redact.   

      /* --------------------------------------- */
      /* Удаление правила                        */
      /* --------------------------------------- */
      action(1):- write("Введите номер правила: "),
                  readint(N), 
                  rule(N,X,Y,Z,_),
                  write("Номер: ",N),nl,
                  write("Тип: ",X),nl,
                  write("Условная часть: ",Y),
                  write("Операционная часть: ",Z),nl,nl,
                  write("Будете удалять (y/n) => "),
                  readchar(C),
                  upper_lower(C1,C),C1='Y',
                  retract(rule(N,_,_,_,_)).
      action(1).

      /* ----------------------- */
      /* Выбор правила по номеру */
      /* ----------------------- */
      action(2):-
        write("Введите номер правила - целое число => "),
        readint(N),
        rule(N,X,Y,Z,_),
        %assert(rule(N,X,Y,Z,S)),nl,
        write("Номер: ",N),nl,
        write("Тип: ",X),nl,
        write("Условная часть: ",Y),nl,
        write("Операционная часть: ",Z),nl,
        write("Выполнено. Нажмите Ввод."),nl,
        readchar(_).
      action(2):-
        write("Нет правила с указанным номером."),nl,
        readchar(_).

      /* ------------------ */
      /* Добавление правила */
      /* ------------------ */
      action(3):-
        write("\nВведите номер правила => "),
        readint(N),nl,
        not(rule(N,_,_,_,_)),
        write("Введите тип правила: "),
        readterm(type,Typ),
        % Ввод условной части правила
        write("Введите условную часть правила в формате: "),nl,
        write("[(f(i,j),...], где"),nl,
        write("f - функтор: eq, gt, lt, ge, ind, al\n"),
        write("i - имя атрибута; j - значение\n"),
        readterm(conditional_part,NewCond),
        % Ввод операционной части правила
        write("Введите операционную часть правила: "),
        readln(NewAct),
        assert(rule(N,Typ,NewCond,NewAct,0)),nl,
        write("Правило создано. Нажмите Ввод"),nl,
        readchar(_).
      action(3):- write("Правило с таким номером уже есть!"),nl.
      
      /* ---------------------------------------------- */
      /* Выход из редактора с запросом сохранение файла */
      /* ---------------------------------------------- */
      action(4):-
        write("Сохранять? Y/N"),
        readchar(C),
        upper_lower(C1,C),C1='Y',
        write("\nВведите имя файла => "),
        readln(File),
        save(File),
        retractall(_), exit.
      action(4):-
        retractall(_), exit.
      /* ---------------------------------------------- */
      /* Далее -                                        */
      /* Задание 7. Автор - Петров Константин           */
      /* Выбор правил по группе */
      /* ---------------------------------------------- */
      action(5):-
         write("Выберите тип правила:\n \
              1. Вопрос \n \
              2. Альтернатива \n \
              3. Управление \n \
              4. Процедура"),nl,
         write("Ваш выбор => "),
         readint(N),nl,
         group(N).
         
      /* ---------------------------------------------- */
      /* Редактирование */
      /* ---------------------------------------------- */
      action(6):-
         write("Выберите номер правила => "),
         readint(N),nl,
         write("Что редактируем?\n \
              1. Номер \n \
              2. Тип \n \
              3. Условная часть \n \
              4. Операционная часть"),nl,
         readint(X),nl,
         edit(X,N).
      
      %запуск теста
      action(7):- vyzov2(0).
      %запуск правила по номеру (скрытая возможность)
      action(8):- vyzov1.
      
      % Выбор правил по группе
      
      group(1):- rule(N,quest,Y,Z,_),
                 write("Номер: ",N),nl,
                 write("Условная часть: ",Y),nl,
                 write("Операционная часть: ",Z),nl,nl,fail.
      group(1).
      group(2):- rule(N,alt,Y,Z,_),
                 write("Номер: ",N),nl,
                 write("Условная часть: ",Y),nl,
                 write("Операционная часть: ",Z),nl,nl,fail.
      group(2).
      group(3):- rule(N,contr,Y,Z,_),
                 write("Номер: ",N),nl,
                 write("Условная часть: ",Y),nl,
                 write("Операционная часть: ",Z),nl,nl,fail.
      group(3).
      group(4):- rule(N,proc,Y,Z,_),
                 write("Номер: ",N),nl,
                 write("Условная часть: ",Y),nl,
                 write("Операционная часть: ",Z),nl,nl,fail.
      group(4).
      
      % Редактирование
      
      edit(1,N):-rule(N,X,Y,Z,S),
                 write("\nВведите номер правила => "),
                 readint(N1),nl,
                 not(rule(N1,_,_,_,_)),
                 retract(rule(N,_,_,_,_)),
                 assert(rule(N1,X,Y,Z,S)).
      edit(1,_):-write("Правило с таким номером уже есть!"),nl.
      
      edit(2,N):-rule(N,_,Y,Z,S),
                 retract(rule(N,_,_,_,_)),
                 write("Введите тип правила: "),
                 readterm(type,X1),
                 assert(rule(N,X1,Y,Z,S)).
      edit(3,N):-rule(N,X,_,Z,S),
                 retract(rule(N,_,_,_,_)),
                 write("Введите условную часть правила в формате: "),nl,
                 write("[(f(i,j),...], где"),nl,
                 write("f - функтор: eq, gt, lt, ge, ind, al\n"),
                 write("i - имя атрибута; j - значение\n"),
                 readterm(conditional_part,Y1),
                 assert(rule(N,X,Y1,Z,S)).
      edit(4,N):-rule(N,X,Y,_,S),
                 retract(rule(N,_,_,_,_)),
                 write("Введите операционную часть правила: "),
                 readln(Z1),
                 assert(rule(N,X,Y,Z1,S)).
                 
      /* ---------------------------------------------- */
      /* Задание 8                                      */
      /* ---------------------------------------------- */
      
      vyzov1:- write("Какое правило вызываем? => "),
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
      vyzov(alt,N):-write("Недопустимый ответ"),nl,
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
      
      %запуск вычислений по строке
      compute(Z):- fronttoken(Z,Z1,Z2), oper(Z1,Z2,_,_).
      
      %операция "=" принимает первым операндом имя переменной в которую надо записать результат вычисления второго операнда
      oper("=",Z,Res,Tale):- fronttoken(Z,Z1,Z2), fronttoken(Z2,Z3,Z4), oper(Z3,Z4,Res2,Tale), assert(value(Z1,Res2,1)), Res = Res2.
      
      %следующие операции с помощью рекурсии получают вычесленные значения операндов и выполняют над ними одну из арифм. операций
      % Res - результат операции, Tale - хвост строки, для которого еще предстоит выполнить операции
      oper("+",Z,Res,Tale):- fronttoken(Z,Z1,Z2), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i + Res2i, str_real(Res,Resi).
      
      oper("-",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i - Res2i, str_real(Res,Resi).
      oper("*",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i * Res2i, str_real(Res,Resi).
      oper("/",Z,Res,Tale):- fronttoken(Z,Z1,Z2), write("z1=",Z1), oper(Z1,Z2,Res1,Tale1), fronttoken(Tale1,Z3,Z4), oper(Z3,Z4,Res2,Tale),
                        str_real(Res1,Res1i), str_real(Res2,Res2i), Resi = Res1i / Res2i, str_real(Res,Resi).
      % Если первое слово строки не является операциями, описанными выше, то делается вывод, что это переменная и извлекается её значение
      oper(X,X1,Res,X1):- value(X,Res,_).
      oper(_,X1,"0",X1).
      
   goal
      zagruzka.