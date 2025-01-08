#import "@preview/unify:0.6.0": num, qty, numrange, unit
#import "@preview/physica:0.9.3": *
#import "@preview/quill:0.5.0": *

#let hbar = $planck.reduce$
#let tp = $times.circle$
#let expec(a) = $angle.l #a angle.r$  // expectation

// to prevent formatting errors in the Y basis
#let pli = $+ #h(0em) i$
#let nei = $- #h(0em) i$
