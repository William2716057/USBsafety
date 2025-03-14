# USB Safety Script

A PowerShell script that continuously monitors for permitted USB devices using a file named test.txt on the detected USB. 
It verifies its hash and automatically ejects the device if the hash does not match the expected value.

## ⚙️ Features

- 🚨 Continuously monitors for removable USB devices.

- 📂 Checks for the presence of test.txt on the detected USB drive.

- 🔐 Verifies the file's integrity using the SHA256 hash algorithm.

- ❌ If the file's hash does not match the expected value, the script:

1. Displays a warning.
2. Ejects the USB device automatically.
3. ✅ Provides clear feedback for each detection attempt.

## 🚨 Limitations

- This script does not protect against malicious software if the USB device is accepted. It only verifies the presence and integrity of a designated file (test.txt).

### 🖥️ Installation

1. Copy the provided PowerShell script into a .ps1 file (e.g., USBsafety.ps1).
2. Update the $expectedHash variable with the correct SHA256 hash value for your trusted test.txt file.
```
Get-FileHash G:\test.txt
```
3. Save the file.

### ▶️ Usage

1. Open PowerShell as Administrator.
2. Navigate to the folder where the script is saved.
3. Run the script with:
```
.\USBsafety.ps1
```
### 🔍 Example Output
```
USB detected
'test.txt' found on G:\
Hash does not match!
Remove device immediately!
Device Ejected
```
### ❗ Important Notes

- Ensure the correct test.txt file is prepared in advance with the expected content and hash value.
- The hash calculation may fail if test.txt is empty or corrupted.
- While the script ejects unauthorized USBs, it cannot prevent malware if the USB is already trusted.

### 🛡️ Recommendations

#### For improved security, consider implementing:

- 🔍 File system scanning tools for deeper threat detection.

- 🔒 Device control policies via Group Policy or endpoint security software.

