# Güvenlik kuralları

- Sır yok: `.env*`, anahtar, jeton, kube-config depoya ve sohbete girmez. Sır gerekiyorsa External Secrets + Vault/KMS referansı yaz, değerini değil.
- `.env*`, `*.pem`, `*.key`, `secrets/` dosyalarını okuma; izinler zaten engeller, istisna isteme.
- Kimlik: OIDC (Authorization Code + PKCE), kısa ömürlü erişim jetonu, yenileme jetonu yalnızca güvenli depoda (tarayıcıda httpOnly cookie, Electron'da safeStorage).
- Yetki: kiracı kimliği her sorguda zorunlu filtre; satır düzeyi güvenlik varsa devre dışı bırakma. "Admin" kısayolu yazma.
- Girdi doğrulama: sınırda (gateway/handler) şemayla; iç servisler de doğrular (defense in depth).
- SSRF: fetcher ve webhook gibi dışa istek atan her yerde allow/deny listesi, özel IP aralıkları ve `.onion` engeli, yönlendirme sınırı, zaman aşımı.
- Deserializasyon/şablon enjeksiyonu: `pickle`, `yaml.load` (unsafe), `eval` yok; Go'da `text/template` kullanıcı verisiyle çalıştırılmaz.
- Bağımlılıklar: sürümler sabit (lockfile); Renovate PR'ları küçük ve sık; yeni bağımlılık eklerken lisansını yaz (GPL/AGPL/CC-BY-NC dikkat; NLLB/SeamlessM4T dışarıda).
- Konteyner: distroless veya slim taban, root olmayan kullanıcı, SBOM (Syft) + tarama (Trivy) CI'da, imza (cosign).
- Günlükler: PII ve jeton maskeleme; yazar kimlikleri yalnızca takma ad (tokenizasyon kasası).
- Tehlikeli komutlar (`git push --force`, `kubectl delete`, `terraform apply/destroy`, `DROP`) insan onayı gerektirir; hook engeller, tartışma.
- Bir güvenlik açığı bulursan: düzeltme PR'ından önce `SECURITY.md` sürecine göre özel olarak bildir; PR açıklamasında sömürü adımlarını yazma.
