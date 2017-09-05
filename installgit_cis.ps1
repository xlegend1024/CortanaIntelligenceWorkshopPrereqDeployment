
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe"
$storageDir = $env:TEMP
$arg='/SILENT'

$webclient = New-Object System.Net.WebClient
$file = "$storageDir\Git-2.14.1-64-bit.exe"
$webclient.DownloadFile($gitUrl,$file)

$p = Start-Process $file -ArgumentList $arg -wait -NoNewWindow -PassThru
$p.HasExited
$p.ExitCode

$webappUrl = "https://github.com/xlegend1024/AdventureWorksTravel.git"
$cloneDir = "C:\myWebApp"
$gitArg = "clone $webappUrl --separate-git-dir=$cloneDir"
$gitP = Start-Process "git.exe" -ArgumentList $gitArg
$gitP.HasExited
$gitP.ExitCode

