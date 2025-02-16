#import "@local/superTemplate:0.2.0": *
#import pstat_mod: *
#let date = datetime(
  year: 2025,
  month: 1,
  day: 3
)
#show: assignment.with("Probability Homework 1", "Jane Doe", date)

#prob[
  For this question, note that poker hands consist of 5 cards, and that we are using a standard 52 card deck, with 4 suits (Spades, Clubs, Hearts, and Diamonds), and within each suit there are 13 different ranks (Ace, 2, ..., 10, J, Q, K).
  Find the probabilities of poker hands that fall in the following categories. (For reference, see example c.19 of your textbook for an example of how you might find the probability of a poker hand with One pair.)
  1. Two pairs. (Two cards of the same rank, two cards of another rank and a fifth card with a different rank.)
  2. Three of a kind. (Three cards of the same rank with two cards which have ranks different from each other and from the first three.)
  3. Straight. (Five cards with ranks in a sequence and which are not all in the same suit. A, 2, 3, 4, 5, and 10, J, Q, K, A both count.)
  4. Flush. (Five cards of the same suit which are not in sequential rank.)
  5. Four of a kind. (Four cards of the same rank and another card.)
][
  First we determine the total number of poker hands: $vec(52, 5) = #let T = calc.binom(52, 5); #T$.
  We perform each calculation by choosing ranks and then suits.
  1. We have $vec(13, 2) vec(4, 2)^2 vec(11, 1) vec(4, 1) = #let pairs = calc.binom(13, 2) * calc.pow(calc.binom(4, 2), 2) * calc.binom(11, 1) * calc.binom(4, 1); pairs$ so that our probability is $#pairs / #T = #(calc.round(pairs / T * 10000) / 100)%$. #v(1em)
  2. We have $vec(13, 1) vec(4, 3) vec(12, 2) vec(4, 1)^2 = #let three = calc.binom(13, 1) * calc.binom(4, 3) * calc.binom(12, 2) * calc.pow(calc.binom(4, 1), 2); three$ so that our probability is $#three / #T = #(calc.round(three / T * 10000) / 100)%$. #v(1em)
  3. Notice we need to pick a starting card from ace to 10, and we also need to subtract off the possibility that all cards are of the same suit.
    Thus we have $vec(10, 1) vec(4, 1)^5 - vec(10, 1) vec(4, 1) = #let straight = calc.binom(10, 1) * calc.pow(calc.binom(4, 1), 5) - 40; straight$ so that our probability is $#straight / #T = #(calc.round(straight / T * 10000) / 100)%$. #v(1em)
  4. We have $vec(13, 5) vec(4, 1) = #let flush = calc.binom(13, 5) * calc.binom(4, 1); flush$ so that our probability is $#flush / #T = #(calc.round(flush / T * 100000) / 1000)%$. #v(1em)
  5. Notice if we choose our 4 cards, there will be 48 cards remaining.
    Thus we have $vec(13, 1) vec(48, 1) = #let four = calc.binom(13, 1) * calc.binom(48, 1); four$ so that our probability is $#four / #T = #(calc.round(four / T * 100000) / 1000)%$. #v(1em)
]

