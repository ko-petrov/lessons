   (* Лабораторная работа №3, раздел №3, Задание №2 *)
   (* Автор: Петров К., 3 курс, ИСиТ (02.12.2020)   *)
   (* --------------------------------------------- *)

   Theorem t_3_2_1: forall (A : Set) 
                           (P : A -> A -> Type),
                     (forall x : A, forall y : A, P x y) ->
                         (forall x : A, P x x).
   Proof.
     intros. apply X.
   Qed.
   Print t_3_2_1.
   Extraction Language Haskell.
   Recursive Extraction t_3_2_1.

   Theorem t_3_2_2: forall (A : Set) 
                             (P Q : A -> Type),
                     (forall x : A, P x -> Q x) -> 
                         (forall x : A, P x) ->
                             (forall x : A, Q x).
   Proof.
      refine (fun _ _ _ => _).
      refine (fun h g => _ ).
      refine (fun x => _).
      refine ((h x) (g x)).
   Qed.
   Print t_3_2_2.
   Extraction Language Haskell.
   Recursive Extraction t_3_2_2.

   Theorem t_3_2_3: forall (A : Set)
                           (P : A -> Type)  
                           (R : A -> A -> Type),
                     (forall x : A, P x -> forall z : A, R z z) ->
                         (forall x : A, P x) -> forall z : A, R z z.
   Proof.
      intros. apply (X z). apply X0.
   Qed.
   Print t_3_2_3.
   Extraction Language Haskell.
   Recursive Extraction t_3_2_3.

   Theorem t_3_2_4: forall (A : Set)
                           (b : A) 
                           (P : A -> Type)
                           (Q : Type),
                     (forall x : A, P x -> Q) -> (forall x : A, P x) -> Q.
   Proof.
      intros. cut (P b). apply X. apply X0.
   Qed.
   Print t_3_2_4.

   Extraction Language Haskell.
   Recursive Extraction t_3_2_4.

   Theorem t_3_2_5: forall (A : Set)
                           (R : A -> A -> Type),
         forall z : A, (forall (x : A) (y : A), R x y) -> R z z.
   Proof.
      intros. apply X.
   Qed.
   Print t_3_2_5.
   Extraction Language Haskell.
   Recursive Extraction t_3_2_5.
