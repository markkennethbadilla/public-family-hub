# family-hub

A running database of family projects and errands. Each person gets a folder;
each project/errand gets a subfolder. Reuse past work as a base for new ones.

## Index

### Aunt
- **`aunt/edd-reports/`** — EdD coursework rendered as HTML slide presentations
  (4 lessons + shared `slides.css` / `slides.js`). Lessons:
  - `lesson1-learning-resources` — Learning Resources Management
  - `lesson2-strategic-planning` — Strategic Planning & Management Reporting
  - `lesson3-project-evaluation` — Project Development & Evaluation
  - `lesson4-educational-leadership` — Educational Leadership & Ethics
- **`aunt/source-material/`** — raw inputs the slides were built from
  (Word docs, Excel sheet, images + metadata).
- **`aunt/edd-emd-design-hearing/`** -- her Design Hearing docx (saved from
  Messenger 2026-10-18); errand: print the 8-page questionnaire x50 back to back
  + 1 transmittal letter. See `ERRAND.md`.

### Mom
- *(nothing yet — ready for her projects)*

### House
- **`house/cat-chicken-care/`** — a daily checklist for feeding the cats and
  chickens, organized by time of day (morning / noon / afternoon / night).
  Self-contained `index.html` served by GitHub Pages; checkboxes persist in the
  browser and reset each morning, so the helper can tick tasks off every day.

## Adding a new errand
1. Create `<person>/<short-slug>/` (e.g. `mom/permit-renewal/`).
2. Drop source material + any built output inside it.
3. Add a one-line entry under that person above.
