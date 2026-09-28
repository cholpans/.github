---
name: pr
description: PR'ı açmaya hazırlar — lint/test çalıştırır, compliance-auditor ve security-reviewer özetlerini toplar, Conventional Commit başlığı ve şablona uygun PR açıklaması yazar, istenirse gh ile açar. "PR hazırla", "PR aç", "gönderime hazırla" dendiğinde kullan.
disable-model-invocation: true
---

# PR hazırlığı

1. Dal ve fark: `git status`, `git log main..HEAD --oneline`, `git diff main...HEAD --stat`. `main`'deysen dur ve dal aç.
2. Kalite kapıları (CLAUDE.md "Komutlar"): lint → tip kontrolü → birim testler. Kırmızı varsa önce `test-runner` ajanı.
3. İncelemeler: `compliance-auditor` ve `security-reviewer` ajanlarını değişiklik üzerinde çalıştır; BLOKE/KRİTİK varsa PR açma.
4. Boyut: net değişiklik > 400 satırsa bölme öner.
5. Başlık: `type(scope): summary` (İngilizce, ≤ 72 karakter).
6. Açıklama (şablon `.github/PULL_REQUEST_TEMPLATE.md`):
   - Amaç ve bağlam (issue/ADR bağlantısı)
   - Değişiklikler (madde madde, dosya grupları)
   - Test (ne çalıştırıldı, ne eklendi)
   - Uyum ve güvenlik özeti (ajan çıktılarından 2–3 cümle)
   - Risk ve geri alma
   - Sözleşme etkisi (contracts sürümü / kırıcı mı)
7. İstenirse: `gh pr create --title "<başlık>" --body-file /tmp/pr-body.md --draft` (taslak varsayılan).
