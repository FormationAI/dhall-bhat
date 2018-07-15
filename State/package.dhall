    let State = ./Type

in    λ(s : Type)
    →   { evalState =
            λ(a : Type) → ./evalState s a
        , execState =
            λ(a : Type) → ./execState s a
        , get =
            λ(a : Type) → ./get s
        , mapState =
            λ(a : Type) → ./mapState s a
        , modify =
            ./modify s
        , put =
            ./put s
        , runState =
            λ(a : Type) → λ(state : State s a) → λ(new : s) → state new
        , withState =
            λ(a : Type) → ./withState s a
        }
      ∧ ./Monad s
