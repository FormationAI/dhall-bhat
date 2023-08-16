let Applicative = ./Type

in  λ(f : Type → Type) →
    λ(applicative : Applicative f) →
      { ap = applicative.ap
      , leftApConst = ./leftApConst f applicative
      , liftA2 = ./liftA2 f applicative
      , map = applicative.map
      , pure = applicative.pure
      , rightApConst = ./rightApConst f applicative
      }
