
   Parameter A  : Type.
   Parameter op : A -> A -> A.
   Parameter e  : A.
   
   Infix "<*>" := op (at level 50, left associativity).

   Axiom euclid : forall (x y z : A),
                     x = y -> x = z -> y = z.
   Axiom eq_op  : forall (x y u v : A),
                     x = y -> u = v -> x <*> u = y <*> v. 

   Axiom op_assoc        : forall x y z : A, 
                              (x <*> y) <*> z = x <*> (y <*> z).
   Axiom e_neutral_right : forall x : A,
                              x <*> e = x.
   Axiom e_neutral_left  : forall x : A,
                              e <*> x = x.

   Theorem t_1: forall x : A, x = x.
   Proof.
      intros. generalize (e_neutral_right x).    intro.
              generalize (euclid (x <*> e) x x). intro.
      apply (H0 H). apply H.
   Qed. 

   Theorem t_2: forall x y : A,
                   x = y -> y = x.
   Proof.
      intros. rewrite H. apply t_1.
   Qed.

   Theorem t_3: forall x y z : A,
                   x = y -> y = z -> x = z.
   Proof.
      intros. generalize (t_2 x y).      intro.
              generalize (euclid y x z). intro.
      apply H2. apply H1. assumption. assumption.
   Qed.

   Theorem t_3_1: forall (x y z : A),
                     x = y -> x <*> z = y <*> z.
   Proof.
      intros. generalize (t_1 z). intro.
              generalize (eq_op x y z z). intro.
              apply H1. assumption. apply t_1.
   Qed.

   Theorem t_3_2: forall (x y z : A),
                     x = y -> z <*> x = z <*> y.
   Proof.

   Theorem t_3_3: forall a b c d : A,
                     a = b <*> c -> b = d -> a = d <*> c.
   Proof.

   Theorem t_3_3': forall a b c d : A,
                      a = b <*> c -> b = d -> a = d <*> c.
   Proof.

   Theorem t_3_4: forall a b c d : A,
                     a = b <*> c -> c = d -> a = b <*> d.
   Proof.

   Theorem t_3_5: forall a b c d f : A,
                     a = b <*> (c <*> d) -> c = f 
                                    -> a = b <*> (f <*> d).
   Proof.


   (* ------------------------------------ *)
   (* Доказательство единственности правой *)
   (* единицы (слабая форма)               *)
   (* ------------------------------------ *)
   Theorem t_6: forall a : A,
                   (forall x : A, x <*> a = x) -> a = e.
   Proof.
      intros. rewrite <- (e_neutral_left a). apply H.
     (*
      intros. generalize (e_neutral_left a). intro. 
              rewrite <- H0. apply H.
     *)
     (*
      intros. cut (e <*> a = e). intros.
      cut (e <*> a = a). intros. rewrite H0 in H1.
      revert H1. apply t_2. apply e_neutral_left.
      apply H.
     *)
   Qed.


   (* ----------------------------------- *)
   (* Доказательство единственности левой *)
   (* единицы (слабая форма)              *)
   (* ----------------------------------- *)
   Theorem t_7: forall a : A,
                   (forall x : A, a <*> x = x) -> a = e.
   Proof.
      intros. rewrite <- (e_neutral_right a). apply H.
   Qed.



   (* --------------------------------------------- *)
   (* Доказательство существования и единственности *)
   (* левой единицы                                 *)
   (* --------------------------------------------- *)
   Theorem t_15: exists! x : A, forall a : A, 
                                   x <*> a = a.
   Proof.
       compute. exists e. apply conj. apply e_neutral_left.
       intros. cut (x' <*> e = e). intro. rewrite <- H0.  
       apply e_neutral_right. apply H.
   Qed.


   (* --------------------------------------------- *)
   (* Доказательство существования и единственности *)
   (* правой единицы                                *)
   (* --------------------------------------------- *)
   Theorem t_15': exists! x : A, forall a : A, 
                                    a <*> x = a.
   Proof.


   (* ------------------------------------------------ *)
   (* Доказательство совпадения левой и правой единицы *)
   (* ------------------------------------------------ *)
   Theorem t_20: forall (i j : A),
                    (forall (a : A), a <*> i = a)
                 /\ (forall (b : A), j <*> b = b) -> i = j.
   Proof.
