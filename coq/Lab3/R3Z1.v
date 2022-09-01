   (* Лабораторная работа №3, раздел №3, Задание №1     *)
   (* Автор: Петров К., 3 курс, ИСиТ (02.12.2020)       *)
   (* ------------------------------------------------- *)
   (* A \/ B = forall f. (A -> f) -> (B -> f) -> f      *)
   (* A /\ B = forall f. (A -> B -> f) -> f             *)
   (* ~A = A -> forall f. f                             *)
   (* exists x. A x =                                   *)
   (*           (forall B. (forall x. A x -> B) -> B)   *) 
   (* ------------------------------------------------- *)

   Theorem t_3_1_1: forall (A : Set -> Type)
                           (b : Set)
                           (E : Type),
     (forall B : Type, 
        forall x : Set, (E -> A x -> B) -> B)
            -> (forall C : Type, 
                   (E -> (forall x : Set, A x) -> C) -> C).
   Proof.
      intros. apply X0. apply X with (B:=E) (x:=b). intros. assumption.
      intros. apply X with (B:=(A x)) (x:=x). intros. assumption.
   Qed.

   Theorem t_3_1_2: forall (A : Set -> Type)
                           (B : Set -> Type),
     ((forall Bt : Type, (forall x : Set, A x -> Bt) -> Bt)
                             -> forall x : Set, B x)
                           -> forall x : Set, A x -> B x.
   Proof.
      intros. apply X. intros. apply X1 with x. assumption.
   Qed.

   Theorem t_3_1_3: forall (A : Set -> Type),

         ((forall B : Type,
              (forall x : Set, A x -> B) -> B)
                                   -> forall C: Type, C)
               -> forall x : Set,
                     A x -> forall C : Type, C.
   Proof.
      intros. apply X. intros. apply X1 with x. assumption.
   Qed.

   Theorem t_3_1_3': forall (A : Set -> Type),
               (forall x : Set,
                     A x -> forall C : Type, C)
                  ->
         ((forall B : Type,
              (forall x : Set, A x -> B) -> B)
                                   -> forall C: Type, C).
   Proof.
      intros. apply X0. intros. apply X with x. assumption.
   Qed.