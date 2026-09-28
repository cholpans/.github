---
name: plan-context
description: Planlama raporlarından (docs/planning) yalnızca ilgili bölümü bulup okur — mimari, teknoloji seçimi, kapasite, RTÜK şartname maddesi, yasak yetenekler, ADR. Tasarım sorusu, "planda ne yazıyor", "neden böyle" veya kapsam/kapasite belirsizliğinde kullan; raporları bütünüyle okuma.
argument-hint: <konu veya anahtar kelime>
---

# Planlama bağlamını çekme

Rapor yolu sırası: `docs/planning/` (docs deposundaysan), `../docs/planning/` (kardeş depo), `$CHOLPANS_ROOT/docs/planning/`.
Dosyalar:
- `decisions-log.md` — önce buraya bak (en güncel kararlar).
- `02-teknik-tasarim-ve-gelistirme-plani.md` — mimari, teknoloji, veri modeli, uyum, RTÜK, kapsam dışı, ADR-001…023.
- `03-tam-kapsamli-platform-teknik-gereksinimler.md` — özellik envanteri, süreç, ekip, 30 aylık yol haritası.
- `01-sektor-raporu.md` — rakip ve pazar; yalnızca ürün sorularında.
- `prohibited-capabilities.md` — 15 yasak yetenek.

Adımlar:
1. `grep -n "^## \|^### " <dosya>` ile başlıkları listele; `$ARGUMENTS` ile eşleşen 1–3 başlığı seç (Türkçe eş anlamlıları dene: "arama/indeks", "uyarı/kural/percolator", "istemci/web/masaüstü/mobil", "lisans/telif", "kapasite/K1/K2").
2. Yalnızca o başlık aralığını oku (`sed -n 'A,Bp'`), en fazla ~300 satır.
3. Cevabında: alıntıladığın bölüm adı + dosya, kararın özeti, varsa ADR numarası ve karar günlüğündeki daha yeni bir satırla çelişip çelişmediği.
4. Raporda cevap yoksa "planda yok" de; uydurma.
