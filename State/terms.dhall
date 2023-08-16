λ(s : Type) →
    { eval = λ(a : Type) → ./eval s a
    , exec = λ(a : Type) → ./exec s a
    , get = λ(a : Type) → ./get s
    , modify = ./modify s
    , put = ./put s
    , withState = λ(a : Type) → ./withState s a
    }
  ∧ ./monad s
