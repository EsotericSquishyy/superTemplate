#import "theme/colors.typ": *

#let header_style_list = ("tab", "classic")
#let header_style = state("headers", "tab")

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
  let bgcolor     = colors(env_theme.get(), "bookmark", "bgcolor")
  let strokecolor = colors(env_theme.get(), "bookmark", "strokecolor")

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
  let bgcolor1      = colors(env_theme.get(), id, "bgcolor1")
  let bgcolor2      = colors(env_theme.get(), id, "bgcolor2")
  let strokecolor1  = colors(env_theme.get(), id, "strokecolor1")
  let strokecolor2  = colors(env_theme.get(), id, "strokecolor2")

  let name_content = [=== _ #kind _]
  if name != [] {
    name_content = [=== _ #kind: _ #name]
  }

  let block_inset
  let top_pad
  let side_pad
  if header_style.get() == "tab" {
    name_content = block(
      fill: strokecolor1,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt
    side_pad = 12pt

  } else if header_style.get() == "classic" {
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

#let thm(name, statement, proof, breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Theorem],
    breakable:    breakable,
    id:           "thm",
  )
}

#let lem(name, statement, proof, breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Lemma],
    breakable:    breakable,
    id:           "lemma",
  )
}

#let cor(name, statement, proof, breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    kind:         [Corollary],
    breakable:    breakable,
    id:           "cor",
  )
}

#let prop(statement, proof, breakable: false) = {
  proof_env(
    [],
    statement,
    proof,
    kind:         [Proposition],
    breakable:    breakable,
    id:           "prop",
  )
}



//-----Definition Environments-----//
#let statement_env(
  name,
  statement,
  kind:         [],
  breakable:    false,
  id:           "",
) = context {
  let bgcolor     = colors(env_theme.get(), id, "bgcolor")
  let strokecolor = colors(env_theme.get(), id, "strokecolor")

  let name_content = [=== #kind]
  if name != [] {
    name_content = [=== #kind: #name]
  }

  let block_inset
  let top_pad
  if header_style.get() == "tab" {
    name_content = block(
      fill: strokecolor,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt

  } else if header_style.get() == "classic" {
    block_inset = 8pt
    top_pad = 12pt
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
        bottom: 6pt,
        left: 12pt,
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

#let defn(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Definition],
    breakable:    breakable,
    id:           "defn",
  )
}

#let rmk(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Remark],
    breakable:    breakable,
    id:           "remark",
  )
}

#let notation(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    kind:         [Notation],
    breakable:    breakable,
    id:           "notation",
  )
}

#let ex(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Example],
    breakable:    breakable,
    id:           "example",
  )
}

// For a more general definition
#let conc(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Concept],
    breakable:    breakable,
    id:           "conc",
  )
}

#let comp_prob(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Computational Problem],
    breakable:    breakable,
    id:           "comp_prob",
  )
}

#let algo(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    kind:         [Algorithm],
    breakable:    breakable,
    id:           "algor",
  )
}

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
  let bgcolor1      = colors(env_theme.get(), id, "bgcolor1")
  let bgcolor2      = colors(env_theme.get(), id, "bgcolor2")
  let strokecolor1  = colors(env_theme.get(), id, "strokecolor1")
  let strokecolor2  = colors(env_theme.get(), id, "strokecolor2")

  let name_content = [=== #kind #name]
  let block_inset
  let top_pad
  let side_pad
  if header_style.get() == "tab" {
    name_content = block(
      fill: strokecolor1,
      inset: 7pt,
      width: 100%,
      text(white)[#name_content]
    )

    block_inset = 0pt
    top_pad = 8pt
    side_pad = 12pt

  } else if header_style.get() == "classic" {
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

#let named_prob(
  name,
  statement,
  solution,
  breakable:  false,
  width:      100%,
  height:     auto,
) = {
  prob_env(
    name,
    statement,
    solution,
    kind:         [Problem],
    breakable:    breakable,
    id:           "prob",
    width:        width,
    height:       height,
  )
}

#let prob(
  statement,
  solution,
  breakable: false,
) = {
  prob_env(
    [#problem_counter.step() #context { problem_counter.display() }],
    statement,
    solution,
    kind:         [Problem],
    breakable:    breakable,
    id:           "prob",
  )
}

#let named_excs(
  name,
  statement,
  solution,
  breakable:  false,
  width:      100%,
  height:     auto,
) = {
  prob_env(
    name,
    statement,
    solution,
    kind:         [Exercise],
    breakable:    breakable,
    id:           "excs",
    width:        width,
    height:       height,
  )
}

#let excs(
  statement,
  solution,
  breakable: false,
) = {
  prob_env(
    [],
    statement,
    solution,
    kind:         [Exercise],
    breakable:    breakable,
    id:           "excs",
  )
}

//------Misc------//
#let nn(content) = {  // no number
  math.equation(
    block: true,
    numbering: none,
    content
  )
}

//-----Templates-----//
#let notes(title, author, doc, number: false) = {
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

      let headings_shown = (1, 2)
      let heading_max_level = calc.max(..headings_shown)

      let section = level.display((..nums) => nums
        .pos()
        .slice(0, calc.min(heading_max_level, nums.pos().len()))
        .map(str)
        .join("."))

      let heading_text = headings_shown.map((i) => {
        let headings_at_this_level = headings
          .filter(h => h.level == i)

        if headings_at_this_level.len() == 0 { return none }

        headings_at_this_level
          .last()
          .body
      })
      .filter(it => it != none)
      .join([ --- ])

      let level_one_headings = query(heading.where(level: 1))
      let on_same_page = level_one_headings.find(h => h.location().page() == here().page())

      let result
      if (on_same_page == none) {
        result = false
      } else {
        result = true
      }
      if (not heading_text.has("text")) and not result {
        align(right, [* #heading_text (#section)*])
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: 1.25cm
  )

  align(center, text(25pt)[
    *#title*
  ])
  align(center, text(15pt)[#author])

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
    depth: 2,
    indent: auto,
  )

  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #set text(25pt)
    #it
    #v(1.2em)
  ]

  problem_counter.update(0)
  show link: l => underline(l) //  + $#emoji.chain$

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

#let assignment(title, author, date, doc, margin: 1.75cm) = {
  set document(title: title, author: author)
  set enum(numbering: "a)")
  set page(
    paper: "us-letter",
    header: context {
      if counter(page).at(here()).first() != 1 {
        align(right, [*#title* | *#author*])
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: margin
  )
  align(center, text(25pt)[
    *#title*
  ])
  align(center, text(15pt)[#author])
  align(center, text(15pt)[#date.display("[month repr:long] [day], [year]")])

  doc
}
