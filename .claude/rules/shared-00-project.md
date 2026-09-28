# Proje kimliği ve öncelik sırası

- Ürün: Cholpans, çok dilli haber + sosyal medya izleme ve medya istihbaratı platformu. API-first, çok kiracılı SaaS;
  kamu kurumu için T3 (ayrı küme / kurum yerinde) kurulum modu.
- Karar önceliği: `docs/planning/decisions-log.md` > Teknik Tasarım (02) > Tam Kapsamlı Gereksinimler (03) > Sektör Raporu (01).
  Rapor 03'teki Next.js / React Native ifadeleri geçersizdir (ADR-020–022: Vue/Nuxt, Electron, Capacitor).
- Bir kararı bulamazsan uydurma: "karar yok" de, seçenekleri ve önerini yaz, `/adr` ile kayıt öner.
- Dil: kod, tanımlayıcı, yorum, commit ve PR başlığı İngilizce; kullanıcıya dönük metin i18n anahtarı; ADR ve tasarım notları Türkçe.
- Zaman ve ölçek varsayımları: K1 (100 k belge/gün), K2 (1 M/gün), K3 (10 M/gün) — kapasite tartışmalarında kademeyi belirt.
- Faz disiplini: Faz 1 = API + Web. `desktop`, `mobile`, `sdk-*` için kod yazma; istenirse önce karar günlüğüne bak.
