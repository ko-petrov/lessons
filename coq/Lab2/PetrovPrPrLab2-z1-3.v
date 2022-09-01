   Theorem z2_1_a: forall A : Prop, 
                   (A \/ A) <-> (A /\ A).
   Proof.
      intros. split.
      intros. elim H. intros. split. assumption. assumption.
      intros. split. assumption. assumption.
      intros. left. apply H.
   Qed.
   Theorem z2_1_a': forall A : Prop, 
                   (A /\ A) <-> (A).
   Proof.
      intros. split.
      intros. elim H. intros. assumption.
      intros. split. assumption. assumption.
   Qed.

   Theorem z2_1_a'': forall A : Prop, 
                   (A \/ A) <-> (A).
   Proof.
      intros. split.
      intros. elim H. intros. assumption. apply id.
      intros. left. assumption.
   Qed.

   Theorem z2_2_a: forall A : Prop, 
                   (~~A) <-> (A).
   Proof.
      Require Import Classical.
      intros. split.
      intros. apply NNPP. intro. contradiction. 
      intros. intro. contradiction.
   Qed.

   Theorem z2_3_a: forall (A B C : Type -> Prop),
           (forall x : Type, (A x \/ B x) -> C x) <->
               (forall x : Type,  A x -> C x)
                   /\ forall x : Type,  B x -> C x.
   Proof.
      intros. split. intros. split. intros. apply H. left. assumption.
                     intros. apply H. right. assumption.
      intros. elim H0. elim H. clear H. intros. revert H2. apply H.
              intros. revert H1. elim H. intros. revert H3. apply H2.
  Qed.
