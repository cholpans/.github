# Uyum sınırları — yasak yetenekler (bağlayıcı)

Kaynak: Teknik Tasarım, "Kapsam dışı bırakılanlar" bölümü ve `docs/planning/prohibited-capabilities.md`.
Bu maddeler ürün kararı değil, hukuki sınırdır (KVKK m.6/11, TCK m.135–136, GDPR m.9/22, AB YZ Yasası m.5,
FSEK/DSM, 5651, Basın Kanunu m.21, X ve Meta platform koşulları). Bir istek bunlardan birine değiyorsa:
**uygulama, iskelet kurma, özellik bayrağı bırakma, "ileride" notu yazma.** Reddet, gerekçeyi bir cümleyle yaz,
izinli alternatifi öner ve `compliance-auditor` ajanına yönlendir.

## Asla yapılmayacaklar
1. Kişi/hesap düzeyinde özel nitelikli veri çıkarımı veya etiketi: din, mezhep, etnik köken/ırk, siyasi görüş,
   felsefi inanç, sendika/dernek üyeliği, sağlık, cinsel hayat/yönelim, ceza mahkûmiyeti, kılık-kıyafet.
   → Şemada bu alanlar yoktur; model etiket kümeleri allowlist taksonomiyle sınırlıdır.
2. Yüz tanıma, yüz gömmesi saklama, ses parmak iziyle kişi tanıma (ADR-013). → Görsel hash/CLIP benzerliği, logo tespiti.
3. Otomatik "yalan bilgi / dezenformasyon / sahte hesap / trol" nihai etiketi (ADR-014). → Olasılık skoru + analist onayı + kanıt zinciri.
4. Özel kişilerin dosyalanması, izleme listesine alınması, konumunun çıkarımı. → `subject_type=private_person` için yalnızca toplulaştırılmış görünüm; izleme listesi API'si 403.
5. Platformlar arası kimlik çözümleme (hesabı kişi/hane/cihaz/e-posta/telefonla eşleme). → Yalnızca platform içi resmî kimlik; tokenizasyon kasası.
6. Kapalı/özel kanallar: DM, WhatsApp/Telegram grupları, kapalı gruplar, kişisel profiller. → Yalnızca resmî API ve halka açık kaynaklar (`access_class` = public_api | public_web).
7. Giriş/ödeme duvarı arkası kazıma, CAPTCHA/anti-bot aşma, robots/TDMRep yok sayma, gizlenmiş User-Agent, kimlik bilgisiyle tarama.
8. Lisanssız kaynakta tam metin gösterimi, e-gazete kopyası, arşiv okuyucu. → `license_status` alan düzeyi yetki; özet + snippet + bağlantı.
9. Dark web / tehdit istihbaratı beslemeleri, sızıntı dökümleri. → Egress'te .onion engelli.
10. Gazeteci iletişim verisi (e-posta/telefon) toplama, bülten gönderimi. → Yalnızca byline meta verisi.
11. Reklam harcaması/ücretli medya analitiği. → Yayın hattında yalnızca `is_ad` bayrağı.
12. Sosyal skorlama, bireysel risk/tehdit skoru, gözetim amaçlı kullanım (protesto/aktivist/gazeteci/muhalif takibi, kolluk/istihbarat amaçlı sosyal veri işleme).
13. İnsan onayı olmadan otomatik idari/hukuki karar (yaptırım önerisi, kaldırma bildirimi, kişi hakkında rapor). → Temporal iş akışında atlanamaz onay adımı.
14. Kiracı verisiyle veya lisanssız tam metinle model eğitimi; kiracılar arası ham veri havuzu. → Eğitim kataloğunda lisans etiketi zorunlu.
15. Reşit olmayanlar: yaş çıkarımı, çocuk hesaplarının analizi, suç haberlerinde çocuk kimliği. → PII maskesi, kaynak kaydında dışarıda.

## İzinli olan ve sık karıştırılan
- Haber **konusunun** "din ve inanç" / "siyaset" olarak sınıflandırılması (IPTC) — izinli; yazarın inancının etiketlenmesi — yasak.
- Konu/olay/marka düzeyinde metin duygu analizi — izinli; bireyin duygusal durum takibi — yasak.
- Kamusal rol taşıyan kişi/kurumların kamusal beyanlarını izlemek (`subject_type=public_figure|outlet|organization`, gerekçe alanı dolu) — izinli.
- Koordineli davranış ve bot olasılık skoru (hesap düzeyi, kanıtlı, "olasılık" etiketiyle) — izinli.
- Olay yeri coğrafyası (haberde geçen yer) — izinli; kullanıcının konumu — yasak.

## Kodda nasıl görünür
- Şema PR'ı yasak kategori alanı ekliyorsa CI reddeder (`contracts` deposu); `CODEOWNERS` hukuk/uyum onayı ister.
- Model kayıt defteri meta verisi: `label_set`, `input_modality`, `biometric`, `subject_level`; `biometric=true` dağıtılamaz.
- LLM istemlerinde çıkarım yasağı cümlesi ve çıktı denetleyicisi zorunludur; "yasak çıkarım" test seti model kapısında koşar.
- Her yeni veri alanı için: amaç, hukuki dayanak, `retention_class`, `subject_type` etkisi PR açıklamasında yazılır.
