# Port-Scanner

This repository contains multiple scripts to perform port scanning on a given target. The port scanning functionality is implemented in three different languages: Bash, Python, and PowerShell. Each script supports two types of scans: **full** scan (scanning ports 1-65535) and **half** scan (scanning ports 1-1024).

## Scripts

1. **Bash-Scanner.sh**: A Bash script to scan ports using `nc` (Netcat) to check for open ports.
2. **PY-Scanner.py**: A Python script that uses the `socket` library to scan the specified range of ports.
3. **PS-Scanner.ps1**: A PowerShell script that uses the `System.Net.Sockets.TcpClient` class to perform port scans.

## Features

- **Full Scan**: Scans all 65535 ports (may take a long time).
- **Half Scan**: Scans ports 1-1024 (faster than a full scan).

## Prerequisites

### For Bash-Scanner.sh
- A Linux-based system with Bash.
- Netcat (`nc`) installed.

### For PY-Scanner.py
- Python 3.x installed.

### For PS-Scanner.ps1
- A Windows system with PowerShell.

---

- Here is the command to install the prerequisites:

```
sudo apt install powershell netcat-traditional python3 -y
```

---

## Usage

### Bash-Scanner.sh

To use the `Bash-Scanner.sh` script, open a terminal and run the following command:

```bash
./Bash-Scanner.sh <target> <full/half>
```

- `<target>`: The target domain or IP address.
- `<full/half>`: The type of scan (`full` for all ports 1-65535, `half` for ports 1-1024).

Example:

```bash
./Bash-Scanner.sh example.com full
```

### PY-Scanner.py

To use the `PY-Scanner.py` script, run the following command in the terminal:

```bash
python3 PY-Scanner.py <target> <full/half>
```

- `<target>`: The target domain or IP address.
- `<full/half>`: The type of scan (`full` for all ports 1-65535, `half` for ports 1-1024).

Example:

```bash
python3 PY-Scanner.py example.com half
```

### PS-Scanner.ps1

To use the `PS-Scanner.ps1` script, run the following command in PowerShell:

```powershell
.\PS-Scanner.ps1 -target <target> -scanType <full/half>
```

- `<target>`: The target domain or IP address.
- `<full/half>`: The type of scan (`full` for all ports 1-65535, `half` for ports 1-1024).

Example:

```powershell
.\PS-Scanner.ps1 -target example.com -scanType full
```

## Output

Each script will display:

- The target (both domain name and resolved IP).
- The start time of the scan.
- The type of scan and port range being used.
- For each open port, the script will print `PORT <port_number> : OPEN`.

## License

This repository is licensed under the MIT License. See the LICENSE file for more information.

---

Feel free to fork and modify the scripts as needed. Happy scanning!
