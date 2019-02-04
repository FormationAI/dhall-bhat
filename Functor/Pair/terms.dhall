    let kArrow = ./../../Function/Kind

in  let kProduct = ./../../Tuple/Kind

in    λ(object : Kind)
    → λ(arrow : kArrow (kProduct object object) Type)
    → λ(category : ./../../Category/Type object arrow)
    → ./../Bifunctor/terms.dhall
      object
      arrow
      category
      object
      arrow
      category
      object
      arrow
