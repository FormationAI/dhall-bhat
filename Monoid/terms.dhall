  λ(object : Kind)
→ λ(cat : ./../Category/Monoidal/Type object)
→ λ(m : object)
→ λ(monoid : ./Type object cat m)
→   { identity = monoid.identity }
  ∧ ./../Semigroup/terms.dhall
    object
    cat.arrow
    cat.op
    m
    (./extractSemigroup object cat m monoid)
