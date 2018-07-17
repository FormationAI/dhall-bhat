    let Reader = ./Type

in    λ(r : Type)
    →   { mapReader =
              λ(a : Type)
            → λ(b : Type)
            → λ(f : a → b)
            → λ(reader : Reader r a)
            → ./mapReader r a b f reader
        , runReader =
            λ(a : Type) → λ(reader : Reader r a) → λ(env : r) → reader env
        , withReader =
              λ(a : Type)
            → λ(rPrime : Type)
            → λ(f : rPrime → r)
            → λ(reader : Reader r a)
            → ./withReader r a rPrime f reader
        }
      ∧ ./Monad r
