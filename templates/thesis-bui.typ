// Thesis Template for Civil- und Environmentalengineers at TU Wien
#let conf(
  thesis-type: none,
  title:none,
  author:none,
  date:none,
  email:none,
  matrnr:none,
  doc
) = {
  // set the Pagelayout
  set page(
    paper:"a4",
    margin: ( left: 2.5cm,
              right: 2.5cm, 
              top: 1.5cm, 
              bottom: 2.5cm ),
    numbering: "1"
  )
  // Set the Heading Numbering
  set heading(numbering: "1.")
  // Set the equation numbering
  set math.equation(numbering: "(1)")
  // Set the paragraph style
  set par(leading: 0.55em,
          first-line-indent: 1.8em,
          justify: true)
  // Set the font style
  set text(
    font: "New Computer Modern",
    size: 11pt
  )
  // Set Table style
  set table(
    stroke: none,
    gutter: auto,
    fill: none,
    inset: (right: 1.5em),
  )
  show figure.where(kind: table): set figure(supplement:[Tab.], numbering: "1")
  show figure.where(kind: image): set figure(supplement:[Abb.], numbering: "1",)

  show raw: set text(font: "DejaVu Sans Mono")
  show par: set block(above: 1.4em, below: 1em)

  show outline.entry.where(
    level: 1,
  ): it => {
    v(11pt, weak: true)
    strong(it.body)
    box(width: 1fr, repeat[])
    strong(it.page)}

  show outline.entry.where(
    level: 2,
  ): it => {
    h(1.2em)
    it.body
    box(width: 1fr, repeat[.])
    it.page}

  show outline.entry.where(
    level: 3,
  ): it => {
    h(2.4em)
    it.body
    box(width: 1fr, repeat[.])
    it.page}

  // Printing the title
  let thefont = "Dejavu Sans" 

  align(center,[
    #v(3em)
    #text(18pt, font: thefont)[#thesis-type]
    #v(.5em)
    #text(18pt, font: thefont)[*#title*]
    #v(1.2em)
    #text(11pt, font: thefont)[#author]
    #v(0.5em)
    #text(11pt, font: thefont)[
      #email\
      Matr.Nr. #matrnr\
      Datum: #date]
    #v(1em)
  ])
  doc
}