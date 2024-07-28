// Latex Style Template with simple cover page
#let conf(
  language:"en",
  title: none,
  doc
) = {
  // set the Pagelayout
  set page(
    paper:"a4",
    margin: ( left: 2.5cm,
              right: 2.5cm, 
              top: 2.5cm, 
              bottom: 2.5cm ),
    footer: context{
      if counter(page).get().first() > 1 [
        #h(1fr)
        #counter(page).display(
          "1",
          both: false,
        )
        #h(1fr)]},
    header: context{
      if counter(page).get().first() > 1 and title != none [
        #set text(10pt)
        #h(1fr) #emph(title)
        #line(length: 100%, stroke: 0.7pt)]} ,
    header-ascent: 30%,
  )
  // Set the Heading Numbering
  set heading(numbering: "1.")
  // Set the paragraph style
  set par(leading: 0.55em,
          first-line-indent: 1.8em,
          justify: true)
  // Set the font style
  let mainfont = "CMU Serif"
  let rawfont = "Dejavu Sans Mono"
  set text(
    font: mainfont,
    size: 10pt, 
  )
  show raw: set text(font: rawfont)
  show par: set block(above: 1.4em, below: 1em)

  // Referencing Figures
  show figure.where(kind: table): set figure(supplement:[Tab.], numbering: "1") if language == "aut"
  show figure.where(kind: image): set figure(supplement:[Abb.], numbering: "1",) if language == "aut"

  // Set Table style
  set table(
    stroke: none,
    gutter: auto,
    fill: none,
    inset: (right: 1.5em),
  )
  
  // Set Table of Contents Style
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

  // List indentation
  set list(indent: 1em)
  set enum(indent: 1em)

  // Document
  doc
}

#let maketitle(
  title:[],
  subtitle:[The important subtitle],
  author:[],
  date: datetime.today().display("[day].[month].[year]"),  
  bottom:[Engineering\
    Fantasy University],
  logo:none,
) = {
  // titlepage with the logo
  if logo != none [
  #image(logo, width: 40%)
  #align(center,[
    #v(2.5cm)
    #text(20pt)[#title]
    #v(1em)
    #text(16pt)[#subtitle]
    #v(3em)
    #text(14pt)[#author]
    #v(1fr)
    #text(14pt)[
      #bottom\
      \
      #date]
  ])
  #pagebreak()] else [
    // titlepage without the logo
    #align(center,[
    #v(5cm)
    #text(20pt)[#title]
    #v(1em)
    #text(16pt)[#subtitle]
    #v(3em)
    #text(14pt)[#author]
    #v(1fr)
    #text(14pt)[
      #bottom\
      \
      #date]])
    #pagebreak()
  ]
}