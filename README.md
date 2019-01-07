# dhall-bhat
Tasty meal of Dhall

We currently require Dhall 1.18.0, and try to support newer releases as much as possible.

## Documentation

Types as documentation: https://formationai.github.io/dhall-bhat/

## Style

Dhall is still a very young community, so the style is still evolving. Here’s how we’re currently doing things in dhall-bhat.

### group expressions by type

It’s common to define a type and a number of related expressions for it. When you do this, we generally create a directory named for the type, with everything related to it in that directory.

- Foo (the name of the type, a directory)
  - Type (the file containing the type itself, capitalized)
  - functor (file contaning a Functor instance for this type, lowercase)
  - op (some operation defined on this type, lowercase)
  - package.dhall (file contanining a record of all the terms related to this type)

### use `dhall format`

`make format` (or, even better, `make lint`) in this repo will automatically apply this to the entire repository.

**NB**: `dhall format` (and `lint`) currently [removes all comments from the file](https://github.com/dhall-lang/dhall-haskell/issues/145) except for a single “heading” comment. So be careful that you don’t lose important comments this way.

### don’t repeat names

In Dhall, the name of an expression is given by the file it’s in. Most of us aren’t used to this style, so we have an inclination to provide a name _within_ the file, e.g.
```dhall
let  foo = <the real expression>
in   foo
```

But this is a place that becomes easy to get out of sync – if the file is renamed, the name used within the file is no longer accurate, so if you’re looking at the contents and trying to use the expression, it can be confusing that you can’t actually use that name. Instead, just rely on the file name, and let the expression be “bare” within the file.

### create bindings for imports

It’s often tempting to use imports directly inlined, like `(./Foo/functor).map`, but as we move toward freezing our imports, we need to add SHAs, which make inlined imports extremely difficult to read. So, pre-emptively, we try to create bindings to avoid having SHAs littered throughout the expression.

### minimal top-level types

In general, we don’t have explicit types on expressions. Since there is only a single top-level expression per file, it’s relatively easy for editors to display the result of `dhall type` to provide a type annotation on the fly.

The exception to this is type class instances, which end up looking like
```dhall
    let Foo = ../Foo/Type
in  let Bar = ./Type
in  { operation = ...
    , anotherOperation = ...
    } : Foo Bar
```
This is because it isn’t enough that they have a valid type, but that type needs to align with the type class definition in order to be applicable where that type class is required.

### don’t define type class methods in their own files

Rather than making each definition its own file, we tend to define methods within the instance. One reason for this is that there are often _multiple_ instances of a type class for a single type, so it’s not always clear which one should be “blessed” at the top-level. E.g., having two incompatible `Applicative` instances isn’t unusual, so defining a “./Foo/ap” can be confusing.

It’s also the case that those methods don’t really have meaning outside of the laws that relate them to the type class, so we constrain the definition to where those laws apply. So we keep those names scoped to the classes, and then also expose them through “./Foo/package.dhall” module that provides names for all operations of a type.

**NB**: We will eventually [replace “package.dhall” with “terms.dhall”](https://github.com/FormationAI/dhall-bhat/issues/46).
