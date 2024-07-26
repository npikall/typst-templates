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
    size: 10pt
  )
  show raw: set text(font: "DejaVu Sans Mono")
  show par: set block(above: 1.4em, below: 1em)

  // Set Table style
  set table(
    stroke: none,
    gutter: auto,
    fill: none,
    inset: (right: 1.5em),
  )
  
  show outline.entry.where(
    level: 1,
  ): it => {
    v(11pt, weak: true)
    strong(it.body)
    box(width: 1fr, repeat[])
    strong(it.page)
  }
  show outline.entry.where(
    level: 2,
  ): it => {
    it.body
    box(width: 1fr, repeat[.])
    it.page}

    show outline.entry.where(
    level: 3,
  ): it => {
    it.body
    box(width: 1fr, repeat[.])
    it.page}


  // Printing the title
  align(center,[
    #v(5em)
    #text(16pt)[#title]
    #v(1em)
    #text(12pt)[#author]
    #v(0em)
    #text(12pt)[#date]
    #v(1em)
  ])
  doc
}