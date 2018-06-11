    let StateT = ./Type

in  let Functor = ../Functor/Type

in  let Applicative = ../Applicative/Type

in  let Monad = ../Monad/Type

in    λ(s : Type)
    → λ(m : Type → Type)
    → λ(a : Type)
    → { Functor =
          λ(functor : Functor m) → ./Functor  s m functor
      , Applicative =
          λ(monad : Monad m) → ./Applicative  s m monad
      , Monad =
          λ(monad : Monad m) → ./Monad  s m monad
      , Transformer =
          ./Transformer  s
      , runState =
          λ(state : StateT s m a) → λ(new : s) → state new
      , evalState =
          λ(monad : Monad m) → ./evalState  s m monad a
      , execState =
          λ(monad : Monad m) → ./execState  s m monad a
      , get =
          λ(monad : Monad m) → ./get  s m monad
      , gets =
          λ(monad : Monad m) → ./gets  s m monad a
      , put =
          λ(monad : Monad m) → ./put  s m monad
      , modify =
          λ(monad : Monad m) → ./modify  s m monad
      }
