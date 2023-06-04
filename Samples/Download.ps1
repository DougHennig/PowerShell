$web = New-Object Net.WebClient
$web.DownloadFile("https://www.prairiedevcon.com/assets/images/speakers/doughennig.jpg", "$((Get-Location).Path)\Doug.jpg")
& mspaint.exe doug.jpg
