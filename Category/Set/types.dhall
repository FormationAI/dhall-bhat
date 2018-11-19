{- These are all of the types specialized to **Set**. It provides some more
   familiar names in some cases, but they are potentially confusing with the
   more categorical names elsewhere.
-}
    let Set = ./../Monoidal/Set/cartesian

in  let Star = ./../../Star/Type Type Set.arrow

in  { Adjunction =
        ./../../Adjunction/Type Type Type Set.arrow Set.arrow
    , Applicative =
        ./../../Applicative/Type
    , Arrow =
        ./../../Arrow/Type
    , Bifunctor =
        ./../../Functor/Pair/Type Type Set.arrow
    , Category =
        ./../../Category/Type Type
    , Codensity =
        ./../../Codensity/Type
    , Comonad =
        ./../../Comonad/Type Type Set.arrow
    , Compactable =
        ./../../Functor/ToTypes/Compactable/Type
    , Compose =
        ./../../Compose/Type Type Type Type
    , Const =
        ./../../Const/Type Type Type
    , Costar =
        ./../../Costar/Type Type Set.arrow
    , Day =
        ./../../Day/Type Type Set
    , Either =
        ./../../Either/Type
    , EitherT =
        ./../../EitherT/Type
    , Foldable =
        ./../../Foldable/Type
    , Function =
        ./../../Function/Type
    , Functor =
        ./../../Functor/Endo/Type Type Set.arrow
    , Identity =
        ./../../Identity/Type Type
    , Lan =
        ./../../Lan/Type Type Type Set.arrow
    , Monad =
        ./../../Monad/Type Type Set.arrow
    , Monoid =
        ./../../Monoid/Type Type Set
    , NaturalTransformation =
        ./../../NaturalTransformation/Type Type Type Set.arrow
    , NonEmptyList =
        ./../../NonEmptyList/Type
    , Profunctor =
        ./../../Functor/Hom Type Set.arrow
    , Ran =
        ./../../Ran/Type Type Type Set.arrow
    , Reader =
        ./../../Reader/Type Type Set.arrow
    , ReaderT =
        λ(m : Type → Type) → ./../../ReaderT/Type Type Set.arrow
    , Semigroup =
        ./../../Semigroup/Type Type Set.arrow Set.product
    , Semigroupoid =
        ./../../Semigroupoid/Type Type Set.arrow
    , Star =
        ./../../Star/Type Type Set.arrow
    , State =
        ./../../State/Type
    , StateT =
        ./../../StateT/Type
    , Strong =
        ./../../Strong/Type Type Type Set.arrow Set.arrow
    , Transformer =
        ./../../Transformer/Type
    , Traversable =
        λ(m : Type → Type) → ./../../Functor/Endo/Type Type (Star m)
    , Tuple =
        ./../../Tuple/Type
    , Yoneda =
        ./../../Yoneda/Type Type Set.arrow
    }
