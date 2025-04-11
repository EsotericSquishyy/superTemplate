#import "@preview/cetz:0.3.2"
#import "src/math_mod.typ"
#import "src/cs_mod.typ"
#import "src/physics_mod.typ"
#import "src/pstat_mod.typ"

#import "src/templates.typ": *

// Quality of life
#let bu(unit) = $bold(upright(unit))$
#let vtr(unit) = $bold(upright(unit))$
#let up(unit) = $upright(unit)$

// Calculus
#let integer = int // required for integral
#let int = sym.integral
#let iint = sym.integral.double
#let iiint = sym.integral.triple
#let oint = sym.integral.cont
#let oiint = sym.integral.surf
#let oiiint = sym.integral.vol
#let df = $upright(d) f$
#let dg = $upright(d) g$
#let dh = $upright(d) h$
#let dl = $upright(d) l$
#let dr = $upright(d) r$
#let ds = $upright(d) s$
#let dt = $upright(d) t$
#let du = $upright(d) u$
#let dv = $upright(d) v$
#let dw = $upright(d) w$
#let dx = $upright(d) x$
#let dy = $upright(d) y$
#let dz = $upright(d) z$
#let dlambda = $upright(d) lambda$
#let dtheta = $upright(d) theta$
#let dphi = $upright(d) phi$
#let dpsi = $upright(d) psi$
#let dell = $upright(d) ell$
#let dbu(x) = $upright(d) bu(#x)$

#let der(..args) = {
  let argv = args.pos()
  let argc = argv.len()

  if argc < 1 {
    panic("Must pass in at least one positional argument")
  } else if argc > 3 {
    panic("Must pass in at most 3 positional arguments")
  }

  let indvar = if argc == 3 { argv.at(1) } else if argc == 2 { argv.at(1) } else { argv.at(0) }
  let depvar = if argc == 3 { argv.at(0) } else if argc == 2 { argv.at(0) } else { none }
  let order = if argc == 3 { argv.at(2) } else { 1 }

  if (order == 1) {
    $(upright(d) #depvar) / (upright(d) #indvar)$
  } else {
    $(upright(d)^#order #depvar) / (upright(d) #indvar^#order)$
  }
}

#let pder(..args) = {
  let argv = args.pos()
  let argc = argv.len()

  if argc < 1 {
    panic("Must pass in at least one positional argument")
  } else if argc > 3 {
    panic("Must pass in at most 3 positional arguments")
  }

  let indvar = if argc == 3 { argv.at(1) } else if argc == 2 { argv.at(1) } else { argv.at(0) }
  let depvar = if argc == 3 { argv.at(0) } else if argc == 2 { argv.at(0) } else { none }
  let order = if argc == 3 { argv.at(0) } else { 1 }

  if (order == 1) {
    $(partial #depvar) / (partial #indvar)$
  } else {
    $(partial^#order #depvar) / (partial #indvar^#order)$
  }
}

// Arbitrary elements in angle brackets or parens
#let ang(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $lr(angle.l joined angle.r)$
}
#let paren(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $lr(paren.l joined paren.r)$
}

// Misc. Symbols
#let cap = sym.inter
#let sect = sym.inter
#let cup = sym.union
#let infty = sym.infinity
#let pm = sym.plus.minus
#let sim = sym.tilde.op
#let ni = sym.in.rev
#let st = "such that"
#let fs = "for some"
#let iff = "if and only if"
#let wlog = "without loss of generality"
#let Wlog = "Without loss of generality"
#let Sps = "Suppose"
#let Spst = "Suppose that"
#let wrt = "with respect to"
#let qquad = $quad quad$
#let cdots = math.class("relation", $dot thin dot thin dot$)
#let ldots = math.class("relation", $. thin . thin .$)
#let comp = sym.compose
#let propto = sym.prop // proportional to (avoids a symbol conflict with proposition)
#let mapsto = sym.arrow.r.long.bar // image of a given element under a map
#let exiuni = $exists!$ // exists unique
#let oplus = sym.plus.circle
#let otimes = sym.times.circle

// Misc. Operators
#let Id = $op("Id")$
#let Im = $op("Im")$
#let sgn = $op("sgn")$
#let asinh = $op("asinh")$
#let acosh = $op("acosh")$
#let atanh = $op("atanh")$
#let arcsinh = $op("arcsinh")$
#let arcosh = $op("arcosh")$
#let arctanh = $op("arctanh")$
#let prod = $limits(product)$
#let sum = $limits(sum)$

// Long division; see https://github.com/typst/typst/discussions/3149
#let longdiv(cols_count, ..cells) = {
  let cols = if type(cols_count) == int { cols_count } else { 1 }
  set grid(
    columns: cols,
    inset: 5pt,
    align: right,
    stroke: (x, y) => (
      left: if x == cols - 1 { black },
      bottom: if (
        y == 0 and x == cols - 1 or x < cols - 1 and calc.odd(y) and x + 1 >= y / 2
      ) {
        black
      },
    ),
  )
  grid(..cells)
}
