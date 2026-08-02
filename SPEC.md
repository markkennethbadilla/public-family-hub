# family-hub

## Purpose

This repo is a running database of errands and small projects Mark does for
family members — his aunt (tita), his mom (mama), and any relative who comes
after them. Each person gets one folder; each errand or favor they ask for gets
one subfolder inside it. The point is reuse: when a new errand for the same
person (or a similar one for someone else) comes in, the right move is to open
the closest existing errand folder and copy its structure and styling, not to
start from a blank page. The repo is public and served through GitHub Pages, so
finished HTML work (like slide decks) is also a live link Mark can hand a family
member directly, with nothing to install on their end.

## Features

- **One folder per family member, one subfolder per errand** — `aunt/`, `mom/`,
  and any future person, each holding that person's own list of favors done for
  them.
- **HTML slide decks for coursework**, built and viewable straight from the repo
  or from the live GitHub Pages link — currently four lesson decks for the
  aunt's EdD coursework, sharing one `slides.css` / `slides.js` so a new lesson
  reuses the same look without rebuilding it.
- **Editable PowerPoint export alongside the HTML** — each slide deck also ships
  a `.pptx` version (with its source assets and command manifests) so the deck
  can be handed over as an editable Office file, not just viewed as a webpage.
- **Source material kept next to the output it produced** — the original Word
  docs, Excel sheets, images and per-image metadata that a slide deck was built
  from live in that person's own `source-material/` folder, so the reasoning
  behind a slide is still there if it ever needs to be redone.
- **A README index that always reflects what's in the repo** — every errand gets
  a one-line entry under its person's heading, so Mark can scan the README
  instead of the folder tree to remember what has already been built for whom.

## Locked decisions

- **One repo for every family errand, never a new repo per task.** Chosen so
  each errand becomes a reusable base for the next one instead of a scattered,
  forgotten one-off. A new aunt slide deck reuses `aunt/edd-reports/slides.css`
  and `slides.js` rather than reinventing styling from nothing.
- **One top-level folder per person, one subfolder per errand inside it.** This
  is the whole filing system — no database, no tags, just the folder tree plus
  the README index that mirrors it. Chosen because the volume of family errands
  is small enough that a folder tree is both sufficient and instantly readable
  by a layman.
- **The repo is public, specifically so GitHub Pages can serve the HTML decks as
  live links.** Rejected alternative: a private repo, which would block Pages
  from serving and would force Mark to export and send files manually every
  time.
- **Slide decks are authored as HTML first, then converted to editable `.pptx`.**
  This matches the standing rule for presentation work: HTML gives full design
  control and a live shareable link; the `.pptx` conversion exists only so the
  recipient can edit it in PowerPoint if they need to.
- **Source material lives in the repo, next to the errand it feeds.** Chosen so
  the inputs to a deliverable (the docx/xlsx/images a slide was built from) stay
  traceable to that deliverable, instead of sitting in a Downloads folder
  disconnected from the output.
- **The README.md is the index and must be kept current by hand.** There is no
  generator for it — whoever adds an errand adds its line to the README in the
  same commit. Chosen because the errand volume is low enough that automation
  would cost more to build than it saves.
- **The Rosemarie dissertation errand is tracked here but its files are not.**
  The dissertation documents used to live in their own standalone `dissertation`
  repo; that repo was removed and the errand was folded into family-hub for
  tracking, but the actual document files live locally in a gitignored
  `dissertation-rosemarie/` folder next to this repo, not inside version
  control. Chosen because dissertation drafts are large, frequently-changing,
  and not something that needs a public commit history — this repo just needs
  to record that the errand exists and where its files sit.
- **`slide-script` is a separate project and is never folded in here**, even
  though it is also presentation-related. It has its own repo and its own custom
  domain (slidescript.elunari.uk) because it is a general-purpose tool, not a
  favor done for a specific family member.

## Non-goals

- **This repo does not build a family errand tracking app.** No database, no
  login, no UI beyond the plain README index and the folder tree — building one
  would cost more than the errand volume justifies.
- **It does not host the Rosemarie dissertation's actual files.** Only the fact
  of the errand and where the files sit locally. The files themselves are
  gitignored on purpose (see Locked decisions).
- **It does not absorb tools or repos that merely touch presentations.**
  `slide-script` stays separate even though its subject matter overlaps with the
  `edd-reports` slide decks here.
- **It does not keep errands private.** The repo is deliberately public so
  Pages links work; anything that must stay private does not belong in this
  repo at all.

## Invariants

- Every person with an errand in this repo has exactly one top-level folder
  named after them, and every errand of theirs lives in one subfolder under it.
- The README.md index lists every errand folder that exists in the repo, and
  lists no folder that does not exist.
- The repo stays public, because GitHub Pages links depend on it.
- `dissertation-rosemarie/` stays gitignored and is never committed.
- No family errand is scattered into a repo outside `family-hub`.
