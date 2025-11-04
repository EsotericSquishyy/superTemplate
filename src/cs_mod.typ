#import "@preview/finite:0.4.1": *  // for cellular automata
#import "@preview/lovelace:0.3.0": *  // for formalized pseudocode
#import "@preview/codly:1.3.0": *  // for code snippets
#import "@preview/codly-languages:0.1.1": *  // for more languages in those code snippets


//------Cryptography------
#let KeyGen = $op("KeyGen")$  // cryptographic key generation
#let Gen = $op("Gen")$  // short form of the same
#let unif = $<-^(\$)$  // uniformly sampled from
#let Enc = $op("Enc")$  // encryption algorithm
#let Dec = $op("Dec")$  // decryption algorithm
#let concat = $#h(0.05em) || #h(0.05em)$  // concatenation
#let poly = $op("poly")$  // polynomial time algorithm
#let PPT = $"PPT"$  // probabilistic polynomial time algorithm
#let pk = $op("pk")$  // private key
#let sk = $op("sk")$  // secret key


//------Lambda Calculus------
#let evalto = sym.arrow.b.double  // evaluate to this value under operational semantics
#let pred = sym.dot.o  // logical predicate


//------Machine Learning------
#let softmax = $op("softmax")$
#let ReLU = $op("ReLU")$
#let score = $op("score")$
#let attention = $op("attention")$
