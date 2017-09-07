# Azure CIS Workshop Dev VM

#Web Client
$webclient = New-Object System.Net.WebClient

#Download git
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe"
$storageDir = $env:TEMP
$arg = '/SILENT'
$file = "$storageDir\Git-2.14.1-64-bit.exe"
$webclient.DownloadFile($gitUrl, $file)

#Download ML Training data
$Location = "C:\data\1.MachineLearning\"
New-Item -Path $Location -ItemType "directory"
$dataUrl = "https://hyssh0mtc0sea.blob.core.windows.net/awtworkshopdata/AWT.CSV"
$datafile = "C:\data\1.MachineLearning\awt_flightsandweather.csv"
$webclient.DownloadFile($dataUrl, $datafile)

#Download ML Training data
$Location = "C:\data\1.MachineLearning\"
New-Item -Path $Location -ItemType "directory" 
$data2Url = "https://hyssh0mtc0sea.blob.core.windows.net/awtworkshopdata/airportlocations.csv"
$data2file = "C:\data\1.MachineLearning\airportlocations.csv"
$webclient.DownloadFile($data2Url, $data2file)

#Download ML Batch data
$Location = "C:\data\"
New-Item -Path $Location -ItemType "directory"
$fnwUrl = "http://aka.ms/flightsandweather"
$flightandweatherfile = "C:\data\FlightsAndWeather.csv"
$webclient.DownloadFile($fnwUrl, $flightandweatherfile)

#Download ADF Data Movement Gateway msi
$Location = "C:\ADF_Gateway\"
New-Item -Path $Location -ItemType "directory"
$admgUrl = "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/DataManagementGateway_2.12.6414.2%20(64-bit).msi"
$admgfile = "C:\ADF_Gateway\DataManagementGateway_2.12.6414.2 (64-bit).msi"
$webclient.DownloadFile($admgUrl, $admgfile)

#Download PowerBI msi
$Location = "C:\temp\"
New-Item -Path $Location -ItemType "directory"
$pbiUrl = "http://go.microsoft.com/fwlink/?LinkID=521662"
$pbiFile = "C:\temp\PowerBIDesktop.msi"
$webclient.DownloadFile($pbiUrl, $pbiFile)
$pbiArg = "ACCEPT_EULA=1 /quiet"

#Install git
$p = Start-Process $file -ArgumentList $arg -wait -NoNewWindow -PassThru
#Install PowerBI
$pbiP = Start-Process $pbiFile -ArgumentList $pbiArg

#Clone Web App
$Location = "C:\myWebApp\"
New-Item -Path $Location -ItemType "directory"
#$webappUrl = "https://github.com/xlegend1024/AdventureWorksTravel.git"
$webappUrl = "https://github.com/toddkitta/AdventureWorksTravel.git"
$gitpath = "C:\Program Files\Git\bin\git.exe"
$gitArg = "clone $webappUrl $Location"
$gitP = Start-Process $gitpath -ArgumentList $gitArg

#Download FireFox
$foxUrl = "https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US&attribution_code=c291cmNlPXd3dy5iaW5nLmNvbSZtZWRpdW09cmVmZXJyYWwmY2FtcGFpZ249KG5vdCBzZXQpJmNvbnRlbnQ9KG5vdCBzZXQpJnRpbWVzdGFtcD0xNTA0NzE2MDY1&attribution_sig=7f33be39c4986e04cb16f6a41e83e170e6657778642d9fc71ee6b58a1cab1550"
$foxFile = "C:\temp\firefox.exe"
$webclient.DownloadFile($foxUrl, $foxFile)
$foxP = Start-Process $foxFile 

#http://www.google.com/chrome/eula.html?system=true&standalone=1&platform=win64

<#
$p.HasExited
$pbiP.HasExited
$gitP.HasExited
$foxP.HasExited

$gitP.ExitCode
$pbiP.ExitCode
$p.ExitCode
$foxP.ExitCode
#>


