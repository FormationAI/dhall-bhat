let Bifunctor = ./Type

in  λ(p : Type → Type → Type) →
    λ(bifunctor : Bifunctor p) →
      { bimap = bifunctor.bimap
      , first = ./first p bifunctor
      , second = ./second p bifunctor
      }
