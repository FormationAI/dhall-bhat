    let object = Type

in    λ(m : object)
    → λ(field : ./Type m)
    →   { divide = ./divide m field, reciprocal = field.multiplicative.inverse }
      ∧ ./../Ring/terms.dhall m (./extractRing m field)
