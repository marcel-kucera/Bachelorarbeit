#let todo(message) = {
  set text(white)
  rect(fill: red, radius: 4pt, [*TODO:* #message])
  set text(black)
}


#let usecase(
  number,
  name,
  ziel,
  akteur: none,
  vorbedingung: none,
  nachbedingung: none,
  fehlernachbedingung: none,
  ausloeser: none,
  ablauf: none,
  erweiterung: none,
) = {
  // Hauptinhalt des Usecases

  let content = stack(dir: ttb, spacing: 10pt, text(size: 20pt, "Anwendungsfall " + [#number] + ": " + name), ..(
    strong("Ziel:") + " " + ziel,
    if akteur != none {
      strong("Akteur:") + " " + akteur
    },
    if vorbedingung != none {
      strong("Vorbedingung:") + " " + vorbedingung
    },
    if nachbedingung != none {
      strong("Nachbedingung:") + " " + nachbedingung
    },
    if fehlernachbedingung != none {
      strong("Nachbedingung im Fehlerfall:") + " " + fehlernachbedingung
    },
    if ausloeser != none {
      strong("Auslöser:") + " " + ausloeser
    },
    if ablauf != none {
      strong("Ablauf:") + "\n" + ablauf
    },
    if erweiterung != none {
      strong("Erweiterung:") + "\n" + [
        #set list(marker:"")
        #erweiterung
      ]
    },
  )
    .filter(row => row != none)
    .flatten())

  figure(
    box(stroke: (left: black + 3pt), inset: 12pt, height: auto, align(left, content)),
    caption: "Anwedungsfall " + name,
  )
}

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Anhang])
  counter(heading).update(0)
  body
}
