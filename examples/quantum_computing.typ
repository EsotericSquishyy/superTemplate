#import "@local/superTemplate:0.2.0": *
#import quantum_mod: *
#show: basic

#align(
  center,
  [= Quantum Computing Study Sheet]
)

== Postulates of Quantum Mechanics

=== Postulate 1

Associated to any isolated physical system is a complex vector space with inner product (that is, a Hilbert space) known as the state space of the system.
The system is completely described by
its state vector, which is a unit vector in the system’s state space.
A coherent qubit is described by
$
  ket(psi)
    &= alpha ket(0) + beta ket(1)
$
with $alpha, beta in CC$, which we call a _superposition_ of the states $ket(0)$ and $ket(1)$.
Also note $|alpha|^2 + |beta|^2 = 1$.

=== Postulate 2

The evolution of a closed quantum system is described by a unitary transformation.
That is, the state $ket(psi)$ of the system at time $t_1$ is related to the state $ket(psi')$ of the system at time $t_2$ by a unitary operator $U$ (meaning $U^dagger = U^(-1)$) which depends only on the times $t_1$ and $t_2$, $ ket(psi') = U ket(psi). $

This postulate is equivalent to the statement that the time evolution of the state of a closed quantum is described by the Schrödinger equation.

=== Postulate 3

Quantum measurements are described by a collection of measurement operators ${M_m}$ such that:
- they act on the state space of the system being measured $ket(psi)$
- the index $m$ corresponds to measurement outcome
- the probability of obtaining outcome $m$ depends on the state of the system $ket(psi)$

== Bloch sphere

While $ket(psi)$ is really 4-dimensional, we can collapse 2 of the dimensions by noting that global phase cannot be measured ($ket(psi)$ and $e^(i phi) ket(psi)$ are indistinguishable when we measure them), and $abs(alpha)^2 + abs(beta)^2 = 1$.
Thus we can describe possible quantum states as being on the surface of a sphere parameterized by only 2 variables: $phi$ and $theta$.
This is the Bloch sphere representation of $ket(psi)$.

#figure(
  image("bloch_sphere.png", width: 30%),
  caption: [
    Bloch sphere with $ket(psi) = cos(theta/2) ket(0) + e^(i phi) sin(theta/2) ket(1)$.
  ],
)

Note that when a qubit interacts with something outside outside, meaning the quantum system becomes open rather than closed, these postulates do not apply.
This is called decoherence.

#pagebreak()

== Basis Vectors

We write out the basis vectors for each of the main bases with an explicit representation in the computational basis below:
#align(center,
  table(
    align: center,
    columns: (auto, auto, auto),
    inset: 10pt,
    table.header(
      [Basis], [+1 eigenstate], [-1 eigenstate]
    ),
    [Z],
    [$ket(0) = vec(1, 0)$],
    [$ket(1) = vec(0, 1)$],
    [X],
    [$ket(+) = 1 / sqrt(2) vec(1, 1)$],
    [$ket(-) = 1 / sqrt(2) vec(1, -1)$],
    [Y],
    [$ket(+i) = 1 / sqrt(2) vec(1, i)$],
    [$ket(-i) = 1 / sqrt(2) vec(1, -i)$]
  )
)

== Pauli Matrices

The following is all written in the computational basis. We can show that $
  I
    = mat(1, 0; 0, 1), quad
  X
    = sigma_x = mat(0, 1; 1, 0), quad
  Y
    = sigma_y = mat(0, -i; i, 0), quad
  Z
    = sigma_z = mat(1, 0; 0, -1)
$ form a basis of $2 times 2$ Hermitian matrices.
These matrices satisfy
$
  [X, Y]
    = 2 i Z; quad
  [Y, Z]
    = 2i X; quad
  [Z, X]
    = 2 i Y \
  {sigma_i, sigma_j}
    = 2 delta_(i j) I
$
where the commutator $[A, B] = A B - B A$ and the anti-commutator ${A, B} = A B + B A$.
In particular, note $i X = Y Z$.

== Change of Basis

Note the change of basis from $Z$ to $X$ basis or $X$ to $Z$ basis is given by the Hadamard gate: $
  H
    = mat([ket(0)]_x, [ket(1)]_x)
    = mat([ket(+)]_z, [ket(-)]_z)
    = 1/sqrt(2) mat(1, 1; 1, -1)_(x, z)
    = ket(+) bra(0) + ket(-) bra(1)
    = ket(0) bra(+) + ket(1) bra(-)
