(* Лабораторная работа №7 *)
(* Петров Константин (22.12.2020) *)

Require Import Arith.
(* ----------------Раздел 0.-------------- *)
(* Задание 1 *)
Inductive beautiful : nat -> Prop :=
   | b_0   : beautiful 0
   | b_3   : beautiful 3
   | b_5   : beautiful 5
   | b_sum : forall n m, beautiful n -> beautiful m
                                     -> beautiful (n + m).
Theorem three_is_beautiful: beautiful 3.
   Proof.
      apply b_3.
   Qed.

Theorem eight_is_beautiful: beautiful 8.
   Proof.
      apply (b_sum 3 5). apply b_3. apply b_5.
   Qed.

Theorem beautiful_plus_eight:
                  forall n, beautiful n -> beautiful (8 + n).
   Proof.
      intros. apply (b_sum 8). apply eight_is_beautiful.
      apply H.
   Qed.

Theorem b_times2: forall n, beautiful n -> beautiful (2 * n).
   Proof.
      intros. simpl. rewrite plus_0_r. apply (b_sum n n).
      assumption. assumption.
   Qed.

Theorem b_timesm: forall n m, beautiful n -> beautiful (n * m).
   Proof.
      intros. induction m. rewrite mult_0_r. apply b_0.
      rewrite mult_succ_r. apply b_sum. assumption.
      assumption.
   Qed.

   (* ----------------Раздел 1.-------------- *)
   (* Задание 1 *)
Fixpoint minus1 (n : nat) : nat :=
      match n with
        | 0 => n
        | S n => n
      end.

Eval compute in minus1 0.
Eval compute in minus1 5.

(* Задание 2 *)
Fixpoint exp (b p : nat) {struct p} : nat :=
      match p with
        | O   => S O
        | S p => b * exp b p
      end.

Eval compute in exp 0 5.
Eval compute in exp 2 6.

(* Задание 3 *)
Fixpoint max n m :=
      match n, m with
        | 0   , _    => m
        | S n', 0    => n
        | S n', S m' => S (max n' m')
      end.

Eval compute in max 0 5.
Eval compute in max 6 3.

(* Задание 4 *)
Fixpoint min n m :=
      match n, m with
        | 0   , _    => 0
        | S n', 0    => 0
        | S n', S m' => S (min n' m')
      end.

Eval compute in min 0 5.
Eval compute in min 6 3.

(* Задание 5 *)
Fixpoint minus (n m : nat) {struct n} : nat :=
      match n, m with
        | S n', S m' => minus n' m'
        |  _  ,  _   => n
      end.

Definition leq (n m : nat) : bool :=
      match minus n m with
        | O => true
        | _ => false
      end.

Fixpoint div (n m : nat) {struct n} : nat :=
      match m with
        | O    => O
        | S m' => if leq (S m') n
                    then match n with
                           | O    => O
                           | S n' => S (div (minus n' m') 
                                            (S m'))
                         end
                    else O
      end.

Eval compute in div 9 3.
Eval compute in div 17 5.

(* Задание 6 *)
Fixpoint divmod x y q u :=
      match x with
        | O    => (q, u)
        | S x' => match u with
                    | O    => divmod x' y (S q) y
                    | S u' => divmod x' y   q   u'
                  end
      end.

Definition mod x y :=
       match y with
         | O    => y
         | S y' => y' - snd (divmod x y' O y')
       end.

Eval compute in mod 9 3.
Eval compute in mod 17 5.

   (* ----------------Раздел 2.-------------- *)

(* Задание 1 *)

   Fixpoint plus' (n m : nat) {struct n} : nat :=
      match n with
        | O   => m
        | S n => S (plus' n m)
      end.

   Eval compute in plus' 0 3.
   Eval compute in plus' 0 0.
   Eval compute in plus' 444 5.

   Theorem plus_0_n: forall n : nat, 
                        plus' 0 n = n.
   Proof.
      intros. reflexivity. 
   Qed.

   Theorem plus_n_O: forall n,
                        n = plus' n 0.
   Proof.
      intros.
      induction n. reflexivity.
      simpl. rewrite <- IHn. reflexivity.
   Qed.

   Lemma abc: forall n m,
                 S (plus' n m) = plus' n (S m).
   Proof.
      intros. induction n.
      reflexivity.
      simpl. f_equal. rewrite IHn. reflexivity.  
   Qed.

   Theorem Свойство'': forall n m,
                          plus' n m = plus' m n.
   Proof.
      intros. induction n.
              simpl. apply plus_n_O.
              simpl. rewrite IHn. apply abc.
   Qed.

      (* ----------------Раздел 3.-------------- *)

   (* 1 *)
Fixpoint ravno (n m : nat) : bool :=
      match n with
        | O    => match m with
                    | O    => true
                    | S m' => false
                    end
        | S n' => match m with
                    | O    => false
                    | S m' => ravno n' m'
                  end
      end.

Eval compute in ravno 5 3.
Eval compute in ravno 5 5.
Eval compute in ravno 5 7.

(* 2 *)
Fixpoint leb (n m : nat) : bool :=
      match n with
        | O    => true
        | S n' => match m with
                    | O    => false
                    | S m' => leb n' m'
                  end
      end.

Eval compute in leb 5 3.
Eval compute in leb 5 5.
Eval compute in leb 5 7.

(* 3 *)
Fixpoint leb2 (n m : nat) : bool :=
      match n with
        | O    => match m with
                    | O    => false
                    | S m' => true
                    end
        | S n' => match m with
                    | O    => false
                    | S m' => leb2 n' m'
                  end
      end.

Eval compute in leb2 5 3.
Eval compute in leb2 5 5.
Eval compute in leb2 5 7.

(* 4 *)
Fixpoint evennum (n : nat) : bool :=
       match n with
         | O        => true
         | S O      => false
         | S (S n') => evennum n'
       end.

Eval simpl in evennum 1.
Eval simpl in evennum 6.

(* 5 *)
Definition oddnum (n : nat) : bool :=
       negb (evennum n).

Eval compute in oddnum 1.
Eval compute in oddnum 6.