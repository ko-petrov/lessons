   (* Лабораторная работа №3, раздел №1           *)
   (* Автор: Петров К., 3 курс, ИСиТ (01.12.2020) *)
   (* ------------------------------------------- *)

   Theorem t_1_1_1: forall A B : Type,
                       A -> (A -> (A -> B)) -> ((A -> B) ->A) -> B.
   Proof.
      refine (fun _ _ => _). 
      refine (fun x y z => _).
      refine (y _ _).
      refine (x).
      refine (x). 
   Qed.
   Print t_1_1_1.
   Extraction Language Haskell.
   Recursive Extraction t_1_1_1.

   Theorem t_1_1_2: forall A B G : Type,
                       (A -> A -> G) -> (B -> A) -> B -> B -> G.
   Proof.
      refine (fun _ _ _ => _). 
      refine (fun x y z w => _).
      refine (x _ _).
      refine (y _).
      refine (z). 
      refine (y _).
      refine (z). 
   Qed.
   Print t_1_1_2.
   Extraction Language Haskell.
   Recursive Extraction t_1_1_2.

   Theorem t_1_1_3: forall A B G D : Type,
                       (D -> D -> A) -> (A -> B -> G) -> (D -> B) -> D -> G.
   Proof.
      refine (fun _ _ _ _ => _). 
      refine (fun x y z w => _).
      refine (y _ _).
      refine (x _ _).
      refine (w).
      refine (w).
      refine (z _).
      refine (w). 
   Qed.
   Print t_1_1_3.
   Extraction Language Haskell.
   Recursive Extraction t_1_1_3.

   Theorem t_1_1_4: forall A B : Type,
                       ((B -> A) -> B) -> ((B -> A) -> A).
   Proof.
      refine (fun _ _ => _). 
      refine (fun x y => _).
      refine (y _).
      refine (x _).
      refine (y). 
   Qed.
   Print t_1_1_4.
   Extraction Language Haskell.
   Recursive Extraction t_1_1_4.