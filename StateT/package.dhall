    let StateT = ./Type

in  let Monad = ./../Monad/Type

in    λ(s : Type)
    → λ(m : Type → Type)
    → λ(monad : Monad m)
    →   { lift =
            λ(a : Type) → (./Transformer s).lift m monad a
        , runState =
            λ(a : Type) → λ(state : StateT s m a) → λ(new : s) → state new
        , evalState =
            λ(a : Type) → ./evalState s m monad a
        , execState =
            λ(a : Type) → ./execState s m monad a
        , get =
            ./get s m monad
        , gets =
            λ(a : Type) → ./gets s m monad a
        , put =
            λ(a : Type) → ./put s m monad
        , modify =
            λ(a : Type) → ./modify s m monad
        }
      ∧ ./Monad s m monad
