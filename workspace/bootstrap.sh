#!/usr/bin/env bash
# Kullanım: mkdir cholpans && cd cholpans && gh repo clone cholpans/.github && bash .github/workspace/bootstrap.sh
set -euo pipefail
ROOT="$(pwd)"
REPOS=(contracts api web ui infra datasets desktop mobile docs sdk-js sdk-python)
for r in "${REPOS[@]}"; do
  [ -d "$r/.git" ] || gh repo clone "cholpans/$r" "$r"
done
cp "$ROOT/.github/workspace/CLAUDE.md" "$ROOT/CLAUDE.md"
cp "$ROOT/.github/workspace/cholpans.code-workspace" "$ROOT/cholpans.code-workspace"
mkdir -p "$ROOT/scripts"
cp "$ROOT/.github/workspace/scripts/"*.sh "$ROOT/scripts/"
chmod +x "$ROOT/scripts/"*.sh
"$ROOT/scripts/sync-claude-shared.sh" --check || echo "uyarı: paylaşılan Claude katmanı güncel değil; ./scripts/sync-claude-shared.sh çalıştırın"
echo "hazır: code $ROOT/cholpans.code-workspace"