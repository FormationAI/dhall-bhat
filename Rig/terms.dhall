  λ(object : Kind)
→ λ(cat : ./../Category/Monoidal/Type object)
→ λ(m : object)
→ λ(rig : ./Type object cat m)
→   { zero = rig.additive.identity }
  ∧ ./../Semiring/terms.dhall object cat m (./extractSemiring object cat m rig)
