// Overleaf LATEX Standard Template
#let conf(
  title:none,
  author:none,
  date:none,
  doc
) = {
  // set the Pagelayout
  set page(
    paper:"a4",
    margin: ( left: 2.5cm,
              right: 2.5cm, 
              top: 1.5cm, 
              bottom: 2.5cm ),
    numbering: "1/1"
  )
  // Set the Heading Numbering
  set heading(numbering: "1.")
  // Set the paragraph style
  set par(leading: 0.55em,
          first-line-indent: 1.8em,
          justify: true)
  // Set the font style
  set text(
    font: "New Computer Modern",
    size: 11pt
  )
  show raw: set text(font: "New Computer Modern Mono")
  show par: set block(above: 1.4em, below: 1em)

  show outline.entry.where(
    level: 1,
  ): it => {
    v(11pt, weak: true)
    strong(it)
  }

  // Printing the title
  align(center,[
    #v(3em)
    #text(18pt)[#title]
    #v(1.5em)
    #text(13pt)[#author]
    #v(0.5em)
    #text(13pt)[#date]
    #v(1em)
  ])
  doc
}