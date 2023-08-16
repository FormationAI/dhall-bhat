let Functor = ./Type

in  λ(f : Type → Type) →
    λ(functor : Functor f) →
      { map =
          λ(a : Type) →
          λ(b : Type) →
          λ(g : a → b) →
          λ(fa : f a) →
            functor.map a b g fa
      , leftConst = λ(a : Type) → λ(b : Type) → ./leftConst f functor a b
      , rightConst = λ(a : Type) → λ(b : Type) → ./rightConst f functor a b
      , void = λ(a : Type) → ./void f functor a
      }
