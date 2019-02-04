    let object = Type

in  let arrow = ./../uncurryT object object Type ./../Function/Type

in  let Reader = ./Type object arrow

in    λ(r : Type)
    →   { withReader = ./withReader object arrow ./../Function/semigroupoid r }
      ∧ ./../Monad/terms.dhall
        object
        arrow
        ./../Function/semigroupoid
        (Reader r)
        (./monad r)
