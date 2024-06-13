# TCP Port Scanner
This is a simple Python script designed to perform a TCP port scan on a specified target. It uses the `socket` module to establish connections with each port and reports whether each port is open or closed. The script also includes error handling for common exceptions such as host resolution failures and connection errors.

### Usage
```
python3 scanner.py <target> <full/half>
```
Replace `<target>` with the hostname or IP address of the target to scan. The `<full/half>` option specifies the type of scan to perform:

- `full`: Scans all ports from 1 to 65535.
- `half`: Scans ports from 1 to 1024.

### Output
The script will display a banner with the target's hostname and IP address, followed by a list of open and closed ports. The output includes the scan type and the ports being scanned.
