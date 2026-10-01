$ErrorActionPreference = 'Stop'
if ($PSScriptRoot -ine (Join-Path $env:SystemRoot 'Setup\UMAY')) { throw 'UMAY target setup folder required.' }
if ([Security.Principal.WindowsIdentity]::GetCurrent().User.Value -ne 'S-1-5-18') { throw 'Windows Setup SYSTEM context required.' }
$os = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
if ($os.EditionID -ne 'Core' -or $os.CurrentBuildNumber -ne '22000' -or -not [Environment]::Is64BitOperatingSystem) { throw 'Windows 11 Home 21H2 x64 required.' }
$hiveName = 'UMAY_21H2_Default'
$loaded = $false
Start-Transcript -Path (Join-Path $PSScriptRoot 'Machine.log') -Append | Out-Null
try {
    $manifest = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'Payload.json') -Raw | ConvertFrom-Json
    foreach ($entry in $manifest.PSObject.Properties) {
        if ((Get-FileHash -LiteralPath (Join-Path $PSScriptRoot $entry.Name) -Algorithm SHA256).Hash -ine $entry.Value) { throw ('Payload checksum mismatch: ' + $entry.Name) }
    }
    if (Test-Path ('Registry::HKEY_USERS\' + $hiveName)) { throw 'Default user hive alias already in use.' }
    $default = [Environment]::ExpandEnvironmentVariables((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList').Default)
    & "$env:SystemRoot\System32\reg.exe" load ('HKU\' + $hiveName) (Join-Path $default 'NTUSER.DAT')
    if ($LASTEXITCODE -ne 0) { throw 'Default user hive load failed.' }
    $loaded = $true
    # Seed values before Explorer's first launch; per-user SPI calls finish the profile.
    $defaults = @(
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects','VisualFXSetting',3),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','TaskbarAnimations',0),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','TaskbarDa',0),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','TaskbarMn',0),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','ListviewShadow',1),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','ListviewAlphaSelect',0),
        @('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','IconsOnly',1),
        @('Software\Microsoft\Windows\DWM','AlwaysHibernateThumbnails',0),
        @('Software\Microsoft\Windows\DWM','EnableAeroPeek',0),
        @('Software\Microsoft\Windows\CurrentVersion\Themes\Personalize','EnableTransparency',0)
    )
    foreach ($setting in $defaults) {
        $key = 'Registry::HKEY_USERS\' + $hiveName + '\' + $setting[0]
        if (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
        New-ItemProperty -LiteralPath $key -Name $setting[1] -Value ([int]$setting[2]) -PropertyType DWord -Force | Out-Null
    }
    $run = 'Registry::HKEY_USERS\' + $hiveName + '\Software\Microsoft\Windows\CurrentVersion\RunOnce'
    if (-not (Test-Path $run)) { New-Item -Path $run -Force | Out-Null }
    $command = '"' + $env:SystemRoot + '\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File "' + $PSScriptRoot + '\Initialize-User.ps1"'
    New-ItemProperty -LiteralPath $run -Name '!UMAY-21H2-User' -Value $command -PropertyType String -Force | Out-Null
    [GC]::Collect(); [GC]::WaitForPendingFinalizers()
    & "$env:SystemRoot\System32\reg.exe" unload ('HKU\' + $hiveName)
    if ($LASTEXITCODE -ne 0) { throw 'Default user hive unload failed.' }
    $loaded = $false
    New-Item -Path 'HKLM:\SOFTWARE\UMAY' -Force | Out-Null
    New-ItemProperty -Path 'HKLM:\SOFTWARE\UMAY' -Name Profile -Value 'UMAY-21H2-x64-r1' -PropertyType String -Force | Out-Null
    Write-Output 'User visual initialization registered. Audio, network, power, pagefile and performance counters left at Windows defaults.'
} finally {
    if ($loaded) { [GC]::Collect(); [GC]::WaitForPendingFinalizers(); & "$env:SystemRoot\System32\reg.exe" unload ('HKU\' + $hiveName) }
    Stop-Transcript | Out-Null
}
