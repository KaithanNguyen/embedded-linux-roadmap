# Read-only Windows host report; run the .sh script inside Linux separately.
$ErrorActionPreference = 'Continue'
Write-Output '# Windows host system report'
Write-Output ([DateTime]::UtcNow.ToString('o'))
Write-Output '## PowerShell'
$PSVersionTable | Out-String | Write-Output
if ($env:OS -ne 'Windows_NT') {
    Write-Output 'WARN: Windows probes skipped on this platform.'
    return
}
try {
    Write-Output '## Operating system'
    Get-CimInstance Win32_OperatingSystem -ErrorAction Stop |
        Select-Object Caption, Version, OSArchitecture, TotalVisibleMemorySize |
        Format-List | Out-String | Write-Output
} catch { Write-Output ('WARN: OS probe failed: ' + $_.Exception.Message) }
try {
    Write-Output '## Logical disks'
    Get-CimInstance Win32_LogicalDisk -ErrorAction Stop |
        Select-Object DeviceID, DriveType, FileSystem, Size, FreeSpace |
        Format-Table | Out-String | Write-Output
} catch { Write-Output ('WARN: disk probe failed: ' + $_.Exception.Message) }
foreach ($tool in @('git', 'wsl')) {
    Write-Output ("## " + $tool)
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        if ($tool -eq 'git') { & git --version } else { & wsl --status }
        if ($LASTEXITCODE -ne 0) { Write-Output ("WARN: exit status " + $LASTEXITCODE) }
    } else { Write-Output ('WARN: command unavailable: ' + $tool) }
}
Write-Output '# Collection complete (best effort); review WARN entries.'
