    let object = Type

in  let cat = ./../Category/Monoidal/Set/cartesian

in    λ(m : object)
    → λ(rig : ./Type m)
    →   { zero = rig.additive.identity }
      ∧ ./../Semiring/terms.dhall object cat m (./extractSemiring m rig)
