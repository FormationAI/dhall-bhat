    let Monad = ./Type 

in  let Module
        :   ∀(f : Type → Type)
          → ∀ ( monad
              : { applicative :
                    { applicative :
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
                , monad       :
                    { bind :
                          ∀(a : Type)
                        → ∀(b : Type)
                        → ∀(fa : f a)
                        → ∀(k : a → f b)
                        → f b
                    }
                }
              )
          → { ap   :
                ∀(a : Type) → ∀(b : Type) → ∀(g : f (a → b)) → ∀(fa : f a) → f b
            , bind :
                ∀(a : Type) → ∀(b : Type) → ∀(fa : f a) → ∀(k : a → f b) → f b
            , map  :
                ∀(a : Type) → ∀(b : Type) → ∀(g : a → b) → ∀(fa : f a) → f b
            , pure : ∀(a : Type) → a → f a
            }
        =   λ(f : Type → Type)
          → λ(monad : Monad f)
          → { ap   =
                  λ(a : Type)
                → λ(b : Type)
                → λ(g : f (a → b))
                → λ(fa : f a)
                → monad.applicative.applicative.ap a b g fa
            , bind =
                  λ(a : Type)
                → λ(b : Type)
                → λ(fa : f a)
                → λ(k : a → f b)
                → monad.monad.bind a b fa k
            , map  =
                  λ(a : Type)
                → λ(b : Type)
                → λ(g : a → b)
                → λ(fa : f a)
                → monad.applicative.functor.map a b g fa
            , pure = λ(a : Type) → monad.applicative.applicative.pure a
            }

in  Module
