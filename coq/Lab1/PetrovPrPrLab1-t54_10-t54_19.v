   Theorem t54_10: forall A B C : Prop,
                     (A -> C) -> (B -> C) -> (A \/ B) -> C.
   Proof.
      intros. elim H1. intros. apply H. assumption.
      intros. apply H0. assumption.
   Qed.

   Theorem t54_11: forall A1 A2 B : Prop,
                     (A1 -> B) -> (A2 -> B) -> ((A1 /\ ~A2) \/ (~A1 /\ A2)) -> B.
   Proof.
      intros. elim H1. intros. apply H. apply H2.
      intros. apply H0. apply H2.
   Qed.

   Theorem t54_12: forall A B C D : Prop,
                     (A -> C) -> (B -> D) -> (A \/ B) -> (C \/ D).
   Proof.
      intros. elim H1. intros. left. apply H. assumption.
      intros. right. apply H0. assumption.
   Qed.

   Theorem t54_13: forall A B C D : Prop,
                     (C -> A) -> (C -> B) -> (~A \/ ~B) -> ~C.
   Proof.
      intros. elim H1. intros. intro. elim H2. apply H. assumption.
                       intros. intro. elim H2. apply H0. assumption.
   Qed.

   Theorem t54_14: forall A B1 B2 : Prop,
                (A -> B1) -> (A -> B2) -> ((~B1 /\ ~(~B2)) \/ (~(~B1) /\ ~B2)) -> ~A.
   Proof.
      intros. intro. elim H1. intros. elim H3. intros. apply H4. apply H. assumption.
                             intros. elim H3. intros. apply H5. apply H0. assumption.
   Qed.

   Theorem t54_15: forall A B C D : Prop,
                     (C -> A) -> (D -> B) -> (~A \/ ~B) -> (~C \/ ~D).
   Proof.
      intros. elim H1. intros. left. intro. apply H2. apply H. assumption.
      intros. right. intro. apply H2. apply H0. assumption.
   Qed.

   Theorem t54_16: forall A1 A2 A3 B : Prop,
                     (A1 -> B) -> (A2 -> B) -> (A3 -> B) -> (A1 \/ A2 \/ A3) -> B.
   Proof.
      intros. elim H2. intros. apply H. assumption.
      intros. elim H3. intros. apply H0. assumption.
      intros. apply H1. assumption.
   Qed.

   Theorem t54_17: forall A1 A2 A3 B1 B2 B3 : Prop,
    (A1 -> B1) -> (A2 -> B2) -> (A3 -> B3) -> (A1 \/ A2 \/ A3) -> (B1 \/ B2 \/ B3).
   Proof.
      intros. elim H2. intros. left. apply H. assumption.
      intros. elim H3. intros. right. left. apply H0. assumption.
      intros. right. right. apply H1. assumption.
   Qed.

   Theorem t54_18: forall A B1 B2 B3 : Prop,
    (A -> B1) -> (A -> B2) -> (A -> B3) -> (~B1 \/ ~B2 \/ ~B3) -> ~A.
   Proof.
      intros. intro. elim H2. intros. apply H4. apply H. assumption.
      intros. elim H4. intros. apply H5. apply H0. assumption.
      intros. apply H5. apply H1. assumption.
   Qed.

   Theorem t54_19: forall A1 A2 A3 B1 B2 B3 : Prop,
              (A1 -> B1) -> (A2 -> B2) -> (A3 -> B3) -> 
              (~B1 \/ ~B2 \/ ~B3) -> (~A1 \/ ~A2 \/ ~A3).
   Proof.
      intros. elim H2. intros. left. intro. apply H3. apply H. assumption.
      intro. elim H3. intros. right. left. intro. apply H4. apply H0. assumption.
      intros. right. right. intro. apply H4. apply H1. assumption.
   Qed.