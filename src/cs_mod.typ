#import "@preview/finite:0.3.0": *
#import "@preview/algorithmic:0.1.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.2.2": canvas, draw, tree

// cryptography
#let KeyGen = $op("KeyGen")$
#let Gen = $op("Gen")$
#let unif = $<-^(\$)$
#let Enc = $op("Enc")$
#let Dec = $op("Dec")$
#let concat = $#h(0.05em) || #h(0.05em)$
#let poly = $op("poly")$
