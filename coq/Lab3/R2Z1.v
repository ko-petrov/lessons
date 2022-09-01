   (* Лабораторная работа №3, раздел №2, Задание №1 *)
   (* Автор: Петров К., 3 курс, ИСиТ (01.12.2020)   *)
   (* --------------------------------------------- *)

   Theorem t_2_1_1: forall D : Type,
                       (forall A : Type, A) -> D.
   Proof.
      intros. apply X. 
   Qed.

   Theorem t_2_1_2: forall D T : Type,
                       D -> (D -> (forall A : Type, A)) -> T.
   Proof.
      intros. apply (X0 X). 
   Qed.

   Theorem t_2_1_3: forall D T : Type,
                       (D -> T) -> (D -> T -> (forall A : Type, A)) -> D
                                           -> (forall A : Type, A).
   Proof.
      intros. apply X0. assumption. apply X. assumption.
   Qed.

   Theorem t_2_1_4: forall D : Type,
                       D -> (D -> (forall A : Type, A)) ->
                       (forall A : Type, A).
   Proof.
      intros. apply X0. assumption.
   Qed.

   Theorem t_2_1_5: forall D T : Type,
                       D -> T -> (forall A : Type, (D -> T -> A) -> A).
   Proof.
      intros. apply X1. assumption. assumption.
   Qed.

   Theorem t_2_1_6: forall D T : Type,
                       (forall A : Type, (D -> T -> A) -> A) -> D.
   Proof.
      intros. apply X. intros. assumption.
   Qed.

   Theorem t_2_1_7: forall D T : Type,
                       (forall A : Type, (D -> T -> A) -> A) -> T.
   Proof.
      intros. apply X. intros. assumption.
   Qed.

   Theorem t_2_1_8: forall D T : Type,
                       D -> (forall A : Type, (D -> A) -> (T -> A) -> A).
   Proof.
      intros. apply X0. assumption.
   Qed.

   Theorem t_2_1_9: forall D T : Type,
                       T -> (forall A : Type, (D -> A) -> (T -> A) -> A).
   Proof.
      intros. apply X1. assumption.
   Qed.

   Theorem t_2_1_10: forall D T P : Type,
     (forall A : Type, (D -> A) -> (T -> A) -> A) -> (D -> P) -> (T -> P) -> P.
   Proof.
      intros. apply X. assumption. assumption.
   Qed.

   Theorem t_2_1_11: forall D T : Type,
     (forall A : Type, (D -> A) -> (T -> A) -> A) -> (D -> T) -> T.
   Proof.
      intros. apply X. assumption. apply id.
   Qed.

   Theorem t_2_1_12: forall (T : Type) (D : Type -> Type),
                 (D T) -> (forall B : Type, (forall A : Type, (D A) -> B) -> B).
   Proof.
      intros. apply X0 with (A:=T). assumption.
   Qed.

   Theorem t_2_1_13: forall (T P : Type) (D : Type -> Type),
                 (forall B : Type, (forall A : Type, (D A) -> B) -> B)
                 -> (forall A : Type, (D A) -> P) -> P.
   Proof.
      intros. apply X. intros. apply X0 with (A:=A). assumption.
   Qed.

   Theorem t_2_1_14: forall (T P : Type) (D : Type -> Type),
                              (forall A : Type, D A) ->
         (forall B : Type, (forall A : Type, (D A) -> B) -> B).
   Proof.
      intros. apply X0 with (A:=B). apply X.
   Qed.