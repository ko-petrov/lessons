   Theorem t71: forall (R : Set)
                       (b : R) 
                       (A : R -> Prop)
                       (E : Prop),
              (exists x : R, E -> A x)
                         <-> (E -> exists x : R, A x).
   Proof.
      split. intros. elim H. intros. exists x. apply (H1 H0).
      Require Import Classical.   
      intro. generalize (classic E). intro. elim H0.
             intro. cut (exists x : R, A x). intro. elim H2. intros. 
                    exists x. easy.
                    apply H. apply H1.
      intro. exists b. intro. contradiction.
   Qed.

   Theorem t72: forall (R : Set)
                       (b : R)
                       (A : R -> Prop)
                       (E : Prop),
                   (exists x : R, A x -> E)
                            <-> ((forall x : R, A x) -> E).
   Proof.
      intros. split. intros. elim H. intros. apply H1. apply H0.
      Require Import Classical.
      intros. generalize (classic E). intros. elim H0. 
          intros. exists b. intros. assumption.
      intros. apply NNPP. intro. apply H1. apply H. intros. 
      apply NNPP. intro. elim H2. exists x. intros. contradiction. 

   Theorem t73: forall (R : Set)
                       (b : R)
                       (A : R -> Prop)
                       (E : Prop),
                   (exists x : R, A x -> E)
                            <-> ((forall x : R, A x) -> E).
   Proof.
      intros. split. intros. elim H. intros. apply H1. apply H0.
      Require Import Classical.
      intros. apply NNPP. intro. apply H0. exists b.
      intros. apply H. intros. apply NNPP. intro. 
      elim H0. exists x. intros. contradiction.

   Theorem t74: forall (R : Set)
                       (A : R -> Prop)
                       (E : Prop),
                 (forall x : R, A x -> E)
                           <-> ((exists x : R, A x) -> E).
   Proof.
      intros. split. intros. elim H0. intro.  apply H.
      intro. intros. apply H. exists x. assumption.
   Qed.

   Theorem t75: forall (R : Set)
                       (A : R -> Prop)
                       (E : Prop),
                 (forall x : R, E -> A x)
                           <-> (E -> (forall x : R, A x)).
   Proof.
      intros. split. intros. apply (H x). assumption.
      intros. apply (H H0).
   Qed.

   Theorem t75_1: forall (R : Set)
                       (A B : R -> Prop),
                 (forall x : R, A x -> B x)
                           -> ((forall x : R, A x) -> (forall x : R, B x)).
   Proof.
      intros. apply (H x). apply H0.
   Qed.

   Theorem t75_2: forall A B : Set -> Prop,
                   (forall x : Set, A x -> B x)
                     -> ((exists x : Set, A x) -> exists x : Set, B x).
   Proof.
      intros. elim H0. intros. exists x. apply (H x). assumption.
   Qed.

   Theorem t75_3: forall P Q : Set -> Prop,
                   (forall x : Set, P x -> ~(Q x))
                     <-> ~(exists x : Set, P x /\ Q x).
   Proof.
      intros. split. intros. intro. elim H0. intros. cut(P x -> ~ Q x). intros.
      elim H2. apply H1. apply H1. apply H.
      intros. intro. elim H. exists x. split. assumption. assumption.
   Qed.

   Theorem t75_4: forall (P Q : Set -> Prop)
                         (b : Set)
                         (E : Prop),
                   (forall x : Set, Q x -> P x -> E)
                     <-> ((exists x : Set, P x /\ Q x) -> E).
   Proof.
      intros. split. intros. cut(Q b -> P b -> E). intros.  elim H0. intros.
      elim H2. intros. revert H3. revert H4. apply H. apply H.
      intros. apply H. exists x. split. assumption. assumption.
    Qed.