$
and the change of basis from the $X$ basis to the $Y$ basis is given by the phase gate: $
  S
    = mat([ket(+)]_y, ket(-)_y)
    // = 1 / 2 mat(1 - i, -1; 1 + i, 1)_y
    = mat(1, 0; 0, i)_z
    = ket(+i) bra(+) + ket(-i) bra(-)

$
with the change of basis from $Y$ to $X$ being $S^(-1) = S^dagger$ (since $S$ is unitary but not Hermitian, unlike the Hadamard gate).
Finally, a change of basis from $Z$ to $Y$ is given by composing the gates, i.e.,
$
  S H = ket(+i) bra(0) + ket(-i) bra(1) = 1 / sqrt(2) vec(1, i) mat(1, 0) + 1 / sqrt(2) vec(1, -i) mat(0, 1) = 1 / sqrt(2) mat(1, 1; i,-i)_z
$

#align(center,
  table(
    align: center,
    columns: 7 * (1fr,),
    inset: 10pt,
    table.header(
      [Element], [$ket(0)$], [$ket(1)$], [$ket(+)$], [$ket(-)$], [$ket(+i)$], [$ket(-i)$]
    ),
    [$Z$],
    [$ket(0)$],
    [$ket(1)$],
    [$(ket(0) + ket(1))/sqrt(2)$],
    [$(ket(0) - ket(1))/sqrt(2)$],
    [$(ket(0) + i ket(1))/sqrt(2)$],
    [$(ket(0) - i ket(1))/sqrt(2)$],
    [$X$],
    [$(ket(+) + ket(-))/sqrt(2)$],
    [$(ket(+) - ket(-))/sqrt(2)$],
    [$ket(+)$],
    [$ket(-)$],
    [$((1 + i) ket(+) + (1 - i) ket(-))/2$],
    [$((1 - i) ket(+) + (1 + i) ket(-))/2$],
    [$Y$],
    [$(ket(+i) + ket(-i))/sqrt(2)$],
    [$(-i ket(+i) + i ket(-i))/sqrt(2)$],
    [$((1 - i) ket(+i) + (1 + i) ket(-i))/2$],
    [$((1 + i) ket(+i) + (1 - i) ket(-i))/2$],
    [$ket(+i)$],
    [$ket(-i)$],
  )
)

== Dirac Notation Decomposition

These matrices have the following representations in different bases:

#align(
  center,
  table(
    align: center,
    columns: (auto, auto, auto, auto, auto),
    inset: 9pt,
    table.header(
      [Basis], [$Z$], [$X$], [$Y$], [$I$]
    ),
    [Z],
    [$ket(0) bra(0) - ket(1) bra(1)$],
    [$ket(1) bra(0) + ket(0) bra(1)$],
    [$i ket(1) bra(0) - i ket(0) bra(1)$],
    [$ket(0) bra(0) + ket(1) bra(1)$],
    [X],
    [$ket(+) bra(-) + ket(-) bra(+)$],
    [$ket(+) bra(+) - ket(-) bra(-)$],
    [$$],
    [$ket(+) bra(+) + ket(-) bra(-)$],
    [$Y$],
    [$i ket(+i) bra(-i) -i ket(-i) bra(+i)$],
    [],
    [$ket(+i) bra(+i) - ket(-i) bra(-i)$],
    [$ket(+i) bra(+i) + ket(-i) bra(-i)$]
  )
)

and note the diagonal entires are simply the Spectral Decompositions, and can be used to derive the other entries in the row by simply writing basis vectors in the other bases.

Example calculation: $Z$ in the $X$ basis.
We have
$
  Z_x
    &= I_(z -> x) Z_z I_(x -> z)
    &= H_z Z_z H_z
    &= X_z
  ==> Z_x
    &= ket(1)_x bra(0)_x + ket(0)_x bra(1)_x
    &= ket(+) bra(-) + ket(-) bra(-).
$

== Partial Rotation Quantum Gates

In addition to the Pauli gates and change of basis gates listed above, we can do a partial rotation in a given direction via

