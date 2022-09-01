   (* Лабораторная работа №3, раздел №2, Задание №4 *)
   (* Автор: Петров К., 3 курс, ИСиТ (02.12.2020)   *)
   (* --------------------------------------------- *)
   (* \/ = forall f. (A -> f) -> (B -> f) -> f      *)
   (* /\ = forall f. (A -> B -> f) -> f             *)
   (* ~A = A -> forall f. f                         *)
   (* --------------------------------------------- *)

   Theorem t1: forall A B G : Type,
        (forall t : Type, (((A -> G) -> (B -> G) -> t) -> t))
     -> ((forall t : Type, (A -> t) -> (B -> t) -> t) -> G).
   Proof.
	intros. apply X. apply X0. 
   Qed.
   Extraction Language Haskell.
   Recursive Extraction t1.

   Theorem t2: forall A B G : Type,
        ((forall t : Type, (A -> t) -> (B -> t) -> t) -> G) 
        -> (forall t : Type, (((A -> G) -> (B -> G) -> t) -> t)).
   Proof.
	intros. apply X0. intros. apply X. intros. apply X2.
        assumption. intros. apply X. intros. apply X3. apply X1.
   Qed.
   Print t2.
   Extraction Language Haskell.
   Recursive Extraction t2.

   Theorem t3: forall A B : Type,
          (forall t : Type, ((A -> forall t : Type, t)
                                 -> t) -> (B -> t) -> t)
          -> (A -> B).
   Proof.
	intros. apply X. intros. apply (X1 X0). apply id.
   Qed.
   Print t3.
   Extraction Language Haskell.
   Recursive Extraction t3.

   Theorem t4: forall D T : Type,
          (forall t : Type, (D -> t) -> (T -> t) -> t)
          -> (D -> T) -> T.
   Proof.
	intros. apply X. apply id. assumption. apply id. 
   Qed.
   Print t4.

   Theorem t5: forall A : Type,
                (A -> (forall f : Type, (A -> 
                (A -> forall f : Type, f) -> f) -> f)) 
                   -> (A -> forall f : Type, f).
   Proof.
	intros. apply (X X0). intros. apply (X2 X1).
   Qed.
   Print t5.

   Theorem t6: forall s : Type,
               (s -> (s -> forall a : Type, a))
                  -> (s -> forall a : Type, a).
   Proof.
	intros. apply X. assumption. assumption.
   Qed.
   Print t6.

   Theorem t7: forall s : Type,
               (s -> forall a : Type, a)
                 -> (s -> (s -> forall a : Type, a)).
   Proof.
	intros. apply (X X0).
   Qed.
   Print t7.

   Theorem t8: forall A B : Type,
               (A -> B) -> ((B -> forall f : Type, f) 
                 -> (A -> forall f : Type, f)).
   Proof.
	intros. apply (X0 (X X1)).
   Qed.
   Print t8.

   Theorem t9: forall A B : Type,
               (A -> B) -> ((forall f : Type, (A -> 
               (B -> forall f : Type, f)
                  -> f) -> f) 
                  -> forall f : Type, f).
   Proof.
	intros. apply X0. intros. apply (X2 (X X1)).
   Qed.
   Print t9.

   Theorem t10: forall A B : Type,
               (forall t : Type, (A -> t) -> (B -> t) -> t) 
             -> ((A -> forall t : Type, t) -> B).
   Proof.
	intros. apply X. intros. apply (X0 X1). apply id.
   Qed.
   Print t10.