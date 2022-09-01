   (*Лабораторная работа 1 *)
   (*Выполнил Петров Константин*)
   (*106/109 задач. Не решено: t26_1 t30 t32_2*)
   Theorem t1: forall A B : Prop, A -> (B -> A).
   Proof.
      intros. assumption. 
   Qed.

   Theorem t1_1: forall A : Prop, (A -> ~A) -> ~A.
   Proof.
      intros. intro. apply H. assumption. assumption.
   Qed.

   Theorem t1_2: forall A : Prop, (~A -> A) -> A.
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. elim H0. apply H. assumption. 
   Qed.

   Theorem t2: forall A B C : Prop, 
                   (A -> B) -> ((A -> (B -> C)) -> (A -> C)).
   Proof.
      intros. apply H0. assumption. apply H. assumption.
   Qed.

   Theorem t3: forall A B : Prop, A -> (B -> A /\ B).
   Proof.
      intros. split. assumption. assumption.
   Qed.

   Theorem t4: forall A B : Prop, (A /\ B) -> A.
   Proof.
      intros. elim H. intros. assumption.
   Qed.

   Theorem t5: forall A B : Prop, (A /\ B) -> B.
   Proof.
      intros. elim H. intros. assumption.
   Qed.

   Theorem t6: forall A B : Prop, (A -> A \/ B).
   Proof.
      intros. left. assumption.
   Qed.

   Theorem t7: forall A B : Prop, (B -> A \/ B).
   Proof.
      intros. right. assumption.
   Qed.

   Theorem t8: forall A B C: Prop, 
                       (A -> C) -> ((B -> C) -> (A \/ B -> C)).
   Proof.
      intros. elim H1. assumption. assumption.
   Qed.

   Theorem t8_1: forall A B C: Prop, 
                     (A \/ B -> C) -> (A -> C) /\ (B -> C).
   Proof.
      intros. split. intros. apply H. left. assumption.
      intros. apply H. right. assumption.
   Qed.

   Theorem t8_2: forall A B C: Prop, 
                     (A -> B) -> ((A -> C) -> (A -> B /\ C)).
   Proof.
      intros. split. apply H. assumption. apply H0. assumption.
   Qed.

   Theorem t9: forall A B: Prop, 
                     (A -> B) -> ((A -> ~B) -> ~A).
   Proof.
      intros. intro. apply H0. assumption. apply H. assumption.
   Qed.

   Theorem t9_1: forall A B: Prop, 
                     (~A -> B) -> (~(A -> ~B) -> A).
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. apply H0. intro. contradiction.
   Qed.

   Theorem t9_2: forall A B: Prop, 
                     (A -> B /\ ~B) -> ~A.
   Proof.
      intros. intro. elim H. intros. contradiction. assumption.
   Qed.

   Theorem t10: forall A : Prop, 
                     (~~A->A).
   Proof.
      Require Import Classical.
      intros. apply NNPP. assumption.
   Qed.

   Theorem t11: forall A B: Prop, 
                     (A -> B) -> ((B -> A) -> (A <-> B)).
   Proof.
      intros. split. assumption. assumption.
   Qed.

   Theorem t11_1: forall A B C: Prop, 
                     (A <-> B) -> ((C -> A) <-> (C -> B)).
   Proof.
      intros. split. intros. elim H. intros. apply H2. apply H0. assumption.
      intros. elim H. intros. apply H3. apply H0. assumption.
   Qed.

   Theorem t11_2: forall A B C: Prop, 
                     (A <-> B) -> ((A -> C) <-> (B -> C)).
   Proof.
      intros. split. intros. elim H. intros. apply H0. apply H3. assumption.
      intros. elim H. intros. apply H0. apply H2. assumption.
   Qed.

   Theorem t12: forall A B : Prop, 
                     (A <-> B) -> (A -> B).
   Proof.
      intros. elim H. intros. apply H1. assumption.
   Qed.

   Theorem t13: forall A B : Prop, 
                     (A <-> B) -> (B -> A).
   Proof.
      intros. elim H. intros. apply H2. assumption.
   Qed.

   Theorem t14: forall A B : Prop, 
                     (A <-> B) <-> (A -> B) /\ (B -> A).
   Proof.
      intros. split. 
      intros. elim H. intros. split. assumption. assumption. 
      intros. elim H. intros. split. assumption. assumption. 
   Qed.

   Theorem t14_1: forall A B : Prop, 
                     (A <-> B) <-> (A /\ B) \/ (~A /\ ~B).
   Proof.
      Require Import Classical.
      intros. split. 
         intros. generalize (classic(A)). intros. elim H0. 
            intros. left. split. assumption.
            elim H. intros. apply H2. assumption.
            
            intros. right. split. assumption. 
               elim H. intros. intro. contradiction (H3 H4).
            
            intros. split. 
                elim H. intros. elim H0. intros. assumption.
                   intros. elim H0. intros. contradiction. 
                elim H. intros. elim H0. intros. assumption.
                   intros. elim H0. intros. contradiction.
   Qed.

   Theorem t15: forall A B : Prop, 
                     (A -> B) <-> (~A \/ B).
   Proof.
      Require Import Classical.
      intros. split. 
         intros. generalize (classic(A)). intros. elim H0. 
            intros. right. apply H. assumption.
            intros. left. assumption.
         intros. elim H. intros. contradiction. apply id.
   Qed.

   Theorem t16: forall A B : Prop, 
                     (A -> B) <-> ~(A /\ ~B).
   Proof.
      Require Import Classical.
      intros. split. 
         intros. generalize (classic(A)). intros. elim H0. 
            intros. intro. elim H2. intros. apply H4. apply H. assumption.
            intros. intro. elim H2. intros. apply H4. apply H. assumption.
        intros. apply NNPP. intro. elim H. split. assumption. assumption.
   Qed.

   Theorem t17: forall A B : Prop,
                   (A /\ B) <-> ~ (~ A \/ ~B).
   Proof.
      intros. split. intro.
              intro. elim H0. intro.
              contradict H1. apply H.
              intro. contradict H1. apply H.
      Require Import Classical.
      intro. split. apply NNPP. intro. elim H. left. assumption. 
                    apply NNPP. intro. elim H. right. assumption.
   Qed.

  Theorem t18: forall A B : Prop,
                   (A /\ B) <-> ~(A -> ~B).
   Proof.
      Require Import Classical.
      intros. split. intro. 
         intro. elim H0. apply H. apply H.
      intro. split. apply NNPP. intro. elim H. intros. contradiction.
                    apply NNPP. intro. elim H. intros. assumption.
   Qed. 

   Theorem t19: forall A B : Prop,
                   (A \/ B) <-> ~ (~A /\ ~B).
   Proof.
      Require Import Classical.
      intros. split. intro.
              intro. elim H. intros. contradict H1.  apply H0.
              intro. contradict H1. apply H0.
      intros. generalize (classic(A)). 
         intros. elim H0. intros. left. assumption.
         intros. right. apply NNPP. intro. elim H. split. assumption. assumption.
   Qed.

   Theorem t20: forall A B : Prop, 
                     (A \/ B) <-> (~A -> B).
   Proof.
      Require Import Classical.
      intros. split. 
         intros. elim H. intros. contradiction. apply id. 
         intros. generalize (classic(A)). intros. elim H0.
            intros. left. assumption.
            intros. right. apply H. assumption.
   Qed.

   Theorem t20_1: forall A B : Prop, 
                     (A \/ B) <-> ((A -> B) -> B).
   Proof.
      Require Import Classical.
      intros. split. 
         intros. elim H. intros. apply H0. assumption. apply id.
         intros. generalize (classic(A)). intros. elim H0.
            intros. left. assumption.
            intros. right. apply H. intros. contradiction.
   Qed.









