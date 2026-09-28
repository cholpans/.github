# Gözlemlenebilirlik ve operasyon

- Her servis: OpenTelemetry trace + metrik + yapılandırılmış JSON günlük; `tenant_id`, `source_id`, `doc_id`, `trace_id` alanları standarttır.
- Kafka tüketicileri: gecikme (lag), işlenen/başarısız sayaçları, ölü mektup (DLQ) konusu `<topic>.dlq`; yeniden işleme betiği belgelidir.
- SLO'lar: uyarı gecikmesi p95 (alım→bildirim) ≤ 90 s (K1), API p95 ≤ 300 ms; SLO'ya dokunan değişiklikte PR'da belirt.
- Sağlık uçları: `/healthz` (canlılık), `/readyz` (bağımlılıklar), `/metrics` (Prometheus).
- Yeni bir hata sınıfı eklerken Grafana panosu/alarm güncellemesini `infra` deposunda ayrı PR olarak aç.
- Üretim verisini yerel ortama kopyalama; dev/staging anonimleştirilmiş örneklem kullanır.
