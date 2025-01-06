#import "@preview/cetz:0.2.2"
#import "src/math_mod.typ"
#import "src/cs_mod.typ"
#import "src/quantum_mod.typ"
#import "src/pstat_mod.typ"

#import "src/env_mod.typ": *

// Quality of life
#let integer = int // required for integral
#let int    = $integral$
#let iint   = $integral.double$
#let iiint  = $integral.triple$
#let oint   = $integral.cont$
#let oiint  = $integral.surf$
#let oiiint = $integral.vol$
#let bu(unit) = $bold(upright(unit))$
#let u(unit) = $upright(unit)$
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
#let del = $partial$
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
  $angle.l joined angle.r$
}

// misc symbols
#let infty = $infinity$
#let pm = $plus.minus$
#let sim = $tilde.op$
#let st = "such that"
#let iff = "if and only if"
#let wlog = "without loss of generality"
#let Wlog = "Without loss of generality"
#let cdots = $dots.h.c$
#let comp = $compose$
#let propto = $prop$

// misc operators
#let Id = $op("Id")$
#let Im = $op("Im")$
#let sgn = $op("sgn")$
#let max = $limits(op("max"))$
#let min = $limits(op("min"))$
#let prod = $limits(product)$
#let sum = $limits(sum)$
#let oplus = $plus.circle$
#let otimes = $times.circle$

#show link: underline

