#import "theme/colors.typ": *

#let problem_counter = counter("problem")

#let correction(body) = {
  text(fill: rgb("#ea4120"), weight: "semibold", body)
}

#let qed = [#v(0.2em) #h(90%) $square.big$]
#let proof(body) = {
  [_Proof_: ]; body; qed
}

//-----Bookmark-----//
#let bookmark(
  title,
  info,
  bgcolor:      colors("bookmark", "bgcolor"),
  strokecolor:  colors("bookmark", "strokecolor"),
) = {
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
  type:         [],
  breakable:    false,
  bgcolor1:     white,
  bgcolor2:     white,
  strokecolor1: black,
  strokecolor2: black,
) = {
  let name_content = [=== _ #type _]
  let statement_content = pad(
      top: 12pt,
      bottom: 12pt,
      left: 12pt,
      block(
        fill: bgcolor2,
        inset: 8pt,
        radius: 2pt,
        stroke: (
          left: strokecolor2 + 6pt
        ),
        statement
      )
    )
  let proof_content = []

  if name != [] {
    name_content = [=== _ #type: _ #name]
  }
  if proof != [] {
    proof_content = stack(
      [*Proof*],
      pad(proof + qed, top: 8pt),
    )
  }

  block(
    fill: rgb(bgcolor1),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: strokecolor1,
    breakable: breakable,
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
    type:         [Theorem],
    breakable:    breakable,
    bgcolor1:     colors("thm", "bgcolor1"),
    bgcolor2:     colors("thm", "bgcolor2"),
    strokecolor1: colors("thm", "strokecolor1"),
    strokecolor2: colors("thm", "strokecolor2"),
  )
}

#let lemma(name, statement, proof, breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    type:         [Lemma],
    breakable:    breakable,
    bgcolor1:     colors("lemma", "bgcolor1"),
    bgcolor2:     colors("lemma", "bgcolor2"),
    strokecolor1: colors("lemma", "strokecolor1"),
    strokecolor2: colors("lemma", "strokecolor2"),
  )
}

#let cor(name, statement, proof, breakable: false) = {
  proof_env(
    name,
    statement,
    proof,
    type:         [Corollary],
    breakable:    breakable,
    bgcolor1:     colors("cor", "bgcolor1"),
    bgcolor2:     colors("cor", "bgcolor2"),
    strokecolor1: colors("cor", "strokecolor1"),
    strokecolor2: colors("cor", "strokecolor2"),
  )
}

#let prop(statement, proof, breakable: false) = {
  proof_env(
    [],
    statement,
    proof,
    type:         [Proposition],
    breakable:    breakable,
    bgcolor1:     colors("prop", "bgcolor1"),
    bgcolor2:     colors("prop", "bgcolor2"),
    strokecolor1: colors("prop", "strokecolor1"),
    strokecolor2: colors("prop", "strokecolor2"),
  )
}



//-----Definition Environments-----//
#let statement_env(
  name,
  statement,
  type:         [Definition],
  breakable:    false,
  bgcolor:      white,
  strokecolor:  black,
) = {
  let name_content = [=== #type]

  if name != [] {
    name_content = [=== #type: #name]
  }
  block(
    fill: bgcolor,
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: strokecolor,
    breakable: breakable,
    stack(
      name_content,
      pad(
        top: 12pt,
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
    type:         [Note],
    breakable:    breakable,
    bgcolor:      colors("note", "bgcolor"),
    strokecolor:  colors("note", "strokecolor"),
  )
}

#let defn(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    type:         [Definition],
    breakable:    breakable,
    bgcolor:      colors("defn", "bgcolor"),
    strokecolor:  colors("defn", "strokecolor"),
  )
}

#let remark(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    type:         [Remark],
    breakable:    breakable,
    bgcolor:      colors("remark", "bgcolor"),
    strokecolor:  colors("remark", "strokecolor"),
  )
}

