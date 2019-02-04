{- These are various operations, grouped by type, specialized to **Set**.
-}
    let Set = ./../../uncurryT Type Type Type ./../../Function/Type

in  { applicative =
        ./../../Applicative/terms.dhall
    , either =
        ./../../Either/terms.dhall
    , functor =
        ./../../Functor/Endo/terms.dhall Type Set
    , monad =
        ./../../Monad/terms.dhall Type Set ./../../Function/semigroupoid
    , reader =
        ./../../Reader/terms.dhall
    }
