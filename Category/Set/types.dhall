{- These are all of the types specialized to **Set**. It provides some more
   familiar names in some cases, but they are potentially confusing with the
   more categorical names elsewhere.
-}
    let Set = ./../../Function/Type

in  let Star = ./../../Star/Type Type Set

in  { Adjunction =
        ./../../Adjunction/Type Type Set
    , Applicative =
        ./../../Applicative/Type
    , Arrow =
        ./../../Arrow/Type
    , Bifunctor =
        ./../../Functor/Pair/Type Type Set
    , Category =
        ./../../Category/Type Type
    , Codensity =
        ./../../Codensity/Type
    , Comonad =
        ./../../Comonad/Type Type Set
    , Compactable =
        ./../../Functor/ToTypes/Compactable/Type
    , Compose =
        ./../../Compose/Type Type Type Type
    , Const =
        ./../../Const/Type Type Type
    , Costar =
        ./../../Costar/Type Type Set
    , Day =
        ./../../Day/Type
    , Either =
        ./../../Either/Type
    , EitherT =
        ./../../EitherT/Type
    , Foldable =
        ./../../Foldable/Type
    , Function =
        ./../../Function/Type
    , Functor =
        ./../../Functor/Endo/Type Type Set
    , Identity =
        ./../../Identity/Type Type
    , Monad =
        ./../../Monad/Type Type Set
    , Monoid =
        ./../../Monoid/Type Type Set ./../../Tuple/Type {}
    , NaturalTransformation =
        ./../../NaturalTransformation/Type Type Type Set
    , NonEmptyList =
        ./../../NonEmptyList/Type
    , Profunctor =
        ./../../Functor/Hom Type Set
    , Ran =
        ./../../Ran/Type
    , Reader =
        ./../../Reader/Type Type Set
    , ReaderT =
        λ(m : Type → Type) → ./../../ReaderT/Type Type Set
    , Semigroup =
        ./../../Semigroup/Type Type Set ./../../Tuple/Type
    , Semigroupoid =
        ./../../Semigroupoid/Type Type Set
    , Star =
        ./../../Star/Type Type Set
    , State =
        ./../../State/Type
    , StateT =
        ./../../StateT/Type
    , Strong =
        ./../../Strong/Type Type Set Type Set
    , Transformer =
        ./../../Transformer/Type
    , Traversable =
        λ(m : Type → Type) → ./../../Functor/Endo/Type Type (Star m)
    , Tuple =
        ./../../Tuple/Type
    , Yoneda =
        ./../../Yoneda/Type
    }
