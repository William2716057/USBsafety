# Wait for USB detection

$usbDevices = Get-WmiObject Win32_DiskDrive | Where-Object { $_.MediaType -eq "removable Media" }


if ($usbDevices) {
        Write-Host "USB detected"
} else {
        Write-Host "Waiting"
}
