#import "@preview/polylux:0.3.1": *

#let conf(
  font: "Carlito", 
  raw-font: "Source Code Pro",
  text-size: 25pt,
  doc
  ) = {
  set page(paper: "presentation-16-9")
  set text(size: text-size, font: font)

  show raw.where(block: false): r => {
    box(
      fill: luma(245),
      outset: (y: 5pt),
      inset: (x: 5pt),
      radius: 3pt,
      text(font: raw-font, r.text), 
      // raw(lang: r.lang, r.text)
    )
  }

  doc
}

  #let glua-title-slide(title, authors, subtitle: none) = {
    let authors = if type(authors) ==  "array" { authors } else { (authors,) }
    polylux-slide[
      #set align(center)
      = #smallcaps(title)
      #if (subtitle != none) [
        _ #subtitle _
      ]

      #grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        column-gutter: 1em,
        row-gutter: 1em,
        ..authors.map(author => text(fill: black, author))
      )
      
    ]
  }

  // #let glula-index-slide(title) = {
  //   polylux-slide[
  //     #outline(title: title)
  //   ]
  // }

  #let glua-slide(title, body) = {
    set page(header: [= #title])
    polylux-slide(body)
  }
