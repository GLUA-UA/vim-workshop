#import "@preview/polylux:0.3.1": *

#let col_bg = rgb(0xd0, 0xd2, 0xd3)
#let col_raw_bg = rgb(0x23, 0x1f, 0x20)
#let col_raw_font = rgb(0xd0, 0xd2, 0xd3)
// #let col_header_bg = rgb(0x12, 0x50, 0x2c)
#let col_header_bg = rgb(0x18, 0x6a, 0x3b)

#let conf(
  font: "DejaVu Sans", 
  raw-font: "Source Code Pro",
  text-size: 25pt,
  doc
  ) = {
  set page(
    paper: "presentation-16-9",
    fill: col_bg,
    // header-ascent: 35%
    margin: 10pt,
  )
  
  set text(size: text-size, font: font)

  set table(
    inset: 8pt,
    align: horizon,
  )

  show raw.where(block: false): r => {
    box(
      fill: col_raw_bg,// luma(245),
      outset: (y: 5pt),
      inset: (x: 5pt),
      radius: 3pt,
      text(
        fill: col_raw_font, 
        font: raw-font, 
        r.text
      ), 
      // raw(lang: r.lang, r.text)
    )
  }

  doc
}

#let glua-title-slide(title, authors, subtitle: none) = {
  let authors = if type(authors) ==  "array" { authors } else { (authors,) }
  polylux-slide[
    #set align(center + horizon)
    = #smallcaps(title)
    #v(20pt)

    #if (subtitle != none) [
      _ #subtitle _
    ]
    #v(30pt)

    #grid(
      columns: (1fr,) * calc.min(authors.len(), 3),
      column-gutter: 1em,
      row-gutter: 1em,
      ..authors.map(a => text(size: 0.85em, a))
    )
  ]
}

// #let glula-index-slide(title) = {
//   polylux-slide[
//     #outline(title: title)
//   ]
// }

#let glua-slide(title, body) = {
  polylux-slide(
    table(
      rows: (1fr, 5fr),
      stroke: none,
      rect(
        fill: col_header_bg, 
        width: 100%, 
        height: 100%, 
        [= #title]
      ),
      body
    )
  )
}
