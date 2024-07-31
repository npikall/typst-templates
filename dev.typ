// Preamble

// Import template
#import "templates/thesis-bui.typ": conf, maketitle

//Set variables
#let title = [Testing Typst Templates]
#let author = [John Glenfiddich]
#let date = datetime.today().display("[day].[month].[year]")

#let thesis-type = [Bachelorthesis]
#let email = [john.glenfiddich\@email.com]
#let matrnr = [123456789]
#let abstract = [#lorem(60)]

// Set document metadata for the actual pdf
#set document(title: title, author: "J.G.")

// Useing the configuration
#show: doc => conf(doc, language: "en")//, title:title)

//%%%%%%%%%%%%%%
// Main Document
//%%%%%%%%%%%%%%

// Make the title
#maketitle(
  title: title,
  author: author,
  date: date,
  language: "en",
  thesis-type: thesis-type,
  email: email,
  matrnr: matrnr,
  // logo: "../features/Logo.png",
  )

// Table of Contents
//#outline(title: [Table of Contents], indent: auto)

// Set document from here on to have 2 columns
//#show: rest => columns(2, rest)

= Introduction
This file is used to test the Typst templates. Just import the templates in the top of this document and and see what effects they have on the document. 

#lorem(40)

= Methods
#lorem(70)

== Tables
#lorem(50)

#figure(
table(
  columns: 3,
  align: (left, center, right),
  table.hline(),
  table.header([Substance], [Subcritical °C], [Supercritical °C],),
  table.hline(),
  [Hydrochloric Acid],[12.0], [92.1],
  [Sodium Myreth Sulfate],[16.6], [104],
  table.hline(start: 1),
  [Potassium Hydroxide], table.cell(colspan: 2)[24.7],
  table.hline(),
), caption: [This is the caption of a table])<tab:Tabelle>

Siehe @tab:Tabelle
#lorem(50)

== Formulas
#lorem(50)
$
K_t = (1 - (R^2 dot tau)/(c_a + nu dot tan delta))^4 dot k_1
$
#lorem(50)

== Figures and Images
#lorem(50)
#figure(
  image("features/Yousuf-Karsh-Winston-Churchill-1941.jpg", width: 40%)
  , caption: [This is the caption of a figure]
)<fig:winston>

Siehe @fig:winston #lorem(50)

== Lists
#lorem(40) Here is a very important list:
- Milk 
- Spices
  - Salt
  - Pepper
    - Black
    - White

#lorem(50)

+ Tick
+ Trick
+ Track

#lorem(40)

== Functions
#lorem(50)
#for value in range(2,12, step:2) [
  - Band #value
]


== Code
#lorem(30)


#figure(
[
#align(center)[#line(length: 40%)]
```python
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 10, 100)
y = np.sin(x)

fig, ax = plt.subplots()
ax.plot(x, y)
plt.show()
```
#align(center)[#line(length: 40%)]], caption: [This is the caption of a figure]
)<fig:code>

== Zitate
#lorem(50)
=== Einstein
#lorem(20)@einstein

=== Dirac
#lorem(30)@dirac

=== Knuth
#lorem(30)@knuthwebsite





= Results
#lorem(200)

= Discussion
#lorem(120)

#outline(target: figure, title: [List of Figures])

#bibliography("features/ref.bib", title: [References])