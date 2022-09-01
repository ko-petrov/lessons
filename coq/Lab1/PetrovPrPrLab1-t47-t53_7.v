   Theorem t47: forall A : Prop,
                     A <-> A.
   Proof.
      split. intro. assumption. intro. assumption.
   Qed.

   Theorem t48: forall A : Prop,
                     A \/ ~A.
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. apply H.
      left. apply NNPP. intro.
      elim H. right. intro. contradiction.
   Qed.

   Theorem t48_1: forall A B : Prop,
                     (A -> B) \/ (B -> A).
   Proof.
      Require Import Classical.
      intros. generalize(classic(A)). intros. elim H.
      intros. right. intros. assumption.
      intros. left. intro. contradiction.
   Qed.

   Theorem t49: forall A : Prop,
                     ~(A /\ ~A).
   Proof.
      intros. intro. elim H. intros. elim H1. assumption.
   Qed.

   Theorem t50: forall A B C : Prop,
                     (A -> B) -> (B -> C) -> (A -> C).
   Proof.
      intros. apply H0. apply H. assumption.
   Qed.

   Theorem t50_1: forall A B C : Prop,
                     (A <-> B) -> ((B <-> C) -> (A <-> C)).
   Proof.
      intros. split. intro. apply H0. apply H. assumption.
      intro. apply H. apply H0. assumption.
   Qed.

   Theorem t50_2: forall A B C : Prop,
                     (A -> B) -> ((C -> A) -> (A -> B)).
   Proof.
      intros. apply H. assumption.
   Qed.

   Theorem t51: forall A B C : Prop,
                     (A -> (B -> C)) <-> (B -> (A -> C)).
   Proof.
      intros. split. intros. apply H. assumption. assumption.
      intros. apply H. assumption. assumption.
   Qed.

   Theorem t52: forall A B C : Prop,
                     (A -> (B -> C)) <-> (A /\ B -> C).
   Proof.
      intros. split. intros. apply H. apply H0. apply H0.
      intros. apply H. split. assumption. assumption.
   Qed.

   Theorem t53: forall A B : Prop,
                     ~A -> (A -> B).
   Proof.
      intros. contradict H. assumption.
   Qed.

   Theorem t53_1: forall A B : Prop,
                     ((A -> B) -> A) -> A.
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. cut(A). intros. contradiction.
      cut(A -> B). intros. apply H. assumption.
      intros. apply NNPP. intro. contradiction.
   Qed.

   Theorem t53_2: forall A B C : Prop,
                     (((A -> B) -> C) -> (A -> B)) -> (A -> B).
   Proof.
      Require Import Classical.
      intros. generalize(Peirce(B)). intros. apply H1. intros.
      apply H. intro.  apply NNPP. intro. apply H2. apply H3. assumption.
      assumption.
   Qed.

   Theorem t53_3: forall A B : Prop,
                     ((((A -> B) -> A) -> A) -> A) -> A.
   Proof.
      Require Import Classical.
      intros. generalize(Peirce(A)). intros. apply H0. intros.
      apply H. intros.
      apply H2. intro.  apply NNPP. intro. apply H1. assumption.
   Qed.

   Theorem t53_4: forall A B : Prop,
                     ((((A -> B) -> A) -> A) -> B) -> B.
   Proof.
      intros. apply H. intros. apply H0. intros.
      apply H. intros. assumption.
   Qed.

   Theorem t53_5: forall A B C : Prop,
                     ((((((A -> B) -> C) -> C) -> A) -> A) -> B) -> B.
   Proof.
      intros. apply H. intros. apply H0. intros. apply H1. intros.
      apply H. intros. assumption.
   Qed.

   Theorem t53_6: forall A B C D : Prop,
                     ((((((((A -> B) -> C) -> C) -> D) -> D) -> A) -> A) -> B) -> B.
   Proof.
      intros. apply H. intros. apply H0. intros. apply H1. intros. apply H2. intros.
      apply H. intros. assumption.
   Qed.

   Theorem t53_7: forall A B : Prop,
                     ((A -> B) -> B) -> ((B -> A) -> A).
   Proof.
      Require Import Classical.
      intros. generalize(Peirce(A)). intros. apply H1. intros.
      apply H0. apply H. intros. apply NNPP. intro. apply H2. assumption.
   Qed.