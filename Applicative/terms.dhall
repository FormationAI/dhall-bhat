    let cat = ./../Category/Monoidal/Set/cartesian

in    λ(f : Type → Type)
    → λ(applicative : ./Type cat f)
    →     let extractFunctor = ./impliedEndofunctor f applicative
      
      in    { ap =
                ./ap f applicative
            , lift2 =
                applicative.op
            , pure =
                applicative.identity
            , extractFunctor =
                extractFunctor
            }
          ∧ ./../Functor/Endo/terms.dhall
            Type
            ./../Function/Type
            f
            extractFunctor
