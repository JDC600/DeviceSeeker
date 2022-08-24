# $location = Get-Location
$path1 = "./MACs.txt"
# $path = $location.ToString() + "\MACs.txt"
$rawString1 = arp -a | Select-String dinámico | Foreach-Object {"$(($_ -split '\s+',4)[2..2])"}
$Utf8NoBomEncoding1 = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($path1, $rawString1, $Utf8NoBomEncoding1)
# $path2 = $location.ToString() + "\IPs.txt"
$path2 = "./IPs.txt"
$rawString2 = arp -a | Select-String dinámico | Foreach-Object {"$(($_ -split '\s+',4)[0..1])"}
$Utf8NoBomEncoding2 = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($path2, $rawString2, $Utf8NoBomEncoding2)