# superTemplate

A [`Typst`](https://github.com/typst/typst) suite of environments/macros for ease of taking notes or doing problem sets in Mathematics, Computer Science, and Physics.

## Installation

1. Install [`Tinymist`](https://github.com/Myriad-Dreamin/tinymist) on your code editor of choice.
Note the current supported editors are `VSCode`, `NeoVim`, `Emacs`, `Sublime Text`, `Helix`, and `Zed`.
You may be able to get a `Typst` LSP working on another editor if you really want to, but this is the easiest option.

2. Clone this repository somewhere locally on your machine.

3. `cd` into the repository and use the setup script in `./scripts` matching your operating system to install.
(The Windows install script is currently still experimental.)
Refer to the [Typst Packages](https://github.com/typst/packages) repository for more information.

4. Test whether the installation worked by opening a new `.typ` file in any directory with the following code:
    ```typ
    #import "@local/superTemplate:0.1.3": *
    #import math_mod: *
    #show: basic

    #cyc(1, 2, 3) Hello world!
    ```
    If you're able to render the pdf, you're good to go.

5. Check out the examples in `./examples` to get started.
