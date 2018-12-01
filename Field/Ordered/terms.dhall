    let object = Type

in    λ(m : object)
    → λ(field : ./Type m)
    →   { le = field.additive.le }
      ∧ ./../PartiallyOrdered/terms.dhall
        m
        (./extractPartiallyOrderedField m field)
