    let Monad = ./../Monad/Type

in    λ(s : Type)
    → λ(m : Type → Type)
    → λ(monad : Monad m)
    →   { lift =
            λ(a : Type) → (./Transformer s).lift m monad a
        , eval =
            λ(a : Type) → ./eval s m monad a
        , exec =
            λ(a : Type) → ./exec s m monad a
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
