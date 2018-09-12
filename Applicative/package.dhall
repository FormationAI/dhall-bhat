--   λ(object : Kind)
-- → λ(arrow : object → object → Type)
-- → λ(f : object → object)
-- → λ(applicative : ./Type object arrow f)
-- →     let extractFunctor = ./impliedEndofunctor object arrow f applicative
  
--   in    { ap =
--             ./ap object arrow f applicative
--         , liftA2 =
--             applicative.op
--         , pure =
--             applicative.identity
--         , extractFunctor =
--             extractFunctor
--         }
--       ∧ ./../Functor/Endo/package.dhall object arrow f extractFunctor
<>
