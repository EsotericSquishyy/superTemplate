// Differential Geometry
#let grad = $gradient$
#let div(x) = $grad dot #x$
#let curl(x) = $grad times #x$
#let lapl = $laplace$


// Topology
#let bound = $diff$
#let clo(x) = $overline(#x)$

// misc analysis
#let Arg = $op("Arg")$
#let Log = $op("Log")$
#let argmin = $arg min$
#let Res = $limits(op("Res"))$
#let conj(a) = $overline(#a)$
#let sup = $limits(op("sup"))$
#let inf = $limits(op("inf"))$
#let limsup = $limits(op("limsup"))$
#let liminf = $limits(op("liminf"))$

// Linear Algebra
#let proj = $op("proj")$
#let null = $op("null")$
#let span(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $"span"{ joined }$
}
#let range = $op("range")$
#let ip(x, y) = $angle.l #x, #y angle.r$  // inner product
#let tr = $op("tr")$  // trace
#let dsum = $plus.circle$  // direct sum
#let tp = $times.circle$  // tensor product

// algebra
#let eclass(a) = $overline(#a)$
#let Mod(z) = $#h(0.25em) (mod #z)$
#let inv(a) = $#a^(-1)$
#let ord = [#math.op("ord")]
#let cyc(..args) = {
  let joined = args.pos().map(x => $#x$).join($space$)
  $(joined)$
}
#let gen(a) = $angle.l #a angle.r$  // cyclic subgroup
#let nsub = $lt.tri.eq$
#let notnsub = $lt.tri.eq.not$
#let Aut = $op("Aut")$
#let Inn = $op("Inn")$
#let GL = $op("GL")$
#let SL = $op("SL")$
#let iso = $tilde.equiv$
#let notiso = $tilde.equiv.not$

// number theory
#let lcm = $op("lcm")$
