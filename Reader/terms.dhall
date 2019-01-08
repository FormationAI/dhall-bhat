    let Reader = ./Type Type ./../Function/Type

in    λ(r : Type)
    →   { withReader =
            ./withReader Type ./../Function/Type ./../Function/semigroupoid r
        }
      ∧ ./../Monad/terms.dhall
        Type
        ./../Function/Type
        ./../Function/semigroupoid
        (Reader r)
        (./monad r)