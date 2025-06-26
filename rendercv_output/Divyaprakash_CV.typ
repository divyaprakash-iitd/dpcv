
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Divyaprakash"
#let locale-catalog-page-numbering-style = context { "Divyaprakash - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Divyaprakash

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)New Delhi],
  [#box(original-link("mailto:divyaprakash.poddar@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)divyaprakash.poddar\@gmail.com])],
  [#box(original-link("tel:+91-78749-80691")[#fa-icon("phone", size: 0.9em) #h(0.05cm)078749 80691])],
  [#box(original-link("https://dpcfd.com/")[#fa-icon("link", size: 0.9em) #h(0.05cm)dpcfd.com])],
  [#box(original-link("https://linkedin.com/in/divyaprakash-iitd")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)divyaprakash-iitd])],
  [#box(original-link("https://github.com/divyaprakash-iitd")[#fa-icon("github", size: 0.9em) #h(0.05cm)divyaprakash-iitd])],
  [#box(original-link("https://scholar.google.com/citations?user=H4Byf9EAAAAJ")[#fa-icon("graduation-cap", size: 0.9em) #h(0.05cm)Google Scholar])],
)
#connections(connections-list)



== About Me


#one-col-entry(
  content: [I am a computational researcher specializing in scientific computing, and machine learning applications in fluid dynamics. My expertise lies in developing and implementing numerical simulations and computational models to solve complex fluid flow and fluid-structure interaction problems. With some years of teaching experience in fluid mechanics and computational methods at the university level, I combine research with effective knowledge transfer. This CV highlights my research contributions, teaching experience, project involvement, and technical skillset in the field of computational mechanics.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[Indian Institute of Technology Delhi], Applied Mechanics
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([CGPA: 9.0\/10.0],[Working on computational modeling of biological cilia-particle interactions in fluid flow],)
  ],
  right-content: [
    New Delhi, India

Sept 2020 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MTech]],
  middle-content: [
    #strong[Indian Institute of Technology Gandhinagar], Mechanical Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([CPI: 8.11\/10.0],)
  ],
  right-content: [
    Gujarat, India

Dec 2013 – Sept 2016
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BE]],
  middle-content: [
    #strong[Dr. Ambedkar Insitute of Technology], Mechanical Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Percentage: 76\%, First class with distinction],)
  ],
  right-content: [
    Bengaluru, India

May 2008 – July 2012
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Google Summer of Code 2025 - Stitching SU2], Summer Intern\/Programmer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Using data-driven, physics-informed machine learning to model fluid properties in computational fluid dynamics],)
  ],
  right-content: [
    Remote

May 2025 – Sept 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Jorhat Engineering College], Assistant Professor
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Specialized in teaching advanced fluid mechanics and CFD courses],)
  ],
  right-content: [
    Assam, India

Sept 2018 – Sept 2020
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Institute of Technology Gopeshwar], Assistant Professor
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Taught core engineering courses and established Google-Suite for education at the institute],)
  ],
  right-content: [
    Uttarakhand, India

Jan 2018 – Aug 2018
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Indian Institute of Technology Gandhinagar], Junior Research Fellow
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Worked on the development of computational simulations for a smart, eco-friendly fire detection and suppression system],)
  ],
  right-content: [
    Gujarat, India

Sept 2016 – Aug 2017
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Institute of High Performance Computing], Summer Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Worked on implementing immersed boundary method in OpenFOAM by modifying existing solver for vortex-induced vibration simulations],)
  ],
  right-content: [
    Singapore

May 2015 – July 2015
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Institute for Plasma Research Gandhinagar], Graduate Apprentice
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Received specialized training in solving conduction heat transfer problems using numerical methods implemented in MATLAB.],)
  ],
  right-content: [
    Gujarat, India

Aug 2013 – Nov 2013
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[ML-Estimated Superdroplet Growth Using DNS Data]
  ],
  right-content: [
    2024 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Improved cloud droplet growth modeling in Large Eddy Simulations \(LES\) by developing a machine learning-based parameterization using high-fidelity DNS data. Achieved an R² of 0.9 for predicting supersaturation and droplet growth rates. Results were presented at ICCP 2024 in South Korea.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Cilia-Particle Interaction Modeling with Machine Learning]
  ],
  right-content: [
    2021 – 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [As part of PhD thesis at IIT Delhi, the sensing mechanism of biological cilia in particle-laden flow environments was investigated. Particle-cilia interactions were simulated using the Immersed Boundary Method, and the generated data was utilized to train an LSTM-based machine learning model with a regression layer. Particle size and aspect ratio were predicted with accuracy within 5\%. Research findings were presented at the ECCOMAS Congress 2024 in Lisboa, Portugal.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Numerical Simulation of Vortex Shedding and Scour for Submarine Pipelines]
  ],
  right-content: [
    2015 – 2016
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [As part of M.Tech thesis at IIT Gandhinagar, 2D turbulent flow around submarine pipelines was simulated using OpenFOAM with RANS and k-ω SST models. Pipeline shapes were tested to minimize vortex shedding, and a custom solver with Python\/bash scripts was developed for scour prediction, validated against experimental data.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Solid Propellant Fire Suppression Simulation]
  ],
  right-content: [
    2018
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Simulated detonation\/deflagration of a solid propellant for fire suppression using Uintah software from the University of Utah. Fire dynamics were modeled with Fire Dynamics Simulator \(FDS\), and initial experiments were conducted with team members to compare simulation results with experimental data.])], column-gutter: 0cm)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] Proficient with Python, Fortan, C\/C++ and Git; basic understanding of Web development]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Software:] Proficient in MATLAB and OpenFOAM; working experience with ANSYS, StarCCM+, FDS and SU2]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(fluent\), Hindi \(native\)]
)


