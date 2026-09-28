---
name: release-notes
description: İki etiket/sürüm arasındaki Conventional Commit geçmişinden sürüm notları ve CHANGELOG girdisi üretir. "sürüm notu", "changelog güncelle", "release hazırla" dendiğinde kullan.
disable-model-invocation: true
argument-hint: <önceki-etiket> [yeni-sürüm]
---

1. `git describe --tags --abbrev=0` ile son etiketi bul (argüman verilmişse onu kullan).
2. `git log <etiket>..HEAD --pretty='%s|%h|%an'` çıktısını türlere ayır: feat → Added, fix → Fixed, perf/refactor → Changed, `BREAKING CHANGE`/`!` → Breaking, security → Security, docs/chore → gizle.
3. Kırıcı değişiklik varsa semver major, feat varsa minor, aksi patch öner; `contracts` için kırıcı = major zorunlu.
4. `CHANGELOG.md` `Unreleased` bölümünü doldur (Keep a Changelog); insan diliyle yeniden yaz, commit hash'lerini parantezde tut.
5. Yayın komutunu **çalıştırma**; `gh release create` insan onayı ister — komutu yaz, sen çalıştırma.
