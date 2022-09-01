   Theorem t54: forall A B : Prop,
                     (A -> B) <-> (~B -> ~A).
   Proof.
      Require Import Classical.
      intros. split. intros. intro. apply H0. apply H. assumption.
      intros. apply NNPP. intro. elim H. assumption. assumption.
   Qed.

   Theorem t54_0: forall A B : Prop,
                     (A <-> B) <-> (~A <-> ~B).
   Proof.
      Require Import Classical.
      intros. split. intros. elim H. intros. 
      split. intros. intro. apply H2. apply H1. assumption.
      intros. intro. apply H2. apply H0. assumption.
      intros. elim H. intros. split. intros. apply NNPP. intro.
      elim H1. intro. contradiction. assumption.
      intros. apply NNPP. intro. apply H0. assumption. assumption.  
   Qed.

   Theorem t54_1: forall A B : Prop,
                     (A -> ~B) <-> (B -> ~A).
   Proof.
       intros. split. intros. intro. elim H. assumption. assumption.
       intros. intro. elim H. assumption. assumption.
   Qed.

   Theorem t54_2: forall A B : Prop,
                     (~A -> B) <-> (~B -> A).
   Proof.
       Require Import Classical.
       intros. split.
       intros. apply NNPP. intro. elim H0. apply H. assumption.
       intros. apply NNPP. intro. elim H0. apply H. assumption.
   Qed.

   Theorem t54_3: forall A B C : Prop,
                     (A /\ B -> C) <-> (A /\ ~C -> ~B).
   Proof.
       Require Import Classical.
       intros. split.
       intros. intro. elim H0. intros. elim H3. apply H. split.
       assumption. assumption.
       intros. apply NNPP. intro. elim H. split.
       apply H0. assumption. apply H0.
   Qed.

   Theorem t54_4: forall A B C : Prop,
                     (A /\ B -> C) -> (~C /\ B -> ~A).
   Proof.
       intros. intro. elim H0. intros. elim H2. apply H. split.
       assumption. assumption.
   Qed.

   Theorem t54_5: forall A B C : Prop,
                      (A /\ ~B -> ~C) -> (A /\ C -> B).
   Proof.
       Require Import Classical.
       intros. apply NNPP. intro. elim H. split. apply H0.
       assumption. apply H0.
   Qed.

   Theorem t54_6: forall A B C : Prop,
                     (C -> A \/ B) -> (~B -> A \/ ~C).
   Proof.
       Require Import Classical.
       intros. generalize(classic(A)). intros. elim H1.
       intros. left. assumption.
       intros. right. intro. apply H2. elim H.
       apply id. intros. contradiction. assumption.
   Qed.

   Theorem t54_7: forall A B C : Prop,
                     (A -> B) <-> (~(A -> B) -> C /\ ~C).
   Proof.
       Require Import Classical.
       intros. split. intros. contradiction.
       intros. apply NNPP. intro. elim H.
       intros. contradiction.
       intro. apply H1. apply H2. assumption.
   Qed.

   Theorem t54_8: forall A B : Prop,
                     (A -> B) <-> (~(A -> B) -> ~A).
   Proof.
       Require Import Classical.
       intros. split. intros. contradiction.
       intros. apply NNPP. intro. elim H.
       intro. apply H1. apply H2. assumption. assumption.
   Qed.

   Theorem t54_9: forall A B : Prop,
                     (A -> B) <-> (~(A -> B) -> B).
   Proof.
       Require Import Classical.
       intros. split. intros. contradiction.
       intros. apply NNPP. intro. elim H1. apply H.
       intro. apply H1. apply H2. assumption. 
   Qed.