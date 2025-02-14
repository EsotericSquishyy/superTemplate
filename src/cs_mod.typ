#import "@preview/finite:0.3.0": *
#import "@preview/algorithmic:0.1.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/codly:1.0.0": *
#import "@preview/codly-languages:0.1.1": *

// cryptography
#let KeyGen = $op("KeyGen")$
#let Gen = $op("Gen")$
#let unif = $<-^(\$)$
#let Enc = $op("Enc")$
#let Dec = $op("Dec")$
#let concat = $#h(0.05em) || #h(0.05em)$
#let poly = $op("poly")$
#let PPT = $"PPT"$

// lambda calculus
#let evalto = $arrow.b.double$
#let pred = $dot.circle$
