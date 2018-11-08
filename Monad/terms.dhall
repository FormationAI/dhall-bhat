  λ(object : Kind)
→ λ(arrow : object → object → Type)
→ λ(semigroupoid : ./../Semigroupoid/Type object arrow)
→ λ(m : object → object)
→ λ(monad : ./Type object arrow m)
→     let extractStarfunctor =
            ./impliedStarfunctor object arrow semigroupoid m monad
  
  in  { map =
          monad.map
      , pure =
          monad.identity
      , join =
          monad.op
      , bind =
          extractStarfunctor.map
      , extractEndofunctor =
          ./extractEndofunctor object arrow m monad
      , extractStarfunctor =
          extractStarfunctor
      }
