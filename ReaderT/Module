    let ReaderT = ./Type

in  let Functor = ../Functor/Type

in  let Applicative = ../Applicative/Type

in  let Monad = ../Monad/Type

in    λ(r : Type)
    → λ(m : Type → Type)
    → λ(a : Type)
    → { Functor =
          λ(functor : Functor m) → ./Functor  r m functor
      , Applicative =
          λ(applicative : Applicative m) → ./Applicative  r m applicative
      , Monad =
          λ(monad : Monad m) → ./Monad  r m monad
      , Transformer =
          ./Transformer  r
      , runReaderT =
          λ(reader : ReaderT r m a) → λ(env : r) → reader env
      , ask =
          λ(applicative : Applicative m) → ./ask  r m applicative
      , asks =
          λ(applicative : Applicative m) → ./asks  r m applicative a
      , local =
          λ(f : r → r) → λ(reader : ReaderT r m a) → ./local  r m a f reader
      }
