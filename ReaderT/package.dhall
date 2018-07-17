    let ReaderT = ./Type

in  let Monad = ./../Monad/Type

in    λ(r : Type)
    → λ(m : Type → Type)
    → λ(monad : Monad m)
    →   { lift =
            λ(a : Type) → (./Transformer r).lift m monad a
        , runReaderT =
            λ(a : Type) → λ(reader : ReaderT r m a) → λ(env : r) → reader env
        , ask =
            ./ask r m monad.{ ap, map, pure }
        , asks =
            λ(a : Type) → ./asks r m monad.{ ap, map, pure } a
        , local =
              λ(a : Type)
            → λ(f : r → r)
            → λ(reader : ReaderT r m a)
            → ./local r m a f reader
        }
      ∧ ./Monad r m monad
