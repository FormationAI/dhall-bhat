    let Applicative = ./Type

in  let Module
        :   ∀(f : Type → Type)
          → ∀ ( applicative
              : { applicative :
                    { ap   :
                          ∀(a : Type)
                        → ∀(b : Type)
                        → ∀(g : f (a → b))
                        → ∀(fa : f a)
                        → f b
                    , pure : ∀(a : Type) → a → f a
                    }
                , functor     :
                    { map :
                          ∀(a : Type)
                        → ∀(b : Type)
                        → ∀(g : a → b)
                        → ∀(fa : f a)
                        → f b
                    }
                }
              )
          → { ap           :
                ∀(a : Type) → ∀(b : Type) → ∀(g : f (a → b)) → ∀(fa : f a) → f b
            , leftApConst  :
                ∀(a : Type) → ∀(b : Type) → ∀(fa : f a) → ∀(fb : f b) → f a
            , liftA2       :
                  ∀(a : Type)
                → ∀(b : Type)
                → ∀(c : Type)
                → ∀(g : a → b → c)
                → ∀(fa : f a)
                → ∀(fb : f b)
                → f c
            , map          :
                ∀(a : Type) → ∀(b : Type) → ∀(g : a → b) → ∀(fa : f a) → f b
            , pure         : ∀(a : Type) → a → f a
            , rightApConst :
                ∀(a : Type) → ∀(b : Type) → ∀(fa : f a) → ∀(fb : f b) → f b
            }
        =   λ(f : Type → Type)
          → λ(applicative : Applicative  f)
          → { ap           =
                  λ(a : Type)
                → λ(b : Type)
                → λ(g : f (a → b))
                → λ(fa : f a)
                → applicative.applicative.ap a b g fa
            , leftApConst  =
                  λ(a : Type)
                → λ(b : Type)
                → λ(fa : f a)
                → λ(fb : f b)
                → ./leftApConst  f applicative a b fa fb
            , liftA2       =
                  λ(a : Type)
                → λ(b : Type)
                → λ(c : Type)
                → λ(g : a → b → c)
                → λ(fa : f a)
                → λ(fb : f b)
                → ./liftA2  f applicative a b c g fa fb
            , map          =
                  λ(a : Type)
                → λ(b : Type)
                → λ(g : a → b)
                → λ(fa : f a)
                → applicative.functor.map a b g fa
            , pure         = λ(a : Type) → applicative.applicative.pure a
            , rightApConst =
                  λ(a : Type)
                → λ(b : Type)
                → λ(fa : f a)
                → λ(fb : f b)
                → ./rightApConst  f applicative a b fa fb
            }

in  Module
