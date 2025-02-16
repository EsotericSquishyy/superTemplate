#import "@local/superTemplate:0.2.0": *
#import cs_mod: *
#show: notes.with("Algorithms", "Jane Doe", depth: 3)
#show: codly-init.with()
#codly(stroke: 2pt + black, fill: white, zebra-fill: rgb("#f5f4f2"), languages: codly-languages)

= Greedy Algorithms

== Interval Scheduling

#bookmark[Lecture 1][Jan 1, 2025]

<intsche>
#comp_prob[Interval Scheduling][
  Suppose we have a list of $n$ tasks that we want to schedule on a single processor.
  Each activity is specified by its start and end times, and only one activity can be scheduled on the resource at a time.
  Note an activity cannot be paused, i.e., it uses the resource continuously between its start and end times.

  Our goal is to schedule the maximum possible number of tasks.
]

#rmk[
  We can formalize the previous problem as follows:

  Call our set of tasks $S = {1, 2, dots, n}$.
  The $i$-th task is given by a tuple $(s(i), f(i))$ with $s(i) <= f(i)$, for $i = 1, dots, n$, where $s(i)$ represents its start time and $f(i)$ represents its finish time.

  Define a _feasible schedule_ as a subset in which no two tasks overlap.
  Thus, our goal is to find a feasible schedule of maximum size.
]

#ex[
  Suppose we have 5 tasks: $ {(3, 6), (1, 4), (4, 10), (6, 8), (0, 2)} $
  A feasible schedule cannot have two activities that overlap, so we cannot accept both (1, 4) and (3, 6).
  However, (3, 6) and (6, 8) are acceptable, because second only begins when first ends.
  Note that the optimal solution in this example has size 3.
]

#rmk[
  We have a few possible greedy strategies:
  1. First In First Out (FIFO): pick the task that starts first, remove overlapping activities and repeat
  2. Shortest first: pick the activity with the shortest duration, remove overlapping activities and repeat
  3. Min overlap first: Count the number of other jobs that overlap, then choose one with smallest overlap count

  But if we analyze these, we can find simple counterexamples for the first one (an activity that's really long is first) and the third one (a shorter interval in the middle that overlaps with 2 which could fit together).
  We could also construct a counterexample example for the second option.
]

<eft>
#algo(name: "Earliest Finish Time (EFT)")[
  We claim that the optimal greedy strategy is to sort the process jobs in order by earliest finish time.

  We sort jobs by order:
  $
    f(j_1) <= f(j_2) <= cdots <= f(j_n)
  $

  #align(
    center,
    table(
      columns: (1.1fr, 2fr),
      table.header(
        [*Pseudocode*], [*Python Implementation*]
      ),
      inset: 10pt,
      align: center + horizon,
      pseudocode-list([
      + A = {1}; j = 1; // accept job 1
      + for i = 2 to n do
        + if s(i) >= f(j) then
          + A = A + {i}; j = i;
      + return A
      ]),
      ```py
      S = [(3, 6), (1, 4), (4, 10), (6, 8), (0, 2)]

      def eft(S: list[tuple[int]]) -> list[int]:
          A, j = [], 1
          for i in range(2, n):
              if S[i][0] >= S[j][1]:
                  A.append(i)
                  j = i

          return A
      ```
    )
  )
]

#ex[
  #grid(
    align: center,
    columns: (0.3fr, 1fr),
    table(
      columns: 3,
      table.header([Activity], [Start], [Finish]),
      [1], [1], [4],
      [2], [3], [5],
      [3], [0], [6],
      [4], [5], [7],
      [5], [3], [8],
      [6], [5], [9],
      [7], [6], [10],
      [8], [8], [11],
      [9], [8], [12],
      [10], [2], [13],
      [11], [12], [14]
    ),
    cetz.canvas(length: 6%, {
      import cetz.draw: *

      set-style(stroke: 0.4pt)
      grid((0, 0), (15, 12), step: 1, stroke: gray + 0.2pt)

      line((0, 0), (15, 0), mark: (end: ">"))
      line((0, 0), (0, 12), mark: (end: ">"))
      line((1, 1), (4, 1))
      line((3, 2), (5, 2))
      line((0, 3), (6, 3))
      line((5, 4), (7, 4))
      line((3, 5), (8, 5))
      line((5, 6), (9, 6))
      line((6, 7), (10, 7))
      line((8, 8), (11, 8))
      line((8, 9), (12, 9))
      line((2, 10), (13, 10))
      line((12, 11), (14, 11))
    })
  )

  The greedy algorithm first chooses 1, then skips 2 and 3.
  Next it chooses 4, and skips 5, 6, and 7.
  Finally, it should choose 8 and 11.
]

#prop[
  The #link(<eft>)[Earliest Finish Time Algorithm] correctly solves the #link(<intsche>)[Interval Scheduling Problem].
][
  Suppose $a_1, dots, a_k$ are the indices of jobs in the greedy schedule, and $b_1, dots, b_m$ are jobs in an optimal schedule OPT.
  We want to show $k = m$.

  Our intuition should be that the greedy algorithm makes the resource free again as soon as possible.
  In particular, $f(a_1) <= f(b_1)$, that is, the greedy algorithm stays ahead.
  We formalize this as follows.

  #lem(name: "Greedy Structure Lemma")[
    For every $i <= k$, we have $f(a_i) <= f(b_i)$.
  ][
    We proceed by induction.
    Note the $i = 1$ case is trivial.
    By the induction hypothesis, we have $f(a_(i - 1)) <= f(b_(i - 1))$.
    Therefore $f(a_(i - 1)) <= s(b_i)$, since clearly $f(b_(i - 1)) <= s(b_i)$.
    But notice $s(b_i) <= f(b_i)$, which implies $f(a_i) <= f(b_i)$ as desired.
  ]

  Notice by the lemma, $f(a_k) <= f(b_k)$, but $f(b_k) <= f(b_m)$, so $f(a_k) <= f(b_m)$, implying $k <= m$.
  But $m <= k$ since OPT is optimal, implying $m = k$ as desired.
]

#runtime[
  Since the Earliest Finish Time algorithm involves sorts its values, it is at least $O(n log n)$.
  Then notice we iterate through the sorted values, an $O(n)$ operation, so the algorithm is $O(n log n)$ overall.
]
