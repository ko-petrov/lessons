

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

(* Задание 7 *)
Fixpoint nod a b :=
      match a with 
        | O    => b
        | S a' => nod (mod b (S a')) (S a')
      end.

Eval compute in nod 12 8.
Eval compute in nod 25 5.

(* Задание 8 *)
Fixpoint lcm a b := div (a * b) (nod a b).

Eval compute in lcm 12 8.
Eval compute in lcm 25 5.

(* Задание 9 *)
Fixpoint sqrt_iter k p q r :=
      match k with
        | O    => p
        | S k' => match r with
                    | O    => sqrt_iter k' (S p)
                                           (S (S q))
                                           (S (S q))
                    | S r' => sqrt_iter k' p q r'
                  end
      end.

Definition sqrt n := sqrt_iter n 0 0 0.

Eval compute in sqrt 25.
Eval compute in sqrt 12.

(* Задание 10 *)
Fixpoint log2_iter k p q r :=
      match k with
        | O    => p
        | S k' => match r with
                    | O    => log2_iter k' (S p) (S q) q
                    | S r' => log2_iter k' p (S q) r'
                  end
      end.

Definition log2 n := log2_iter (pred n) 0 1 0.

Eval compute in log2 32.
Eval compute in log2 71.
