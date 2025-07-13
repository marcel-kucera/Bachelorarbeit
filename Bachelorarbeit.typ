#import "@preview/hydra:0.6.1": hydra
#import "utils.typ": todo

#set page(paper:"a4",margin: 3cm)
#set text(lang: "de",size: 12pt)
#set par(justify: true, leading: 1em, spacing: 1.5em)
#show heading: set block(below: 1.3em,above: 1.5em)
#show link: link =>  underline(text(blue,link))
#show cite: set text(fill: blue)
#show ref: set text(fill: blue)

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Anhang])
  counter(heading).update(0)
  body
}


#set page(numbering: "I")

#align(
  center,
)[
  
  #image("mni.svg")
  #v(15%)
  Bachelorarbeit
  #v(5%)
  
  #heading(outlined: false, "Konzeptionierung und Implementierung einer 
  Pivot-Tabellen-Komponente in einem CRM-System")

  #v(5%)

  #grid(
    columns: 1,
    gutter: 0.5cm,
    [zur Erlangung des akademischen Grades],
    [Bachelor of Science (B. Sc.)],
    grid(
      columns: 1,
      gutter: 0.25cm,
      [vorgelegt dem],
      [Fachbereich Mathematik, Naturwissenschaften und Informatik],
      [der Technischen Hochschule Mittelhessen]
    )
  )
  
  #v(5%)

  #grid(
    columns: 1,
    gutter: 0.5cm,
    [vorgelegt von],
    [Marcel Frank Kucera],
  )
  
  #v(5%)

  im September 2025

]

#v(10%)

#grid(
  columns: 2,
  gutter: 0.4cm,
  [Referent:],[Sebastian Süß, M.Sc.],
  [Korreferent:],[Prof. Dr. Steffen Vaupel]
)

#pagebreak()

#outline(indent: auto)

#todo("Eidstattliche erklärung")
#todo("KI Erklärung")
#todo("Zusammenfassung")

#pagebreak()

#set page(
  numbering: "1",
  header: context {
  if calc.odd(here().page()) {
    align(right, emph(hydra(1)))
  } else {
    align(left, emph(hydra(2)))
  }
  line(length: 100%)
   },
)
#set heading(numbering: "1.1")
#show heading.where(level: 1): it => pagebreak(weak: true) + it

#counter(page).update(1)

#include "kapitel/1einleitung.typ"
#include "kapitel/2kontext.typ"
#include "kapitel/3konzeptionierung.typ"
#include "kapitel/4entwurf.typ"
#include "kapitel/5implementierung.typ"
#include "kapitel/6evaluation.typ"
#include "kapitel/7fazit.typ"

#bibliography("My Library.bib",style: "ieee")