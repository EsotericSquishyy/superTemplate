#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge

// Differential Geometry
#let grad = $gradient$
#let div(x) = $grad dot #x$
#let curl(x) = $grad times #x$
#let lapl = $laplace$

// Topology
#let bound = sym.diff
#let clo(x) = $overline(#x)$

// misc analysis
#let Arg = $op("Arg")$
#let Log = $op("Log")$
#let argmin = $arg min$
#let Res = $limits(op("Res"))$
#let conj(a) = $overline(#a)$
#let sup = $limits(op("sup"))$
#let inf = $limits(op("inf"))$
#let max = $limits(op("max"))$
#let min = $limits(op("min"))$
#let limsup = $limits(op("limsup"))$
#let liminf = $limits(op("liminf"))$
#let contint1 = $integral_C f(z) d z$
#let contint2 = $integral_gamma f(z) d z$

// Linear Algebra
#let proj = $op("proj")$
#let null = $op("null")$
#let span(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $"span"lr({ joined })$
}
#let range = $op("range")$
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$  // inner product
#let tr = $op("tr")$  // trace
#let dsum = sym.plus.circle  // direct sum
#let tp = sym.times.circle  // tensor product
#let codim = $op("codim")$

// algebra
#let eclass(a) = $overline(#a)$
#let Mod(z) = $#h(0.25em) (mod #z)$
#let inv(a) = $#a^(-1)$
#let ord = [#math.op("ord")]
#let cyc(..args) = {
  let joined = args.pos().map(x => $#x$).join($space$)
  $lr((joined))$
}
#let gen(a) = $angle.l #a angle.r$  // cyclic subgroup
#let nsub = sym.lt.tri.eq
#let notnsub = sym.lt.tri.eq.not
#let Aut = $op("Aut")$
#let Inn = $op("Inn")$
#let GL = $op("GL")$
#let SL = $op("SL")$
#let iso = sym.tilde.equiv
#let notiso = sym.tilde.equiv.not
#let rcoset = $#h(0cm) \\ #h(0cm)$
#let Isom = $op("Isom")$
#let char = $op("char")$
#let nil = $op("nil")$
#let cont = $op("cont")$
#let pp = $op("pp")$

// number theory
#let lcm = $op("lcm")$

// model theory
#let mimp = $op(tack.r.double)$
#let notmimp = $op(tack.r.double.not)$
#let rlmimp = $tack.r.double tack.l.double$

// Geometry
#let Cay = $op("Cay")$

// https://github.com/typst/typst/discussions/3149
#let longdiv(cols_count, ..cells) = {
  let cols = if type(cols_count) == int { cols_count } else { 1 }
  set grid(
    columns: cols,
    inset: 5pt,
    align: right,
    stroke: (x, y) => (
      left: if x == cols - 1 { black },

      bottom: if (
        y == 0 and x == cols - 1
        or x < cols - 1 and calc.odd(y) and x + 1 >= y / 2
      ) {
        black
      }
    ),
  )
  grid(..cells)
}
