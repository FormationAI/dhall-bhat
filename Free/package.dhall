let Free = ./Type

let Functor = ../Functor/Type

let Applicative = ../Applicative/Type

in    λ(f : Type → Type)
    →   { iter =
            ./iter f
        , iterA =
            λ(g : Type → Type) → λ(AG : Applicative g) → ./iterA f g AG
        , retract =
            ./retract f
        , wrap =
            ./wrap f
        , liftF = \(FF : Functor f) -> ./liftF f FF
        , foldFree = ./foldFree f
        }
      ∧ ./monad f ⫽ ./transformer
