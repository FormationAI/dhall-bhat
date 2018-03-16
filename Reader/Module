    let Reader = ./Type

in    λ(r : Type)
    → λ(a : Type)
    → { mapReader =
            λ(b : Type)
          → λ(f : a → b)
          → λ(reader : Reader r a)
          → ./mapReader  r a b f reader
      , Functor =
          ./Functor  r
      , Applicative =
          ./Applicative  r
      , Monad =
          ./Monad  r
      , runReader =
          λ(reader : Reader r a) → λ(env : r) → reader env
      , withReader =
            λ(rPrime : Type)
          → λ(f : rPrime → r)
          → λ(reader : Reader r a)
          → ./withReader  r a rPrime f reader
      }
