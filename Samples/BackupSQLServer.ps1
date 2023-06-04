$SkipDBs = @('master','model','msdb','tempdb')
Get-SqlDatabase -ServerInstance STONEFIELDSOFTW\SQLEXPRESS | Where { $SkipDBs -NotContains $_.Name } | 
	foreach { Backup-SqlDatabase -DatabaseObject $_ -BackupFile "C:\SQLBackup\$($_.Name).bak" }
$compress = @{
  Path = "C:\SQLBackup\*.*"
  CompressionLevel = "Fastest"
  DestinationPath = "C:\ActBackup\BackupSQL $(get-date -f yyyy-MM-dd).Zip"
}
Compress-Archive -Force @compress
