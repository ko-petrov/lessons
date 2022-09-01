   (*Контрольная задача*)
   (*Выполнил Петров Константин*)

   Theorem t2: forall (R : Set)
                       (P Q : R -> Prop),
                 ~(exists x : R, P x) -> (forall x : R, P x -> Q x).       
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. elim H. exists x. assumption.
   Qed.

   Theorem t4: forall (R : Set)
                       (P : R -> Prop)
                       (A : Prop),
                 (forall x : R, ~(P x)) -> 
                 (A /\ ~A -> (exists x : R, P x)).       
   Proof.
      Require Import Classical.
      intros. elim H0.  intros. contradiction.
   Qed.
