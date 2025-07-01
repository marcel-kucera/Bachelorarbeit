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
#set page(
  margin: 3cm,
  numbering: "1",
  header: [
    #set text(8pt)
    Marcel Frank Kucera
    #h(1fr)
    #datetime.today().display("[day].[month].[year]")
  ],
)

#outline(indent: auto)
#pagebreak()

#set heading(numbering: "1.1")

= Filler
