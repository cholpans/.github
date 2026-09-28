#!/usr/bin/env bash
# PreToolUse hook (Bash): tehlikeli komutları engeller. Çıkış 2 = engelle ve Claude'a mesaj ver.
set -uo pipefail
command -v jq >/dev/null 2>&1 || exit 0
cmd=$(jq -r '.tool_input.command // empty' 2>/dev/null || true)
[ -z "${cmd:-}" ] && exit 0
deny_patterns=(
  'git push --force' 'git push -f ' 'git push --force-with-lease'
  'rm -rf /' 'rm -rf ~' 'rm -rf \*'
  'kubectl delete' 'kubectl apply -f https://'
  'terraform apply' 'terraform destroy'
  'DROP TABLE' 'DROP DATABASE' 'TRUNCATE '
  'chmod -R 777' 'curl .* \| *sh' 'wget .* \| *sh'
)
for p in "${deny_patterns[@]}"; do
  if echo "$cmd" | grep -Eiq -- "$p"; then
    echo "guard-bash: '$p' kalıbı engellendi. Bu işlem insan onayı ve ayrı bir süreç gerektirir (bkz. .claude/rules/security.md)." >&2
    exit 2
  fi
done
exit 0
