Param(
    [parameter(Mandatory = $true)] 
    [ValidateNotNullOrEmpty()]
    [string]$sourceFolder
)

# Get the name of the zip file.
$zipFileName = $sourceFolder + "\Backup\Backup_$(Get-Date -f yyyy-MM-dd).zip"

try
{ 
    # Create the Backup folder if it doesn't exist.
    $exists = Test-Path ($sourceFolder + "\Backup")
    if (-not $exists)
    {
        md ($sourceFolder + "\Backup")
    }

    # Zip all the files in the folder.
    $compress = @{
      Path = $sourceFolder + "\*.*"
      CompressionLevel = "Fastest"
      DestinationPath = $zipFileName
    }
    Compress-Archive -Force @compress

    # Check for errors
    if ($?)
    { 
        Write-Host "Backup successful"
    }
    else
    { 
        Write-Host "Backup failed"
    } 
}

catch
{
    Write-Host "Error occurred at $(Get-Date): $($Error[0].Exception.Message)"
} 

finally
{
    Write-Host "Backup finished at $(Get-Date)"
} 
