# Dokümantasyon ve ADR

- Mimari kararlar `docs` deposunda `planning/adr/ADR-0NN-<slug>.md` (MADR-lite: bağlam, karar, seçenekler, sonuçlar, durum).
  Numara 024'ten devam eder (001–023 Teknik Tasarım'da). Depoya özgü küçük kararlar: o depoda `docs/decisions/<REPO>-NNN.md`.
- Her depo README'si: amaç, kurulum, komutlar, dizin yapısı, bağımlılık paketleri. CLAUDE.md README'nin kopyası değildir; CLAUDE.md "nasıl çalışılır", README "ne".
- API değişikliği → `contracts` CHANGELOG + üretilen referans; elle API dokümanı yazma.
- Yorumlar "neden" anlatır; açık kodu tekrar etmez. TODO'lar issue numarası taşır: `TODO(#123)`.
- Türkçe metinde teknik terimler İngilizce bırakılabilir; ürün adları ve depo adları aynen.
- Karar günlüğü `docs/planning/decisions-log.md`: tarih · karar · dayanak · etkilenen depolar; sohbette alınan her karar buraya bir satır.
