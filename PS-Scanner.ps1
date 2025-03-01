# PowerShell port scanner with full and half scan options
param(
    [string]$target,
    [string]$scanType
)

function Show-Banner {
    Write-Host "###################################"
    Write-Host "TARGET (TEXT) : $target"
    Write-Host "TARGET (IP) : $target"
    Write-Host "START TIME : $(Get-Date)"
}

function Scan-Port {
    param(
        [string]$target,
        [int]$port
    )
    try {
        $socket = New-Object System.Net.Sockets.TcpClient($target, $port)
        $socket.Close()
        Write-Host "PORT $port : OPEN"
    } catch {}
}

function Full-Scan {
    Write-Host "SCAN TYPE : FULL"
    Write-Host "PORTS : 1-65535"
    Write-Host "--- NOTE : The Full Scan might take a long time to finish"
    Write-Host "-----------------------------------"
    for ($port = 1; $port -le 65535; $port++) {
        Scan-Port -target $target -port $port
    }
}

function Half-Scan {
    Write-Host "SCAN TYPE : HALF"
    Write-Host "PORTS : 1-1024"
    Write-Host "-----------------------------------"
    for ($port = 1; $port -le 1024; $port++) {
        Scan-Port -target $target -port $port
    }
}

# Main Script Logic
if (-not $target -or -not $scanType) {
    Write-Host "SYNTAX : .\scanner.ps1 <target> <full/half>"
    exit
}

# Resolve the target to an IP address
try {
    $target = [System.Net.Dns]::GetHostAddresses($target)[0].ToString()
} catch {
    Write-Host "ERROR: Could not resolve target IP"
    exit
}

# Display banner
Show-Banner

# Perform scan based on user input
switch ($scanType.ToLower()) {
    "full" { Full-Scan }
    "half" { Half-Scan }
    default {
        Write-Host "SYNTAX : .\scanner.ps1 <target> <full/half>"
    }
}
