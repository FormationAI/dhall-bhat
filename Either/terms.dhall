let Either = ./Type

in  λ(a : Type) →
    λ(b : Type) →
        { Left = (Either a b).Left
        , Right = (Either a b).Right
        , fromLeft = ./fromLeft a b
        , fromRight = ./fromRight a b
        , isLeft = ./isLeft a b
        , isRight = ./isRight a b
        , lefts = ./lefts a b
        , mapBoth = ./mapBoth a b
        , mapLeft = ./mapLeft a b
        , mapRight = ./mapRight a b
        , partition = ./partition a b
        , rights = ./rights a b
        }
      ∧ ./monad a ⫽ ./traversable a ⫽ ./bifunctor
