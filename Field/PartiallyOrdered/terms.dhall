    let object = Type

in  let cat = ./../../Category/Monoidal/Set/cartesian

in  let category = ./../../Function/category

in  let bifunctor = ./../../Tuple/functor/pair

in    λ(m : object)
    → λ(field : ./Type m)
    →   { eq = field.additive.eq, partialLE = field.additive.partialLE }
      ∧ ./../terms.dhall
        object
        cat
        category
        bifunctor
        m
        (./extractField m field)
