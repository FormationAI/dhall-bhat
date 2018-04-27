    let Functor = ./Type

in  let Module
        :   ∀(f : Type → Type)
          → ∀ ( functor
              : { map :
                    ∀(a : Type) → ∀(b : Type) → ∀(g : a → b) → ∀(fa : f a) → f b
                }
              )
          → { map        :
                ∀(a : Type) → ∀(b : Type) → ∀(g : a → b) → ∀(fa : f a) → f b
            , leftConst  :
                ∀(a : Type) → ∀(b : Type) → ∀(val : a) → ∀(fb : f b) → f a
            , rightConst :
                ∀(a : Type) → ∀(b : Type) → ∀(fa : f a) → ∀(val : b) → f b
            , void       : ∀(a : Type) → ∀(fa : f a) → f {}
            }
        =   λ(f : Type → Type)
          → λ(functor : Functor  f)
          → { map        =
                  λ(a : Type)
                → λ(b : Type)
                → λ(g : a → b)
                → λ(fa : f a)
                → functor.map a b g fa
            , leftConst  =
                λ(a : Type) → λ(b : Type) → ./leftConst  f functor a b
            , rightConst =
                λ(a : Type) → λ(b : Type) → ./rightConst  f functor a b
            , void       = λ(a : Type) → ./void  f functor a
            }

in  Module
