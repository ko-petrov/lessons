   (*Контрольная задача*)
   (*Выполнил Петров Константин*)
   Theorem t3_2_3: forall A B : Prop, 
                     A /\ B -> (A <-> B).
   Proof.
      split. intro. apply H. intro. apply H.
   Qed.

   Theorem t3_2_1: forall A B C : Prop, 
                     ((A -> B) -> C) <-> (~A -> C) /\ (B -> C).
   Proof.
      Require Import Classical.
      intros. split. intros. split. intros. apply H. intros. contradiction.
      intros. apply H. intros. assumption.
      intros. elim H. intros. apply NNPP. intro.
      apply H3. apply H2. apply H0. apply NNPP. intro. 
      apply H3. apply (H1 H4). 
   Qed.