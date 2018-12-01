  λ(object : Kind)
→ λ(arrow : object → object → Type)
→ λ(product : object → object → object)
→ λ(m : object)
→ λ(semigroup : ./Type object arrow product m)
→ { op = semigroup.op }
