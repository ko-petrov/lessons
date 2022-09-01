   Theorem t34: forall A : Prop,
                     (A /\ A) <-> A.
   Proof.
      intros. split. intros. apply H. intros. split. assumption. assumption.
   Qed.

   Theorem t35: forall A : Prop,
                     (A \/ A) <-> A.
   Proof.
      intros. split. intros. elim H. apply id. apply id.
      intros. left. assumption.
   Qed.

   Theorem t36: forall A : Prop,
                     A /\ (A \/ A) <-> A.
   Proof.
      intros. split. intros. elim H. intros. assumption.
      intros. split. assumption. left. assumption.
   Qed.

   Theorem t37: forall A : Prop,
                     (A \/ A /\ A) <-> A.
   Proof.
      intros. split. intros. elim H. intros. assumption.
      intros. apply H0. intros. left. assumption.
   Qed.

   Theorem t38: forall A B : Prop,
                     A /\ (B \/ ~B) <-> A.
   Proof.
      Require Import Classical.
      intros. split. intros. elim H. intros. assumption.
      intros. split. assumption. apply (classic(B)).
   Qed.

   Theorem t39: forall A B : Prop,
                     A \/ (B /\ ~B) <-> A.
   Proof.
      intros. split. intros. elim H. apply id. intros. elim H0.
      intros. contradiction.
      intros. left. assumption.
   Qed.

   Theorem t40: forall A B : Prop,
                     (A /\ B /\ ~B) <-> (B /\ ~B).
   Proof.
      intros. split. intros. elim H. intros. assumption. 
      intros. elim H. intros. contradiction.
   Qed.

   Theorem t41: forall A B : Prop,
                     (A \/ B \/ ~B) <-> (B \/ ~B).
   Proof.
      Require Import Classical.
      intros. split. intros. apply classic.
      intros. right. apply classic.
   Qed.

   Theorem t42: forall A B : Prop,
                     ~(A /\ B) <-> (~A \/ ~B).
   Proof.
      Require Import Classical.
      intros. split. generalize(classic(A)). intros. elim H.  
      intros. right. intro. elim H0. split.  assumption. assumption.
      intros. left. assumption.
      intros. elim H. intros. intro. elim H1. intros. contradiction.
      intros. intro. elim H1. intros. contradiction. 
   Qed.

   Theorem t43: forall A B : Prop,
                     ~(A \/ B) <-> (~A /\ ~B).
   Proof.
      intros. split. intros. split. intro. elim H. left. assumption.
      intro. elim H. right. assumption.
      intros. intro. elim H. intros. 
      apply H. elim H0. intro. contradiction. apply id.  
   Qed.

   Theorem t44: forall A B : Prop,
                     ~(A -> B) <-> (A /\ ~B).
   Proof.
      Require Import Classical.
      intros. split. intros. split. apply NNPP. intro. elim H. intros.
         contradiction. intro. elim H. intros. assumption.
      intros. elim H. intros. intro. elim H1. apply H2. assumption.
   Qed.

   Theorem t45: forall A B : Prop,
                     ~(A <-> B) <-> (A \/ B) /\ ~(A /\ B).
   Proof.
      Require Import Classical.
      intros. split. intros. split. apply NNPP. intro. elim H. split. intros.
         elim H0. left. assumption. intros.
         elim H0. right. assumption.
         intro. elim H0. intros. elim H. split.
         intro. assumption. intro. assumption.
      intros. elim H. intros. intro. elim H2. intros. elim H0. intros. elim H1.
         split. assumption. apply H3. assumption.
      intros. elim H1. split. apply H4. assumption. assumption.
   Qed.

   Theorem t45_1: forall A B : Prop,
                     ~(A <-> B) <-> (A /\ ~B) \/ (~A /\ B).
   Proof.
      Require Import Classical.
      intros. generalize(classic(A)). intros. elim H. intros.
         split. intros. left. split. assumption. intro. elim H1.
         split. intro. assumption. intro. assumption.
         intros. intro. elim H2. intros. elim H1. intros. elim H5.
            intros.  elim H7. apply H3. assumption.
         intros. elim H5. intros. contradiction.
      split. intros. right. split. assumption. apply NNPP. intro. elim H1.
         split. intro. contradiction. intros. contradiction.
         intros. elim H1. intros. elim H2. intros. contradiction.
         intros. elim H2. intros. intro. elim H5. intros. apply H0. apply H7. assumption.
   Qed.

   Theorem t46: forall A B : Prop,
                     ~~A <-> A.
   Proof.
      Require Import Classical.
      intros. generalize(classic(A)). intros. elim H. intros. split. intro. assumption.
      intro. intro. contradiction.
      intro. split. intro. contradiction.
      intro. contradiction.
   Qed.