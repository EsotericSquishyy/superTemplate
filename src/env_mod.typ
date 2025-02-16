#import "theme/theme.typ": *

#let problem_counter = counter("problem")

#let correction(body) = {
  text(fill: rgb("#ea4120"), weight: "semibold", body)
}

#let qed = [#v(0.2em) #h(90%) $square.big$]

#let pf(body) = {
  [_*Proof*_: ]; body; qed
}

//-----Bookmark-----//
#let bookmark(
  title,
  info,
) = context {
  let bgcolor     = colors(env_colors.get(), "bookmark", "bgcolor")
  let strokecolor = colors(env_colors.get(), "bookmark", "strokecolor")

  block(
    fill: bgcolor,
    width: 100%,
    inset: 8pt,
    stroke: strokecolor,
    breakable: false,
    grid(
      columns: (1fr, 1fr),
      align(left)[#title],
      align(right)[#info],
    )
  )
}

//-----Theorem Environments-----//
#let proof_env(
  name,
  statement,
  proof,
  kind:         [],
  breakable:    false,
  id:           "",
) = context {
  let theme = env_colors.get()

  let bgcolor1      = colors(theme, id, "bgcolor1")
  let bgcolor2      = colors(theme, id, "bgcolor2")
  let strokecolor1  = colors(theme, id, "strokecolor1")
  let strokecolor2  = colors(theme, id, "strokecolor2")

  show raw.where(block: false): r => {
    box(
      fill: bgcolor1.saturate(ratios(theme, "raw", "saturation")),
      outset: (x: 1pt, y: 3pt),
      inset: (x: 2pt),
      radius: 2pt,
      r
    )
  }

  let name_content = [=== _ #kind _]
  if name != [] {
    name_content = [=== _ #kind: _ #name]
  }

  let block_inset
  let top_pad
  let side_pad
  if env_headers.get() == "tab" {
    name_content = block(
      fill: strokecolor1,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt
    side_pad = 12pt

  } else if env_headers.get() == "classic" {
    block_inset = 8pt
    top_pad = 12pt
    side_pad = 0pt
  }

  let statement_content = pad(
    top: top_pad,
    right: 12pt,
    left: 12pt,
    bottom: 12pt,
    block(
      fill: bgcolor2,
      inset: 8pt,
      radius: 2pt,
      width: 100%,
      stroke: (
        left: strokecolor2 + 6pt
      ),
      statement
    )
  )
  let proof_content = []

  if proof != [] {
    proof_content = pad(pf(proof), side_pad)
  }

  block(
    fill: bgcolor1,
    width: 100%,
    inset: block_inset,
    radius: 7pt,
    stroke: strokecolor1,
    breakable: breakable,
    clip: true,
    stack(
      name_content,
      statement_content,
      proof_content,
    )
  )
}

#let theorem(statement, proof, name: [], breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Theorem],
    breakable:    breakable,
    id:           "theorem",
  )
}
#let thm = theorem

#let lemma(statement, proof, name: [], breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Lemma],
    breakable:    breakable,
    id:           "lemma",
  )
}
#let lem = lemma

#let corollary(statement, proof, name: [], breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Corollary],
    breakable:    breakable,
    id:           "corollary",
  )
}
#let cor = corollary

#let proposition(statement, proof, breakable: false) = {
  proof_env(
    [],
    statement,
    proof,
    kind:         [Proposition],
    breakable:    breakable,
    id:           "proposition",
  )
}
#let prop = proposition