#prob[
  Let $X$ be a continuous random variable with density function
  $
  f_X (x) = cases(
    3e^(-3x) "if" x > 0 \
    0 "otherwise"
  )
  $
  1. Verify that $f$ is a density function.
  2. Calculate $P(-1 < X < 1)$.
  3. Calculate $P(X < 5)$.
  4. Calculate $P(2 < X < 4 | X < 5)$.
  5. Find the cumulative distribution function of $X$.
][
  1. Consider that
  $
  int_(-infty)^infty f_X (x) dx = 3 int_0^infty e^(-3x) dx = lr(-e^(-3 x)|)_0^infty = 1
  $
  which implies that $f$ is a density function.

  2. We have
  $
  P(-1 < X < 1) = int_(-1)^1 f_X (x) dx = 3 int_(0)^1 e^(-3 x) dx = lr(-e^(-3 x)|)_0^1 = 1 - e^(-3).
  $

  3. We have
  $
  P(X < 5) = int_(-infty)^5 f_X (x) dx = lr(-e^(-3 x)|)_(0)^5 = 1 - e^(-15).
  $

  4. We have
  $
  P(2 < X < 4 | X < 5) = P(2 < X < 4) / P(X < 5) = (int_2^4 f_X (x) dx) / (1 - e^(-15)) = (lr(-e^(-3 x)|)_2^4) / (1 - e^(-15)) = (e^(-6) - e^(-12)) / (1 - e^(-15)).
  $

  5. We have
  $
  F(x) = int_(-infty)^x f_X (t) dt = int_0^x = 3 int_0^infty e^(-3t) dt = lr(-e^(-3 t)|)_0^x = 1 - e^(-3x).
  $
]

#prob(breakable: true)[
  Let $X$ and $Y$ be jointly continuous with joint probability density function
  $
  f(x, y) = cases(
    &c(x y + y^2)\, quad &0 <= x <= 1 " and  " 0 <= y <= 1 \
    &0\, &"otherwise"
  )
  $
  where $c$ is a constant.
  1. Find $c$ such that this is a proper joint PDF.
  2. Find the marginal density functions of $X$ and $Y$.
  3. Calculate the probability $P(X < Y)$.
  4. Calculate the expectation $E[X^2 Y]$.
][
  1. For this to be a joint PDF, we must have
  $
  1 = int_(-infty)^infty int_(-infty)^infty f(x, y) dx dy &= int_0^1 int_0^1 c(x y + y^2) dx dy \
  &= c int_0^1 lr(1 / 2 y x^2 + y^2 x |)_(x = 0)^(x = 1) dy \
  &= c int_0^1 1 / 2 y + y^2 dy \
  &= c (lr(1 / 4 y^2 + y^3 / 3 |)_0^1) \
  &= c (1 / 4 + 1 / 3) \
  &= c (7 / 12) \
  ==> 12 / 7 = c.
  $

  2. We have
  $
  f_X (x) &= int_(-infty)^infty f(x, y) dy \
  &= int_0^1 12 / 7 (x y + y^2) dy \
  &= 12 / 7 (lr(x y^2 / 2 + y^3 / 3 |)_(y = 0)^(y = 1)) \
  &= 12 / 7 (x / 2 + 1 / 3) \
  &= (6 x) / 7 + 4 / 7 \
  $
  meaning
  $
  f_X (x) = cases(
    (6 x) / 7 + 4 / 7 "if" 0 <= x <= 1 \
    0 "otherwise"
  )
  $
  and
  $
  f_Y (y) &= int_(-infty)^infty f(x, y) dx \
  &= int_0^1 12 / 7 (x y + y^2) dx \
  &= 12 / 7 (lr(y x^2 / 2 + x y^3 |)_(x = 0)^(x = 1)) \
  &= 12 / 7 (y / 2 + y^3) \
  $
  so
  $
  f_Y (y) = cases(
    12 / 7 (y / 2 + y^3) "if" 0 <= y <= 1 \
    0 "otherwise".
  )
  $

  3. We have
  $
  P(X < Y) &= int_infty^infty int_(-infty)^y f(x, y) dx dy \
  &= 12 / 7 int_0^1 int_0^y x y + y^2 dx dy \
  &= 12 / 7 int_0^1 (lr(y x^2 / 2 + x y^2 |)_(x = 0)^(x = y)) \
  &= 12 / 7 int_0^1 (y^3 / 2 + y^3) \
  &= 12 / 7 (lr((3 y^4) / 8 |)_(y = 0)^(y = 1)) \
  &= 12 / 7 (3 / 8) \
  &= 9 / 14.
  $

  4. We have
  $
  E[X^2 Y] &= int_infty^infty int_(-infty)^y x^2 y f(x, y) dx dy \
  12 / 7 int_0^1 int_0^1 (x^2 y) (x y + y^2) dx dy \
  &= 12 / 7 int_0^1 int_0^1 (x^3 y^2 + x^2 y^3) dx dy \
  &= 12 / 7 int_0^1 lr(x^4 / 4 y^2 + x^3 / 3 y^3 |)_(x = 0)^(x = 1) dy \
  &= 12 / 7 int_0^1 y^2 / 4 + y^3 / 3 dy \
  &= 12 / 7 ( lr(y^3 / 12 + y^4 / 12 |)_(y = 0)^(y = 1)) \
  &= 12 / 7 (1 / 12 + 1 / 12) \
  &= 12 / 7 (1 / 6) \
  &= 2 / 7.
  $
]

