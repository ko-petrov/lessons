   (* Лабораторная работа №0   *)
   (* раздел 1 задание 1(11-20)*)
   (* Выполнил Петров Константин *)
   (* ------------------------------------------------- *)
   Theorem t1_1_11: forall A B : Prop,
                         (A -> B -> B) -> A -> B -> A -> B.
   Proof.
      intros. assumption.
   Qed.
   Print t1_1_11.

   Theorem t1_1_12: forall A B : Prop,
                         A -> (B -> A).
   Proof.
      intros. assumption.
   Qed.
   Print t1_1_12.

   Theorem t1_1_13: forall A B G : Prop,
                     (A -> (B -> G)) -> (A -> B) -> (A -> G).
   Proof.
      intros. apply H. assumption. apply H0. assumption.
   Qed.
   Print t1_1_13.

   Theorem t1_1_14: forall A B G : Prop,
                   (A -> B) -> (A -> (B -> G)) -> (A -> G).
   Proof.
      intros. apply H0. assumption. apply H. assumption.
   Qed.
   Print t1_1_14.

   Theorem t1_1_15: forall A B : Prop,
                     (A -> (A -> B)) -> (A -> B).
   Proof.
      intros. apply H. assumption. assumption.
   Qed.
   Print t1_1_15.

   Theorem t1_1_16: forall A B G : Prop,
                ((A -> B) -> (A -> G)) -> (A -> (B -> G)).
   Proof.
      intros. apply H. intros. assumption. assumption.
   Qed.
   Print t1_1_16.

   Theorem t1_1_17: forall A B : Prop,
                (A -> (A -> B)) -> ((A -> B) -> A) -> B.
   Proof.
      intros. apply H. 
      apply H0. intros. apply H. assumption. assumption. 
      apply H0. intros. apply H. assumption. assumption.
   Qed.
   Print t1_1_17.

   Theorem t1_1_18: forall A B : Prop,
                ((B -> A) -> B) -> ((B -> A) -> A).
   Proof.
      intros. apply H0. apply H. assumption.
   Qed.
   Print t1_1_18.

   Theorem t1_1_19: forall A B : Prop,
                A -> (A -> (A -> B)) -> ((A -> B) -> A) -> B.
   Proof.
      intros. apply H0. assumption. assumption.
   Qed.
   Print t1_1_19.

   Theorem t1_1_20: forall A B : Prop,
               (A -> (B -> A) -> B) -> (((A -> B) -> B) -> B).
   Proof.
      intros. apply H0. intros. apply H. 
      assumption. intros. assumption.
   Qed.
   Print t1_1_20.

   (* раздел 1 задание 2(2)*)
   (* ----------------------------------------------------------- *)
   Theorem t1_2_2: forall A B B1 G : Prop,
     (B1 -> (B1 -> A)) -> ((G -> A) -> ((A -> B) -> (B1 -> (G -> B)))).
   Proof.
      intros. apply H1. apply H0. assumption.
   Qed.
   Print t1_2_2.

   (* раздел 1 задание 3(2)*)
   (* ------------------------ *)
   Theorem t1_3_2: forall A B : Prop,
           ((((A -> B) -> A) -> A) -> B) -> B.
   Proof.
      intros. apply H. intros. apply H0. intros. apply H. intros. assumption.
   Qed.
   Print t1_3_2.

   (* раздел 1 задание 5(1-7)*)
   (* ------------------------ *)
   Theorem t1_5_1: forall P Q R S : Prop,
           (P -> Q) -> (Q -> R) -> P -> R.
   Proof.
      intros. apply H0. apply H. assumption.
   Qed.
   Print t1_5_1.

   Theorem t1_5_2: forall P Q R S : Prop,
           (P -> Q -> R) -> (Q -> P -> R).
   Proof.
      intros. apply H. assumption. assumption.
   Qed.
   Print t1_5_2.

   Theorem t1_5_3: forall P Q R S : Prop,
           (P -> R) -> P -> Q -> R.
   Proof.
      intros. apply H. assumption.
   Qed.
   Print t1_5_3.

   Theorem t1_5_4: forall P Q R S : Prop,
           (P -> P -> Q) -> P -> Q.
   Proof.
      intros. apply H. assumption. assumption.
   Qed.
   Print t1_5_4.

   Theorem t1_5_5: forall P Q R S : Prop,
           (P -> Q) -> (P -> P -> Q).
   Proof.
      intros. apply H. assumption.
   Qed.
   Print t1_5_5.

   Theorem t1_5_6: forall P Q R S : Prop,
           (P -> Q) -> (P -> R) -> (Q -> R -> S) -> P -> S.
   Proof.
      intros. apply H1. apply H. assumption. apply H0. assumption.
   Qed.
   Print t1_5_6.

   Theorem t1_5_7: forall P Q R S : Prop,
           ((((P -> Q) -> P) -> P) -> Q) -> Q.
   Proof.
      intros. apply H. intros. apply H0. intros. apply H. intros. assumption.
   Qed.
   Print t1_5_7.

   (* раздел 2 задание 1(1-6)*)
   (* ------------------------ *)
   Theorem t2_1_1: forall P Q R : Prop, 
                  (P -> Q) -> (((P /\ ~R) \/ Q) -> Q).
   Proof.
      intros. elim H0. intro. apply H. apply H1. apply id.
   Qed.

   Theorem t2_1_2: forall P Q R S : Prop,
                  (P /\ ~Q \/ R) -> (R -> P) -> (S -> P).
   Proof.
      intros. elim H. intro. apply H2. assumption.
   Qed.

   Theorem t2_1_3: forall P Q R S : Prop,
         (P /\ ~R \/ (S -> P)) -> ((R -> Q) -> P) -> (S -> P).
   Proof.
      intros. elim H. intro. clear H. apply H2. intro. apply (H2 H1).
   Qed.

   Theorem t2_1_4: forall P Q R S: Prop,
         (R /\ ~Q \/ (S -> P)) -> (R -> P) -> (S -> P).
   Proof.
      intros. elim H. intro. apply H0. apply H2. intro. apply (H2 H1). 


   Theorem t2_1_5: forall P Q R S : Prop,
                  ((R -> P) \/ ~S)
                      -> (R \/ P /\ ~Q) -> (S -> P).
   Proof.
      intros. elim H. intro. clear H. elim H0. assumption. clear H0.
              intro. apply H. intro. contradict H2. assumption.
   Qed.   

   Theorem t2_1_6: forall P Q R : Prop,
                  ((P -> R) \/ Q) -> (Q -> R) -> (P -> R).
   Proof.
       intros. elim H. intros. apply H2. assumption. assumption. 
   Qed.

