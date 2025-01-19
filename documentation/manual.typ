#import "@preview/mantys:0.1.4": *
#import "@preview/codly:1.0.0": *

#show: mantys.with(
  name: "aero-check",
  title: [aero-check checklist template],
  // subtitle: [An unofficial template for FHICT document generation.],
  authors: "TomVer99",
  url: "https://github.com/TomVer99/Typst-checklist-template",
  version: "0.2.0",
  date: datetime.today(),
  abstract: [
    This template allows you to easily create checklists in the style of aviation checklists.
  ],
)

#show: codly-init.with()
#codly(
  languages: (
    rust: (name: "Rust"),
    rs: (name: "Rust"),
    cmake: (name: "CMake"),
    cpp: (name: "C++"),
    c: (name: "C"),
    py: (name: "Python"),
    java: (name: "Java"),
    js: (name: "JavaScript"),
    sh: (name: "Shell"),
    bash: (name: "Bash"),
    json: (name: "JSON"),
    xml: (name: "XML"),
    yaml: (name: "YAML"),
    typst: (name: "Typst"),
  ),
  number-format: none,
  display-icon: false,
)

= Usage

== Pre Requisites

To use this template, you need to be able to render Typst documents.

== Importing the template

```typst
#import "@preview/aero-check:0.1.1": *
```

== First Document

To create a document using this template, you can use the `checklist` command.

This command has a lot of arguments to customize the document.
Here is an example of a simple document:

```typst
#show: checklist.with(
  title: "Title",
  // disclaimer: "",
  // 0 or 1
  // style: 0,
)

#topic("Topic")[
  #section("Section")[
    #step("Step", "Check")
    #step("Step", "Check")
  ]
  #section("Section")[
    #step("Step", "Check")
    #step("Step", "Check")
  ]
]
```

= Available commands

<checklist>
#command(
  "checklist",
  arg[title],
  arg[disclaimer],
  arg[style],
  barg[body],
)[
  #argument("title", types: "string", default: none)[
    The title of the document.
  ]

  #argument("disclaimer", types: "string", default: none)[
    A disclaimer put at the top of the checklist.
  ]

  #argument("style", types: "int", default: 0)[
    The style of the checklist.
  ]
]

<topic>
#command(
  "topic",
  arg[title],
  arg[fill-clr],
  barg[body],
)[
  #argument("title", types: "string")[
    The title / name of the topic.
  ]

  #argument("caution", types: "color", default: rgb("FFFFFF"))[
    The fill color of the topic box.
  ]

  #argument("body", types: content)[
    The contents of the topic.
  ]
]

<section>
#command(
  "section",
  arg[title],
  arg[fill-clr],
  barg[body],
)[
  #argument("title", types: "string")[
    The title / name of the section.
  ]

  #argument("caution", types: "color", default: rgb("FFFFFF"))[
    The fill color of the section box.
  ]

  #argument("body", types: content)[
    The contents of the section.
  ]
]

#pagebreak()
<step>
#command(
  "step",
  arg[a],
  arg[b],
  arg[bold],
)[
  #argument("a", types: "string")[
    The right element of a step.
  ]

  #argument("b", types: "string")[
    The left element of a step.
  ]

  #argument("bold", types: "bool", default: false)[
    If the step gets printed in #strong("bold").
  ]
]

<topic>
#command(
  "small-caution",
  barg[caution],
)[
  #argument("caution", types: "string")[
    The caution text to be displayed.
  ]
]

// black-and-white: false, body
<emer-page>
#command(
  "emer-page",
  arg[black-and-white],
  barg[body],
)[
  #argument("black-and-white", types: "bool", default: false)[
    If the emergency page style should be drawn in black and white or color.
  ]

  #argument("body", types: content)[
    The contents of the emer-page.
  ]
]