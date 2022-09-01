   (*Лабораторная работа №2*)
   (*Выполнил Петров Константин*)
   (*45 задач*)
   Theorem t55: forall (R : Set)
                       (A : R -> Prop),
                 (forall x : R, A x) <-> (forall y : R, A y).
   Proof.
      intros. split. intros. apply H.
      intros. apply H.
   Qed.

   Theorem t56: forall (R : Set)
                       (A : R -> Prop),
                 (exists x : R, A x) <-> exists y : R, A y.       
   Proof.
      intros. split. intro. apply H. intros. apply H.
   Qed.

   Theorem t57: forall (R : Set)
                       (A : R -> R -> Prop),
                 (forall x y : R, A x y) <-> (forall y x : R, A y x).
   Proof.
      intros. split. intros. apply H.
      intros. apply H.
   Qed.

   Theorem t58: forall (R : Set)
                       (A : R -> R -> Prop),
       (exists x : R, exists y : R, A x y) <-> (exists y : R, exists x : R, A y x).
   Proof.
      intros. split. intros. apply H.
      intros. apply H.
   Qed.

   Theorem t59: forall (R : Set)
                       (A : R -> Prop),
                 ~(forall x : R, A x) <-> (exists x : R, ~(A x)).       
   Proof.
      Require Import Classical.
      intros. split. intro. apply NNPP. intro.
      elim H. intros. apply NNPP. intro. elim H0. exists x. intro.
      contradiction.
      intros. intro. elim H. intros. apply H1. apply H0.
   Qed.

   Theorem t60: forall (R : Set)
                       (A : R -> Prop),
                 ~(exists x : R, A x) <-> (forall x : R, ~(A x)).       
   Proof.
      intros. split. intros. intro. elim H. exists x. assumption.
      intros. intro. elim H0. intros. apply H with x. assumption.
   Qed.

   Theorem t61: forall (R : Set)
                       (A : R -> Prop),
                 (forall x : R, A x) <-> ~(exists x : R, ~(A x)).       
   Proof.
      Require Import Classical.
      intros. split. intro. intro. elim H0. intros. apply H1. apply H.
      intros. apply NNPP. intro. elim H. exists x. intro. contradiction. 
   Qed.

   Theorem t62: forall (R : Set)
                       (A : R -> Prop),
                 (exists x : R, A x) <-> ~(forall x : R, ~(A x)).       
   Proof.
      Require Import Classical.
      intros. split. intro. intro. elim H. intros. apply H0 with x. assumption.
      intros. apply NNPP. intro. elim H. intros. intro. apply H0. exists x. apply H1.
   Qed.

   Theorem t63: forall (R : Set) 
                       (A B : R -> Prop),
                  (forall x : R, A x /\ B x)
                         <-> (forall x : R, A x) /\ (forall x : R, B x).
   Proof.
      split. intro. split. intros. cut (A x /\ B x). intro. 
              apply H0. apply H.
             intros. cut (A x /\ B x). intro. apply H0. apply H.     
      intros. split. apply H. apply H.
   Qed.

  Theorem t64: forall (R : Set)
                      (b : R)
                      (A : R -> Prop)
                      (E : Prop),
                   (E /\ forall x : R, A x) <-> (forall x : R, A x /\ E).
   Proof.
      (* firstorder. *)
      split. intros.  split. apply H. apply H.
             intro. split. cut (A b /\ E). intro. apply H0.
             apply H. 
             intros. elim (H x). intros. assumption.
   Qed.

   Theorem t65: forall (R : Set)
                       (b : R)
                       (A : R -> Prop)
                       (E : Prop),
                 (E \/ forall x : R, A x)
                               <-> (forall x : R, E \/ A x).
   Proof.
      intros. split. intro. elim H. intros. left. assumption.
              intros. right. apply H0.
      Require Import Classical.
      intro. apply NNPP. intro. cut(E \/ A b). intros. elim H0. 
         elim H1. intros. left. assumption.
      intros. right. intros. elim (H x). intros. elim H0. left. assumption.
      apply id. apply H.
   Qed.

   Theorem t66: forall (R : Set)
                       (A B : R -> Prop),
                 (exists x : R, (A x) \/ (B x) )
                           <-> (exists x : R, A x) \/ (exists x : R, B x).
   Proof.
      intros. split. intro. elim H. intros. elim H0. intros.
         left. exists x. assumption.
         intros. right. exists x. assumption.
      intros. elim H. intros. elim H0. intros.
      exists x. left. assumption.
      intros. elim H0. intros. exists x. right. assumption.
   Qed.

   Theorem t67: forall (R : Set)
                       (b : R)
                       (A : R -> Prop)
                       (E : Prop),
                 (exists x : R, E \/ (A x) )
                           <-> E \/ (exists x : R, A x).
   Proof.
      intros. split. intro. elim H. intros. elim H0. intros.
         left. assumption.
         intros. right. exists x. assumption.
      intros. elim H. intros. cut(E \/ A b). intros. elim H1.
      intros. exists b. assumption. intros. exists b. assumption.
      left. assumption.
      intros. elim H0. intros. exists x. right. assumption.
   Qed.

   Theorem t68: forall (R : Set)
                       (A : R -> Prop)
                       (E : Prop),
                 (exists x : R, E /\ (A x) )
                           <-> E /\ (exists x : R, A x).
   Proof.
      intros. split. intro. elim H. intros. elim H0. intros.
         split. assumption. exists x. assumption.
      intros. elim H. intros. elim H1. intros. exists x. split.
      assumption. assumption.
   Qed.

   Theorem t69: forall (R : Set)
                       (b : R) 
                       (E : Prop), 
                   (forall x : R, E) <-> E.
   Proof.
      split. intro. apply (H b).
      easy. 
   Qed.  

   Theorem t70: forall (R : Set)
                       (b : R)
                       (A : R -> Prop)
                       (E : Prop),
                 (exists x : R, E) <-> E.
   Proof.
      intros. split. intro. elim H. intros. assumption.
      intros. exists b. assumption.
   Qed.

