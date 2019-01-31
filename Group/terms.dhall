  λ(object : Kind)
→ λ(cat : ./../Category/Monoidal/Type object)
→ λ(category : ./../Category/Type object cat.arrow)
→ λ ( bifunctor
    : ./../Functor/Bifunctor/Type
      object
      object
      object
      cat.arrow
      cat.arrow
      cat.arrow
      cat.op
    )
→ λ(m : object)
→ λ(group : ./Type object cat m)
→   { inverse =
        group.inverse
    , leftQuotient =
        ./leftQuotient object cat category bifunctor m group
    , rightQuotient =
        ./rightQuotient object cat category bifunctor m group
    }
  ∧ ./../Monoid/terms.dhall object cat m (./extractMonoid object cat m group)
