# family-hub

## Purpose

This repo is a running database of errands and small projects Mark does for
family members — his aunt (tita), his mom (mama), and any relative who comes
after them — plus small household routines that serve the whole house rather
than one person. Each person gets one folder; a shared household routine gets a
`house/` folder; and each errand or favor gets one subfolder inside its parent.
The point is reuse: when a new errand for the same person (or a similar one for
someone else) comes in, the right move is to open the closest existing errand
folder and copy its structure and styling, not to start from a blank page. The
repo is public and served through GitHub Pages, so finished HTML work (like slide
decks) is also a live link Mark can hand a family member or helper directly, with
nothing to install on their end.

## Features

- **One folder per family member, one subfolder per errand** — `aunt/`, `mom/`,
  and any future person, each holding that person's own list of favors done for
  them. A small routine that serves the whole house lives under `house/` instead
  of under one person.
- **A daily checklist page for the household** — `house/cat-chicken-care/` is a
  self-contained `index.html` (no build step) organizing the cat and chicken
  feeding by time of day. Its checkboxes persist in the browser's local storage
  and reset each morning, so the helper can tick tasks off day by day.
- **Personal errands live in the private twin.** The aunt's EdD decks (they
  named her and her university), their source material and the Design Hearing
  errand moved to `markkennethbadilla/private-family-hub` on 2026-11-19, and
  this repo's history was rewritten to drop them.
- **A README index that always reflects what's in the repo** — every errand gets
  a one-line entry under its person's heading, so Mark can scan the README
  instead of the folder tree to remember what has already been built for whom.

## Locked decisions

- **Two repos: this public one for Pages, private-family-hub for anything
  with personal data.** Pages on a private repo needs a paid plan.
- **One top-level folder per person, one subfolder per errand inside it.** This
  is the whole filing system — no database, no tags, just the folder tree plus
  the README index that mirrors it. Chosen because the volume of family errands
  is small enough that a folder tree is both sufficient and instantly readable
  by a layman.
- **The repo is public, specifically so GitHub Pages can serve the HTML decks as
  live links.** Rejected alternative: a private repo, which would block Pages
  from serving and would force Mark to export and send files manually every
  time.
- **The README.md is the index and must be kept current by hand.** There is no
  generator for it — whoever adds an errand adds its line to the README in the
  same commit. Chosen because the errand volume is low enough that automation
  would cost more to build than it saves.
- **`slide-script` is a separate project and is never folded in here**, even
  though it is also presentation-related. It has its own repo and its own custom
  domain (slidescript.elunari.uk) because it is a general-purpose tool, not a
  favor done for a specific family member.

## Non-goals

- **This repo does not build a family errand tracking app.** No database, no
  login, no backend — building one would cost more than the errand volume
  justifies. The cat-and-chicken checklist is deliberately a single static
  `index.html` whose checkboxes live in the visitor's own browser, not a shared
  tracked app, so it stays inside this boundary.
- **It does not absorb tools or repos that merely touch presentations.**
  `slide-script` stays separate even though its subject matter overlaps with the
  slide decks in private-family-hub.
- **It does not keep errands private.** The repo is deliberately public so
  Pages links work; anything that must stay private does not belong in this
  repo at all.
- **It holds no private or sensitive content.** Because the repo is public and
  served on Pages, nothing with sensitive or personal detail goes in any folder
  — not in a routine page, not in a source-material file. A routine that could
  leak personal detail is summarized, never copied in full.

## Invariants

- Every person with an errand in this repo has exactly one top-level folder
  named after them, and every errand of theirs lives in one subfolder under it.
  A household-wide routine lives in the single `house/` top-level folder.
- The README.md index lists every errand folder that exists in the repo, and
  lists no folder that does not exist.
- The repo stays public, because GitHub Pages links depend on it.
- No file names a family member, their school or their documents; such work
  goes to private-family-hub.
- No family errand lives outside this repo or private-family-hub.

## Security scan

The Trunk pre-push gate runs Opengrep with the pinned JavaScript and
TypeScript security rules (mkb-winops spec 060). It scans only files changed
since origin/main and blocks a push on a new ERROR or WARNING finding. Fix the
finding, or when it is a false positive put `// nosemgrep: <rule-id>` on the
line above it, using the short rule id the scan prints. There is no global
skip.
