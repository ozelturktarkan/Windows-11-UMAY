# Aynı profili kendiniz hazırlayın

1. Windows 11 Consumer Editions 21H2 Türkçe x64 / 22000.194 medyanızı ayrı bir çalışma klasörüne çıkarın. Home indeksini seçin. Kaynağın kimlik/hash sınırları README ve KAYNAK-ADAYI.json içindedir.
2. NTLite'da Home imajına `NTLite/NTLite-Windows-11-UMAY-r1.xml` ön ayarını uygulayın. 25 kaldırmayı inceleyin. Üretimde NTLite 2026.9.12209 kullanıldı; bazı kaldırmalar uygun ücretli NTLite lisansı gerektirebilir. XML'in Tweaks bölümü boştur; görsel profil kurulum betiğiyle uygulanır.
3. Değişiklikleri kaydedin. Yalnız değiştirilen Home'u medyanın `sources/install.wim` dosyasına tek indeks olarak dışa aktarın; diğer sürümleri dağıtıma katmayın.
4. Deponun `Medya-Eki/` içeriğini medyanın köküne alt dizinlerini koruyarak kopyalayın. `autounattend.xml` kökte, `sources/$OEM$/$$/Setup/UMAY/` dosyaları aynı yapıda olmalıdır. XML tek başına bu ekleri taşımaz.
5. Kurulum betikleri kurulan hedef Windows içindir. Ana bilgisayarda çalıştırmayın. `Payload.json` iki kullanıcı betiğinin SHA-256'sını içerir; içeriklerini değiştirirseniz hashleri de yenileyin. Kaynak bütünlüğünü `Araclar/Dosyalari-Dogrula.ps1` ile okuyarak kontrol edebilirsiniz.
6. BIOS ve UEFI önyüklemesi olan ISO üretin. Bu üretimde pycdlib 1.21.0, UDF 2.60 / ISO level 3 kullanıldı; NTLite veya farklı paketleyiciler farklı ISO hash'i üretebilir. Kaynak klasörün eski katılımsız kurulum dosyalarını ve günlüklerini yanlışlıkla eklemeyin.
7. Son ISO SHA-256'sını hesaplayın. Windows kurulumu, ses, internet, ilk oturum efektleri ve temel uygulamaları ayrı test edin. `Araclar/ISO-Dogrula.ps1 -IsoPath ...` yayımlanmış UMAY ISO'sunu denetler; yeniden ürettiğiniz farklı hash'li ISO'nun bozuk olduğunu tek başına göstermez.

## Kurulum akışı

Yanıt dosyasının windowsPE aşaması yalnız TPM/Secure Boot/RAM denetim değerlerini yazar. specialize aşaması `Apply-Machine.ps1` çağırır. Betik hedef sürümü/yolu denetler, Default User görsel değerlerini ve kullanıcı başına RunOnce kaydını hazırlar. İlk kullanıcı oturumu `Initialize-User.ps1` ile görsel profili uygular ve isteğe bağlı ses/ağ kontrol kısayolunu ekler. Sürekli çalışan bir optimizasyon işlemi kurulmaz.

Kaynak XML ve bütün küçük kurulum dosyaları paylaşılmıştır. Windows ikilileri ve yerel üretim bilgisayarına bağlı araç yolları bu kaynak ZIP'ine dahil değildir. Aynı işlevsel ayarlar, bit düzeyinde aynı ISO dosyasını garanti etmez.
