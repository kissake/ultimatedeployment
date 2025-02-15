<?xml version="1.0" encoding="utf-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
    <settings pass="windowsPE">
       <component name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <InputLocale>[LANGUAGE]</InputLocale>
            <SystemLocale>[LANGUAGE]</SystemLocale>
            <UILanguage>[LANGUAGE]</UILanguage>
            <UserLocale>[LANGUAGE]</UserLocale>
        </component>
       <component name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <InputLocale>[LANGUAGE]</InputLocale>
            <SystemLocale>[LANGUAGE]</SystemLocale>
            <UILanguage>[LANGUAGE]</UILanguage>
            <UserLocale>[LANGUAGE]</UserLocale>
        </component>
         <component name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <ImageInstall>
                <OSImage>
                    <WillShowUI>OnError</WillShowUI>
                    <InstallTo>
                      <DiskID>0</DiskID>
                      <PartitionID>2</PartitionID>
                    </InstallTo>
                    <InstallFrom>
                        <Path>i:\[OS]\[FLAVOR]\sources\install.wim</Path>
                        <MetaData wcm:action="add">
                            <Key>/IMAGE/INDEX</Key>
                            <Value>[IMAGEID]</Value>
                        </MetaData>
                    </InstallFrom>
                </OSImage>
            </ImageInstall>
            <UserData>
                <AcceptEula>true</AcceptEula>
                <ProductKey>
                  <Key></Key>
                  <WillShowUI>Never</WillShowUI>
                </ProductKey>
            </UserData>
            <WindowsDeploymentServices>
                <Login>
                    <WillShowUI>OnError</WillShowUI>
                    <Credentials>
                        <Username>Administrator</Username>
                        <Domain>domain.com</Domain>
                        <Password>Password1</Password>
                    </Credentials>
                </Login>
            </WindowsDeploymentServices>
        </component>
        <component name="Microsoft-Windows-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <ImageInstall>
                <OSImage>
                    <WillShowUI>OnError</WillShowUI>
                    <InstallTo>
                    <DiskID>0</DiskID>
                    <PartitionID>2</PartitionID>
                    </InstallTo>
                    <InstallFrom>
                        <Path>i:\[OS]\[FLAVOR]\sources\install.wim</Path>
                        <MetaData wcm:action="add">
                            <Key>/IMAGE/INDEX</Key>
                            <Value>[IMAGEID]</Value>
                        </MetaData>
                    </InstallFrom>
                </OSImage>
            </ImageInstall>
            <UserData>
                <AcceptEula>true</AcceptEula>
                <ProductKey>
                  <Key></Key>
                  <WillShowUI>Never</WillShowUI>
                </ProductKey>
            </UserData>
            <WindowsDeploymentServices>
                <Login>
                    <WillShowUI>OnError</WillShowUI>
                    <Credentials>
                        <Username>Administrator</Username>
                        <Domain>domain.com</Domain>
                        <Password>Password1</Password>
                    </Credentials>
                </Login>
            </WindowsDeploymentServices>
        </component>
    </settings>
    <settings pass="oobeSystem">
       <component name="Microsoft-Windows-International-Core" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <InputLocale>[LANGUAGE]</InputLocale>
            <SystemLocale>[LANGUAGE]</SystemLocale>
            <UILanguage>[LANGUAGE]</UILanguage>
            <UserLocale>[LANGUAGE]</UserLocale>
        </component>
       <component name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <InputLocale>[LANGUAGE]</InputLocale>
            <SystemLocale>[LANGUAGE]</SystemLocale>
            <UILanguage>[LANGUAGE]</UILanguage>
            <UserLocale>[LANGUAGE]</UserLocale>
        </component>
         <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <FirstLogonCommands>
                <SynchronousCommand wcm:action="add">
                    <Order>1</Order>
                    <CommandLine>REG ADD "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff" /F</CommandLine>
                    <Description>No New Network Block</Description>
                    <RequiresUserInput>true</RequiresUserInput>
                </SynchronousCommand>
            </FirstLogonCommands>    
            <OOBE>
                <ProtectYourPC>3</ProtectYourPC>
                <NetworkLocation>Other</NetworkLocation>
                <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
                <SkipMachineOOBE>true</SkipMachineOOBE>
                <SkipUserOOBE>true</SkipUserOOBE>
            </OOBE>
            <UserAccounts>
                <LocalAccounts>
                    <LocalAccount wcm:action="add">
                        <Password>
                            <Value></Value>
                            <PlainText>true</PlainText>
                        </Password>
                        <Name>admin</Name>
                        <Group>Administrators</Group>
                    </LocalAccount>
                </LocalAccounts>
            </UserAccounts>
            <TimeZone>GMT Standard Time</TimeZone>
        </component>
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <FirstLogonCommands>
                <SynchronousCommand wcm:action="add">
                    <Order>1</Order>
                    <CommandLine>REG ADD "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff" /F</CommandLine>
                    <Description>No New Network Block</Description>
                    <RequiresUserInput>true</RequiresUserInput>
                </SynchronousCommand>
            </FirstLogonCommands>    
            <OOBE>
                <ProtectYourPC>3</ProtectYourPC>
                <NetworkLocation>Other</NetworkLocation>
            </OOBE>
            <UserAccounts>
                <LocalAccounts>
                    <LocalAccount wcm:action="add">
                        <Password>
                            <Value></Value>
                            <PlainText>true</PlainText>
                        </Password>
                        <Name>User1</Name>
                        <Group>Administrators</Group>
                    </LocalAccount>
                </LocalAccounts>
            </UserAccounts>
            <TimeZone>GMT Standard Time</TimeZone>
       </component>
    </settings>
    <cpi:offlineImage cpi:source="wim:i:/[OS]/[FLAVOR]/sources/install.wim#Windows 7 HOMEPREMIUM" xmlns:cpi="urn:schemas-microsoft-com:cpi" />
</unattend>
