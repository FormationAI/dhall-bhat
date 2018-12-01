    let object = Type

in    λ(m : object)
    → λ(field : ./Type m)
    →   { eq = field.additive.eq, partialLE = field.additive.partialLE }
      ∧ ./../terms.dhall m (./extractField m field)
