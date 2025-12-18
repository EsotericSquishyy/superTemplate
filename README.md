# superTemplate

A [`Typst`](https://github.com/typst/typst) suite of templates and macros for taking notes, doing problem sets, and writing reports in Mathematics, Computer Science, Physics, and Engineering.
This package is best used as a companion to [our other package](https://github.com/EsotericSquishyy/superTheorems).

> [`Typst`](https://github.com/typst/typst) is required to use this package.
> You can get started by via the integrated language service [`Tinymist`](https://github.com/Myriad-Dreamin/tinymist) or by referring to Typst's [installation page](https://github.com/typst/typst?tab=readme-ov-file#installation).
> Note that [`Tinymist`](https://github.com/Myriad-Dreamin/tinymist) currently supports `VSCode`, `NeoVim`, `Emacs`, `Sublime Text`, `Helix`, and `Zed`.

## Gallery

<p float="left">
    <img src="assets/algebra-1.png" width="300">
    <img src="assets/analysis-2.png" width="300">
    <img src="assets/algorithms-1.png" width="300">
    <img src="assets/probability-2.png" width="300">
    <img src="assets/quantum_computing-5.png" width="300">
</p>

See the source code for these in `./examples`.

## Features

This package consists of two parts:

1. A set of templates
2. Macros for various subjects

We have implemented the following templates in `templates.typ`:

- `notes`, for taking lecture notes during class (or taking them from a textbook). The real analysis and algorithm notes in the gallery above are both examples of this.
- `assignment`, for completing homework assignments and problem sets. The probability and group theory assignments in the gallery above are both examples of this.
- `basic`, a barebones template for generic tasks. We've used this to create study sheets summarizing key info in a course. The quantum computing summary sheet in the gallery above is an example of this.
- `report` (in progress), for writing a paper, lab report, or (eventually) even a thesis

The macros we have implemented are separated by subject to avoid naming conflicts and minimize the amount of overhead when importing.
Many of the macros are inspired by their equivalents in Latex, which we were heavy users of prior to switching to Typst.
In addition, commonly used Typst packages relevant to each subject are automatically imported.
For example, we import the pseudocode package `lovelace` for our computer science module.
The macros we implemented cover commonly used notation in the following topics:

- `math_mod`
  - linear algebra
  - real analysis (up to and including some measure theory)
  - group, ring, and field theory
  - topology
  - differential geometry
  - model theory
- `cs_mod`
  - cryptography
  - data structures and algorithms
  - programming language theory
  - formal language and automata theory
- `physics_mod`
  - quantum mechanics
  - quantum information
- `pstat_mod`
  - basic probability theory

## Installation

1. Clone this repository somewhere locally on your machine.

2. `cd` into the repository and use the setup script in `./scripts` to install.
    Note that the shell script only works if you are on Mac or Linux.
    If you are on Windows or would prefer to do this manually, refer to the [Typst Packages](https://github.com/typst/packages) repository for more information.

3. Test whether the installation worked by opening a new `.typ` file in any directory with the following code:

    ```typ
    #import "@local/superTemplate:0.3.0": *
    #import math_mod: *
    #show: basic

    #cyc(1, 2, 3) Hello world!
    ```

    If you're able to render the pdf, you're good to go.

4. Check out the examples in `./examples` to get started.
