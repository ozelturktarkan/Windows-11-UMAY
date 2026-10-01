$ErrorActionPreference = 'Stop'
if ($PSScriptRoot -ine (Join-Path $env:SystemRoot 'Setup\UMAY')) { throw 'UMAY target Windows required.' }
if ((Get-ItemProperty 'HKLM:\SOFTWARE\UMAY' -ErrorAction SilentlyContinue).Profile -ne 'UMAY-21H2-x64-r1') { throw 'UMAY 21H2 profile required.' }
$out = Join-Path $env:LOCALAPPDATA 'UMAY'
New-Item -Path $out -ItemType Directory -Force | Out-Null
$result = [ordered]@{Time=(Get-Date).ToString('o'); Services=@(); Adapters=@(); SoundDevices=@(); DNS=$false; HTTPS=$false; AudioHeard='Requires user listening test'; Errors=@()}
foreach ($name in 'Audiosrv','AudioEndpointBuilder','Dhcp','Dnscache','NlaSvc','netprofm','mpssvc') {
    try { $s=Get-Service -Name $name; $result.Services += [pscustomobject]@{Name=$s.Name;Status=[string]$s.Status} } catch { $result.Errors += $_.Exception.Message }
}
try { $result.Adapters = @(Get-NetAdapter | Select-Object Name,Status,LinkSpeed,InterfaceDescription) } catch { $result.Errors += $_.Exception.Message }
try { $result.SoundDevices = @(Get-CimInstance Win32_SoundDevice | Select-Object Name,Status,ConfigManagerErrorCode) } catch { $result.Errors += $_.Exception.Message }
try { $result.DNS = @([Net.Dns]::GetHostAddresses('www.microsoft.com')).Count -gt 0 } catch { $result.Errors += $_.Exception.Message }
try { $response=Invoke-WebRequest -Uri 'https://www.microsoft.com/' -Method Head -UseBasicParsing -TimeoutSec 15; $result.HTTPS=($response.StatusCode -eq 200) } catch { $result.Errors += $_.Exception.Message }
$file = Join-Path $out 'Ses-Ag-Kontrol.json'
$result | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $file -Encoding UTF8
$result.Services | Format-Table -AutoSize
$result.Adapters | Format-Table -AutoSize
$result.SoundDevices | Format-Table -AutoSize
Write-Output ('DNS: ' + $result.DNS + '  HTTPS: ' + $result.HTTPS)
Write-Output 'Duyulabilir sesi dogrulamak icin mmsys.cpl > Hoparlor > Ozellikler > Gelismis > Sina kullanin.'
Write-Output ('Rapor: ' + $file)
