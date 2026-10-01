# Cholpans — paylaşılan bağlam (üst klasör)

Bu dosya `~/dev/cholpans/` üst klasöründedir; altındaki her depoda açılan Claude Code oturumu bunu okur.
Depoya özgü bilgi her deponun kendi `CLAUDE.md`'sindedir. Çelişkide depo dosyası kazanır.

## Proje

Cholpans, çok dilli haber ve sosyal medya izleme / medya istihbaratı platformudur (Meltwater, Dataminr sınıfı).
Kaynaklar: web haber (RSS/site haritası/tarama), sosyal (Bluesky, X, Reddit, Meta halka açık Sayfalar, YouTube),
yayın (TV/radyo ASR) ve basılı. Çıktılar: canlı akış, olay kümeleri, uyarılar, analitik, API.
Türkçe desteklenen dillerden biridir; ürün uluslararasıdır. Arayüz dili kullanıcı başına, içerik dili filtre.

## Mimari (tek cümle)

Kafka omurgalı olay güdümlü hat: fetcher → extractor → dil başına NLP → clusterer → OpenSearch/ClickHouse/Iceberg →
kural motoru (percolator) → notifier → REST/OpenAPI + SSE. İstemciler API-first: web (Nuxt 4 + Vue 3 + PrimeVue),
masaüstü (Electron, web derlemesini paketler), mobil (Capacitor 6 ince uyarı istemcisi).

## Depolar (GitHub org: cholpans)

| Depo | Rol | Üretir / tüketir |
|---|---|---|
| `.github` | Org profili, yeniden kullanılabilir CI, paylaşılan Claude kuralları | — |
| `contracts` | OpenAPI 3.1 + Protobuf/CloudEvents + AsyncAPI; buf/Spectral | üretir: `@cholpans/api-client` (npm), `cholpans-client` (Python) |
| `api` | Tüm arka uç servisleri (Go + Python), api-gateway, mcp-server; OpenAPI'nin kaynağı | tüketir: contracts; üretir: konteyner imajları |
| `ui` | Tasarım tokenları, PrimeVue preset, sarmalanmış bileşenler | üretir: `@cholpans/ui` |
| `web` | Nuxt 4 uygulaması (PWA); statik derleme masaüstüne gider | tüketir: ui, api-client |
| `infra` | Terraform, Helm değerleri, ArgoCD, ortamlar | dağıtır: hepsini |
| `datasets` | Altın setler, ayrıştırıcı regresyon, değerlendirme | tüketir: api CI |
| `desktop` | Electron kabuğu (Faz 2) | tüketir: web derlemesi |
| `mobile` | Capacitor ince istemci (Faz 3) | tüketir: ui, api-client |
| `docs` | Planlama raporları, ADR arşivi, geliştirici portalı (Faz 2) | — |
| `sdk-js`, `sdk-python` | Elle yazılmış SDK katmanı (gerekince) | tüketir: contracts |

## Kaynak belgeler (docs deposu, `docs/planning/`)

- `decisions-log.md` — sohbet ve tasarım kararlarının günlüğü; **en yüksek öncelik**.
- `02-teknik-tasarim-ve-gelistirme-plani.md` — mimari, teknoloji, RTÜK şartname eşlemesi, kapsam dışı, ADR-001…023.
- `03-tam-kapsamli-platform-teknik-gereksinimler.md` — tam özellik envanteri ve 30 aylık süreç (istemci satırları ADR-020–022 ile güncellendi).
- `01-sektor-raporu.md` — pazar ve rakip bağlamı (kod kararlarında kullanılmaz).
- `prohibited-capabilities.md` — 15 yasak yetenek; bağlayıcıdır.

Bu belgeleri bütünüyle okuma; `/plan-context <konu>` becerisiyle ilgili bölümü çek.

## Bağlayıcı kurallar (özet; tam metin her depoda `.claude/rules/shared-*.md`)

1. **Yasak yetenekler**: kişi düzeyinde özel nitelikli veri çıkarımı, yüz tanıma, otomatik "yalan/sahte" hükmü,
   özel kişi takibi, platformlar arası kimlik çözümleme, kapalı kanallar, ödeme duvarı/anti-bot aşma, lisanssız tam
   metin, dark web, gazeteci iletişim verisi, reklam analitiği, sosyal skorlama/gözetim, insan onaysız idari karar,
   kiracı verisiyle model eğitimi, reşit olmayanlar. Bunları uygulama, iskeletini kurma, "ileride açılır" bayrağı koyma.
2. **API-first**: istemcide iş kuralı yok; tüm istemciler `contracts`'tan üretilen istemciyi kullanır.
3. **Sözleşme değişikliği** yalnızca `contracts` deposunda; kırıcı değişiklik = yeni major.
4. **Gizli bilgi** depoya girmez; `.env*` okunmaz; Vault/External Secrets.
5. **Dil**: kod, tanımlayıcı, commit mesajı İngilizce (Conventional Commits); doküman ve ADR Türkçe; UI metni i18n.
6. **Test** olmadan PR yok; `compliance-auditor` PR öncesi çalışır.

## Faz durumu

Faz 1 (ay 0–8) — hedef: yerelde Docker ile uçtan uca çalışan platform. İlk ayak API + Web: `contracts`, `api`, `web`, `ui`, `infra`, `.github` aktif; `datasets` ay 2.
`desktop`, `docs` portalı, `sdk-*` Faz 2; `mobile` Faz 3. Boş depolara kod yazma; önce ilgili ADR/karar.
Üyelik, faturalama, Zitadel/SSO/SCIM, çok kiracılı T1–T3, ISO/SOC "Ticari katman"dır: en sona bırakıldı (Faz 3 sonrası). Şimdilik yalnızca OIDC/JWT doğrulaması ve şemada `tenant_id`; bunlar için kod yazma.
