# Git ve PR akışı

- Trunk-based: `main` korumalı; kısa ömürlü dallar `feat/<konu>`, `fix/<konu>`, `chore/<konu>`, `docs/<konu>`; ömür ≤ 3 gün.
- Commit: Conventional Commits, İngilizce, emir kipi: `feat(fetcher): add sitemap discovery`, `fix(api): reject empty tenant id`.
  Kapsam = servis/paket adı. Gövdede "neden", "ne" değil. Claude'un yardımı için `Co-Authored-By: Claude <noreply@anthropic.com>` satırı serbesttir.
- PR: ≤ 400 satır net değişiklik hedefi; şablon doldurulur (amaç, değişiklik, test, risk, uyum etkisi, geri alma).
  Bir PR bir amaç; refactor + davranış değişikliği ayrılır.
- Zorunlu kontroller: lint, birim test, sözleşme testi (varsa), `compliance-auditor` özeti PR açıklamasında.
- Kırıcı değişiklik yalnızca `contracts`'ta ve yeni major ile; tüketici depolarda Renovate PR'ı ile yükseltilir.
- Asla: `main`'e doğrudan push, `--force` push, `git reset --hard` (paylaşılan dalda), büyük ikili dosya (DVC/LakeFS kullan).
- Sürüm: semver; `ui`, `contracts`, `sdk-*` paketlerde `CHANGELOG.md` (Keep a Changelog), otomatik sürüm notu `/release-notes`.
- Yerel çalışma: paralel görev için `git worktree`; her worktree ayrı Claude oturumu.
