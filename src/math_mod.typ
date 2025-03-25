#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge  // for commutative diagrams


//------Differential Geometry------
#let grad = $gradient$  // gradient operator
#let div(x) = $grad dot #x$  // divergence operator
#let curl(x) = $grad times #x$  // curl operator
#let lapl = $laplace$  // laplacian operator


//------Topology------
#let bound = sym.diff  // boundary of a topological space
#let clo(x) = $overline(#x)$  // closure of a topological space


//------Real and Complex Analysis------
#let Arg = $op("Arg")$  // principal argument
#let Log = $op("Log")$  // principal logarithm
#let argmax = $arg max$  // arguments of the maxima
#let argmin = $arg min$  // arguments of the minima
#let Res = $limits(op("Res"))$  // residue
#let conj(a) = $overline(#a)$  // complex conjugate
#let contint1 = $integral_C f(z) d z$  // generic contour integral (notation 1)
#let contint2 = $integral_gamma f(z) d z$  // generic contour integral (notation 2)

// the following have been redefined to display math underneath inline:
#let sup = $limits(op("sup"))$  // supremum
#let inf = $limits(op("inf"))$  // infimum
#let max = $limits(op("max"))$  // maximum
#let min = $limits(op("min"))$  // minimum
#let limsup = $limits(op("limsup"))$  // limit superior
#let liminf = $limits(op("liminf"))$  // limit inferior

// measure differentials
#let dmu = $upright(d) mu$
#let dnu = $upright(d) nu$


//------Linear Algebra------
#let proj = $op("proj")$  // projection
#let null = $op("null")$  // null space
#let span(..args) = {  // linear span
  let joined = args.pos().map(x => $#x$).join(",")
  $"span"lr({ joined })$
}
#let range = $op("range")$
#let nullity = $op("nullity")$
#let rank = $op("rank")$
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$  // inner product
#let tr = $op("tr")$  // trace
#let dsum = sym.plus.circle  // direct sum
#let tp = sym.times.circle  // tensor product
#let codim = $op("codim")$  // codimension


//------Abstract Algebra------
#let eclass(a) = $overline(#a)$  // equivalence class
#let Mod(z) = $#h(0.25em) (mod #z)$  // modulo
#let inv(a) = $#a^(-1)$  // inverse
#let ord = $op("ord")$  // order
#let Sym = $op("Sym")$  // symmetric group
#let cyc(..args) = {  // permutation (element of a cyclic group)
  let joined = args.pos().map(x => $#x$).join($space$)
  $lr((joined))$
}
#let gen(a) = $angle.l #a angle.r$  // cyclic subgroup
#let nsub = sym.lt.tri.eq  // normal subgroup
#let notnsub = sym.lt.tri.eq.not  // not a normal subgroup
#let Aut = $op("Aut")$  // automorphism
#let Inn = $op("Inn")$  // inner automorphism
#let GL = $op("GL")$  // general linear group
#let SL = $op("SL")$  // special linear group
#let Ker = $op("Ker")$  // kernel
#let iso = sym.tilde.equiv  // isomorphic
#let notiso = sym.tilde.equiv.not  // not isomorphic
#let rcoset = $#h(0cm) \\ #h(0cm)$  // right coset
#let Isom = $op("Isom")$  // isometry
#let char = $op("char")$  // characteristic
#let nil = $op("nil")$  // nilradical
#let cont = $op("cont")$  // content
#let pp = $op("pp")$
#let GF = $op("GF")$  // galois field


//------Number Theory------
#let lcm = $op("lcm")$  // least common multiple


//------Model Theory------
#let mimp = $op(tack.r.double)$  // semantic implication
#let notmimp = $op(tack.r.double.not)$  // not a semantic implication
#let rlmimp = $tack.r.double tack.l.double$


//------Geometry------
#let Cay = $op("Cay")$  // Cayley graph
