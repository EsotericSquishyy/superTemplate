#import "@preview/unify:0.6.0": num, qty, numrange, unit // for calculations involving units
#import "@preview/physica:0.9.5": * // for general physics notation
#import "@preview/quill:0.5.0": * // for quantum circuits

//------Classical Mechanics------
#let ddot = math.dot.double
#let dddot = math.dot.triple
#let eula(x, y) = $pdv(L, #x) - dv(, #y) pdv(L, dot(#x))$  // euler-lagrange equation
#let ham1(q, p) = $dv(#q, t) = pdv(H, #p)$  // hamilton's equation 1
#let ham2(q, p) = $dv(#p, t) = -pdv(H, #q)$  // hamilton's equation 2

//------Quantum Mechanics------
#let hbar = $planck.reduce$  // reduced planck constant
#let tp = $times.circle$  // tensor product


//------Quantum Information------
#let expec(a) = $angle.l #a angle.r$  // expectation

// bases in the Bloch sphere
#let zbasis = $plus.circle$
#let xbasis = $times.circle$

// the following prevent formatting errors in the Y basis
#let pli = $+ #h(0em) i$
#let nei = $- #h(0em) i$
