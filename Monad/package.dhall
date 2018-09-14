  λ(object : Kind)
→ λ(arrow : object → object → Type)
→ λ(semigroupoid : ./../Semigroupoid/Type object arrow)
→ λ(m : object → object)
→ λ(monad : ./Type object arrow m)
→ { map =
      monad.map
  , pure =
      monad.identity
  , join =
      monad.op
  , bind =
      (./impliedStarfunctor object arrow semigroupoid m monad).map
  }
