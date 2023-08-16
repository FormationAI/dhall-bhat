let Monad = ./Type

in  λ(f : Type → Type) →
    λ(monad : Monad f) →
      { ap =
          λ(a : Type) →
          λ(b : Type) →
          λ(g : f (a → b)) →
          λ(fa : f a) →
            monad.ap a b g fa
      , bind =
          λ(a : Type) →
          λ(b : Type) →
          λ(fa : f a) →
          λ(k : a → f b) →
            monad.bind a b fa k
      , map =
          λ(a : Type) →
          λ(b : Type) →
          λ(g : a → b) →
          λ(fa : f a) →
            monad.map a b g fa
      , pure = λ(a : Type) → monad.pure a
      , join =
          λ(a : Type) →
          λ(ffa : f (f a)) →
            monad.bind (f a) a ffa (λ(fa : f a) → fa)
      }
