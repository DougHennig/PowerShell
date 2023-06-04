# Allow scripts to run; this needs to be executed in the console pane.
#Set-ExecutionPolicy unrestricted -Scope CurrentUser

# Download and install Chocolatey
Invoke-Expression ((new-object net.webclient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Add Chocolatey to the path so we can run it from anywhere
set PATH=%PATH%;%systemdrive%\chocolatey\bin

# Start installing apps
choco install Filezilla
choco install GoogleChrome
choco install NotepadPlusPlus