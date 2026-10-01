# UMAY r1 değişiklik listesi

NTLite ile aşağıdaki 25 bileşen/paket hedeflendi. AppX kaldırmaları DISM yöntemiyle uygulandı; tam ön ayar NTLite klasöründedir.

- `defenderantivirus`
- `microsoft.windowsstore`
- `microsoft.storepurchaseapp`
- `microsoft.windows.apprep.chxapp`
- `microsoft.549981c3f5f10`
- `microsoft.bingnews`
- `microsoft.bingweather`
- `microsoft.gamingapp`
- `microsoft.getstarted`
- `microsoft.microsoftofficehub`
- `microsoft.microsoftsolitairecollection`
- `microsoft.microsoftstickynotes`
- `microsoft.people`
- `microsoft.powerautomatedesktop`
- `microsoft.todos`
- `microsoft.windowscommunicationsapps`
- `microsoft.windowsfeedbackhub`
- `microsoft.windowsmaps`
- `microsoft.yourphone`
- `microsoft.xbox.tcui`
- `microsoft.xboxgameoverlay`
- `microsoft.xboxgamingoverlay`
- `microsoft.xboxidentityprovider`
- `microsoft.xboxspeechtotextoverlay`
- `microsoftwindows.client.webexperience`

## İlk oturum görsel profili

Yazı yumuşatma/ClearType, masaüstü simge etiketinin gölgesi, seçim solması ve pencere gölgesi açık kalır. Menü/araç ipucu/küçültme-büyütme/görev çubuğu animasyonları, saydamlık, Peek, sürüklerken pencere içeriği ve hedeflenen diğer efektler kapatılır. Simgeler yerine küçük resimler gösterilmez; Widgets ve Chat düğmeleri gizlenir. Kullanıcı sonradan ayarları değiştirebilir. Özel duvar kâğıdı, imleç veya dock yüklenmez.

Görsel API değerleri için [Microsoft SystemParametersInfo](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-systemparametersinfow) belgesi esas alındı. SysMain, bellek sıkıştırma, WMI, performans sayaçları ve sistem takas dosyası korundu; [Microsoft sayfa dosyası açıklaması](https://learn.microsoft.com/en-us/troubleshoot/windows-client/performance/how-to-determine-the-appropriate-page-file-size-for-64-bit-versions-of-windows). Ölçülmüş bir hız/bellek kazanımı henüz yoktur.
