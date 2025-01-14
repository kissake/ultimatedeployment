@ECHO OFF 

set UDA_IPADDR=%1
set UDA_TEMPLATE=%2
set UDA_SUBTEMPLATE=%3

echo UDA_IPADDR=%UDA_IPADDR%
echo UDA_TEMPLATE=%UDA_TEMPLATE%
echo UDA_SUBTEMPLATE=%UDA_SUBTEMPLATE%

echo Subtemplate information can be found in
echo I:\pxelinux.cfg\templates\%UDA_TEMPLATE%\subtemplates.txt

SET UDADIR=%SYSTEMDRIVE%\sources\uda
SET INSTALLDRIVE=I
SET DISKPART=%SYSTEMDRIVE%\windows\system32\diskpart.exe
SET DISKPARTTXT=%UDADIR%\diskpart.txt
SET UNATTEND=%INSTALLDRIVE%:\pxelinux.cfg\templates\%UDA_TEMPLATE%\%UDA_SUBTEMPLATE%.xml
SET REGEXE=%SYSTEMDRIVE%\windows\system32\reg.exe

cd %UDADIR%

echo Preparing the diskpart file
if exist %SYSTEMDRIVE%\windows\system32\uda.opt goto EFI

:BIOS
echo BIOS selected
echo select disk 0                                   >%DISKPARTTXT%
echo clean                                           >>%DISKPARTTXT%
echo convert mbr >>%DISKPARTTXT%
echo create partition primary size=1 >>%DISKPARTTXT%
echo create partition primary >>%DISKPARTTXT%
echo select partition 2 >>%DISKPARTTXT%
echo active >>%DISKPARTTXT%
echo assign letter=c >>%DISKPARTTXT%
echo format fs=ntfs LABEL=^"Windows^" QUICK OVERRIDE >>%DISKPARTTXT%
echo exit                                            >>%DISKPARTTXT%
goto DISKPART

:EFI
echo EFI selected
echo select disk 0 >%DISKPARTTXT%
echo clean >>%DISKPARTTXT%
echo convert gpt >>%DISKPARTTXT%
echo create partition efi size=200 >>%DISKPARTTXT%
echo create partition primary >>%DISKPARTTXT%
echo select partition 2 >>%DISKPARTTXT%
echo active >>%DISKPARTTXT%
echo assign letter=c >>%DISKPARTTXT%
echo format fs=ntfs LABEL=^"Windows^" QUICK OVERRIDE >>%DISKPARTTXT%
echo exit >>%DISKPARTTXT%
goto DISKPART

:DISKPART
echo.
echo Partioning the disk
%DISKPART% /s %DISKPARTTXT%

echo.
echo Removing PXE information from registry to prevent WDS installation
%REGEXE% delete HKLM\SYSTEM\CurrentControlSet\Control\PXE /f

echo Sleeping for 10 seconds and starting vds service to prevent 'Windows could not retrieve information about the disks on this computer' error
%SYSTEMDRIVE%\windows\system32\ping.exe -n 11 localhost > nul
%SYSTEMDRIVE%\windows\system32\net.exe start vds

echo.
echo Starting setup with unattend file %UNATTEND%
%SYSTEMDRIVE%\setup.exe /unattend:%UNATTEND%

