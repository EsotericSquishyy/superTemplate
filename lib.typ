#import "@preview/cetz:0.3.2"
#import "src/math_mod.typ"
#import "src/cs_mod.typ"
#import "src/quantum_mod.typ"
#import "src/pstat_mod.typ"

#import "src/env_mod.typ": *

// Quality of life
#let integer = int // required for integral
#let int    = sym.integral
#let iint   = sym.integral.double
#let iiint  = sym.integral.triple
#let oint   = sym.integral.cont
#let oiint  = sym.integral.surf
#let oiiint = sym.integral.vol
#let bu(unit) = $bold(upright(unit))$
#let vtr(unit) = $bold(upright(unit))$
#let up(unit) = $upright(unit)$
#let dt = $upright(d) t$
#let dx = $upright(d) x$
#let dy = $upright(d) y$
#let dz = $upright(d) z$
#let df = $upright(d) f$
#let dg = $upright(d) g$
#let dh = $upright(d) h$
#let ds = $upright(d) s$
#let du = $upright(d) u$
#let dv = $upright(d) v$
#let dr = $upright(d) r$
#let dmu = $upright(d) mu$
#let dw = $upright(d) w$
#let dtheta = $upright(d) theta$
#let dphi = $upright(d) phi$
#let dpsi = $upright(d) psi$
#let del = sym.partial
#let deriv(x, n: 1, f: none) = {
  if (n == 1) {
    $(upright(d) #f) / (upright(d) #x)$
  } else {
    $(upright(d)^#n #f) / (upright(d) #x^#n)$
  }
}
#let pderiv(x, n: 1, f: none) = {
  if (n == 1) {
    $(partial #f) / (partial #x)$
  } else {
    $(partial^#n #f) / (partial #x^#n)$
  }
}
#let ang(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $lr(angle.l joined angle.r)$
}
#let paren(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $lr(paren.l joined paren.r)$
}

// misc symbols
#let cap    = sym.inter
#let sect   = sym.inter
#let cup    = sym.union
#let infty  = sym.infinity
#let pm     = sym.plus.minus
#let sim    = sym.tilde.op
#let ni     = sym.in.rev
#let st     = "such that"
#let fs     = "for some"
#let iff    = "if and only if"
#let wlog   = "without loss of generality"
#let Wlog   = "Without loss of generality"
#let Sps    = "Suppose"
#let Spst   = "Suppose that"
#let wrt    = "with respect to"
#let qquad  = $quad quad$
#let cdots  = math.class("relation", $dot thin dot thin dot$)
#let ldots  = math.class("relation", $. thin . thin .$)
#let comp   = sym.compose
#let propto = sym.prop
#let varphi = sym.phi.alt
#let mapsto = sym.arrow.r.long.bar
#let exiuni = $exists!$

// misc operators
#let Id = $op("Id")$
#let Im = $op("Im")$
#let sgn = $op("sgn")$
#let prod = $limits(product)$
#let sum = $limits(sum)$
#let oplus = sym.plus.circle
#let otimes = sym.times.circle
