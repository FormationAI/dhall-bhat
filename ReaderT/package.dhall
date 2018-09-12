--     let ReaderT = ./Type

-- in  let Monad = ./../Monad/Type Type ./../Function/Type

-- in    λ(r : Type)
--     → λ(m : Type → Type)
--     → λ(monad : Monad m)
--     →     let extractApplicative =
--                 ./../Monad/impliedApplicative
--                 Type
--                 ./../Function/Type
--                 ./../Function/semigroupoid
--                 m
--                 monad
      
--       in    { lift =
--                 λ(a : Type) → (./Transformer r).lift m monad a
--             , ask =
--                 ./ask r m (extractApplicative m monad)
--             , asks =
--                 λ(a : Type) → ./asks r m (extractApplicative m monad) a
--             , local =
--                   λ(a : Type)
--                 → λ(f : r → r)
--                 → λ(reader : ReaderT r m a)
--                 → ./local r m a f reader
--             }
--           ∧ ./../Monad/package.dhall
--             Type
--             ./../Function/Type
--             (ReaderT r m)
--             (./monad r m monad)
<>
