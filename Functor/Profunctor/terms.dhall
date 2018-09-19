  λ(cObject : Kind)
→ λ(cArrow : cObject → cObject → Type)
→ λ(cCategory : ./../../Category/Type cObject cArrow)
→ λ(dObject : Kind)
→ λ(dArrow : dObject → dObject → Type)
→ λ(dCategory : ./../../Category/Type dObject dArrow)
→ ./../Bifunctor/terms.dhall
  dObject
  (./../../Category/Op/Type dObject dArrow)
  (./../../Category/Op/category dObject dArrow dCategory)
  cObject
  cArrow
  cCategory
  Type
  ./../../Function/Type
