#!/usr/bin/env bash
# PostToolUse hook: düzenlenen dosyayı uzantısına göre biçimlendirir.
# Girdi: stdin'de JSON ({"tool_input": {"file_path": "..."}}). Hata durumunda sessizce çıkar (0).
set -euo pipefail
command -v jq >/dev/null 2>&1 || exit 0
file=$(jq -r '.tool_input.file_path // empty' 2>/dev/null || true)
[ -z "${file:-}" ] && exit 0
[ -f "$file" ] || exit 0
case "$file" in
  *.py)  command -v ruff >/dev/null && ruff format -q "$file" && ruff check -q --fix "$file" || true ;;
  *.go)  command -v gofmt >/dev/null && gofmt -w "$file" || true
         command -v goimports >/dev/null && goimports -w "$file" || true ;;
  *.ts|*.tsx|*.js|*.mjs|*.vue|*.json|*.md|*.yml|*.yaml|*.css|*.scss)
         if [ -f node_modules/.bin/prettier ]; then node_modules/.bin/prettier --log-level silent --write "$file" || true; fi ;;
  *.tf)  command -v terraform >/dev/null && terraform fmt -write=true "$file" >/dev/null || true ;;
  *.proto) command -v buf >/dev/null && buf format -w "$file" || true ;;
esac
exit 0
