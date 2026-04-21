#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/cetz:0.4.2"

#let m-dark-orange = rgb(255, 152, 0)
#let m-granat = rgb(176, 47, 44)
#let m-karneol = rgb(214, 66, 66)
#let m-aquamarin = rgb(138, 194, 209)
#let m-light-gray = rgb(201, 201, 201)
#let m-gray = rgb(128, 128, 128)
#let m-basalt = rgb(38, 42, 49)

#let m-subtitle = state("m-subtitle", none)
#let m-shorttitle = state("m-shorttitle", none)
#let m-section = state("m-section", none)

#let m-pages = counter("m-page")

// Theming, show rules and meta data
//
// - title: Presentation title.
// - author: List of authors.
// - subtitle: (Optional) subtitle for more info.
// - short-title: (Optional) short title for the header.
// - date: (Optional) date of the presentation.
#let leipzig-theme(
  title: [],
  author: (),
  subtitle: none,
  short-title: none,
  date: datetime.today(),
  body
) = {
  set document(
    title: title,
    author: author,
    date: date,
  )
  m-subtitle.update(subtitle)
  m-shorttitle.update(short-title)

  set page(
    paper: "presentation-16-9",
    margin: (x: 54.7pt, y: 26.5pt)
  )
  set text(font: "Arial", fill: black, 20.2pt)

  set list(marker: text(m-karneol)[--])

   body
}

#let fontsize-LARGE = 32pt
#let fontsize-Large = 26pt
#let fontsize-small = 18.6pt
#let fontsize-tiny  = 12.6pt

// Declare the title slide.
//
// - logo: (Optional) institution / faculty logo.
// - date-format: (Optional) date format to display the presentation date.
// - extra: (Optional) info below the date and author, like the faculty.
#let title-slide(
  logo: none,
  date-format: "[month repr:long] [day], [year]",
  extra: none,
) = {
  set page(background: context {
      let w = page.width
      let h = page.height
      set align(right)
      cetz.canvas(length: w, {
        import cetz.draw: *
        let r = 1   // right edge
        let b = h/w // bottom edge
        set-transform(cetz.matrix.transform-scale((1, 1)))
        stroke(none)
        line((0.65 * r, b), (r, b), (r, 0.65 * b), close: true, fill: m-aquamarin)
        line((0.895 * r, b), (r, b), (r, 0.65 * b), (0.925 * r, 0.725 * b), close: true, fill: m-karneol)
        line((r, 0.65 * b), (0.925 * r, 0.725 * b), (r , 0), close: true, fill: m-granat)
      })
    }
  )
  let content = {
    m-pages.update(1)
    context {
      image("leipzig_university.svg", height: 0.23 * page.height)
    }
    let subtitle = context m-subtitle.get()
    if subtitle != none {
      place(center)[
        #set text(fontsize-Large)
        #align(center)[#subtitle]
      ]
    }
    if logo != none {
      context {
        set image(height: 0.186 * page.height)
        place(logo, dx: 58%, dy: 80pt)
      }
    }
    v(50pt)
    [
      #text(fontsize-LARGE)[*#context document.title*]

      #context document.date.display(date-format)\
      #context document.author.join(", ")
      #v(1em)
      #text(fontsize-small)[#extra]
    ]
    m-pages.step()
  }

  polylux-slide(content)
}

// Basic slide function.
//
// - title: (Optional) heading of the slide.
#let slide(
  title: none,
  body
) = {
  if heading != none {
    m-section.update(heading)
  }
  set page(
    margin: (x: 7%, y: 13%),
    background: context {
      let w = page.width
      let h = page.height
      let thin = 0.8pt
      let very-thin = 0.4pt
      set par(leading: 1.4pt)
      cetz.canvas(length: w, {
        import cetz.draw: *
        let r = 1   // right edge
        let b = h/w // bottom edge
        set-transform(cetz.matrix.transform-scale((1, 1)))
        // ensure positioning is correct
        rect((0,0), (1, b), stroke: none, fill: none)

        // header
        line((0, 0.03 * b), (0.05, 0.03 * b), stroke: black+very-thin)
        line((0, 0.035 * b), (0.05, 0.035 * b), stroke: m-gray+very-thin)
        let short-title = m-shorttitle.get()
        let section = m-section.get()
        content((0.06, 0.035 * b), text(fontsize-small)[*#context if short-title == none { document.title } else { short-title }* | #if section != none [#section] ], anchor: "west")

        // footer
        line((0.068, 0.88 * b), (0.93, 0.88 * b), stroke: m-karneol+very-thin)
        line((0.068, 0.885 * b), (0.93, 0.885 * b), stroke: m-gray+very-thin)
        line((0.07, 0.89 * b), (0.07, 0.98 * b), stroke: m-gray+thin)
        content((0.078, 0.935 * b), text(size: fontsize-tiny, black)[UNIVERSITÄT\ LEIPZIG], anchor: "west")
        content((0.93, 0.935 * b), text(size: fontsize-tiny, m-karneol)[#context m-pages.get().first()], anchor: "east")
      })
    },
  )
  let content = {
    show: align.with(horizon)
    m-pages.step()
    if heading != none {
      align(top+left, heading(level: 1, title))
    }
    body
  }

  polylux-slide(content)
}
