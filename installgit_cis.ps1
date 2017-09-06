# Azure CIS Workshop Dev VM
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe"
$storageDir = $env:TEMP
$arg = '/SILENT'

$webclient = New-Object System.Net.WebClient
$file = "$storageDir\Git-2.14.1-64-bit.exe"
$webclient.DownloadFile($gitUrl, $file)

$Location = "C:\data\"
New-Item -Path $Location -ItemType "directory"
$fnwUrl = "http://aka.ms/flightsandweather"
$flightandweatherfile = "C:\data\flightsandweather.csv"
$webclient.DownloadFile($fnwUrl, $flightandweatherfile)

$Location = "C:\data\1.MachineLearning\"
New-Item -Path $Location -ItemType "directory"
$dataUrl = "https://hyssh0mtc0sea.blob.core.windows.net/awtworkshopdata/AWT.CSV"
$datafile = "C:\data\1.MachineLearning\awt_flightsandweather.csv"
$webclient.DownloadFile($dataUrl, $datafile)

$Location = "C:\ADF_Gateway\"
New-Item -Path $Location -ItemType "directory"
$admgUrl = "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/DataManagementGateway_2.12.6414.2%20(64-bit).msi"
$admgfile = "C:\ADF_Gateway\DataManagementGateway_2.12.6414.2 (64-bit).msi"
$webclient.DownloadFile($admgUrl, $admgfile)

$Location = "C:\temp\"
New-Item -Path $Location -ItemType "directory"
$pbiUrl = "http://go.microsoft.com/fwlink/?LinkID=521662"
$pbiFile = "C:\temp\PowerBIDesktop.msi"
$webclient.DownloadFile($pbiUrl, $pbiFile)
$pbiArg = "ACCEPT_EULA=1 /quiet"

$Location = "C:\myWebApp\"
New-Item -Path $Location -ItemType "directory"
$webappUrl = "https://github.com/xlegend1024/AdventureWorksTravel.git"
$cloneDir = "C:\myWebApp"
$gitArg = "clone $webappUrl --separate-git-dir=$cloneDir"

$p = Start-Process $file -ArgumentList $arg -wait -NoNewWindow -PassThru
$pbiP = Start-Process $pbiFile -ArgumentList $pbiArg
$gitP = Start-Process "git.exe" -ArgumentList $gitArg

$p.HasExited
$pbiP.HasExited
$gitP.HasExited

$gitP.ExitCode
$pbiP.ExitCode
$p.ExitCode

