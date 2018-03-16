    let State = ./Type

in    λ(s : Type)
    → λ(a : Type)
    → { evalState =
          ./evalState  s a
      , execState =
          ./execState  s a
      , get =
          ./get  s
      , mapState =
          ./mapState  s a
      , modify =
          ./modify  s
      , put =
          ./put  s
      , runState =
          λ(state : State s a) → λ(new : s) → state new
      , Applicative =
          ./Applicative  s
      , Functor =
          ./Functor  s
      , Monad =
          ./Monad  s
      , withState =
          ./withState  s a
      }