//-----Definition Environments-----//
#let statement_env(
  name,
  statement,
  kind:         [],
  breakable:    false,
  id:           "",
) = context {
  let theme = env_colors.get()

  let bgcolor     = colors(theme, id, "bgcolor")
  let strokecolor = colors(theme, id, "strokecolor")

  let name_content = [=== #kind]
  if name != [] {
    name_content = [=== #kind: #name]
  }

  show raw.where(block: false): r => {
    box(
      fill: bgcolor.saturate(ratios(theme, "raw", "saturation")),
      outset: (x: 1pt, y: 3pt),
      inset: (x: 2pt),
      radius: 2pt,
      r
    )
  }

  let block_inset
  let top_pad
  let side_pad
  let bottom_pad
  if env_headers.get() == "tab" {
    name_content = block(
      fill: strokecolor,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt
    side_pad = 12pt
    bottom_pad = 10pt

  } else if env_headers.get() == "classic" {
    block_inset = 8pt
    top_pad = 12pt
    side_pad = 0pt
    bottom_pad = 3pt
  }

  block(
    fill: bgcolor,
    width: 100%,
    inset: block_inset,
    radius: 7pt,
    stroke: strokecolor,
    breakable: breakable,
    clip: true,
    stack(
      name_content,
      pad(
        top: top_pad,
        bottom: bottom_pad,
        left: side_pad,
        right: side_pad,
        statement
      )
    )
  )
}

#let note(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Note],
    breakable:    breakable,
    id:           "note",
  )
}

#let definition(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Definition],
    breakable:    breakable,
    id:           "definition",
  )
}
#let defn = definition

#let remark(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Remark],
    breakable:    breakable,
    id:           "remark",
  )
}
#let rem = remark
#let rmk = remark

#let notation(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Notation],
    breakable:    breakable,
    id:           "notation",
  )
}
#let notn = notation

#let example(statement, name: [], breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Example],
    breakable:    breakable,
    id:           "example",
  )
}
#let ex = example

// For a more general definition
#let concept(statement, name: [], breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Concept],
    breakable:    breakable,
    id:           "concept",
  )
}
#let conc = concept

#let computational_problem(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Computational Problem],
    breakable:    breakable,
    id:           "computational_problem",
  )
}
#let comp_prob = computational_problem

#let algorithm(statement, name: [], breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Algorithm],
    breakable:    breakable,
    id:           "algorithm",
  )
}
#let algo = algorithm

#let runtime(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Runtime Analysis],
    breakable:    breakable,
    id:           "runtime",
  )
}

//-----Problem Environments-----//
#let prob_env(
  name,
  statement,
  solution,
  kind:         [],
  breakable:    false,
  id:           "",
  width:        100%,
  height:       auto,
) = context {
  let theme = env_colors.get()

  let bgcolor1      = colors(theme, id, "bgcolor1")
  let bgcolor2      = colors(theme, id, "bgcolor2")
  let strokecolor1  = colors(theme, id, "strokecolor1")
  let strokecolor2  = colors(theme, id, "strokecolor2")

  show raw.where(block: false): r => {
    box(
      fill: bgcolor1.saturate(ratios(theme, "raw", "saturation")),
      outset: (x: 1pt, y: 3pt),
      inset: (x: 2pt),
      radius: 2pt,
      r
    )
  }

  let name_content = [=== #kind #name]
  let block_inset
  let top_pad
  let side_pad
  if env_headers.get() == "tab" {
    name_content = block(
      fill: strokecolor1,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt
    side_pad = 12pt

  } else if env_headers.get() == "classic" {
    block_inset = 8pt
    top_pad = 12pt
    side_pad = 0pt
  }

  let statement_content = pad(
    top: top_pad,
    right: 12pt,
    bottom: 12pt,
    left: 12pt,
    block(
      fill: bgcolor2,
      inset: 8pt,
      radius: 2pt,
      width: width,
      stroke: (
        left: strokecolor2 + 6pt
      ),
      statement
    )
  )

  block(
    fill: bgcolor1,
    width: width,
    height: height,
    inset: block_inset,
    radius: 7pt,
    stroke: strokecolor1,
    breakable: breakable,
    clip: true,
    stack(
      name_content,
      statement_content,
      pad([*Solution*], top: 12pt, left: side_pad),
      pad(solution, side_pad)
    )
  )
}

#let problem(
  statement,
  solution,
  name:       [],
  breakable:  false,
  width:      100%,
  height:     auto,
) = {
  problem_counter.step()

  let suffix = [:]
  if name == [] {
    name = [#context { problem_counter.display() }]
    suffix = []
  }

  prob_env(
    name,
    statement,
    solution,
    kind:         [Problem] + suffix,
    breakable:    breakable,
    id:           "problem",
    width:        width,
    height:       height,
  )
}
#let prob = problem

#let exercise(
  statement,
  solution,
  name:       [],
  breakable:  false,
  width:      100%,
  height:     auto,
) = {
  let suffix = [:]
  if name == [] { suffix = [] }

  prob_env(
    name,
    statement,
    solution,
    kind:         [Exercise] + suffix,
    breakable:    breakable,
    id:           "exercise",
    width:        width,
    height:       height,
  )
}
#let excs = exercise

//------Misc------//
#let nn(content) = {  // no number
  math.equation(
    block: true,
    numbering: none,
    content
  )
}

