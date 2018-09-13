  λ(f : Type → Type)
→ λ(applicative : ./Type f)
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
      ∧ ./../Functor/Endo/package.dhall Type ./../Function/Type f extractFunctor