$
  X(theta)
    &equiv exp(-i theta / 2 sigma_x)
    = cos(-theta / 2) I + i sin(- theta / 2) sigma_x
    = mat(cos(theta / 2), -i sin(theta / 2); -i sin(theta / 2), cos(theta / 2)). \
  Y(alpha)
    &equiv exp(-i alpha / 2 sigma_y)
    = cos(- alpha / 2) I + i sin(-alpha / 2) sigma_y
    =  mat(cos(alpha / 2), -sin(alpha / 2); sin(alpha / 2), cos(alpha / 2)) \
  Z(beta)
    &equiv exp(-i beta / 2 sigma_z)
    = mat(e^(-i beta / 2), 0; 0, e^(i beta / 2)).
$

These can be used to create a "generalized Hadamard" as in HW 4 \#4 according to Office Hours: $Y(alpha) X(beta)$.

== Two Qubit Gates

Some typical 2 qubit gates are:

$
  "CNOT" = "CX"
    &= mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0)
    = ket(0) bra(0) tp I + ket(1) bra(1) tp X \
  "CZ"
    &= mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1)
    = ket(0) bra(0) tp I + ket(1) bra(1) tp Z \
  "SWAP"
    &= mat(1, 0, 0, 0; 0, 0, 1, 0; 0, 1, 0, 0; 0, 0, 0, 1)
    = ket(00) bra(00) + ket(10) bra(01) + ket(01) bra(10) + ket(11) bra(11).
$

== Eigendecomposition

For a Hermitian operator $A$, the Spectral Theorem tells us we can write $f(A) = Q^dagger f(Lambda) Q = sum_lambda f(lambda) ket(v) bra(v)$ for a unitary $Q$ and and unit eigenvectors $v$.

For example, $
  e^(theta Z)
    &= e^theta ket(0) bra(0) + e^(-theta) ket(1) bra(1)
    &= mat(e^theta, 0; 0, e^(-theta)).
$

== Schrödinger Equation

The Schrödinger equation is given by $
  i planck.reduce d/(d t) ket(psi(t))
    &= hat(H) ket(psi(t)).
$ If $hat(H)$ is independent of time, $ket(psi(t))$ can be solved by separation of variables. The result is given by $
  ket(psi(t))
    &= exp(- (i t)/planck.reduce hat(H)) ket(psi(0)).
$
Using an eigendecomposition for the Hamiltonian, we can write
$
  exp(- (i t)/planck.reduce hat(H))
    &= exp(- (i t)/planck.reduce lambda_1) ket(v_1) bra(v_1) + exp(- (i t)/ planck.reduce lambda_2) ket(v_2) bra(v_2).
$

If $hat(H)$ is dependent on time, $ket(psi(t))$ can be solved by solving the two ODEs, $alpha(t)$ and $beta(t)$, where $ket(psi(t)) = vec(alpha(t), beta(t))$.

== Mathematics of Quantum Measurements

According to Postulate 3, we have that the probability of $ket(psi)$ being in outcome $m$ is $
  p(m)
    &= bra(psi) M_m^dagger M_m ket(psi)
$ and once measured the state becomes $
  ket(phi)
    &= (M_m ket(psi))/(sqrt(p(m))).
$
Note that a set of measurement operators must satisfy a completeness condition due to being a probability mass function: $
  sum_m M_m^dagger M_m = I
    &<==> sum_m p(m)
    &= sum_m bra(psi) M_m^dagger M_m ket(psi)
    &= 1.
$

=== Projective Measurements

A projective measurement is a special type of measurement given by an observable $M$.
An observable is a Hermitian operator $M$ on the state space being observed.
It has a spectral decomposition $
  M
    &= sum_m m P_m
$ where $P_m$ is the projector onto the eigenspace of the eigenvalue $m$, i.e. $P_m = ket(v_m) bra(v_m)$.

Note that this definition implies projective measurements satisfy completeness, orthogonality ($M_m M_(m') = delta_(m,m') M_m$), and Hermiticity.

Note since projective measurements are idempotent, the probability of $ket(psi)$ being in the state of eigenvalue $m$ simplifies to $p(m) = bra(psi) P_m ket(psi)$.

== Identities

Some key identities are:

#align(
  center,
  [
    $&A = ket(psi) bra(phi.alt) -> A^dagger = ket(phi.alt) bra(psi) \
  &(A B ket(psi))^dagger = bra(psi) B^dagger A^dagger \
  &(A + B)^dagger = A^dagger + B^dagger \
  &tr(A tp B) = tr(A) tr(B) \
  &(f tp g) (u tp w) = f(u) tp g(w) "for" f: U -> V "and" g : W -> Z \
  & tr_B ([ket(a_1) bra(a_1) tp ket(b_1) bra(b_1)]) equiv ket(a_1) bra(a_1) tr(ket(b_1) bra(b_1))$
  ]
)


