    let object = Type

in    λ(m : object)
    → λ(ring : ./Type m)
    →   { negate = ring.additive.inverse, subtract = ./subtract m ring }
      ∧ ./../Rig/terms.dhall m (./extractRig m ring)
