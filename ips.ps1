$location = Get-Location
$path = $location.ToString() + "\MACs.txt"
$rawString = arp -a | Select-String dinámico | Foreach-Object {"$(($_ -split '\s+',4)[2..2])"}
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($path, $rawString, $Utf8NoBomEncoding)
$path = $location.ToString() + "\IPs.txt"
$rawString = arp -a | Select-String dinámico | Foreach-Object {"$(($_ -split '\s+',4)[0..1])"}
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($path, $rawString, $Utf8NoBomEncoding)