#import "@local/superTemplate:0.2.0": *
#import math_mod: *
#let date = datetime(
  year: 2025,
  month: 1,
  day: 3
)
#show: assignment.with("Group Theory Homework 1", "John Doe", date)

#excs(name: "Dummit and Foote 1.1.9", breakable: true)[
  Let $G = {a + b sqrt(2) in RR : a, b in QQ}$.

  1. Prove that $G$ is a group under addition.
  2. Prove that the nonzero elements of $G$ are a group under multiplication.
    [Rationalize the denominators to find multiplicative inverses.]
][
  1. We begin by showing closure under the operation.
    Take $g_1, g_2 in G$ so that $exists a, b, c, d in QQ st g_1 = a + b sqrt(2), g_2 = c + d sqrt(2)$.
    Then $g_1 + g_2 = a + b sqrt(2) + c + d sqrt(2) = (a + c) + (b + d) sqrt(2) in G$, which follows from associativity, commutativity, and and the distribution law on the field $RR$, and the fact that $QQ$ is closed under addition..
    In fact, the associativity of addition on $G$ trivially follows from the fact that $G subset RR$ and addition is associative in $RR$.
    Further, $0 = 0 + 0 sqrt(2) in G$ is an additive identity, which follows from the fact that 0 is the additive identity in $RR$ already.

    Now to show every element has an inverse, notice given $g in G$ with $g = a + b sqrt(2) "and" a, b in QQ$, let $g' = (-a) + (-b) sqrt(2) in G$, so that
    $
    g + g' &= a + b sqrt(2) + (-a) + (-b) sqrt(2) \
    &= a + (-a) + b sqrt(2) + (-b) sqrt(2) \
    &= (a + (-a)) + (b + (-b)) sqrt(2) \
    &= 0 \
    &= (-a) + (-b sqrt(2)) + a + b sqrt(2) \
    &= g' + g
    $
    which follows from addition being commutative and associative in $RR$.

    Thus $G$ is a group under addition.

  2. Again we show closure under the operation.
    Take $g_1, g_2 in G$ so that $exists a, b, c, d in QQ st g_1 = a + b sqrt(2), g_2 = c + d sqrt(2)$.
    Then $g_1 g_2 = (a + b sqrt(2)) (c + d sqrt(2)) = a c + a d sqrt(2) + b c sqrt(2) + 2 b d = (a c + 2 b d) + (a d + b c) sqrt(2) in G$ where our manipulations are valid since $RR$ is a field, and $a c + 2b d, a d + b c in QQ$ follows from the closure of addition and multiplication on $QQ$.
    The associativity of multiplication follows from $G subset RR$, and since $1 = 1 + 0 sqrt(2)in G$ is the multiplicative identity in $RR$, it is the multiplicative identity here too.

    Now let $g in G$ with $g = a + b sqrt(2)$ and $a, b in QQ$, and let $g' = a / (a^2 - 2b^2) - b / (a^2 - 2b^2) sqrt(2)$.
    Notice since $QQ$ is closed under multiplication and division by nonzero elements, we need only check that $a^2 - 2 b^2 != 0$.
    But this is equivalent to $a = pm b sqrt(2)$.
    We need only check nonzero elements of $G$, so we can throw out the case that $a = b = 0$.
    But then our condition is equivalent to $a / b = pm sqrt(2)$, an impossibility since $a / b in QQ$ and $sqrt(2) in.not QQ$.
    Thus we indeed have $g' in G$, and
    $
    g g' &= (a + b sqrt(2)) (a / (a^2 - 2b^2) - b / (a^2 - 2b^2) sqrt(2)) \
    &= (a / (a^2 - 2b^2) - b / (a^2 - 2b^2) sqrt(2)) (a + b sqrt(2)) \
    &= g' g \
    &= a^2 / (a^2 - 2b^2) + (a b sqrt(2)) / (a^2 - 2b^2) - (b a sqrt(2)) / (a^2 - 2b^2) - (2 b^2) / (a^2 - 2b^2) \
    &= (a^2 - 2b^2) / (a^2 - 2b^2) \
    &= 1.
    $
    Thus $G \\ {0}$ is a group under multiplication.
]

#excs(name: "Dummit and Foote 1.1.25")[
  Let $G$ be a group.
  Prove that if $x^2 = 1 forall x in G$, then $G$ is abelian.
][
  Let $a, b in G$.
  Then observe
  $
  a b &= 1 dot a b dot 1 \
  &= b^2 (a b) a^2 \
  &= b (b a) (b a) a \
  &= b (b a)^2 a \
  &= b dot 1 dot a \
  &= b a
  $
  so $G$ is abelian.
]

#excs(name: "Dummit and Foote 1.1.32)")[
  If $x$ is an element of finite order $n$ in a group $G$, prove that the elements $1, x, x^2, dots, x^(n - 1)$ are all distinct.
  Deduce that $|x| <= |G|$.
][
  Suppose by contradiction that $x^a = x^b$ for some $a, b in {0, 1, dots, n - 1}$ with $a != b$.
  Without loss of generality, suppose $a < b$.
  Then $x^(-a) x^a = 1 = x^(-a) x^b = x^(b - a)$.
  But since $b - a <= (n - 1) - 0 < n$, we must have that $x$ cannot be order $n$, a contradiction.
  Therefore $1, x, dots, x^(n - 1)$ are all distinct.
  Further, each belongs to $G$, so $G$ includes at least these elements, and thus $n = |x| <= |G|$.
]

#pagebreak()
#excs(name: "Dummit and Foote 1.2.5)", breakable: true)[
  If $n$ is odd and $n >= 3$, show that the identity is the only element of $D_(2n)$ which commutes with all the elements of $D_(2n)$.
][
  Recall that $D_(2n) = angle.l r, s | r^n = 1, s^2 = 1, s r = inv(r) s angle.r$.
  Suppose $x in D_(2n)$ commutes with all elements of $D_(2n)$.

  Recall that $r$ and $s$ are generators of $D_(2n)$, and in particular $D_(2n) = {1, r, dots, r^(n - 1), s, r s, dots, r^(n - 1) s}$

  First, consider the case that $x = r^k s$ for some $k in {0, dots, n - 1}$.
  Then since $x$ commutes universally,
  $
  r x &= x r \
  ==> r (r^k s) &= (r^k s) r \
  ==> r^(k + 1) s &= r^k (r^(-1) s) \
   &= r^(k - 1) s \
  ==> (r^(-k)) r^(k + 1) &= (r^(-k)) r^(k - 1) \
  ==> r &= r^(-1) \
  ==> r^2 &= 1 \
  $
  but by definition, $r$ has order $n >= 3$, so this is a contradiction.
  Therefore, we must have $x = r^k$ for $k in {0, dots, n - 1}$:
  $
  x s &= s x \
  ==> r^k s &= s r^k \
  &= (s r) r^(k - 1) \
  &= r^(-1) (s r) r^(k - 2) \
  &#h(0.3em) dots.v \
  &= r^(-k) s \
  ==> r^k &= r^(-k) \
  ==> r^(2k) &= 1 \
  $
  Now since $r$ has order $n$, we must have that $n divides 2k$.
  But since $k <= n - 1$, we must have either $n = 2 k$ or $k = 0$.
  But the former situation is impossible since $n$ is odd, so it must be true that $k = 0$ and $x = r^0 = 1$.
  Thus any element in $D_(2n)$ that commutes with every other element must be the identity.
]
