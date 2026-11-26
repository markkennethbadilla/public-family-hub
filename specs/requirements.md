# public-family-hub requirements

OpenFastTrace register (coverage register T24, mkb-agentops spec 145 "Item format"): one item per MUST, never and always line, invariant and known limit of `SPEC.md`, with the check that holds it. Traced on every push by Trunk action `trace-on-push`. HARD: a check refuses the miss. WATCHED: an outside monitor reports a miss. PARTIAL: the `Rationale:` names what is not held. SOFT: history.

### spec:inv.1
`req~spec_inv.1~1`

> Every person with an errand in this repo has exactly one top-level folder named after them, and every errand of theirs lives in one subfolder under it.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#has no README index line
enforcer: repo:.trunk/trunk.yaml#bash scripts/repo-checks.sh

Tags: HARD, beforeHARD

Needs: impl

### spec:inv.2
`req~spec_inv.2~1`

> The README.md index lists every errand folder that exists in the repo, and lists no folder that does not exist.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#has no README index line
enforcer: repo:scripts/repo-checks.sh#which does not exist

Tags: HARD, beforeHARD

Needs: impl

### spec:locked.1
`req~spec_locked.1~1`

> whoever adds an errand adds its line to the README in the same commit.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#has no README index line

Tags: HARD, beforeHARD

Needs: impl

### spec:inv.3
`req~spec_inv.3~1`

> The repo stays public, because GitHub Pages links depend on it.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#must be PUBLIC

Tags: HARD, beforeHARD

Needs: impl

### spec:inv.4
`req~spec_inv.4~1`

> No file names a family member, their school or their documents; such work goes to private-family-hub.

Rationale:
No script can tell personal data from other text, and a list of the names to refuse would itself publish them. Judged by the agent writing each page (skill family-errands-in-family-hub); the 2026-11-19 move took every known item out.

Comment:
source: SPEC.md

Tags: PARTIAL, beforePARTIAL

### spec:nongoal.1
`req~spec_nongoal.1~1`

> nothing with sensitive or personal detail goes in any folder

Rationale:
Same limit as spec:inv.4: judged by reading, not by a script.

Comment:
source: SPEC.md

Tags: PARTIAL, beforePARTIAL

### spec:inv.5
`req~spec_inv.5~1`

> No family errand lives outside this repo or private-family-hub.

Rationale:
An errand made elsewhere (a Documents folder, another repo) is not visible to this repo's gate; the skill family-errands-in-family-hub routes every errand here or to the private twin.

Comment:
source: SPEC.md

Tags: PARTIAL, beforePARTIAL

### spec:nongoal.2
`req~spec_nongoal.2~1`

> No database, no login, no backend

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#package.json present

Tags: HARD, beforeHARD

Needs: impl

### spec:locked.2
`req~spec_locked.2~1`

> **`slide-script` is a separate project and is never folded in here**

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#slide-script is a separate repo

Tags: HARD, beforeHARD

Needs: impl

### spec:feat.1
`req~spec_feat.1~1`

> Its checkboxes persist in the browser's local storage and reset each morning, so the helper can tick tasks off day by day.

Rationale:
Known limit: no test runs the page script (the repo has no package.json or test runner by design, spec:nongoal.2); the reset compares a stored date stamp with today in `house/cat-chicken-care/index.html`.

Comment:
source: SPEC.md
enforcer: repo:house/cat-chicken-care/index.html#localStorage.getItem\(KEY \+ "stamp"\)

Tags: PARTIAL, beforePARTIAL

### spec:scan.1
`req~spec_scan.1~1`

> The Trunk pre-push gate runs Opengrep with the pinned JavaScript and TypeScript security rules (mkb-winops spec 060).

Comment:
source: SPEC.md
enforcer: repo:.trunk/trunk.yaml#enabled: \[block-push-on-opengrep

Tags: HARD, beforeHARD

Needs: impl

### spec:pages.1
`req~spec_pages.1~1`

> Actions is off on this repo (rule 76), so a push does not rebuild Pages.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#Actions is enabled, must be off

Tags: HARD, beforeHARD

Needs: impl

### spec:pages.2
`req~spec_pages.2~1`

> No workflow files live in the repo.

Comment:
source: SPEC.md
enforcer: repo:scripts/repo-checks.sh#workflow files present
enforcer: owner:mkb-agentops/.rulesync/hooks/ban-github-actions.mjs

Tags: HARD, beforeHARD

Needs: impl

### spec:recover.1
`req~spec_recover.1~1`

> **Health address:** `https://markkennethbadilla.github.io/public-family-hub/` answers 200 (static files, no server of ours).

Comment:
source: SPEC.md
enforcer: ext:Uptime Kuma monitor `public-family-hub (GitHub Pages)` at uptime.elunari.uk, HTTP 200 every 300 s (personal-infra spec 003)

Tags: WATCHED, beforeWATCHED

Needs: impl

### spec:recover.2
`req~spec_recover.2~1`

> `gh api repos/markkennethbadilla/public-family-hub/pages/builds/latest --jq .commit` must name the reverted commit.

Rationale:
A step of the rollback, read back by whoever runs it; no gate runs a rollback.

Comment:
source: SPEC.md

Tags: PARTIAL, beforePARTIAL

### spec:history.1
`req~spec_history.1~1`

> moved to `markkennethbadilla/private-family-hub` on 2026-11-19, and this repo's history was rewritten to drop them.

Rationale:
History: a past move, nothing left to enforce.

Comment:
source: SPEC.md

Tags: SOFT, beforeSOFT
