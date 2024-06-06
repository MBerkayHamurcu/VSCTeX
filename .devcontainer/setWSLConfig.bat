@echo off
cd %USERPROFILE%
IF NOT EXIST .wslconfig (
    echo # Settings apply across all Linux distros running on WSL ^2>.wslconfig
    echo [wsl2]>>.wslconfig
    echo.>>.wslconfig
    echo # Limits VM memory to use no more than ^4 GB, this can be set as whole numbers using GB or MB>>.wslconfig
    echo memory=3GB>>.wslconfig
    echo.>>.wslconfig
    echo # Sets the VM to use four virtual processors>>.wslconfig
    echo processors=^2>>.wslconfig
    echo.>>.wslconfig
    echo # Sets amount of swap storage space to ^0GB, default is ^25 percent of available RAM>>.wslconfig
    echo swap=8GB>>.wslconfig
    echo.>>.wslconfig
    echo # Turn off default connection to bind WSL ^2 localhost to Windows localhost>>.wslconfig
    echo localhostforwarding=false>>.wslconfig
    echo.>>.wslconfig
    echo # Enabled nested virtualization>>.wslconfig
    echo nestedVirtualization=true>>.wslconfig
    echo.>>.wslconfig
    echo # Turns off output console showing contents of dmesg when opening a WSL ^2 distro for debugging>>.wslconfig
    echo debugConsole=false>>.wslconfig
    echo.>>.wslconfig
    echo # Boolean to turn on or off support for GUI applications ^(WSLg^) in WSL. Only available for Windows ^11>>.wslconfig
    echo guiApplications=false>>.wslconfig
    echo.>>.wslconfig
    echo Created .wslconfig file in the user directory.
) ELSE (
    echo .wslconfig file already exists in the user directory.
)

echo.
echo Press any key to close this window...
pause >nul
