// Thesis Template for Civil- und Environmentalengineers at TU Wien
#let conf(
  title:none,
  language:"en",
  doc
) = {
  // set the Pagelayout
  set page(
    paper:"a4",
    margin: ( left: 2.5cm,
              right: 2.5cm, 
              top: 2.5cm, 
              bottom: 2.5cm ),
    numbering: "1",
    header: context{
      if counter(page).get().first() > 1 [
      #set text(10pt)
      #h(1fr) #emph(title)
      #line(length: 100%, stroke: 0.7pt)]} ,
    header-ascent: 30%,
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
  let mainfont = "CMU Serif"//"New Computer Modern"
  let titlefont = "CMU Sans Serif" //"Dejavu Sans"
  set text(
    font: mainfont,
    size: 11pt
  )
  // Set Heading Style
  show heading: it => [
    #set text(font: titlefont)
    #block(it)
  ]
  // Raw text and Spaces
  show raw: set text(font: "DejaVu Sans Mono")
  show par: set block(above: 1.4em, below: 1em)

  // Set Table style
  set table(
    stroke: none,
    gutter: auto,
    fill: none,
    inset: (right: 1.5em),
  )
  // Referencing Figures
  show figure.where(kind: table): set figure(supplement:[Tab.], numbering: "1") if language == "aut"
  show figure.where(kind: image): set figure(supplement:[Abb.], numbering: "1",) if language == "aut"

  // List indentation
  set list(indent: 1em)
  set enum(indent: 1em)

  // Table of Contents Style
  show outline.entry.where(
    level: 1,
  ): it => {
    v(11pt, weak: true)
    text(font:titlefont, size:11pt ,[
      #strong(it.body)
      #box(width: 1fr, repeat[])
      #strong(it.page)
      ])}

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
    it.page
    }
  doc
}

// Make the Titleblock
#let maketitle(
  thesis-type: [Bachelorthesis],
  title:[The Bachelorthesis Title],
  author:[Firstname Lastname],
  date:datetime.today().display("[day].[month].[year]"),
  email:[author\@email.com],
  matrnr:[12345678],
  abstract:[#lorem(60)],
  language:"en",
) = {
  let mainfont = "CMU Serif"//"New Computer Modern"
  let titlefont = "CMU Sans Serif" //"Dejavu Sans"

  // Printing the title
  // define title printing function
  let print_title(
    abstract_name:[],
    matrnr_name:[],
    date_name:[],
    ) = {
  align(center,[
    #v(3em)
    #text(18pt, font: titlefont)[#thesis-type]
    #v(.5em)
    #text(18pt, font: titlefont)[*#title*]
    #v(1.2em)
    #text(10pt, font: titlefont)[#author]
    #v(0.5em)
    #text(10pt, font: titlefont)[
      #email\
      #matrnr_name: #matrnr\
      #date_name: #date]
    #v(1em)
    #box(width: 85%, [
    #text(11pt, font: titlefont)[#strong[#abstract_name]]\
    #text(11pt, font: mainfont)[#abstract]
    #v(1em)])
  ])}

  // print title depending on language
  if language == "aut" [
    #print_title(
      abstract_name: [Kurzfassung],
      date_name: [Datum], 
      matrnr_name: [Matr.Nr.],
  )] else [
    #print_title(
      abstract_name: [Abstract],
      date_name: [Date], 
      matrnr_name: [Matr.Nr.],)
  ]
}