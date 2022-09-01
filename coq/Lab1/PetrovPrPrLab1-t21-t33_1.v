   Theorem t21: forall A B : Prop, (A /\ B) <-> (B /\ A).
   Proof.
      intros. split. intro. split. apply H. apply H. 
      intro. split. apply H. apply H. 
   Qed.

   Theorem t22: forall A B : Prop, (A \/ B) <-> (B \/ A).
   Proof.
      intros. split. intro. elim H. intro. right. assumption. 
      intro. left. assumption.
      intro. elim H. intro. right. assumption.
      intro. left. assumption.
   Qed.

   Theorem t23: forall A B : Prop, (A <-> B) <-> (B <-> A).
   Proof.
      intros. split. intro. split. intro. apply H. assumption.
      intro. apply H. assumption. 
      intro. split. intro. apply H. assumption.
      intro. apply H. assumption.
   Qed.

   Theorem t24: forall A B C : Prop, 
                     A /\ (B /\ C) <-> (A /\ B) /\ C.
   Proof.
      intros. split. intro. split. split. apply H. apply H. apply H.
      intro. split. apply H. split. apply H. apply H.
   Qed.

   Theorem t25: forall A B C : Prop, 
                     A \/ (B \/ C) <-> (A \/ B) \/ C.
   Proof.
      intros. split. intro. elim H. intro. left. left. assumption.
      intro. elim H0. intro. left. right. assumption.
      intro. right. assumption.
      intro. elim H. intro. elim H0. intro. left. assumption.
      intro. right. left. assumption.
      intro. right. right. assumption.
   Qed.

   Theorem t26: forall A B C : Prop, 
                     ((A <-> B) <-> C) -> (A <-> (B <-> C)).
   Proof.
      intros. elim H. intros. split. intro. split. intro. apply H0. split. intro. assumption.
         intro. assumption. intro. elim H1. intros. apply H4. assumption. assumption.
         Require Import Classical.
         intro. generalize(Peirce(A)). intro. apply H3. intros. elim H1. intros. apply H6. apply H2. apply H0. split. assumption. assumption.
         apply H. split. intros. apply NNPP. intro.      apply H4. assumption.
         intros. elim H1. intros. apply H7. assumption. apply H2. assumption.
   Qed.
         
   Theorem t26_1: forall A B C : Prop, (*did not proofed*)
                     (A <-> (B <-> C)) -> ((A <-> B) <-> C).
   Proof.
      Require Import Classical.
      intros. generalize(classic(A)). intros. elim H0. 
         intros. elim H. intros. elim H2. intros. split. intros. apply H4. apply H6. assumption.
            intros. split. intros. apply H5. assumption. intros. assumption. assumption.
            elim H. intros. elim H1. intros. split. intros.
         intros. 


   Theorem t27: forall A B C : Prop, 
                     A /\ (B \/ C) <-> A /\ B \/ A /\ C.
   Proof.
      intros. split. intros. elim H. intros.
         elim H1. intros. left. split. assumption. assumption.
      intros. right. split. assumption. assumption. intros. elim H. 
         intros. split. apply H0. elim H0. intros. left. assumption.
      intros. elim H0. intros. split. assumption. right. assumption.
   Qed.

   Theorem t28: forall A B C : Prop, 
                     A \/ (B /\ C) <-> (A \/ B) /\ (A \/ C).
   Proof.
      intros. split. intros. elim H. intros. split. left. assumption. left. assumption.
      intros. split. right. apply H0. right. apply H0.
      intros. elim H. intros. elim H0. intros. left. assumption.
      intros. elim H1. intros. left. assumption. right. split.
      assumption. assumption.
   Qed.

   Theorem t29: forall A B C : Prop, 
                     A \/ (B -> C) <-> (A \/ B) -> (A \/ C).
   Proof.
      Require Import Classical.
      intros. generalize(classic(A)). intros. elim H. intros. split. intros. left. assumption.
      intros. left. assumption. intros. split. intros. elim H1. intros. contradiction.
      intros. elim H2. intros. contradiction. intros. right. apply H3. assumption.
      intros. right. intros. elim H1. intros. contradiction. apply id. right. assumption.
   Qed.

   Theorem t30: forall A B C : Prop, (*did not proofed*)
                     A \/ (B <-> C) <-> (A \/ B) <-> (A \/ C).
   Proof.
      Require Import Classical.

   Theorem t30_1: forall A B C : Prop,
                     (A -> B) -> (A /\ C) -> (B /\ C).
   Proof.
      intros. split. apply H. apply H0. apply H0.
   Qed.

   Theorem t30_2: forall A B C : Prop,
                     (A -> B) -> (C /\ A) -> (C /\ B).
   Proof.
      intros. split. apply H0. apply H. apply H0.
   Qed.

   Theorem t30_3: forall A B C : Prop,
                     (A <-> B) -> ((C /\ A) <-> (C /\ B)).
   Proof.
      intros. split. intros. split. apply H0. apply H. apply H0.
      intros. split. apply H0. apply H. apply H0.
   Qed.

   Theorem t30_4: forall A B C : Prop,
                     (A -> B) -> (A \/ C) -> (B \/ C).
   Proof.
      intros. elim H0. intros. left. apply H. assumption. intros. right. apply H1.
   Qed.

   Theorem t30_5: forall A B C : Prop,
                     (A -> B) -> (C \/ A) -> (C \/ B).
   Proof.
      intros. elim H0. intros. left. assumption. intros. right. apply H. apply H1.
   Qed.

   Theorem t30_6: forall A B C : Prop,
                     (A <-> B) -> ((C \/ A) <-> (C \/ B)).
   Proof.
      intros. split. intros. elim H0. intros. left. assumption.
      intros. right. apply H. assumption. 
      intros. elim H0. intros. left. assumption.
      intros. right. apply H. assumption.
   Qed.

   Theorem t30_7: forall A B C D : Prop,
                     (A -> B) -> ((B /\ C -> D) -> (A /\ C -> D)).
   Proof.
      intros. elim H1. intros. apply H0. split. apply H. assumption. assumption.
   Qed.

   Theorem t30_8: forall A B C D : Prop,
                     (A -> B) -> ((C /\ D -> A) -> (C /\ D -> B)).
   Proof.
      intros. elim H1. intros. apply H. apply H0. split. assumption. assumption.
   Qed.

   Theorem t31: forall A B C : Prop,
                     (A -> B /\ C) <-> (A -> B) /\ (A -> C).
   Proof.
      intros. split. intros. split. intros. elim H. intros. assumption. assumption.
         intros. elim H. intros. assumption. assumption.
      intros. elim H. intros. split. apply H1. assumption. apply H2. assumption.
   Qed.

   Theorem t31_1: forall A B C D : Prop,
                     (A -> C) /\ (B -> D) -> (A /\ B -> C /\ D).
   Proof.
      intros. elim H. intros. split. apply H1. apply H0. apply H2. apply H0.
   Qed.

   Theorem t31_2: forall A B C D : Prop,
                     (A -> B) /\ (C -> D) -> (A \/ C -> B \/ D).
   Proof.
      intros. elim H. intros. elim H0. intros. left. apply H1. assumption.
      intros. right. apply H2. assumption.
   Qed.

   Theorem t32: forall A B C  : Prop,
                     (A -> B \/ C) <-> (A -> B) \/ (A -> C).
   Proof.
      intros. apply conj.
              intro. 
              Require Import Classical.
              generalize (classic (A -> B)). intro. elim H0. intro.
              left. assumption. 
              intro. right. intro. cut (B \/ C). intro. elim H3. intro.
              cut (A -> B). intro. contradiction. intro. assumption.
              apply id. apply (H H2).
              intros. elim H. intro. left. apply (H1 H0).   
              intros. right. apply (H1 H0).
    Qed.

   Theorem t32_1: forall A B C  : Prop,
                     (A \/ B -> C) <-> (A -> C) /\ (B -> C).
   Proof.
      intros. split. intros. split. intros. apply H. left. assumption.
      intros. apply H. right. assumption.
      intros. elim H. intros. elim H0. intros. apply H1. assumption.
      intros. apply H2. assumption.
   Qed. 

   Theorem t33: forall A B C  : Prop,
                     A -> (B <-> C) <-> ((A -> B) <-> (A -> C)).
   Proof.
      intros. split. intros. split. intros. apply H. assumption. apply (H0 H1).
      
      intros. apply H. assumption. apply (H0 H1).
      intros. elim H. intros. split. intros.  apply H1. intros. assumption. assumption.
      intros. apply H2.  intros. assumption. assumption.
   Qed.

   Theorem t33_1: forall A B C  : Prop,
                     (A -> (B -> C)) <-> ((A -> B) -> (A -> C)).
   Proof.
      intros. split. intros. apply H. assumption. apply (H0 H1).
      intros. apply H. intros. assumption. assumption.
   Qed.