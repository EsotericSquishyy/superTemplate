#import "@preview/unify:0.6.0": num, qty, numrange, unit  // for calculations involving units
#import "@preview/physica:0.9.3": *  // for general physics notation
#import "@preview/quill:0.5.0": *  // for quantum circuits

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
