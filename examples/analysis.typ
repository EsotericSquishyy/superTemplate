#import "@local/superTemplate:0.2.0": *
#import math_mod: *
#show: notes.with("Analysis Lecture Notes", "John Doe", number: true, depth: 3)
#set enum(numbering: "i)")

// These notes are based on the first few pages of Principles of Mathematical Analysis by Walter Rudin

= The Real and Complex Number Systems

== Introduction

#bookmark[Lecture 1][Jan 1, 2025]

We must predicate the main concepts of analysis on a well-defined concept of numbers.
What do we mean when we say the sequence
#nn[$
  1, 1.4, 1.41, 1.414, 1.4142, ...
$]
tends to $sqrt(2)$?

#ex[
  We now show that the equation $ p^2 = 2 $<1> is not satisfied by any rational $p$.
  By contradiction, suppose there were such a $p$.
  Then we could write $p = m / n$ where $n, m in ZZ$ and $n$ and $m$ are coprime.
  Then @1 implies $ m^2 = 2 n^2, $<2> which shows that $m^2$ is even.
  Note that if $m$ were odd, $m^2$ would be odd, so $m^2$ being even implies $m$ is even.
  But then we can write $m = 2k fs k in ZZ$, giving us $2k^2 = n^2$, which by the same argument shows that $n$ is even.
  But $n$ and $m$ were supposed to be coprime, a contradiction.
]

We now consider this more closely.

#prop[
  Let $A$ be the set of all positive rationals $p st p^2 < 2$ and let $B$ consist of all positive rationals $p st p^2 > 2$.
  Then for every $p in A exists q in QQ sect A st p < q$, and $forall p in B exists q in QQ sect B st q < p$.
][
  Associate with each rational $p > 0$ the number
  $
    q = p - (p^2 - 2) / (p + 2) = (2p + 2) / (p + 2).
  $<3>
  Then
  $
    q^2 - 2 = (2(p^2 - 2)) / (p + 2)^2.
  $<4>
  If $p in A$, then $p^2 - 2 < 0$, so @3 shows that $q > p$, and @4 shows that $q^2 < 2$.
  Thus $q in A$.
  If $p in B$, then $p^2 - 2 > 0$ so @3 shows that $0 < q < p$ and @4 shows that $q^2 > 2$.
  Thus $q in B$.
]

#rmk[
  This shows that the rational number system has gaps, despite the density of $QQ$ in $QQ$.
  The real number system fills these gaps.
]

<order>
#defn[Order][
  Let $S$ be a set.
  An *order* on $S$ is a relation, denoted by $<$, with the following two properties:

  1. If $x in S$ and $y in S$ then one and only one of the statements #nn[$ x < y #h(2em) x = y #h(2em) y < x $] is true.
  2. If $x, y, z in S$, then if $x < y$ and $y < z$, then $x < z$.

  The statement "$x < y$" may be read as "$x$ is less than $y$" of "$x$ is smaller than $y$".
]

#defn[Ordered Set][
  An *ordered set* is a set $S$ in which an order is defined.

  For example, $QQ$ is an ordered set if $r < s$ is defined to mean that $s - r$ is a positive rational number.
]

#thm[
  Suppose $S$ is an ordered set with the least upper bound property, $B subset S$, $B$ is nonempty, and $B$ is bounded below.
  Let $L$ be the set of all lower bounds of $B$.
  Then #nn[$ alpha = sup L $] exists in $S$, and $alpha = inf B$.

  In particular, $inf B$ exists in $S$.
][
  Since $B$ is bounded below, $L$ is nonempty.
  SInce $L$ consists of the $y in S$ which satisfy the inequality $y <= x$ for every $x in B$, we see that _every_ $x in B$ is an _upper bound_ of $L$.
  Thus, $L$ is bounded above.
  Our hypothesis then implies that $L$ has a supremum in $S$ called $alpha$.

  If $gamma < alpha$, then (see #link(<order>)[Definition 1.1.4]) $gamma$ is not an upper bound of $L$, hence $gamma in.not B$.
  It follows that $alpha <= x forall x in B$.
  Thus $alpha in L$.

  If $alpha < beta$ then $beta in.not L$, since $alpha$ is a lower bound of $L$.

  We have shown that $alpha in L$ but $beta in.not L$ if $beta > alpha$.
  In other words, $alpha$ is a lower bound of $B$, but $beta$ is not if $beta > alpha$.
]
