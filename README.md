# Windows 11 UMAY

> **r1 kurulum sorunu bulundu:** İlk canlı testte Windows Setup, ProductKey yanıt dosyası hatası verdi. r1 ile kuruluma devam etmeyin; anahtar eklemeden seçim ekranını açan r2 düzeltmesi doğrulanıyor.

**Windows 11 Home 21H2 · 22000.194 · Türkçe · x64 · r1**

ISO üretildi; NTLite ön ayarı, kurulum ekleri, doğrulama raporları ve hashleri yayımlandı. **Kurulum, gerçek ses ve internet testleri kullanıcı sonucunu bekliyor. Büyük ISO için Archive bağlantısı henüz yok.** [r1 kaynak paketini indir](https://github.com/ozelturktarkan/Windows-11-UMAY/releases/tag/v0.1-r1); bu küçük ZIP Windows kurulum ISO'su değildir.

## Neler değişti?

- Önceki tercih doğrultusunda Defender Antivirus, SmartScreen, Microsoft Store ve Store Purchase App kaldırıldı.
- Cortana, Widgets, Xbox uygulamaları, Haberler/Hava Durumu ve diğer 21 tüketici uygulaması kaldırıldı. [25 maddelik tam liste](docs/DEGISIKLIKLER.md).
- Yazı yumuşatma, masaüstü simge etiketi gölgesi, seçim solması ve pencere gölgesi korunur; diğer hedeflenen animasyonlar, saydamlık ve Peek kapatılır. Bu profil her kullanıcıya ilk oturumda bir kez uygulanır.
- **Özel arka plan, imleç veya dock yoktur.** Windows'un varsayılan görünümü kullanılır.
- Ses ve ağ sürücüleri/hizmetleri, güvenlik duvarı, Edge, yerel arama, temel uygulamalar, AppX altyapısı ve güncelleme bağımlılıkları korundu. SysMain, bellek sıkıştırma, takas dosyası ve performans sayaçları kapatılmadı.
- Temiz kurulumun TPM, Secure Boot ve RAM denetimleri için yanıt dosyası eklendi. Ürün anahtarı, aktivasyon ve otomatik disk bölümleme eklenmedi.

## ISO ve doğrulama

`Windows 11 UMAY.iso` — **4,632,555,520 bayt (4,31 GiB)**.

SHA-256:
```text
cb8498f871c8b6fd90fa9583c0527e807e553d5a265f53b80229ef633e94326c
```

[SHA-256 / SHA-1 / MD5](HASHES.txt) · [ISO raporu](reports/ISO-Dogrulama.json) · [Test durumu](docs/TESTLER.md)

```powershell
Get-FileHash -LiteralPath '.\Windows 11 UMAY.iso' -Algorithm SHA256
```

WIM bütünlük taraması, ISO geri okuması ve BIOS/UEFI önyükleme kataloğu doğrulaması geçti. 360 sürücü hizmetinde beklenmeyen başlangıç değişikliği bulunmadı; dokuz temel ses/ağ dosyasının SHA-256'sı kaynak WIM ile eşleşti. Bu kontroller **kurulmuş Windows'ta duyulabilir ses veya internet testi değildir**. Hash eşleşmesi dosya kimliğini doğrular; tek başına güvenlik veya Microsoft özgünlüğü kanıtı değildir.

## Kendi medyanızdan hazırlayın

[NTLite XML](NTLite/NTLite-Windows-11-UMAY-r1.xml), [Medya-Eki](Medya-Eki) ve [yeniden üretim adımları](docs/YENIDEN-URETIM.md) paylaşılmıştır. **XML tek başına ilk oturum profilini eklemez; Medya-Eki de gereklidir.** Aynı ayarlarla üretim, farklı zaman damgaları ve araçlarla birebir aynı ISO hash'ini garanti etmez.

Kaynak: [rg-adguard dosya kaydı](https://files.rg-adguard.net/file/c1f0bf7b-3ee1-3f0b-d19e-90bac2fc4f8a) — `tr-tr_windows_11_consumer_editions_x64_dvd_e9dd3889.iso` (diğer adı `Win11_Turkish_x64.iso`). Home 21H2 x64 seçildi. Üçüncü taraf katalog SHA-256'sı `c5b71f1ca4a05c2f55a2fe4b3a8686250537567d2c9950949db03c141c556562`. Orijinal ISO'nun tamamı üretim sırasında elde olmadığı için bağımsız yerel ISO hash karşılaştırması yapılmadı; çıkarılmış WIM kimliği ve yedek hash'i denetlendi. [Kaynak kaydı](KAYNAK-ADAYI.json).

## Kurulum ve hedef

Test makinesi **4 GB RAM, 2 vCPU, 64 GB dinamik disk, UEFI/TPM 2.0, NAT/kablo bağlı ve Intel HD Audio çıkışı açık** olarak hazırlandı. Kurulumu elle yapın; [VirtualBox notları](docs/SANAL-MAKINE.md).

**1 GB+ RAM bir deney hedefidir; doğrulanmış alt sınır değildir.** Boşta RAM, hız artışı veya uzun dönem kararlılık ölçümü henüz yayımlanmadı. Masaüstündeki **UMAY Ses ve Internet Kontrol** kısayolu yalnız istenildiğinde çalışır; ses duyulduğunu kullanıcı ayrıca doğrular.

Defender ve SmartScreen'in yokluğu bu imajın açıkça belirtilen güvenlik tercihidir; güvenlik duvarı bunların yerini tutmaz. Bu özel imaj Microsoft'un resmî dağıtımı değildir.

[Tüm Windows 10/11 HAKANLAR dizinini ziyaret edin](https://github.com/ozelturktarkan/Windows-10-11-HAKANLAR-Dizesi) · [Lisans kapsamı](LISANS-NOTU.md)
