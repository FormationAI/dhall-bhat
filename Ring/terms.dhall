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
      cat.product
    )
→ λ(m : object)
→ λ(ring : ./Type object cat m)
→   { negate =
        ring.additive.inverse
    , subtract =
        ./subtract object cat category bifunctor m ring
    }
  ∧ ./../Rig/terms.dhall object cat m (./extractRig object cat m ring)
