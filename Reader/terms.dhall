let Reader = ./Type

in  λ(r : Type) →
        { withReader =
            λ(a : Type) →
            λ(rPrime : Type) →
            λ(f : rPrime → r) →
            λ(reader : Reader r a) →
              ./withReader r a rPrime f reader
        }
      ∧ ./monad r