== Key Theorems

=== Real Spectral Theorem

Any Hermitian operator $M$ on a vector space $V$ is diagonal with respect to some orthonormal basis for $V$ and has real eigenvalues.

=== Simultaneous Diagonalization Theorem

Suppose $A$ and $B$ are Hermitian operators.
Then $[A, B] = 0 <==> exists$ an orthonormal basis such that $A$ and $B$ are diagonal wrt that basis.

=== Observable Exponential

Let $bu(v) in RR^3$ be a real unit vector and let $theta in RR$.
Then
$
  exp(i theta bu(v) dot bu(sigma))
    &= cos(theta) I + i sin(theta) bu(v) dot bu(sigma)
$

=== No Cloning Theorem

It is impossible to create an independent and identical copy of an arbitrary unknown quantum state.
This follows from the fact that given two states $ket(psi)$ and $ket(phi)$, we can show that a unitary "cloning" operator implies $braket(psi, phi) in {0, 1}$, meaning we can only copy states if they are the same or orthogonal.

=== Density Matrix Representation

An arbitrary density matrix for a mixed state qubit may be written as $
    rho
      &= (I + bu(r) dot bu(sigma))/2,
  $ where $bu(r)$ is a real three-dimensional vector such that $norm(bu(r)) <= 1$.

== Quantum Circuits

Given a quantum circuit such as

#align(center,
  quantum-circuit(
    1, 1, ctrl(1), $X(theta)$, [\ ],
    1, $Z(phi)$, targ(), 2
  )
)

