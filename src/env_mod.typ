
//------Misc------//
#let nn(content) = {  // no number
  math.equation(
    block: true,
    numbering: none,
    content
  )
}

//-----Templates-----//
#let notes(title, author, doc, box: false, continuous: false, number: false, depth: 2) = context {
  set document(title: title, author: author)
  set table(stroke: text.fill)
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
          columns: (auto, 1fr, auto),
          align(left)[
            #smallcaps[#text(fill: text.fill, weight: "extrabold")[#headers.at(0)]]
          ],
          [],
          align(right)[
            #smallcaps[#text(fill: text.fill, weight: "extrabold")[#headers.at(1) $dash.em$ #section]]
          ]
        )
        line(length: 100%, stroke: text.fill)
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[#smallcaps[#text(weight: "extrabold", fill: text.fill)[Page #page_number of #total_pages]]]
    },
    margin: (top: 1.75cm, bottom: 1.25cm, left: 1cm, right: 1cm)
  )

  set page(
    height: auto,
    header: none,
    footer: none
  ) if continuous

  let box_color = none
  if (box) {
    box_color = text.fill
  }

  block(
    width: 100%,
    inset: 8pt,
    stroke: box_color,
    breakable: false,
    stack(
      dir: ttb,
      align(center, text(25pt)[
        #title
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

  show outline.entry: it => {
    if continuous {
      link(
        it.element.location(),
        // Keep just the body, dropping
        // the fill and the page.
        it.indented(it.prefix(), it.body()),
      )
    } else {
      it
    }
  }

  outline(
    title: [Table of Contents],
    depth: depth,
    indent: auto,
  )

  show heading.where(level: 1): it => [
    #if not continuous {
      pagebreak(weak: true)
    }
    #set text(27pt)
    #it
    #v(0.3em)
  ]

  show heading.where(level: 2): it => [
    #set text(21pt)
    #it
    #v(0.5em)
  ]

  show link: l => underline(l)

  doc
}

#let basic(doc) = context {
  set document()
  set page(
    paper: "us-letter",
    margin: 1cm
  )
  doc
}

#let assignment(title, author, date, doc, box: false, margin: 1.5cm) = context {
  set document(title: title, author: author)
  set enum(numbering: "a)")
  set page(
    paper: "us-letter",
    header: context {
      if counter(page).at(here()).first() != 1 {
        grid(
          columns: (1fr, 1fr),
          align(left)[
            #smallcaps[#title]
          ],
          align(right)[
            #smallcaps[#author]
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

  let box_color = none
  if (box) {
    box_color = text.fill
  }

  block(
    width: 100%,
    inset: 8pt,
    stroke: box_color,
    breakable: false,
    stack(
      dir: ttb,
      align(center, text(25pt)[
        *#title*
      ]),
      v(20pt),
      align(center + horizon, text(15pt)[#author $dash.em$ #date.display("[month repr:long] [day], [year]")]),
    )
  )

  doc
}
