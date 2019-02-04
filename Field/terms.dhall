    let kArrow = ./../Function/Kind

in  let kProduct = ./../Tuple/Kind

in    λ(object : Kind)
    → λ(cat : ./../Category/Monoidal/Type kArrow kProduct object)
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
    → λ(field : ./Type object cat m)
    →   { divide =
            ./divide object cat category bifunctor m field
        , reciprocal =
            field.multiplicative.inverse
        }
      ∧ ./../Ring/terms.dhall
        object
        cat
        category
        bifunctor
        m
        (./extractRing object cat m field)
