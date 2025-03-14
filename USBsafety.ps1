while ($true) {
    $usbDevices = Get-CimInstance Win32_DiskDrive | Where-Object { $_.MediaType -eq "Removable Media" }

    if ($usbDevices) {
        Write-Host "USB detected"

        foreach ($usb in $usbDevices) {
            $partitions = Get-CimInstance Win32_DiskPartition | Where-Object { $_.DiskIndex -eq $usb.Index }
            $logicalDisks = $partitions | ForEach-Object {
                Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 } # Removable drives only
            }

            foreach ($disk in $logicalDisks) {
                $filePath = Join-Path -Path $disk.DeviceID -ChildPath "test.txt"
                
                if (Test-Path $filePath) {
                    Write-Host "'test.txt' found on $($disk.DeviceID)"
                    $fileHash = Get-FileHash $filePath -Algorithm SHA256

                    $expectedHash = "9A30A503B2862C51C3C5ACD7FBCE2F1F784CF4658CCF8E87D5023A90C21C0714"

                    if ($fileHash.Hash -eq $expectedHash) {
                        Write-Host "Hash matches"
                    } else {
                        Write-Host "Hash does not match!"
			Write-Host "Remove device immediately!"
			$driveEject = New-Object -comObject Shell.Application
			$driveEject.Namespace(17).ParseName("G:\").InvokeVerb("Eject")
			Write-Host "Device Ejected"
                    }
                } else {
                    Write-Host "'test.txt' not found on $($disk.DeviceID)"
                }
            }
        }
    } else {
        Write-Host "Waiting"
    }

    Start-Sleep -Seconds 5
}
