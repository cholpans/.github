---
name: compliance-check
description: Mevcut değişiklik seti veya verilen tasarım için compliance-auditor ajanını çalıştırır ve sonucu PR'a hazır özet hâline getirir. "uyum kontrolü", "bu yasak mı", "KVKK açısından bak" dendiğinde kullan.
---

1. Kapsamı belirle: staged fark (`git diff --staged`), dal farkı (`git diff main...HEAD`) veya `$ARGUMENTS` ile verilen dosyalar/metin.
2. `compliance-auditor` ajanını bu kapsamla çağır; çıktısını aynen al.
3. BLOKE varsa: kullanıcıya alternatifi öner, kod önerme. KOŞULLU: eksik teknik güvenceyi (şema alanı, 403, allowlist, test) somut dosya önerisiyle listele.
4. Sonucu `## Uyum kontrolü` başlığıyla 5 satırı geçmeyen PR özeti olarak ver.
