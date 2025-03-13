# Wait for USB detection

$usbDevices = Get-CimInstance Win32_DiskDrive | Where-Object { $_.MediaType -eq "removable Media" }


if ($usbDevices) {
        Write-Host "USB detected"
	$usbDevices | forEach-Object { Write-Host " - $($_.DeviceID) ($($_.Model))" }
} else {
        Write-Host "Waiting"
	Start-Sleep -Seconds 5
}

#Start-Sleep -Seconds 20
