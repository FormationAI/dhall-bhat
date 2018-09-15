  λ(object : Kind)
→ λ(arrow : object → object → Type)
→ λ(f : object → object)
→ λ(functor : ./Type object arrow f)
→ { map = functor.map }
