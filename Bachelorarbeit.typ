#import "@preview/icu-datetime:0.1.2": fmt-date, fmt-time, fmt-datetime, experimental

#set page(paper:"a4")
#set text(lang: "de",size: 12pt)
#show heading: set block(below: 1.3em,above: 1.5em)
#set par(justify: true, leading: 1em, spacing: 1.5em)
#show link: link =>  underline(text(blue,link))

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Anhang])
  counter(heading).update(0)
  body
}

#show cite: set text(fill: blue)
#show ref: set text(fill: blue)

// TITLEPAGE
#set page(margin: 3cm)
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

#import "@preview/hydra:0.6.1": hydra

#outline(indent: auto)
#pagebreak()

#set page(
  margin: 3cm,
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



#set heading(numbering: "1.1")

= Einleitung
test @becker2019
== Motivation
== Zielsetzung
== Methodik
= Kontext
== CURSOR-CRM
== Infoboards
== React
=== Innerhalb des CURSOR-CRM
== Pivot-Tabellen
= Konzeptionierung
== Anforderungen
== Vergleich mit alter Pivot-Tabellen-Komponente
= Entwurf
== Design
== Evaluation von verfügbaren Bibliotheken
= Implementierung
== Freistehende Entwicklung
== Integration in das CRM-System
= Evaluation
== Usability-Tests
== Bewertung
= Fazit und Ausblick

#bibliography("My Library.bib",style: "ieee")