//-----Templates-----//
#let notes(title, author, doc, number: false, depth: 2) = {
  set document(title: title, author: author)
  set page(
    paper: "us-letter",
    // https://stackoverflow.com/a/78318321
    header: context {
      let selector = selector(heading).before(here())
      let level = counter(selector)
      let headings = query(selector)

      if headings.len() == 0 {
        return
      }

      let last_heading_level = headings.last().level
      let headings_shown = (1, 2).filter(l => (l <= last_heading_level))
      let heading_max_level = calc.max(..headings_shown)

      let section = level.display((..nums) => nums
        .pos()
        .slice(0, calc.min(heading_max_level, nums.pos().len()))
        .map(str)
        .join("."))

      let headers = headings_shown.map((i) => {
        let headings_at_this_level = headings
          .filter(h => h.level == i)

        if headings_at_this_level.len() == 0 { return none }

        headings_at_this_level
          .last()
          .body
      })
      .filter(it => it != none)

      let level_one_headings = query(heading.where(level: 1))
      let h1_on_page = level_one_headings.find(h => h.location().page() == here().page())

      if (h1_on_page == none) {
        grid(
          columns: (1fr, 1fr),
          align(left)[
            #smallcaps[*#headers.at(0)*]
          ],
          align(right)[
            #smallcaps[*#headers.at(1) --- #section*]
          ]
        )
        line(length: 100%)
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: (top: 1.75cm, bottom: 1.25cm, left: 1cm, right: 1cm)
  )

  block(
    width: 100%,
    inset: 8pt,
    stroke: black,
    breakable: false,
    stack(
      dir: ttb,
      align(center, text(25pt)[
        *#title*
      ]),
      v(20pt),
      align(center, text(15pt)[#author])
    )
  )

  let eq-numbering = none
  if number {
    eq-numbering = "(1.1)"
  }

  set math.equation(numbering: eq-numbering, supplement: none)
  show ref: it => { // https://github.com/typst/typst/issues/873
    if it.element != none and it.element.func() == math.equation {
      [(#it)]
    } else {
      it
    }
  }

  set heading(numbering: "1.")
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(
    title: [Table of Contents],
    depth: depth,
    indent: auto,
  )

  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #set text(27pt, rgb("#020004"))
    #it
    #v(0.3em)
  ]

  show heading.where(level: 2): it => [
    #set text(21pt, rgb("#16428e"))
    #it
    #v(0.5em)
  ]

  problem_counter.update(0)
  show link: l => underline(l)

  doc
}

#let basic(doc) = {
  set document()
  set page(
    paper: "us-letter",
    margin: 1cm
  )
  doc
}

#let assignment(title, author, date, doc, margin: 1.5cm) = {
  set document(title: title, author: author)
  set enum(numbering: "a)")
  set page(
    paper: "us-letter",
    header: context {
      if counter(page).at(here()).first() != 1 {
        grid(
          columns: (1fr, 1fr),
          align(left)[
            #smallcaps[*#title*]
          ],
          align(right)[
            #smallcaps[*#author*]
          ]
        )
        line(length: 100%)
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: (top: 1.75cm, bottom: 1.25cm, left: margin, right: margin)
  )

  block(
    width: 100%,
    inset: 8pt,
    stroke: black,
    breakable: false,
    stack(
      dir: ttb,
      align(center, text(25pt)[
        *#title*
      ]),
      v(20pt),
      grid(
        columns: (1fr, 1fr),
        inset: 30%,
        align(left, text(15pt)[#author]),
        align(right, text(15pt)[#date.display("[month repr:long] [day], [year]")]),
      )
    )
  )

  doc
}
