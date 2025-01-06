#let example_counter = counter("example")
#let problem_counter = counter("problem")
#let exercise_counter = counter("exercise")

#let correction(body) = {
  text(fill: rgb("#ea4120"), weight: "semibold", body)
}

#let qed = $square.big$
#let proof(body) = {
  [_Proof_: ]; body; qed
}

//-----Bookmark-----//
#let bookmark(
  title,
  info,
  bgcolor:      white,
  strokecolor:  red,
) = {
  block(
    fill: rgb(bgcolor),
    width: 100%,
    inset: 8pt,
    stroke: rgb(strokecolor),
    breakable: false,
    grid(
      columns: (1fr, 1fr),
      align(left)[#title],
      align(right)[#info],
    )
  )
}


//-----Theorem Environments-----//
#let thm_env(
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
        fill: rgb(bgcolor2),
        inset: 8pt,
        radius: 2pt,
        stroke: (
          left: rgb(strokecolor2) + 6pt
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
    stroke: rgb(strokecolor1),
    breakable: breakable,
    stack(
      name_content,
      statement_content,
      proof_content,
    )
  )
}

#let thm(name, statement, proof, breakable: false) = {
  thm_env(
    name,
    statement,
    proof,
    type:         [Theorem],
    breakable:    breakable,
    bgcolor1:     "#faf1fd",
    bgcolor2:     "#dfc1e6",
    strokecolor1: "#6913d1",
    strokecolor2: "#87739a",
  )
}

#let lemma(name, statement, proof, breakable: false) = {
  thm_env(
    name,
    statement,
    proof,
    type:         [Lemma],
    breakable:    breakable,
    bgcolor1:     "#fcffcc",
    bgcolor2:     "#edeb69",
    strokecolor1: "#abc00c",
    strokecolor2: "#b2c016",
  )
}

#let cor(name, statement, proof, breakable: false) = {
  thm_env(
    name,
    statement,
    proof,
    type:         [Corollary],
    breakable:    breakable,
    bgcolor1:     "#dedbf8",
    bgcolor2:     "#bfb6df",
    strokecolor1: "#0f0cc0",
    strokecolor2: "#4922bf",
  )
}

#let prop(statement, proof, breakable: false) = {
  thm_env(
    [],
    statement,
    proof,
    type:         [Proposition],
    breakable:    breakable,
    bgcolor1:     "#fbdfdb",
    bgcolor2:     "#e1a29f",
    strokecolor1: "#e03636",
    strokecolor2: "#d45345",
  )
}



//-----Definition Environments-----//
#let defn_env(
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
    fill: rgb(bgcolor),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(strokecolor),
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

#let defn(name, statement, breakable: false) = {
  defn_env(
    name,
    statement,
    type:         [Definition],
    breakable:    breakable,
    bgcolor:      "#cceeff",
    strokecolor:  "#33adff",
  )
}

#let remark(statement, breakable: false) = {
  defn_env(
    [],
    statement,
    type:         [Remark],
    breakable:    breakable,
    bgcolor:      "#eee3f4",
    strokecolor:  "#951fc7",
  )
}

#let example(name, statement, breakable: false) = {
  defn_env(
    name,
    statement,
    type:         [Example #example_counter.step()#context { example_counter.display() }],
    breakable:    breakable,
    bgcolor:      "#fafffa",
    strokecolor:  "#1fc71f",
  )
}

#let instr(statement, breakable: false) = {
  defn_env(
    [],
    statement,
    type:         [Instructions],
    breakable:    breakable,
    bgcolor:      "#cceeff",
    strokecolor:  "#33adff",
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
    stroke: rgb(strokecolor1),
    breakable: breakable,
    stack(
      [=== #type #name],
      pad(
        top: 12pt,
        bottom: 12pt,
        left: 12pt,
        block(
          fill: rgb(bgcolor2),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb(strokecolor2) + 6pt
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
    bgcolor1:     "#fafffa",
    bgcolor2:     "#abc3b0",
    strokecolor1: "#1fc71f",
    strokecolor2: "#739a7a",
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
    bgcolor1:     "#fafffa",
    bgcolor2:     "#abc3b0",
    strokecolor1: "#1fc71f",
    strokecolor2: "#739a7a",
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
    bgcolor1:     "#fff3e1",
    bgcolor2:     "#eed08a",
    strokecolor1: "#fd9e0a",
    strokecolor2: "#c37410",
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
    [#exercise_counter.step() #context { exercise_counter.display() }],
    statement,
    solution,
    type:         [Exercise],
    breakable:    breakable,
    bgcolor1:     "#fff3e1",
    bgcolor2:     "#eed08a",
    strokecolor1: "#fd9e0a",
    strokecolor2: "#c37410",
  )
}



//-----Templates-----//
#let notes(title, author, doc) = {
  set document(title: title, author: author)
  set enum(numbering: "i)")
  set heading(numbering: "1.")
  set page(
    paper:"us-letter",
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

  example_counter.update(0)
  problem_counter.update(0)
  exercise_counter.update(0)
  show link: l => underline(l) //  + $#emoji.chain$

  doc
}

#let basic(doc) = {
  set document()
  set page(
    paper:"us-letter",
    margin: 1cm
  )
  doc
}

#let assignment(title, author, date, doc, margin: 1.75cm) = {
  set document(title: title, author: author)
  set enum(numbering: "a)")
  set page(
    paper:"us-letter",
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
