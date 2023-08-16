let Monad = ../Monad/Type

let extractApplicative = ../Monad/extractApplicative

in  λ(r : Type) →
    λ(m : Type → Type) →
    λ(monad : Monad m) →
        { lift = (./transformer r).lift m monad
        , ask = ./ask r m (extractApplicative m monad)
        , asks = ./asks r m (extractApplicative m monad)
        , local = ./local r m
        }
      ∧ ./monad r m monad
