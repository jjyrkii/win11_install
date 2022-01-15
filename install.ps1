# windows 11 post-installation-script

# update all pre installed packages
#winget upgrade --all

# install packages
#winget import packagelist.json

$downloadFiles = @{
    "https://download.amd.com/software/AMD_StoreMI.zip" = "c:\driver\StoreMI.zip";
    "https://prod.escapefromtarkov.com/launcher/download" = "c:\driver\bsg-launcher.exe";
    "https://www.netacad.com/portal/resources/file/a1a73d9d-5af7-4162-9a52-0746d39c2dd4" = "c:\driver\packettracer.exe";

}
echo "Creating directory to store files"
mkdir c:\driver

echo "`v ---Starting external downloads--- `v"
foreach ($link in $downloadFiles.Keys)
{
    echo "Downloading: $link"
#    Invoke-WebRequest -Uri $link -OutFile $downloadFiles[$link]
}

echo "`vAMD-Driver:"
echo "Chipset: https://www.amd.com/en/support/chipsets/amd-socket-am4/b450"
echo "GPU: https://www.amd.com/en/support/graphics/radeon-500-series/radeon-rx-500-series/radeon-rx-580 `v"