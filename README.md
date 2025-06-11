# Weekly Report Data Editing Guide

This guide explains how to edit the `data.yaml` file for weekly reports.

## Basic Information

At the top of the file, fill in your personal information:

```yaml
name: Student Name           # Replace with your full name
stno: XXXX-XXXXX           # Replace with your student number
supervisor: Supervisor Name # Replace with your supervisor's name
company: Company Name       # Replace with your company name
```

## Cumulative Hours

Track your total hours using a simple addition format:

```yaml
cumulative_hours: "5+10"    # Add weekly hours as an equation (e.g., "5+10+8")
```

## Daily Tasks

Each week contains up to 5 days of tasks. For each day:

1. Set the day number
2. Insert the actual date
3. Add one or more tasks with:
   - activity: Description of what you did
   - status: Set as "Complete"
   - solution: Use "N / A" if no specific solution is needed

Example:
```yaml
tasks:
  - day: 1
    date: Insert Date
    tasks:
      - activity: Activity 1
        status: Complete
        solution: N / A
```

## Narrative Summary

Add a detailed summary of your week's work in paragraph form:

```yaml
narrative_summary: "Your detailed weekly summary goes here..."
```

## Appendix

The appendix can contain various types of content:

### 1. Tables
```yaml
- title: "Table"
  type: "table"
  table_content:
    - ["Column 1", "Column 2", "Column 3"]  # Header row
    - ["Item 1", "Item 2", "Item 3"]        # Data rows
```

### 2. Charts
```yaml
- title: "Chart"
  type: "chart"
  chart_url: "chart.png"    # Reference to chart image file
```

### 3. Glossary
```yaml
- title: "Glossary"
  type: "glossary"
  glossary_content:
    - term: "Term 1"
      definition: "Definition for term 1"
```

### 4. Technical Specifications
Can include both code and text sections:
```yaml
- title: "Technical Specifications"
  type: "technical"
  tech_content:
    - section_title: "Section A"
      type: "code"
      language: "js"
      code_content: |
        // Your code here
    - section_title: "Section B"
      type: "text"
      text_content: "Your technical description here"
```

### 5. Diagrams
```yaml
- title: "Diagram"
  type: "diagram"
  description: "description"
  diagram_url: "diagram.png"  # Reference to diagram image file
```

## PDF Generation

- To generate a PDF from the `.typ` file, You can do the following:
    - Open in the [Typst](typst.app) website
        - Create a New Project
        - Open the Explorer
        - Click the three dots
        - Select Upload File
        - Choose Pick a Folder
    - In your terminal
        - Make sure that `typst` is installed in your system
        - Run the command `typst c <input_file> <output_file>`

## Important Notes

1. Maintain the exact structure shown in the examples
2. Don't add new fields or change field names
3. Image files (charts, diagrams) should be in the same directory
4. All dates should be in a consistent format
5. Status should always be "Complete"
6. Use "N / A" for solutions when no specific solution is needed
7. If there are no appendix entries just leave it as blank but keep the `appendix:` key
