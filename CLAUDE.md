# .github — organizasyon deposu

## Amaç
Cholpans organizasyonunun ortak kalıpları: profil README, varsayılan topluluk dosyaları, yeniden kullanılabilir
GitHub Actions iş akışları ve **paylaşılan Claude Code kuralları/ajanları/becerileri** (`claude/`).
İş mantığı, uygulama kodu, sır yoktur.

## Yapı
```
profile/README.md                 org sayfası
.github/workflows/reusable-*.yml  workflow_call ile çağrılan CI parçaları (node, python, go, container, terraform)
.github/workflows/claude-review.yml  isteğe bağlı PR incelemesi (anthropics/claude-code-action)
CODEOWNERS, SECURITY.md, PULL_REQUEST_TEMPLATE.md, ISSUE_TEMPLATE/
claude/rules/shared/              kaynak; depolara .claude/rules/shared-<ad>.md olarak kopyalanır
claude/agents/shared/             kaynak; depolara .claude/agents/<ad>.md olarak kopyalanır
claude/skills/shared/             kaynak; depolara .claude/skills/<ad>/ olarak kopyalanır
renovate.json                     org Renovate ön ayarı
```

## Kurallar
- `claude/*/shared` içindeki bir dosyayı değiştirdiysen `scripts/sync-claude-shared.sh` çalıştır ve etkilenen depolarda PR aç.
- Yeniden kullanılabilir iş akışlarında `secrets: inherit` kullanma; gereken sırrı açıkça geçir.
- Bu depo public'tir: gerçek hostname, IP, iç URL yazma.

## Komutlar
- `actionlint .github/workflows/*.yml` — iş akışı lint
- `../scripts/sync-claude-shared.sh --check` — drift kontrolü
