--	      
    let Either = ./Type

in    λ(a : Type)
    → λ(b : Type)
    →     let E = constructors (Either a b)
      
      in    { Left =
                E.Left
            , Right =
                E.Right
            , fromLeft =
                λ(def : a) → λ(e : Either a b) → ./fromLeft a b def e
            , fromRight =
                λ(def : b) → λ(e : Either a b) → ./fromRight a b def e
            , isLeft =
                λ(e : Either a b) → ./isLeft a b e
            , isRight =
                λ(e : Either a b) → ./isRight a b e
            , lefts =
                λ(eithers : List (Either a b)) → ./lefts a b eithers
            , partition =
                λ(eithers : List (Either a b)) → ./partition a b eithers
            , rights =
                λ(eithers : List (Either a b)) → ./rights a b eithers
            , traverse =
                ./functor/pair
            , pair =
                ./functor/pair
                (./../Identity/Type Type)
                (./../Identity/functor/endo Type ./../Function/Type)
            }
          ∧ ./monad a
