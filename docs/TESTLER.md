# r1 doğrulama ve test durumu

| Denetim | Sonuç |
| --- | --- |
| Home 21H2 x64 / 22000.194 kimliği | Doğrulandı |
| WIM tüm veri akışlarının bütünlüğü | Geçti |
| ISO içinden WIM/kurulum dosyalarını geri okuma | Hashler eşleşti |
| BIOS ve UEFI önyükleme kataloğu | Doğrulandı; gerçek açılış testi ayrıca bekleniyor |
| 360 sürücü hizmetinin başlangıç değerleri | Beklenmeyen değişiklik yok |
| 9 temel ses/ağ dosyası | Kaynak WIM SHA-256 değerleriyle aynı |
| Temiz Windows kurulumu ve ilk oturum | Kullanıcı sonucu bekleniyor |
| Gerçek ses, DNS/HTTPS internet erişimi | Kullanıcı sonucu bekleniyor |
| Efekt profili ve temel uygulamalar | Kullanıcı sonucu bekleniyor |
| 1 GB RAM, CPU/RAM performansı, uzun dönem kararlılık | Ölçülmedi |

Kurulumdan sonra Edge ile bir HTTPS sitesi açın. `Win+R → mmsys.cpl → Hoparlör → Özellikler → Gelişmiş → Sına` ile sesin duyulduğunu kontrol edin. Masaüstündeki **UMAY Ses ve Internet Kontrol** DNS/HTTPS, ses aygıtı, ağ bağdaştırıcısı ve hizmet durumunu yalnız okuyarak raporlar. Sonuç `%LOCALAPPDATA%\UMAY\Ses-Ag-Kontrol.json` dosyasına yazılır; sesin duyulduğunu ölçmez. Sorun bildirirken ağ adresi/kullanıcı yolu gibi kişisel bilgileri kontrol ederek ilgili hata metnini paylaşın.

[Makine tarafından okunabilir durum](../reports/Test-Durumu.json) · [WIM raporu](../reports/WIM-Dogrulama.json) · [ISO raporu](../reports/ISO-Dogrulama.json)
