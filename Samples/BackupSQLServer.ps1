$SkipDBs = @('master','model','msdb','tempdb')
Get-SqlDatabase -ServerInstance MyServer | Where { $SkipDBs -NotContains $_.Name } | 
	foreach { Backup-SqlDatabase -DatabaseObject $_ -BackupFile "C:\SQLBackup\$($_.Name).bak" }
$compress = @{
  Path = "C:\SQLBackup\*.bak"
  CompressionLevel = "Fastest"
  DestinationPath = "C:\Backups\BackupSQL $(get-date -f yyyy-MM-dd).Zip"
}
Compress-Archive -Force @compress