with initial state $ket(psi) = 1 / sqrt(5) (ket(01) + 2 ket(10))$, we start on the left and apply each unitary in succession as follows:
$
  ket(psi') = U_3 U_2 U_1 ket(psi)
$
where
$
  U_1
    &= I tp Z(phi)
    = I tp exp(-i phi / 2 sigma_z) \
  U_2
    &= "CNOT"
    = ket(0) bra(0) tp I + ket(1) bra(1) tp X \
  U_3
    &= X(theta) tp I
    = exp(-i theta / 2 sigma_x) tp I.
$

Note that a 50:50 beamsplitter is realized by a Hadamard gate.

=== Quantum Zeno Effect

In order to get predictable quantum states, we can repeatedly measure a state after a short time interval, collapsing it back to its initial state with high probability.
If we have some small rotation
$
  ket(0) --> hat(X) ket(0) = cos(pi / (2n)) ket(0) + i sin(pi / (2n)) ket(1)
$
then the probability of measuring 0 for all time goes to 1 as $n -> infty$.

== Observables

An observable $O$ is a physical property that can be measured.
They are self-adjoint operators that assign values to outcomes of measurements, corresponding with eigenvalues of the operator.
The expectaton of an observable represents the expected values of the measurement, which is a weighted sum of the probability of getting different measurements $p(m)$ multiplied by the value of each measurement $c(m) in RR$
$
  EE(O)
    &= expec(hat(O))
    &= sum_m c(m) bra(psi) M_m^dagger M ket(psi)
    &= bra(psi) sum_m c_m M_m^dagger M_m ket(psi)
    &= bra(psi) hat(O) ket(psi)
    &= tr(ket(psi) bra(psi) hat(O)).
$

Note from probability theory, the standard deviation of an observable is given by $sigma = sqrt(EE(O^2) - EE(O)^2).$

Notice $ket(psi) bra(psi)$ is a measurement operator in the $psi$ basis.

== Partial Trace

We can describe a subsystem of a joined quantum system using partial trace.
For example, suppose we have physical systems $A$ and $B$, whose state is described by a density operator $rho^(A B)$.
The reduced density operator is defined by
$
  rho^A
    &equiv tr_B (rho^(A B))
$
where $tr_B$ is a map of operators known as the partial trace over system $B$.
This is defined by
$
  tr_B ([ket(a_1) bra(a_1) tp ket(b_1) bra(b_1)])
    &equiv ket(a_1) bra(a_1) tr(ket(b_1) bra(b_1))
$
where $a_1, a_2$ are vectors in the state space of $A$ and $b_1, b_2$ are vectors in the state space of $B$.
Notice $tr(ket(b_1) bra(b_2)) = braket(b_2, b_1)$.

For example, if $rho^(A B) = rho tp sigma$, then $rho^A = tr_B (rho tp sigma) = rho tr(sigma) = rho$, and similarly $rho^B = sigma$.

Given a pure Bell state, the corresponding density operator in the computational basis is
$
  rho
    &= ((ket(00) + ket(11)) / sqrt(2))((bra(00) + bra(11)) / sqrt(2)) \
    &= (ket(00) bra(00) + ket(11) bra(00) + ket(00) bra(11) + ket(11) bra(11)) / 2
$
meaning if we trace out the second qubit,
$
  rho^1
    &= tr_2 (rho) \
    &= (tr_2(ket(00) bra(00)) + tr_2 (ket(11) bra(00)) + tr_2(ket(00) bra(11)) + tr_2(ket(11) bra(11))) / 2 \
    &= (ket(0) bra(0) braket(0, 0) + ket(1) bra(0) braket(0, 1) + ket(0) bra(1) braket(1, 0) + ket(1) bra(1) braket(1, 1)) / 2 \
    &= (ket(0) bra(0) + ket(1) bra(1)) / 2 = I / 2.
$

== Environments

An arbitrary open quantum system can be described as an interaction between the system of interest and an environment, which together form a closed quantum system.
Suppose we have a system in state $rho$ and sent it through a box coupled to an environment.
Assume that the system-environment state is a product state, $rho tp rho_"env"$.

In this case the effect of the environment can be evaluated by tracing out the environmental system
$
  cal(E)(rho)
    &= tr_"env" [U (rho tp rho_"env") U^dagger]
$
giving us the reduced state of the system alone, since the system no longer interacts with the environment after the transformation $U$.

In the special case where $rho$ and $ket(0)$ go through a CNOT we have
$
  cal(E)(rho)
    &= tr_"env" [U (rho tp rho_"env") U^dagger] \
    &= tr_"env" ["CNOT" (rho tp rho_"env") "CNOT"^dagger] \
    &= tr_"env" [(P_0 tp I + P_1 tp X) (rho tp ket(0) bra(0)) (P_0 tp I + P_1 tp X)] \
    &= tr_"env" [(P_0 tp ket(0) + P_1 tp ket(1)) (rho tp I) (P_0 tp bra(0) + P_1 tp bra(1))] \
    &= tr_"env" [(P_0 rho P_0 tp ket(0) bra(0)) + (P_1 rho P_1 tp ket(1) bra(1)) + (P_0 rho P_1 tp ket(0) bra(1)) + (P_1 rho P_0 tp ket(1) bra(0))] \
    &= P_0 rho P_0 braket(0) + P_1 rho P_1 braket(1) + P_0 rho P_1 braket(0,1) + P_1 rho P_0 braket(1,0) \
    &= P_0 rho P_0 + P_1 rho P_1
$

If they go through a $C Y$ gate,
$
  cal(E)(rho)
    &= tr_"env" [U (rho tp rho_"env") U^dagger] \
    &= tr_"env" [C Y (rho tp rho_"env") (C Y)^dagger] \
    &= tr_"env" [(P_0 tp I + P_1 tp Y) (rho tp ket(0) bra(0)) (P_0 tp I + P_1 tp Y)] \
    &= tr_"env" [(P_0 tp I + P_1 tp (i ket(1) bra(0) - i ket(0) bra(1))) (rho tp ket(0) bra(0)) (P_0 tp I + P_1 tp (i ket(1) bra(0) - i ket(0) bra(1)))] \
    &= tr_"env" [(P_0 tp ket(0) + P_1 tp (i ket(1))) (rho tp I) (P_0 tp bra(0) + P_1 tp (- i bra(1)))] \
    &= tr_"env" [P_0 rho P_0 tp ket(0) bra(0) + P_1 rho P_1 tp ket(0) bra(0)] \
    &= P_0 rho P_0 + P_1 rho P_1
$

=== Operator Sum Representation

We can generalize this by introducing an orthonormal basis $ket(e_k)$ for the state space of the environment, with $rho_"env" = ket(e_0) bra(e_0)$.
There is no loss of generality associated with making this state pure, since if it is mixed, we can introduce an intermediary system purifying the state.
Thus we can rewrite this
$
  cal(E) (rho)
    &= tr_"env" [U (rho tp rho_"env") U^dagger] \
    &= sum_k bra(I tp e_k) U [rho tp ket(e_0) bra(e_0)] U^dagger ket(I tp e_k) \
    &= sum_k bra(I tp e_k) U (I tp ket(e_0)) rho (I tp bra(e_0)) U^dagger ket(I tp e_k) \
    &= sum_k E_k rho E_k^dagger
$
where $E_k equiv bra(I tp e_k) U ket(I tp e_0)$ is an operator on the state space of the principal system.

= Quantum Algorithms

== Deutsch's Algorithm

Suppose you are given a function $f: {0, 1} -> {0, 1}$ as a black box.
You are promised that $f$ is either of two cases:
1. CONST: $f$ is constant, meaning $f(0) = f(1)$
2. BAL: $f$ is balanced, meaning $f(0) != f(1)$.

The problem is to determine which of these two cases we have, using $f$ as few times as possible.

Classically we can just use 2 queries to figure this out, i.e., just evaluate $f(0)$ and $f(1)$.

To solve this in quantum computing we need only 1 query: just use the Mach Zehnder interferometer

#align(center,
  quantum-circuit(
    lstick($ket(0)$), $H$, $R_z (f(x) pi)$, $H$, meter()
  )
)
where
$
  R_z (f(x) pi)
    &= mat((-1)^f(0), 0; 0, (-1)^f(1))
    &= mat(e^(i pi f(0)), 0; 0, e^(i pi f(1)))
    &equiv mat(1, 0; 0, e^(i pi (f(1) - f(0))))
