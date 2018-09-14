# dhall-bhat
Tasty meal of Dhall

Many of the classes here are more general than is commonly seen in functional languages. Here are some mappings to help you know what to use

```
dhall-bhat                 | Haskell     | Scala (Cats)
---------------------------|-------------|-------------
./Functor/Contravariant ...|Contravariant|Contravariant
./Functor/Endo/Set         |Functor      |Functor
./Functor/Endo/Star        |Traversable  |Traverse
./Functor/Hom ...          |Profunctor   |Profunctor
./Monoid/Set               |Monoid       |Monoid
./Semigroup/Set            |Semigroup    |Semigroup
```

## Documentation

Types as documentation: https://formationai.github.io/dhall-bhat/
