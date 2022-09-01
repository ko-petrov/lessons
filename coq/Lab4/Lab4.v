(* Лабораторная работа №4 *)
(* Автор: Петров Константин*)
   Theorem t2_1: forall A B : Prop,
                         (1 + 2) * 2 = 6.
   Proof.
      reflexivity.
   Qed.
   
   Theorem t2_2: forall x y z : Type,
                         x = y -> y = z -> x = z.
   Proof.
      intros.
      rewrite H.
      assumption.
   Qed.

   Theorem t2_2': forall x y z : Type,
                         x = y -> y = z -> x = z.
   Proof.
      intros.
      transitivity y.
      assumption.
      assumption.
   Qed.

   Variable f: nat -> nat.
   Hypothesis f00: f 0 = 0.
   Hypothesis f10: f 1 = f 0.
   
   Theorem Ex_f1     : forall k : nat, k=0 \/ k=1 -> f k = 0.
      intros. elim H. intros. rewrite H0. apply f00.
      intros. rewrite H0. rewrite f10. apply f00.
   Qed.

   Theorem Ex_f2     : f (f 1) = f 1.
      intros. rewrite f10. rewrite f00. apply f00.
   Qed.

   Theorem Ex_compute: f (5 - 2 * 2) = f (3 - 3).
      intros. compute. rewrite f10. reflexivity.
   Qed.

   Variable U : Set.
   Variable m : U -> U -> U.
   
   Hypothesis com: forall x y : U,   m x y = m y x.
   Hypothesis ass: forall x y z : U, m (m x y) z = m x (m y z).
   Hypothesis idp: forall x : U,     m x x = x.
   
   Theorem XYX_XY: forall (x y : U), m (m x y) x = m x y.
      intros. rewrite com. rewrite <- ass. rewrite idp. reflexivity.
   Qed.

   Theorem t2_5_a: forall (x y z : Set)
                          (t : Prop),
                     t=t.
   Proof.
      intros. reflexivity.
   Qed.

   Theorem t2_5_b: forall (x y z : Set)
                          (t : Prop),
                     x=y -> y=x.
   Proof.
      intros. rewrite H. reflexivity.
   Qed.

   Theorem t2_5_v: forall (x y z : Set)
                          (t : Prop),
                     x=y -> (y = z -> x = z).
   Proof.
      intros. rewrite H. assumption.
   Qed.

   Theorem t2_5_g: forall (x y z : Set)
                          (t : Prop),
                     x=y -> (x = z -> y = z).
   Proof.
      intros. rewrite <- H. assumption.
   Qed.

   Theorem t2_5_d: forall (x y z : Set)
                          (t : Set -> Prop),
                     x=y -> (t x -> t y).
   Proof.
      intros. rewrite H in H0. assumption.
   Qed.
   
   Theorem t2_5_e: (forall x : Type, x = x) /\
                      (forall x y : Type, x = y -> y = x) /\
                        (forall x y z : Type, x = y -> y = z -> x = z)
                  <-> (forall x : Type, x = x) /\
                         (forall x y z : Type, x = y -> x = z -> y = z).
   Proof.
      intros. apply conj.
      intro. elim H. intros. elim H1. intros. clear H. clear H1.
             apply conj. apply H0.
             intros. apply H2. revert H.
             apply H3 with (z:=y) (x:=z) (y:=x). apply H2.
             assumption.
      intros. apply conj. elim H. intros. apply H0.
              apply conj. intros until y. elim H. intros.  
              apply H1 with (x:=x) (y:=y) (z:=x). assumption.
              apply H0.
              elim H. intros. clear H.
              apply H1 with (x:=y) (y:=x) (z:=z).
              apply H1 with (z:=x) (x:=x). assumption.
              apply H0. apply H3.
   Qed.

   Theorem t2_6_a: forall 
                          (B : Set -> Prop),
                    forall x : Set, (B x <-> exists y, x = y /\ B y).
   Proof.
      intros. split. intros.  exists x. split. reflexivity. assumption.
      intros. elim H. intros. elim H0. intros. rewrite <- H1 in H2.
      assumption.
   Qed.

   Theorem t2_6_b: forall 
                          (B : Set -> Prop),
                    forall x : Set, (B x <-> forall y, x = y -> B y).
   Proof.
      intros. split. intros. rewrite H0 in H. assumption.
      intros. apply H. reflexivity.
   Qed.


   Theorem t2_6_v: forall (B : Set -> Prop),
                    forall x : Set, exists y : Set, x = y.
   Proof.
      intros. exists x. reflexivity.
   Qed.

   Theorem t3_1_1: forall (A : Type)
                           (P : A -> Prop)
                           (t : A),
                       exists! x : A, x = t.
   Proof.
      intros. compute. exists t. apply conj. reflexivity. symmetry.
                 assumption.  
   Qed.

   Theorem t3_1_2: forall (A : Type)
                           (P : A -> Prop)
                           (r s : A),
               P r -> P s -> (exists! x : A, P x) -> r = s.
   Proof. 
      intros. compute in H1. elim H1. intros. elim H2. intros. clear H1.
              cut (x = s). intro. cut (x = r). intro.   
              rewrite <- H1. rewrite H5. reflexivity. 
              revert H. apply H4. revert H0. apply H4.
   Qed. 

   Theorem t3_1_3: forall (A : Type)
                           (P : A -> Prop),
            (exists x : A, forall y : A, x = y <-> P y)
                                      -> exists x : A, P x.
   Proof.
      intros. compute in H. elim H. intros. exists x. clear H.
              apply (H0 x). reflexivity. 
   Qed.


