# windows 11 post-installation-script

# update all pre installed packages
winget upgrade --all

# install winget packages
winget import packagelist.json

# files not included in winget
$downloadFiles = @{
    "https://download.amd.com/software/AMD_StoreMI.zip" = "c:\driver\StoreMI.zip";
    "https://prod.escapefromtarkov.com/launcher/download" = "c:\driver\bsg-launcher.exe";
}

# create download directory
echo "Creating directory to store files"
mkdir c:\driver

# download files from external sources
echo "`v ---Starting external downloads--- `v"
foreach ($link in $downloadFiles.Keys)
{
    echo "Downloading: $link"
    Invoke-WebRequest -Uri $link -OutFile $downloadFiles[$link]
}

# links to amd drivers
echo "`vAMD-Driver:"
echo "Chipset: https://www.amd.com/en/support/chipsets/amd-socket-am4/b450"
echo "GPU: https://www.amd.com/en/support/graphics/radeon-500-series/radeon-rx-500-series/radeon-rx-580 `v"