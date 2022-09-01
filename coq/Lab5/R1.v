   Parameter A  : Type.
   Parameter op : A -> A -> A.
   
   Infix "<*>" := op (at level 50, left associativity).


   Axiom refl   : forall (x : A), x = x.
   Axiom euclid : forall (x y z : A),
                     x = y -> x = z -> y = z. 
   Axiom eq_op  : forall (x y u v : A),
                     x = y -> u = v -> x <*> u = y <*> v. 

   Axiom op_assoc: forall x y z : A, 
                      (x <*> y) <*> z = x <*> (y <*> z).

   Theorem t_1: forall x y : A,
                   x = y -> y = x.
   Proof.
      intros. generalize (refl x). revert H. apply euclid.
   Qed.

   Theorem t_2: forall x y z : A,
                   x = y -> y = z -> x = z.
   Proof.
      intros. generalize (t_1 x y).      intro.
              generalize (euclid y x z). intro.
      apply H2. apply (H1 H). assumption.
   Qed.

   Theorem t_3_1: forall (x y z : A),
                     x = y -> x <*> z = y <*> z.
   Proof.
      intros. generalize (eq_op x y z z). intros.
              generalize (refl z). intro. apply (H0 H H1).
   Qed.

   Theorem t_3_2: forall (x y z : A),
                     x = y -> z <*> x = z <*> y.
   Proof.
      intros. generalize (eq_op z z x y). intros.
              generalize (refl z). intro. apply (H0 H1 H).
   Qed.

   Theorem t_3_3: forall a b c d : A,
                      a = b <*> c -> b = d -> a = d <*> c.
   Proof.
      intros. generalize (t_3_1 b d c). intros.
              elim H1. assumption. assumption.
   Qed.

   Theorem t_3_4: forall a b c d : A,
                     a = b <*> c -> c = d -> a = b <*> d.
   Proof.
      intros. rewrite H0 in H. assumption.
   Qed.

   Theorem t_3_5: forall a b c d f : A,
                     a = b <*> (c <*> d) -> c = f 
                                    -> a = b <*> (f <*> d).
   Proof.
      intros. generalize(t_3_1 c f d). intro. 
              cut(c <*> d = f <*> d). intro. 
              generalize(t_3_2 (c <*> d) (f <*> d) b). intro.
              cut(b <*> (c <*> d) = b <*> (f <*> d)). intro.
              revert H4. revert H. apply t_2. apply (H3 H2).
              apply(H1 H0). 
   Qed.