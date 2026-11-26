#!/usr/bin/env bash
# Prior-art: gh api reads visibility and Actions state; no maintained tool checks a README folder index (SPEC "Invariants").
set -u
fail=0
bad() { echo "FAIL $*" >&2; fail=1; }
vis=$(timeout 20 gh repo view markkennethbadilla/public-family-hub --json visibility -q .visibility) || { echo "FAIL could not read repo visibility" >&2; exit 1; }
[ "$vis" = PUBLIC ] || bad "repo visibility is $vis, must be PUBLIC (Pages links depend on it)"
act=$(timeout 20 gh api repos/markkennethbadilla/public-family-hub/actions/permissions -q .enabled) || { echo "FAIL could not read Actions state" >&2; exit 1; }
[ "$act" = false ] || bad "Actions is enabled, must be off between Pages rebuilds (rule 76)"
[ -e .github/workflows ] && bad "workflow files present in .github/workflows"
[ -e package.json ] && bad "package.json present: no build, backend or app in this repo"
[ -e slide-script ] && bad "slide-script is a separate repo, never folded in here"
for d in */*/; do
  d=${d%/}
  case $d in specs/* | scripts/* | test-runs/*) continue ;; esac
  grep -qF "\`$d/\`" README.md || bad "errand folder $d has no README index line"
done
for d in $(grep -oE '`[a-z0-9-]+/[a-z0-9-]+/`' README.md | tr -d '`'); do
  [ -d "$d" ] || bad "README indexes $d, which does not exist"
done
[ $fail = 0 ] && echo "OK public, Actions off, no workflows or package.json, README index matches the tree"
exit $fail
