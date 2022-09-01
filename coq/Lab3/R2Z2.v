   (* Лабораторная работа №3, раздел №2, Задание №2 *)
   (* Автор: Петров К., 3 курс, ИСиТ (01.12.2020)   *)
   (* --------------------------------------------- *)

   Theorem tip1: forall B : Type,
                    (forall A : Type, A -> B) -> B.
   Proof.
      intros. apply X with (B -> B). apply id.
   Qed.
   Print tip1.

   Theorem tip2: forall B : Type,
                    (forall G : Type, G -> G -> B) -> B.
   Proof.
      intros. apply X with (B -> B -> B). intro. apply id.
      intro. apply id.
   Qed.
   Print tip2.

   Theorem tip3: forall B : Type,
                    (forall A : Type, (A -> forall G : Type, G -> B)) -> B.
   Proof.
      intros. apply X with (B -> B) (B -> B). 
      apply id. apply id.
   Qed.
   Print tip3.

   Theorem tip3'': forall B : Type,
                    (forall A : Type, (A -> forall G : Type, G)) -> B.
   Proof.
      intros. apply X with (B -> B). 
      apply id.
   Qed.
   Print tip3''.

   Theorem tip4: forall B G : Type,
                   (forall A : Type, G -> (A -> B))
                                             -> G -> B.
   Proof.
      intros. apply X with (B -> B). assumption. apply id.
   Qed.
   Print tip4.

   Theorem tip4'': forall A T : Type,
                   (A -> forall B : Type, B -> T) -> (A -> T).
   Proof.
      intros. apply X with (T -> T). assumption. apply id.
   Qed.
   Print tip4''.

   Theorem tip5: forall G B : Type,
                   (G -> B) -> (forall D : Type, D -> G) -> B.
   Proof.
      intros. apply X. apply X0 with (G -> B). apply X.
   Qed.
   Print tip5.

   Theorem tip6: forall A B D : Type, 
                    (A -> B) 
                       -> (forall S : Type,
                              ((S -> D) -> D) -> A) -> B.
   Proof.
      intros. apply X. apply X0 with (D -> D).
      intros. apply X1. apply id.
   Qed.
   Print tip6.

   Theorem tip6''': forall A B D : Type, 
                    (A -> B) 
                       -> (((forall S : Type,
                              ((S -> D) -> A) -> D) -> D) -> A) -> B.
   Proof.
      intros. apply X. apply X0.
      intros. apply X1 with (A -> B). intros.
      apply X0. intros. apply X2. assumption.
   Qed.
   Print tip6'''.

   Theorem tip7: forall G2 B : Type, 
                    (((forall G1 : Type, G1 -> G2) -> G2) -> B) -> B.
   Proof.
      intros. apply X. intros. apply X0 with (B -> B). apply id. 
   Qed.
   Print tip7.

   Theorem tip8: forall B : Type, 
                    (forall A : Type, A -> A -> A -> B) -> B.
   Proof.
      intros. apply X with (B -> B). apply id. apply id. apply id.
   Qed.
   Print tip8.

   Theorem tip9: forall B : Type, 
         (forall A : Type, A -> (forall G : Type, G -> A -> B)) -> B.
   Proof.
      intros. apply X with (B -> B) (B -> B). apply id. apply id. apply id.
   Qed.
   Print tip9.

   Theorem tip13: forall B : Type, 
         (forall A : Type, A -> ( A -> forall G : Type, G -> B)) -> B.
   Proof.
      intros. apply X with (B -> B) (B -> B). apply id. apply id. apply id.
   Qed.
   Print tip13.

   Theorem tip16_1: forall B : Type, 
         (B -> B) -> (forall G : Type, G -> (forall G : Type, G -> B)) -> B.
   Proof.
      intros. apply X0 with (B -> B) (B -> B). apply id. apply id.
   Qed.
   Print tip16_1.

   Theorem tip16_2: forall E D : Type, 
         (E -> D) -> (forall G : Type, G -> G -> E) -> D.
   Proof.
      intros. apply X. apply X0 with (D -> D). apply id. apply id.
   Qed.
   Print tip16_2.

   Theorem tip16_3: forall B E : Type, 
         (B -> B) -> (forall A : Type, A -> A -> A -> B) -> B.
   Proof.
      intros. apply X0 with (B -> B). apply id. apply id. apply id.
   Qed.
   Print tip16_3.

   Theorem tip16_4: forall B E : Type, 
         (E -> B) -> (forall A : Type, A -> 
                         forall A : Type, A  -> 
                            forall A : Type, A -> E) -> B.
   Proof.
      intros. apply X. apply X0 with (B -> B) (B -> B) (B -> B).
      apply id. apply id. apply id.
   Qed.
   Print tip16_4.

   Theorem tip16_5: forall B E : Type, 
         (E -> B) -> (forall G : Type, G -> 
                         forall G : Type, G -> E) -> B.
   Proof.
      intros. apply X. apply X0 with (B -> B) (B -> B).
      apply id. apply id.
   Qed.
   Print tip16_5.