#let notation(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    type:         [Notation],
    breakable:    breakable,
    bgcolor:      colors("notation", "bgcolor"),
    strokecolor:  colors("notation", "strokecolor"),
  )
}

#let example(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    type:         [Example],
    breakable:    breakable,
    bgcolor:      colors("example", "bgcolor"),
    strokecolor:  colors("example", "strokecolor"),
  )
}

// For a more general definition
#let conc(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    type:         [Concept],
    breakable:    breakable,
    bgcolor:      colors("conc", "bgcolor"),
    strokecolor:  colors("conc", "strokecolor"),
  )
}

#let comp_prob(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    type:         [Computational Problem],
    breakable:    breakable,
    bgcolor:      colors("comp_prob", "bgcolor"),
    strokecolor:  colors("comp_prob", "strokecolor"),
  )
}

#let algor(name, statement, breakable: false) = {
  statement_env(
    name,
    statement,
    type:         [Algorithm],
    breakable:    breakable,
    bgcolor:      colors("algor", "bgcolor"),
    strokecolor:  colors("algor", "strokecolor"),
  )
}

#let runtime(statement, breakable: false) = {
  statement_env(
    [],
    statement,
    type:         [Runtime Analysis],
    breakable:    breakable,
    bgcolor:      colors("runtime", "bgcolor"),
    strokecolor:  colors("runtime", "strokecolor"),
  )
}

//-----Problem Environments-----//
#let prob_env(
  name,
  statement,
  solution,
  type:         [],
  breakable:    false,
  bgcolor1:     white,
  bgcolor2:     white,
  strokecolor1: black,
  strokecolor2: black,
  width:        100%,
  height:       auto,
) = {
  block(
    fill: rgb(bgcolor1),
    width: width,
    height: height,
    inset: 8pt,
    radius: 7pt,
    stroke: strokecolor1,
    breakable: breakable,
    stack(
      [=== #type #name],
      pad(
        top: 12pt,
        bottom: 12pt,
        left: 12pt,
        block(
          fill: bgcolor2,
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: strokecolor2 + 6pt
          ),
          statement
        )
      ),
      [*Solution*],
      pad(top: 12pt, solution)
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
    type:         [Problem],
    breakable:    breakable,
    bgcolor1:     colors("named_prob", "bgcolor1"),
    bgcolor2:     colors("named_prob", "bgcolor2"),
    strokecolor1: colors("named_prob", "strokecolor1"),
    strokecolor2: colors("named_prob", "strokecolor2"),
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
    type:         [Problem],
    breakable:    breakable,
    bgcolor1:     colors("prob", "bgcolor1"),
    bgcolor2:     colors("prob", "bgcolor2"),
    strokecolor1: colors("prob", "strokecolor1"),
    strokecolor2: colors("prob", "strokecolor2"),
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
    type:         [Exercise],
    breakable:    breakable,
    bgcolor1:     colors("named_excs", "bgcolor1"),
    bgcolor2:     colors("named_excs", "bgcolor2"),
    strokecolor1: colors("named_excs", "strokecolor1"),
    strokecolor2: colors("named_excs", "strokecolor2"),
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
    type:         [Exercise],
    breakable:    breakable,
    bgcolor1:     colors("excs", "bgcolor1"),
    bgcolor2:     colors("excs", "bgcolor2"),
    strokecolor1: colors("excs", "strokecolor1"),
    strokecolor2: colors("excs", "strokecolor2"),
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
    margin: 1.75cm
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
  show outline.entry.where(
    level: 3
  ): it => {
    if (it.body.children.at(2).has("body")) {
      let form
      if (it.body.children.at(2).fields().body.has("children")) {
        form = it.body.children.at(2).fields().body.children.at(1).text
      } else {
        form = it.body.children.at(2).fields().at("body").text
      }

      it
    } else {
      it
    }
  }
  outline(
    title: [Table of Contents],
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
