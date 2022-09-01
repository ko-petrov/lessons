   Require Import Arith.

(* Задание 1 *)

   Fixpoint plus' (n m : nat) {struct n} : nat :=
      match n with
        | O   => m
        | S n => S (plus' n m)
      end.

   Eval compute in plus' 0 3.
   Eval compute in plus' 0 0.
   Eval compute in plus' 444 5.

   Theorem plus_0_n: forall n : nat, 
                        plus' 0 n = n.
   Proof.
      intros. reflexivity. 
   Qed.

   Theorem plus_n_O: forall n,
                        n = plus' n 0.
   Proof.
      intros.
      induction n. reflexivity.
      simpl. rewrite <- IHn. reflexivity.
   Qed.

   Lemma abc: forall n m,
                 S (plus' n m) = plus' n (S m).
   Proof.
      intros. induction n.
      reflexivity.
      simpl. f_equal. rewrite IHn. reflexivity.  
   Qed.

   Theorem Свойство'': forall n m,
                          plus' n m = plus' m n.
   Proof.
      intros. induction n.
              simpl. apply plus_n_O.
              simpl. rewrite IHn. apply abc.
   Qed.

(* Задание 3 *)

Fixpoint mult (n m : nat) {struct n}: nat :=
      match n with
        | O    => O
        | S n' => plus m (mult n' m)
      end.

Theorem sv1: forall m,
                          mult 0 m = 0.
   Proof.
   intros. simpl. reflexivity.

Theorem sv2: forall m,
                          mult m 0 = 0.
   Proof.
   intros. induction m. simpl. reflexivity.
   simpl. apply IHm.
   Qed.