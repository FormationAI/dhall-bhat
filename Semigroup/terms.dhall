    let kArrow = ./../Function/Kind

in  let kProduct = ./../Tuple/Kind

in    λ(object : Kind)
    → λ(arrow : kArrow (kProduct object object) Type)
    → λ(product : kArrow (kProduct object object) object)
    → λ(m : object)
    → λ(semigroup : ./Type object arrow product m)
    → semigroup.{ op }
