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