#prob[
  Suppose the random variables $X_1, X_2, dots, X_n sim^("i.i.d.") Exp(lambda)$ and define the random variable $Y$ as the minimum of those $X$'s, or $ Y = min_(1 <= i <= n) {X_i}. $
  Identify the distribution of $Y$ and the parameter values.
][
  Notice that since the random variables are identical and independent, we can write
  $
  P(t <= Y) = P(t <= min_(1 <= i <= n) {X_i}) = P(sect.big_(i = 1)^n (t <= X_i)) = prod_(i = 1)^n P(t <= X_i) = prod_(i = 1)^n (e^(-y lambda)) = e^(-n lambda y)
  $
  using the complement of the CDF for $Exp(lambda)$.
  But this clearly implies $Y sim Exp(n lambda)$.
]

#prob(breakable: true)[
  Let $X$ and $Y$ be jointly continuous with joint density
  $
  f(x, y) = cases(
    &c(1 - y)\, quad &0 < x < y < 1 \
    &0\, &"otherwise"
  )
  $
  where $c$ is some constant.

  1. Find $c$ that makes this a proper density function.
  2. Given that $Y > 2 slash 3$ find the probability that $X < 1 slash 2$.
  3. Find the expected value of $X$.
  4. Find the expected value of $Y$.
][
  1. We have
  $
  1 &= int_0^1 int_0^y c(1 - y) dx dy \
  &= c int_0^1 y(1 - y) dy \
  &= c int_0^1 y - y^2 dy \
  &= c lr(y^2 / 2 - y^3 / 3 |)_0^1 \
  &= c (1 / 2 - 1 / 3) \
  &= c / 6
  $
  implying $c = 6$.

  2. We want to determine
  $
  P(X < 1 / 2 | Y > 2 / 3) &= P(X < 1 / 2 sect Y > 2 / 3) / P(Y > 2 / 3) \
  &= (int_0^(1 / 2) int_(2 / 3)^1 6 (1 - y) dy dx) / (int_(2 / 3)^1 int_0^y 6 (1 - y) dx dy) \
  &= (1 / 6) / (7 / 27) \
  &= 9 / 14
  $
  via a calculator.

  3. We want to determine
  $
  E[X] &= 6 int_0^1 int_0^y x(1 - y) dx dy \
  &= 6 int_0^1 (1 - y) lr(x^2 / 2 |)_(x = 0)^(x = y) dy \
  &= 3 int_0^1 y^2 - y^3 dy \
  &= 3 (lr(y^3 / 3 - y^4 / 4) |)_0^1 \
  &= 3 (1 / 3 - 1 / 4) \
  &= 3 (1 / 12) \
  &= 1 / 4.
  $

  4. We have
  $
  E[Y] &= 6 int_0^1 int_0^y y (1 - y) dx dy \
  &= 6 int_0^1 y^2 (1 - y) dy \
  &= 6 int_0^1 y^2 - y^3 dy \
  &= 6 (y^3 / 3 - y^4 / 4)_0^1 \
  &= 6 (1 / 3 - 1 / 4) \
  &= 1 / 2.
  $
]