== Publications & Conference Proceedings


#two-col-entry(
  left-content: [
    #strong[Machine Learning-Based Estimation of Superdroplet Growth Rates Using DNS Data]

  ],
  right-content: [
    Oct 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Divyaprakash]], Nikita N. Makwana, Amitabh Bhattacharya, Bipin Kumar

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.48550/arXiv.2410.13890")[10.48550/arXiv.2410.13890]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Sensing Particulate Flows Using Arrays of Passive Artificial Cilia]

  ],
  right-content: [
    July 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Divyaprakash]], Amitabh Bhattacharya

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1007/978-981-97-1033-1_30")[10.1007/978-981-97-1033-1_30]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Review of Computational Modeling of Fluid-Immersed Flexible Filaments]

  ],
  right-content: [
    Apr 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Divyaprakash]], Mohit Garg, Ajeet Kumar, Amitabh Bhattacharya

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1007/s41745-024-00423-x")[10.1007/s41745-024-00423-x]])



== Conferences & Poster Presentations


#one-col-entry(
  content: [- #strong[preCICE Workshop 2024] \(University of Stuttgart, Germany | Sept 2024\): 'Cilia as Particle Sensors: From 2D Numerical Models to 3D with preCICE' - #emph[Poster Presentation, Awarded travel grant]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[ECCOMAS Congress 2024] \(Lisbon, Portugal | June 2024\): 'Sensing of Particle Shape and Size Using Arrays of Artificial Cilia' - #emph[Oral Presentation, Art & Science Competition Winner]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Workshop on Interfacial Engineering at Multiple Spatio-temporal Scales] \(IISC, Bengaluru | Jan 2024\): 'Computational Study of Cilia-Based Sensing Mechanism for Particle's Shape and Size' - #emph[Poster Presentation, Best Poster Award]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Conference on Fluid Mechanics and Fluid Power \(FMFP\)] \(IIT Roorkee | Dec 2022\): 'Sensing Particulate Flows using Arrays of Passive Artificial Cilia' - #emph[Oral Presentation]],
)


== Extracurricular Activities


#one-col-entry(
  content: [- Program Coordinator \(Volunteer\), Indiahikes \(Oct 2023\) - An Experiential Learning Program was coordinated for business school students, fostering leadership skills through a Himalayan trek despite terrain and weather challenges.],
)


== References


#one-col-entry(
  content: [- Amitabh Bhattacharya, Professor, Indian Institute of Technology Delhi, Email: #link("mailto:bhattach@iitd.ac.in")[bhattach\@iitd.ac.in]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Amit Gupta, Professor, Indian Institute of Technology Delhi, Email: #link("mailto:agupta@mech.iitd.ac.in")[agupta\@mech.iitd.ac.in]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Bipin Kumar, Scientist, Indian Institute of Tropical Meteorology, Email: #link("mailto:bipin.porwal@gmail.com")[bipin.porwal\@gmail.com]],
)


