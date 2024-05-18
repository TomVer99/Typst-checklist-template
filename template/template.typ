#let small_text_size = 8pt
#let large_text_size = 14pt

#let abnormals = rgb("FF9A00")

#let style_state = state("style", "0")

#let topic(
  title,
  fill_clr: rgb("FFFFFF"),
  body
) = {
  box(width: 100%, stroke: 1pt, outset: 4pt, fill: fill_clr)[
    #v(5pt)
    #align(center)[#text(size: 20pt, upper(strong(title)))]
    #text(size: 0pt)[= #title]
    #v(5pt)
  ]
  columns(2)[
    #body
  ]
}

#let section(
  title,
  fill_clr: rgb("FFFFFF"),
  body
) = locate(loc => {
  if (title != none and title != "") {
    box(width: 100%, stroke: 1pt, outset: 4pt, fill: fill_clr)[
      #v(5pt)
      #align(center)[#upper(strong(title))]
      #text(size: 0pt)[== #title]
      #v(5pt)
    ]
    linebreak()
    v(-(small_text_size))
    if (style_state.at(loc) == 1) {
      box(width: 1fr, stroke: 1pt, outset: 4pt, )[
        #v(5pt)
        #body
        #v(5pt)
      ]
    } else {
      body
      v(-10pt)
      ellipse(width: 30pt, height: 20pt, fill: rgb("000000"))[
        #align(center + horizon)[#text(size: 8pt, fill: rgb("FFFFFF"), upper(strong("END")))]
      ]
    }
  }
})

#let step(a, b) = {
  if ((a != none and a != "") or (b != none and b != "")) {
    a; " "; box(width: 1fr,repeat[.]); " "; b; linebreak()
  }
}

#let small_caution(
  caution
) = {
  text(size: small_text_size)[
    #text("Caution: ", fill: rgb("FF0000"))
  ]
  v(-1.6em)
  align(top + right)[#box(width: 85%)[#align(left)[
        #text(size: small_text_size)[#caution]
  ]]]
}

#let note(note) = {
  text(size: small_text_size)[Note:]
  v(-1.6em)
  align(top + right)[#box(width: 90%)[#align(left)[
    #text(size: small_text_size)[#note]
  ]]]
}

#let page_number() = locate(loc => {
  loc.page()
})

#let checklist(
  organization-name: none,
  cover-page-image: none,
  title: none,
  disclaimer: none,
  distribution-statement: none,
  rev: none,
  doc: none,

  style: 0,

  body
) = {
  set page("a4", margin: 0.4in,
  background: [
    #grid(
      columns: (90%),
      rows: (1fr, 2fr, 1fr, 1fr, 1fr, 1fr),
      gutter: 0.1in,
      [#text(size: 2em)[#organization-name]],
      [
        #if cover-page-image != none {
          image(cover-page-image, width: 6in, height: 3in)
        }
      ],
      [#text(size: 2em)[#title]],
      [#disclaimer],
      [#distribution-statement],
      [#rev
      #if rev != none and doc != none {[#linebreak()]}
      #doc],
    )
  ])
  set text(size: large_text_size, font: "Open Sans")

  style_state.update(style)

  box[]
  pagebreak()

  set page("a4",
  background: [],
  footer: [
    #line(start: (0pt, -15pt), length: 100%)
    #place(left, dy: -10pt,
      text(size: 8pt, fill: rgb("000000"))[
        #datetime.today().display()#linebreak()
        #rev
      ]
    )
    #place(center, dy: -10pt,
      text(size: 8pt, fill: rgb("000000"))[
        #page_number()
      ]
    )
    #place(right, dy: -10pt,
      text(size: 8pt, fill: rgb("000000"))[
        #title#linebreak()
        #doc
      ]
    )
  ])

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  show outline.entry.where(
    level: 2
  ): it => {
    h(2em)
    it
  }

  outline(title: "Table of Contents")
  pagebreak()

  body

}