$
where the equivalence is by a global phase.
Then the evolution of the state is given by
$
  H R_z H ket(0)
    &= H R_z (ket(0) + ket(1)) / sqrt(2) \
    &= H ((-1)^(f(0)) ket(0) + (-1)^(f(1)) ket(1)) / sqrt(2) \
    &= ((-1)^(f(0)) ket(+) + (-1)^(f(1)) ket(-)) / sqrt(2) \
    &= ((-1)^(f(0)) (ket(0) + ket(1)) / sqrt(2)) / sqrt(2) +  ((-1)^(f(1)) (ket(0) - ket(1)) / sqrt(2)) / sqrt(2) \
    &= (ket(0)((-1)^(f(0)) + (-1)^(f(1)))) / 2 + (ket(1) ((-1)^(f(0)) - (-1)^(f(1)))) / 2 \
    &equiv cases(
      ket(0) #h(1em) &f(0) = f(1) \
      ket(1) &f(0) != f(1)
    )
$
up to a global phase.

= Calculation Shortcuts

== Trigonometry Identities
$
  sin(2 theta)
    &= 2 sin(theta) cos(theta) \
  cos(2 theta)
    &= cos^2(theta) - sin^2(theta) \
    &= 2 cos^2(theta) - 1 \
    &= 1 - 2 sin^2(theta) \
  tan(2 theta)
    &= (2 tan(theta))/(1 - tan^2(theta)) \
$$
  cos(theta)
    &= (e^(i theta) + e^(i theta))/2, quad
  sin(theta)
    &= (e^(i theta) - e^(i theta))/(2i) \
$

== Generalized Pure State

Let $ket(psi) = cos(theta/2) ket(0) + e^(i phi) sin(theta/2) ket(1)$ then we have that the density matrix $rho$, for $ket(psi)$, is given by $
  rho
    &= ket(psi) bra(psi) \
    &= (cos (theta/2) ket(0) + e^(i phi) sin(theta/2) ket(1))(cos (theta/2) bra(0) + e^(-i phi) sin(theta/2) bra(1)) \
    &= cos^2(theta/2) ket(0) bra(0) + sin^2(theta/2) ket(1) bra(1) + cos(theta/2) sin(theta/2) (e^(i phi) ket(1) bra(0) + e^(-i phi) ket(0) bra(1)) \
    &= cos^2(theta/2) ket(0) bra(0) + sin^2(theta/2) ket(1) bra(1) + sin(theta)/2 (e^(i phi) ket(1) bra(0) + e^(-i phi) ket(0) bra(1)) \
    &= mat(
      cos^2(theta/2), (e^(-i phi))/2 sin(theta/2);
      (e^(i phi))/2 sin(theta/2), sin^2(theta/2)
    ).
$
