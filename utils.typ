#let todo(message) = {
  set text(white)
  rect(
    fill: red,
    radius: 4pt,
    [*TODO:* #message]
  )
  set text(black)
}