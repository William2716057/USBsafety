while ($true) {
    $usbDevices = Get-CimInstance Win32_DiskDrive | Where-Object { $_.MediaType -eq "Removable Media" }

    if ($usbDevices) {
        Write-Host "USB detected"
        $usbDevices | ForEach-Object { Write-Host " - $($_.DeviceID) ($($_.Model))" }
    } else {
        Write-Host "Waiting"
    }

    Start-Sleep -Seconds 10
}
