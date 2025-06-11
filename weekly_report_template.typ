// #set document(margin: 1in)
#set text(font: "Times New Roman", size: 11pt)

#let name = "Student Name"
#let stno = "XXXX-XXXXX"
#let supervisor = "Supervisor Name"
#let company = "Company Name"
#let N = 0

#let tasks_list = (
  (
    day: 1,
    date: "Insert Date",
    tasks: (
      (
        activity: "Activity 1",
        status: "Complete",
        solution: "N / A",
      ),
    ),
  ),
  (
    day: 2,
    date: "Insert Date",
    tasks: (
      (
        activity: "Activity 1",
        status: "Complete",
        solution: "N / A",
      ),
    ),
  ),
  (
    day: 3,
    date: "Insert Date",
    tasks: (
      (
        activity: "Activity 1",
        status: "Complete",
        solution: "N / A",
      ),
    ),
  ),
  (
    day: 4,
    date: "Insert Date",
    tasks: (
      (
        activity: "Activity 1",
        status: "Complete",
        solution: "N / A",
      ),
    ),
  ),
  (
    day: 5,
    date: "Insert Date",
    tasks: (
      (
        activity: "Activity 1",
        status: "Complete",
        solution: "N / A",
      ),
    ),
  ),
)

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

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

#pagebreak()

= Appendix

#pagebreak()

= Digital Signature / Certification

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
