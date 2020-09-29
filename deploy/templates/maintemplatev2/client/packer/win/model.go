package win

var xml = `<?xml version="1.0" encoding='windows-1252'?>
<Wix xmlns="http://schemas.microsoft.com/wix/2006/wi">
    <Product Id="*"
        Name="{{.AppName}}"
        Language="1033"
        Version="1.0.0"
        Manufacturer="{{.AppName}} Company"
        UpgradeCode="58957637-ffe1-418c-8ab1-af42e036290d">
        
        <Package Id="*" InstallerVersion="100"
            Compressed="yes"
            InstallScope="perMachine"
            Manufacturer="{{.AppName}} Company"
            Description="Installs {{.AppName}} Software"
            Keywords="Practice,Installer,MSI"
            Comments="(c) 2020 {{.AppName}} Company"/>

        <MediaTemplate EmbedCab="yes" />    
        <UIRef Id="WixUI_Minimal"/>
        <Directory Id="TARGETDIR" Name="SourceDir">
            <Directory Id="ProgramFilesFolder">
                <Directory Id="{{.AppName}}" Name="{{.AppName}}" />
            </Directory>

            <Directory Id="ProgramMenuFolder">
                <Directory Id="ApplicationProgramsFolder" Name="{{.AppName}}"/>
            </Directory>
                
        </Directory>

        <DirectoryRef Id="ApplicationProgramsFolder">
            <Component Id="ApplicationShortcut" Guid="*">
                <Shortcut Id="ApplicationStartMenuShortcut" 
                    Name="{{.AppName}}" 
                    Description="My Application Description"
                    Target="[#{{.AppName}}.exe]"
                    WorkingDirectory="APPLICATIONROOTDIRECTORY"/>
                <RemoveFolder Id="ApplicationProgramsFolder" On="uninstall"/>
                <RegistryValue Root="HKCU" Key="Software\GetCourageNow\{{.AppName}}" Name="installed" Type="integer" Value="1" KeyPath="yes"/>
           </Component>
        </DirectoryRef>

        <DirectoryRef Id="{{.AppName}}">
            <Component Id="CMP_{{.AppName}}" Guid="*">
                <File Id="{{.AppName}}.exe" Source="{{.AppName}}.exe" KeyPath="yes"/>
            </Component>
        </DirectoryRef>

        <Feature Id="MainApplication" Title="{{.AppName}}" Level="1">
                <ComponentRef Id='CMP_{{.AppName}}' />
                <ComponentRef Id="ApplicationShortcut" /> 
        </Feature>
    </Product>
</Wix>
`
