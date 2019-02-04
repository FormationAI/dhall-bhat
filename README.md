# dhall-bhat
Tasty meal of Dhall

This requires either Dhall 1.18 or 1.20+ (it will not work on Dhall 1.19).

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

## Contributing

Here are some helpful hints to nativigating the code base.

Everything lives within a “`Kind`-level” monoidal category, which you can think of as an approximation of **Cat**. This is represented by the names `kArrow` and `kProduct`. The object of the category is implicitly `Kind`, but we can’t specify that explicitly. We also have no way of representing common monoidal identities at the Kind-level (e.g., `{}` and `<>` have no `Kind`-level equivalent), so there is no `kIdentity` for the monoidal category.
