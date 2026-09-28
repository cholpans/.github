# Test kuralları

- Test olmadan PR yok. Davranış değişikliği = test değişikliği; yalnızca refactor = mevcut testler yeşil.
- Piramit: birim (hızlı, izole) > entegrasyon (Testcontainers: Kafka, Postgres, OpenSearch) > sözleşme (Schemathesis / Pact) > uçtan uca (Playwright, yalnızca kritik yollar).
- Bir testi geçirmek için testi gevşetme, `skip`/`retry` ekleme, rastgeleliği tohumlamadan bırakma. Kırmızı test önce anlaşılır, sonra düzeltilir.
- Deterministik: saat ve rastgelelik enjekte edilir (`clock`, `rng`); ağ çağrıları sahte (VCR/httpx mock/httptest).
- Altın setler: ayrıştırıcı ve NLP değişiklikleri `datasets` deposundaki setlerle kapıdan geçer; eşik düşürme = ADR.
- İsimlendirme: `test_<birim>_<durum>_<beklenti>` (py), `Test<Birim>_<Durum>` (go), `describe/it` (ts) davranış cümlesiyle.
- Kapsam hedefi: yeni kodda ≥ 80 % satır; kapsam için anlamsız test yazma.
- Yük/performans: K1 hedefleri için k6/Locust senaryoları `perf/` altında; PR'da yalnızca smoke, gece tam.
