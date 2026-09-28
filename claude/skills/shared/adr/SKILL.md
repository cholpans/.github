---
name: adr
description: Yeni bir mimari karar kaydı (ADR) oluşturur veya mevcut ADR'yi günceller. "ADR yaz", "kararı kaydet", "neden X seçtik belgele" dendiğinde ya da geri alması zor bir teknoloji/veri/uyum kararı alındığında kullan.
---

# ADR yazma

1. Numara: `docs/planning/adr/` (docs deposu; bu depodan `../docs/planning/adr/`) içindeki en büyük numara + 1. 001–023 Teknik Tasarım'dadır; bulamazsan 024'ten başla.
   Depoya özgü küçük karar ise `docs/decisions/<REPO>-NNN.md` (bu depoda).
2. Dosya adı: `ADR-0NN-<kebab-slug>.md`.
3. Şablon (Türkçe, kısa cümleler):

```markdown
# ADR-0NN: <Karar başlığı>

- Durum: Önerildi | Kabul | Reddedildi | Yerine geçti: ADR-0MM
- Tarih: YYYY-AA-GG
- Karar sahipleri: <rol/kişi>
- Etkilenen depolar: api, web, …

## Bağlam
Sorun nedir, hangi kısıtlar var (ölçek kademesi K1/K2/K3, hukuki sınır, maliyet, ekip).

## Karar
Tek paragraf: ne seçildi, hangi koşulla.

## Değerlendirilen seçenekler
| Seçenek | Artı | Eksi | Neden değil |
| --- | --- | --- | --- |

## Sonuçlar
Olumlu, olumsuz, geri dönüş yolu, ölçüm (hangi metrik kararı doğrular), yeniden değerlendirme tarihi.

## Uyum etkisi
Yasak yetenekler listesiyle temas var mı; DPIA gerekli mi.
```
4. `docs/planning/decisions-log.md`'ye bir satır ekle: `YYYY-AA-GG · ADR-0NN · <başlık> · <depolar>`.
5. Karar bir kuralı değiştiriyorsa ilgili `.claude/rules/*.md` dosyasını da aynı PR'da güncelle.
