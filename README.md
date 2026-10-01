# Windows 11 UMAY

**Hazırlık aşamasında — henüz UMAY ISO'su veya uygulanmış NTLite ön ayarı yayımlanmadı.**

UMAY için seçilen yeni taban **Windows 11 Home 21H2, Türkçe x64**. Önceki IoT/LTSC planı bırakıldı. Kaynak adayının yapısı **22000.194**; amaç düşük kaynaklı sanal makine ve deneme ortamı hazırlamak. **1 GB+ RAM bir deney hedefidir; çalıştığı doğrulanmış bir gereksinim değildir.**

## Kaynak adayı

[rg-adguard dosya kaydı](https://files.rg-adguard.net/file/c1f0bf7b-3ee1-3f0b-d19e-90bac2fc4f8a): `tr-tr_windows_11_consumer_editions_x64_dvd_e9dd3889.iso` (alternatif adı `Win11_Turkish_x64.iso`). Consumer medyasından Home seçilecektir.

Katalogdaki SHA-256:
```text
c5b71f1ca4a05c2f55a2fe4b3a8686250537567d2c9950949db03c141c556562
```
Bu üçüncü taraf katalog değeridir; yerel indirme hash'i ve resmî Microsoft referansı bu aşamada bağımsız doğrulanmadı. **Bu değer özelleştirilmiş UMAY ISO'sunun hash'i değildir.** [Kaynak adayının kaydı](KAYNAK-ADAYI.json).

NTLite XML, kurulum ekleri, kaldırma listesi ve son ISO hashleri üretim tamamlandığında eklenecek. Henüz indirme bağlantısı ve performans sonucu yoktur.

[Sanal makine notları](docs/SANAL-MAKINE.md) · [Tüm Windows 10/11 HAKANLAR dizini](https://github.com/ozelturktarkan/Windows-10-11-HAKANLAR-Dizesi)
