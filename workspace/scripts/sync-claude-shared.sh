#!/usr/bin/env bash
# Paylaşılan Claude Code katmanını .github/claude/ kaynağından her depoya kopyalar.
#   rules/shared/<ad>.md   → <repo>/.claude/rules/shared-<ad>.md
#   agents/shared/<ad>.md  → <repo>/.claude/agents/<ad>.md
#   skills/shared/<ad>/    → <repo>/.claude/skills/<ad>/
# Kullanım: ./scripts/sync-claude-shared.sh [--check]   (--check: fark varsa 1 döner, CI için)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/.github/claude"
REPOS=(.github contracts api web ui infra datasets desktop mobile docs sdk-js sdk-python)
mode="${1:-}"
rc=0

copy_or_check() { # src dst
  if [ "$mode" = "--check" ]; then
    if ! diff -rq "$1" "$2" >/dev/null 2>&1; then echo "drift: ${2#$ROOT/}"; rc=1; fi
  else
    if [ -d "$1" ]; then rm -rf "$2"; mkdir -p "$2"; cp -r "$1/." "$2/"; else mkdir -p "$(dirname "$2")"; cp "$1" "$2"; fi
  fi
}

for r in "${REPOS[@]}"; do
  [ -d "$ROOT/$r" ] || continue
  for f in "$SRC"/rules/shared/*.md;  do copy_or_check "$f" "$ROOT/$r/.claude/rules/shared-$(basename "$f")"; done
  for f in "$SRC"/agents/shared/*.md; do copy_or_check "$f" "$ROOT/$r/.claude/agents/$(basename "$f")"; done
  for d in "$SRC"/skills/shared/*/;   do copy_or_check "${d%/}" "$ROOT/$r/.claude/skills/$(basename "$d")"; done
done
[ "$mode" = "--check" ] && exit $rc
echo "sync done"
