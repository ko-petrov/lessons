   (* Лабораторная работа №3, раздел №0           *)
   (* Автор: Петров К., 3 курс, ИСиТ (01.12.2020) *)
   (* ------------------------------------------- *)

   Theorem t_0_1_1: forall A B G : Type,
                       ((A -> B) -> G) -> B -> G.
   Proof.
      refine (fun _ _ _ => _).
      refine (fun _ _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H0).
   Qed.
   Print t_0_1_1.

   Theorem t_0_1_2: forall A B G : Type,
                       (A -> A -> B) -> (G -> A) -> (G -> B).
   Proof.
      refine (fun _ _ _ => _).
      refine (fun _ _ _ => _).
      refine (_H _ _).
      refine (_H0 _).
      refine (_H1).
      refine (_H0 _).
      refine (_H1).
   Qed.
   Print t_0_1_2.

   Theorem t_0_1_3: forall A B G : Type,
                       (A -> G) -> (G -> A -> B) -> (A -> B).
   Proof.
      refine (fun _ _ _ => _).
      refine (fun _ _ _ => _).
      refine (_H0 _ _).
      refine (_H _).
      refine (_H1).
      refine (_H1).
   Qed.
   Print t_0_1_3.

   Theorem t_0_1_4: forall A B : Type,
                       ((B -> A -> B) -> A) -> A.
   Proof.
      refine (fun _ _ => _).
      refine (fun _ => _).
      refine (_H _).
      refine (fun _ _ => _).
      refine (_H0).
   Qed.
   Print t_0_1_4.

   Theorem t_0_1_5: forall A B G D : Type,
                       ((A -> B) -> G -> D) -> G -> B -> D.
   Proof.
      refine (fun _ _ _ _ => _).
      refine (fun _ _ _ => _).
      refine (_H _ _).
      refine (fun _ => _).
      refine (_H1).
      refine (_H0).
   Qed.
   Print t_0_1_5.

   Theorem t_0_1_6: forall A B : Type,
                       ((A -> A) -> B) -> B.
   Proof.
      refine (fun _ _ => _).
      refine (fun _  => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H0).
   Qed.
   Print t_0_1_6.

   Theorem t_0_1_7: forall A B G : Type,
                       ((A -> B -> A) -> G) -> G.
   Proof.
      refine (fun _ _ _ => _).
      refine (fun _  => _).
      refine (_H _).
      refine (fun _ _ => _).
      refine (_H0).
   Qed.
   Print t_0_1_7.

   Theorem t_0_1_8: forall A B G D : Type,
                       (((A -> B -> G) -> (B -> A -> G)) -> D) -> D.
   Proof.
      refine (fun _ _ _ _ => _).
      refine (fun _  => _).
      refine (_H _).
      refine (fun _ _ _ => _).
      refine (_H0 _ _).
      refine (_H2).
      refine (_H1).
   Qed.
   Print t_0_1_8.

   Theorem t_0_1_9: forall A B G D : Type,
                       (((A -> B -> G) -> (A -> B) -> (A -> G)) -> D) -> D.
   Proof.
      refine (fun _ _ _ _ => _).
      refine (fun _  => _).
      refine (_H _).
      refine (fun _ _ _ => _).
      refine (_H0 _ _).
      refine (_H2).
      refine (_H1 _).
      refine (_H2).
   Qed.
   Print t_0_1_9.

   Theorem t_0_1_10: forall A B G : Type,
                       ((A -> B) -> G) -> ((B -> G) -> A -> B) -> G.
   Proof.
      refine (fun _ _ _ => _).
      refine (fun _ _  => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H0 _ _).
      refine (fun _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H2).
      refine (_H1).
   Qed.
   Print t_0_1_10.

   Theorem t_0_1_11: forall A B : Type,
                        ((A -> B) -> (B -> A)) -> (B -> A).
   Proof.
      refine (fun _ _ => _). 
      refine (fun _ _ => _).
      refine (_H _ _).
      refine (fun _ => _).
      refine (_H0). 
      refine (_H0).
   Qed.
   Print  t_0_1_11.

   Theorem t_0_1_12: forall A G : Type,
                        ((((A -> A) -> A) -> A) -> G) ->
                                        (((((A -> A) -> A) -> A) -> G) -> G).
   Proof.
      refine (fun _ _ => _). 
      refine (fun _ _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H1 _).
      refine (fun _ => _).
      refine (_H2).
   Qed.
   Print  t_0_1_12.

   Theorem t_0_2_1: forall A : Type,
                        ((A -> A) -> A) -> A.
   Proof.
      refine (fun _ => _). 
      refine (fun _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H0). 
   Qed.
   Print  t_0_2_1.

   Theorem t_0_2_2: forall A B : Type,
                        ((((A -> B) -> A) -> A) -> B) -> B.
   Proof.
      refine (fun _ _ => _). 
      refine (fun _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H0 _).
      refine (fun _ => _).
      refine (_H _).
      refine (fun _ => _).
      refine (_H1).
   Qed.
   Print  t_0_2_2.