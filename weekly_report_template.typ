// #set document(margin: 1in)
#set text(font: "Times New Roman", size: 11pt)

#let data = yaml("data.yaml")

#let name = data.name
#let stno = data.stno
#let supervisor = data.supervisor
#let company = data.company
#let N = eval(data.cumulative_hours)
#let narrative_summary = data.narrative_summary
#let appendix = data.appendix

#let tasks_list = data.tasks

#let activity_list(tasks_list) = {
  for entry in tasks_list {
    heading(level: 2, "Day " + str(entry.day) + " (" + text(entry.date, font: "JetBrainsMono NF", weight: "light", size: {.8em}, style: "italic") + ")")

    table(
      columns: (1fr, 0.5fr, 1fr),
      align: (x, y) =>
        if y == 0 or x == 1 { center } 
        else { left },
      fill: (_, y) =>
        if y == 0 { rgb("#e5e4e2") },
      table.header(
        [Activity/Problems Encountered], [Status], [Solution]
      ),
      ..for task in entry.tasks {
        (task.activity, task.status, task.solution)
      }
    )
  }
}

#let appendix_list(data) = {
  let i = 0
  for entry in data {
    heading(level: 2, "Appendix " + str.from-unicode(65+i) + ": " + entry.title)
    v(0.5cm)

    align(
      if entry.type == "technical" { left } else { center },
      if entry.type == "table" {
        table(
          columns: (1fr, 0.5fr, 1fr),
          align: center,
          fill: (_, y) =>
            if y == 0 { rgb("#e5e4e2") },
          ..for content in entry.table_content {
            entry.table_content.flatten()
          }
        )
      } 
      else if entry.type == "chart" {
        image(
          entry.chart_url,
          alt: "Chart"
        )
      }
      else if entry.type == "diagram" {
        image(
          entry.diagram_url,
          alt: "Diagram"
        )
      }
      else if entry.type == "glossary" {
        if entry.type == "glossary" {
          let glossary_terms = entry.glossary_content
          let split_index = int(calc.round(glossary_terms.len() / 2, digits: 0))  // Split the glossary in half
          let first_half = glossary_terms.slice(0, split_index)  // First column (first half)
          let second_half = glossary_terms.slice(split_index)     // Second column (second half)
          
          columns(
            2,
            {         
              let column1 = first_half
              let column2 = second_half
              
              for term in column1 {
                text(term.term + " - " + term.definition + "\n")
              }
              
              colbreak()  // Move to the second column
              
              for term in column2 {
                text(term.term + " - " + term.definition + "\n")
              }
            }
          )
        }
      }
      else if entry.type == "technical" {
        for item in entry.tech_content {
          heading(
            level: 3,
            item.section_title
          )
          if item.type == "code" {
            raw(
              item.code_content,
              lang: item.language
            )
          }
          else if item.type == "text" {
            text(
              item.text_content,
            )
          }
          v(0.5cm)
        }
      }
      else {
        text("Invalid content type")
      }
    )

    pagebreak()
    i += 1
  }
}

#align(center)[
  #text(size: 17pt, weight: "bold")[Weekly Report X]
  #v(0.2cm)
  #name\
  _#stno _\
  _Cumulative Hours: #N hrs_
]

#outline(
  title: "Table of Contents"
)

#pagebreak()

= Activity List

#activity_list(tasks_list)

#pagebreak()

= Narrative Summary

#v(0.5cm)
#narrative_summary

#pagebreak()

#if appendix != none [
= Appendix
#appendix_list(appendix)
]

= Digital Signature / Certification

#v(0.5cm)
I certify, to my knowledge, that all the activities and data mentioned in this document are true and correct and that they are stated here only for the evaluation of my faculty supervisor.

Signed,

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #v(1in)
    #name \
    Student\
    Institute of Computer Science
  ],
  [
    #v(1in)
    #supervisor \
    Supervisor \
    #company
  ]
)
