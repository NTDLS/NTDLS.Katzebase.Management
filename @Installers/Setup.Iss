[Setup]
;-- Main Setup Information
 AppName                          = Katzebase Management
 AppVerName                       = Katzebase Management 0.11.0
 AppCopyright                     = Copyright © 2024 NetworkDLS.
 DefaultDirName                   = {commonpf}\NetworkDLS\Katzebase\Management
 DefaultGroupName                 = NetworkDLS\Katzebase
 UninstallDisplayIcon             = {app}\NTDLS.Katzebase.Management.exe
 SetupIconFile                    = "..\@Art\Icon.ico"
 PrivilegesRequired               = admin
 Uninstallable                    = Yes
 MinVersion                       = 0.0,7.0
 Compression                      = bZIP/9
 ChangesAssociations              = Yes
 OutputBaseFilename               = Katzebase_Management
 ArchitecturesInstallIn64BitMode  = x64

;-- Windows 2000 & XP (Support Dialog)
 AppPublisher    = NetworkDLS
 AppPublisherURL = http://www.NetworkDLS.com/
 AppUpdatesURL   = http://www.NetworkDLS.com/
 AppVersion      = 0.11.0

[Files]
 Source: "..\NTDLS.Katzebase.Management\bin\Release\net8.0-windows\*.exe";        DestDir: "{app}";                       Flags: IgnoreVersion;                 
 Source: "..\NTDLS.Katzebase.Management\bin\Release\net8.0-windows\*.dll";        DestDir: "{app}";                       Flags: IgnoreVersion;                 
 Source: "..\NTDLS.Katzebase.Management\bin\Release\net8.0-windows\*.json";       DestDir: "{app}";                       Flags: IgnoreVersion;                
 Source: "..\NTDLS.Katzebase.Management\bin\Release\net8.0-windows\Runtimes\*.*"; DestDir: "{app}\MSSQLMigrate\Runtimes"; Flags: IgnoreVersion recursesubdirs; 
 Source: ".\Highlighters\*.*";                                                    DestDir: "{app}\Highlighters";          Flags: IgnoreVersion;                

[Icons]
 Name: "{group}\Katzebase Manager";               Filename: "{app}\NTDLS.Katzebase.Management.exe";                               
 Name: "{commondesktop}\Katzebase Manager";       Filename: "{app}\NTDLS.Katzebase.Management.exe";                               
 Name: "{userdesktop}\Katzebase Manager";         Filename: "{app}\NTDLS.Katzebase.Management.exe";                               

[Registry]
;-- Create SS "Katzebase SQL Script" Association
 Root: HKCR; Subkey: ".kbs"; Flags: uninsdeletekey;
 Root: HKCR; Subkey: ".kbs"; ValueType: string; ValueData: "KatzebaseScript";
 Root: HKCR; Subkey: "KatzebaseScript"; Flags: uninsdeletekey;
 Root: HKCR; Subkey: "KatzebaseScript"; ValueType: string; ValueData:"Katzebase Script";
 Root: HKCR; Subkey: "KatzebaseScript\Shell"; ValueType: string; ValueData:"Open";
 Root: HKCR; Subkey: "KatzebaseScript\Shell\Open\Command"; Flags: uninsdeletekey; 
 Root: HKCR; Subkey: "KatzebaseScript\Shell\Open\Command"; ValueType: string; ValueData:"""{app}\NTDLS.Katzebase.Management.exe"" ""%1""";
 Root: HKCR; Subkey: "KatzebaseScript\DefaultIcon"; Flags: uninsdeletekey;
 Root: HKCR; Subkey: "KatzebaseScript\DefaultIcon"; ValueType: string; ValueData:"{app}\NTDLS.Katzebase.Management.exe,1";

 Root: HKLM; Subkey: "Software\NetworkDLS\Katzebase\Management";                                                             Flags: uninsdeletekey noerror;
 Root: HKLM; Subkey: "Software\NetworkDLS\Katzebase\Management\"; ValueType: string; ValueName: "Path";   ValueData:"{app}"; Flags: CreateValueIfDoesntExist;

[Run]
 Filename: "{app}\NTDLS.Katzebase.Management.exe"; Description: "Run Katzebase Manager now?"; Flags: postinstall nowait skipifsilent shellexec;
