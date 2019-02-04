    let kArrow = ./../../Function/Kind

in  let kProduct = ./../../Tuple/Kind

in    λ(cObject : Kind)
    → λ(cArrow : kArrow (kProduct cObject cObject) Type)
    → λ(cCategory : ./../../Category/Type cObject cArrow)
    → λ(dObject : Kind)
    → λ(dArrow : kArrow (kProduct dObject dObject) Type)
    → λ(dCategory : ./../../Category/Type dObject dArrow)
    → λ(eObject : Kind)
    → λ(eArrow : kArrow (kProduct eObject eObject) Type)
    → λ(f : kArrow (kProduct cObject dObject) eObject)
    → λ(functor : ./Type cObject dObject eObject cArrow dArrow eArrow f)
    →     let extractFirstFunctor =
                ./impliedFirstFunctor
                cObject
                cArrow
                dObject
                dArrow
                dCategory
                eObject
                eArrow
                f
                functor
      
      in  let extractSecondFunctor =
                ./impliedSecondFunctor
                cObject
                cArrow
                cCategory
                dObject
                dArrow
                eObject
                eArrow
                f
                functor
      
      in    { first =
                λ(a : dObject) → (extractFirstFunctor a).map
            , second =
                λ(a : cObject) → (extractSecondFunctor a).map
            , extractFirstFunctor =
                extractFirstFunctor
            , extractSecondFunctor =
                extractSecondFunctor
            }
          ∧ functor
