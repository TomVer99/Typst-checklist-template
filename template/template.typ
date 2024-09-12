#let small_text_size = 8pt
#let large_text_size = 14pt

#let abnormals = rgb("FF9A00")

#let style_state = state("style", "0")

#let emer-page(black-and-white: false, body) = {
  let size = 0.33in
  let color = if black-and-white {
    rgb("FFFFFF")
  } else {
    abnormals
  }
  let padding = if black-and-white {
    1pt
  } else {
    0pt
  }
  set page(
    "a4",
    margin: 0.4in,
    background: [
      #align(left + top)[
        #block(width: size, height: 100%, fill: black)[
          #for i in range(18) {
            polygon(
              (0pt, 0pt),
              (size + padding, -(size + padding)),
              (size + padding, 0pt),
              (0pt, size + padding),
              fill: color,
            )
            v(0.1in)
          }]
      ]
      #align(right + bottom)[
        #block(width: size, height: 100%, fill: black)[
          #for i in range(18) {
            polygon(
              (0pt, -(size + padding)),
              (size + padding, 0pt),
              (size + padding, size + padding),
              (0pt, 0pt),
              fill: color,
            )
            v(0.1in)
          }]
      ]
    ],
  )

  body

  set page("a4", margin: 0.4in, background: none)
}

#let topic(
  title,
  fill_clr: rgb("FFFFFF"),
  body,
) = {
  box(width: 100%, stroke: 1pt, outset: 4pt, fill: fill_clr)[
    #v(5pt)
    #align(center)[#text(size: 20pt, upper(strong(title)))]
    #v(5pt)
  ]
  columns(2)[
    #body
  ]
}

#let section(
  title,
  fill_clr: rgb("FFFFFF"),
  body,
) = (
  context {
    if (title != none and title != "") {
      box(width: 100%, stroke: 1pt, outset: 4pt, fill: fill_clr)[
        #v(5pt)
        #align(center)[#upper(strong(title))]
        #v(5pt)
      ]
      linebreak()
      v(-(small_text_size))
      if (style_state.get() == 1) {
        box(width: 1fr, stroke: 1pt, outset: 4pt)[
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
  }
)

#let step(a, b) = {
  if ((a != none and a != "") or (b != none and b != "")) {
    a
    " "
    box(width: 1fr, repeat[.])
    " "
    b
    linebreak()
  }
}

#let small_caution(
  caution,
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

#let page_number() = (
  context {
    counter(page).display()
  }
)

#let checklist(
  title: none,
  disclaimer: none,
  style: 0,
  body,
) = {
  set page(
    "a4",
    margin: 0.4in,
    footer: [
      #line(start: (0pt, -15pt), length: 100%)
      #place(
        left,
        dy: -10pt,
        text(size: 8pt, fill: rgb("000000"))[
          #datetime.today().display()
        ],
      )
      #place(
        center,
        dy: -10pt,
        text(size: 8pt, fill: rgb("000000"))[
          #page_number()
        ],
      )
      #place(
        right,
        dy: -10pt,
        text(size: 8pt, fill: rgb("000000"))[
          #title
        ],
      )
    ],
  )
  set text(size: large_text_size, font: "Open Sans")

  style_state.update(style)

  if title != none {
    box(width: 100%, stroke: 1pt, outset: 4pt, fill: rgb("FFFFFF"))[
      #v(5pt)
      #align(center)[#text(size: 20pt, upper(strong(title)))]
      #v(5pt)
    ]
  }

  if disclaimer != none {
    box(width: 100%, stroke: 1pt, outset: 4pt, fill: rgb("FF1100").lighten(40%))[
      #v(5pt)
      #align(center)[#text(size: 20pt, upper(strong(disclaimer)))]
      #v(5pt)
    ]
  }

  body

}
