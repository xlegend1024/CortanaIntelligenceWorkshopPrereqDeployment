
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe"
$storageDir = $env:TEMP
$arg='/SILENT'

$webclient = New-Object System.Net.WebClient
$file = "$storageDir\Git-2.14.1-64-bit.exe"
$dataUrl="https://hyssh0mtc0sea.blob.core.windows.net/awtworkshopdata/AWT.CSV"
$datafile = "C:\data\1.MachineLearning\awt_flightsandweather.csv"
$fnwUrl = "http://aka.ms/flightsandweather"
$flightandweatherfile = "C:\data\flightsandweather.csv"
$webclient.DownloadFile($gitUrl,$file)
$webclient.DownloadFile($dataUrl,$datafile)
$webclient.DownloadFile($fnwUrl,$flightandweatherfile)


$webappUrl = "https://github.com/xlegend1024/AdventureWorksTravel.git"
$cloneDir = "C:\myWebApp"
$gitArg = "clone $webappUrl --separate-git-dir=$cloneDir"

$p = Start-Process $file -ArgumentList $arg -wait -NoNewWindow -PassThru
$gitP = Start-Process "git.exe" -ArgumentList $gitArg

$p.HasExited
$gitP.HasExited

$gitP.ExitCode
$p.ExitCode

