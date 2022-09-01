   Theorem t75_5: forall (P Q : Set -> Prop),
                   (forall x : Set, P x <-> Q x)
                     -> ((forall x : Set, P x) <-> (forall x : Set, Q x)).
   Proof.
      intros. split. intros. cut(P x <-> Q x). intros.
      apply H1. apply H0. apply H.
      intros. cut(P x <-> Q x). intros.
      apply H1. apply H0. apply H.
    Qed.

   Theorem t75_6: forall (P Q : Set -> Prop),
                   (forall x : Set, P x <-> Q x)
                     -> ((exists x : Set, P x) <-> (exists x : Set, Q x)).
   Proof.
      intros. split. intros. elim H0. intros. exists x.
      cut(P x <-> Q x). intros. apply H2. assumption. apply H.
      intros. elim H0. intros. exists x.
      cut(P x <-> Q x). intros. apply H2. assumption. apply H.
    Qed.

   Theorem t76: forall (A : Set -> Prop) (b : Set),
                   (forall x : Set, A x) -> (exists x : Set, A x).
   Proof.
      intros. exists b. apply H.
    Qed.

   Theorem t77: forall (A : Set -> Set -> Prop),
                   (exists x : Set, forall y : Set, A y x) 
                   -> (forall x : Set, exists y : Set, A x y).
   Proof.
      intros. elim H. intros. exists x0. apply H0.
    Qed.

   Theorem t78: forall (A B : Set -> Prop),
                   (exists x : Set, A x /\ B x) 
                   -> ((exists x : Set, A x) /\ (exists x : Set, B x)).
   Proof.
      intros. elim H. intros. split.
      exists x. apply H0.
      exists x. apply H0.
    Qed.

   Theorem t78_1: forall (P Q : Set -> Prop),
                   (exists x : Set, P x /\ ~(Q x)) 
               <-> ~(forall x : Set, P x -> Q x).
   Proof.
      intros. split. intros. elim H. intros. intro. elim H0. intros.
      cut(P x -> Q x). intros. apply H3. apply H4. apply H0. apply H1.
      Require Import Classical.
      intros. apply NNPP. intro. apply H. intros. apply NNPP. intro.
      apply H0. exists x. split. assumption. assumption.
    Qed.

   Theorem t78_2: forall (P Q : Set -> Prop) (E : Prop),
                   (exists x : Set, Q x /\ P x /\ E) 
               <-> E /\ (exists x : Set, Q x /\ P x).
   Proof.
      intros. split. intros. elim H. intros. split.
      apply H0. exists x. split. apply H0. apply H0.
      intros. elim H. intros. elim H1. intros. exists x. split.
      apply H2. split. apply H2. apply H0.
    Qed.

   Theorem t79: forall (A B : Set -> Prop),
                   ((forall x : Set, A x) \/ (forall x : Set, B x))
                      -> (forall x : Set, A x \/ B x).
   Proof.
      intros. elim H. intros. left. apply H0.
      intros. right. apply H0.
    Qed.

   Theorem t80: forall (A B : Set -> Prop),
                   ((exists x : Set, A x) -> (forall x : Set, B x))
                      -> (forall x : Set, A x -> B x).
   Proof.
      intros. apply H. exists x. assumption.
    Qed.

   Theorem t80_1: forall (A B : Set -> Prop) (b : Set),
                   ((exists x : Set, A x) -> (exists x : Set, B x))
                      -> (exists x : Set, A x -> B x).
   Proof.
      Require Import Classical.
      intros. apply NNPP. intro. apply H0. exists b. intros.
      elim H. intros. apply NNPP.  intro.  apply H0. exists x. intro. assumption.
      exists b. assumption.
    Qed.

   Theorem t81: forall (A : Set -> Set -> Prop),
                   (forall x y : Set, A x y)
                      -> (forall x : Set, A x x ).
   Proof.
      intros. apply H. 
    Qed.

   Theorem t82: forall (A : Set -> Set -> Prop) (b : Set),
                   (exists x : Set, A x x)
                      -> (exists x : Set, exists y : Set, A x y).
   Proof.
      intros. elim H.  intros. exists x. exists x. assumption. 
    Qed.

   Theorem t83: forall (A : Set -> Prop)
                       (t : Set), 
                   (forall x : Set, A x) -> A t.
   Proof.
      intros. apply H.
   Qed.

   Theorem t84: forall (A : Set -> Prop)
                       (t : Set), 
                   A t -> (exists x : Set, A x).
   Proof.
      intros. exists t. assumption.
   Qed.

   Theorem t85: forall (A : Set -> Prop)
                       (t : Set), 
                   (exists x : Set, A x) \/ (exists x : Set, ~(A x)).
   Proof.
      Require Import Classical.
      intros. generalize(classic(A t)). intros. elim H.
      intros. left. exists t. assumption.
      intros. right. exists t. assumption.
   Qed.

   Theorem t86: forall (P Q : Set -> Prop)
                       (R : Set -> Set -> Prop)
                       (b : Set), 
                   (exists x : Set, (P x /\ (exists y : Set, Q y /\ R x y))) 
               <-> (exists y : Set, (Q y /\ (exists x : Set, P x /\ R x y))).
   Proof.
      intros. split. intros. elim H. intros. elim H0. intros. elim H2. intros.
      elim H3. intros.
      exists x0. split. assumption. exists x. split. assumption. assumption.
      intros. elim H. intros. elim H0. intros. elim H2. intros.
      elim H3. intros.
      exists x0. split. assumption. exists x. split. assumption. assumption.
   Qed.

   Theorem t87: forall (P Q : Set -> Prop)
                       (R : Set -> Set -> Prop)
                       (b : Set), 
                   (exists x : Set, (P x /\ (forall y : Set, Q y -> R x y))) 
                -> (forall y : Set, (Q y -> (exists x : Set, P x /\ R x y))).
   Proof.
      intros. elim H. intros. elim H1. intros.
      exists x. split. assumption. apply H3. assumption.
   Qed.

