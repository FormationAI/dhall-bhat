  λ(object : Kind)
→ λ(cat : ./../Category/Monoidal/Type object)
→ λ(m : object)
→ λ(semiring : ./Type object cat m)
→ { add =
      semiring.additive.op
  , multiply =
      semiring.multiplicative.op
  , one =
      semiring.multiplicative.identity
  }
