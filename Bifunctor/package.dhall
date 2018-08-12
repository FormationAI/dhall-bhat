    let Bifunctor = ./Type

in  let Module
        :   ∀(p : Type → Type → Type)
          → ∀ ( bifunctor
              : { bimap :
                      ∀(a : Type)
                    → ∀(b : Type)
                    → ∀(c : Type)
                    → ∀(d : Type)
                    → ∀(f : a → b)
                    → ∀(g : c → d)
                    → ∀(pac : p a c)
                    → p b d
                }
              )
          → { bimap :
                  ∀(a : Type)
                → ∀(b : Type)
                → ∀(c : Type)
                → ∀(d : Type)
                → ∀(f : a → b)
                → ∀(g : c → d)
                → ∀(pac : p a c)
                → p b d
            , first :
                  ∀(a : Type)
                → ∀(b : Type)
                → ∀(c : Type)
                → ∀(f : a → b)
                → ∀(pac : p a c)
                → p b c
            , second :
                  ∀(a : Type)
                → ∀(c : Type)
                → ∀(d : Type)
                → ∀(g : c → d)
                → ∀(pac : p a c)
                → p a d
            }
        =   λ(p : Type → Type → Type)
          → λ(bifunctor : Bifunctor p)
          → { bimap =
                  λ(a : Type)
                → λ(b : Type)
                → λ(c : Type)
                → λ(d : Type)
                → λ(f : a → b)
                → λ(g : c → d)
                → λ(pac : p a c)
                → bifunctor.bimap a b c d f g pac
            , first =
                ./first p bifunctor
            , second =
                ./second p bifunctor
            }

in  Module
