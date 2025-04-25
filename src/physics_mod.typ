#import "@preview/unify:0.6.0": num, qty, numrange, unit // for calculations involving units
#import "@preview/physica:0.9.5": * // for general physics notation
#import "@preview/quill:0.5.0": * // for quantum circuits

//------Classical Mechanics------
#let ddot = math.dot.double
#let dddot = math.dot.triple
#let eula1(x, y) = $0 = pdv(cal(L), #x) - dv(, y) pdv(cal(L), dot(#x))$
#let eula2(x, y) = $0 = pdv(f, #x) - dv(, y) pdv(f, dot(#x))$


//------Quantum Mechanics------
#let hbar = $planck.reduce$ // reduced planck constant
#let tp = $times.circle$ // tensor product


//------Quantum Information------
#let expec(a) = $angle.l #a angle.r$ // expectation

// bases in the Bloch sphere
#let zbasis = $plus.circle$
#let xbasis = $times.circle$

// the following prevent formatting errors in the Y basis
#let pli = $+ #h(0em) i$
#let nei = $- #h(0em) i$
