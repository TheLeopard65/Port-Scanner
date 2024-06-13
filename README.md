#BASIC PORT SCANNER
This is a simple Python script designed to perform a TCP port scan on a specified target. It uses the `socket` module to establish connections with each port from 0 to 255 and reports whether each port is open or closed. The script also includes error handling for common exceptions such as host resolution failures and connection errors.

### Usage
```
python3 scanner.py <target>
```
Replace `<target>` with the hostname or IP address of the target to scan.

### Output
The script will display a banner with the target's hostname and IP address, followed by a list of open and closed ports.
