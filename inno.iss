#define AppName "FFmpeg"
#define AppVersion "4.3.1"
#define GitReleace "https://github.com/ProjectSoft-STUDIONIONS/ffmpegInstaller/releases"
#define AppCopyright "Copyright © 2020 ffmpeg.org"
#define AppPublisher "https://ffmpeg.org/"
#define AppUrl "https://ffmpeg.org/"
#define AppEmail "ffmpeg-user-owner@ffmpeg.org"
#define InstallBuilder "ProjectSoft"
#define InstallBuilderUrl "https://projectsoft.ru/"

[Setup]
AppId={{08BEAACF-0F07-44F4-9E70-B02AA9C49DF9}
AppName={#AppName}
AppVersion={#AppVersion}
AppCopyright={#AppCopyright}
AppMutex={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppContact={#AppEmail}
AppComments=—борка инстал€ции дл€ программы {#AppName}

VersionInfoVersion={#AppVersion}
VersionInfoCompany={#AppName}
VersionInfoDescription=—борка инстал€ции дл€ программы {#AppName}
VersionInfoTextVersion={#AppVersion}
VersionInfoCopyright={#AppCopyright}
DefaultDirName={sd}\ffmpeg
UninstallDisplayIcon={app}\icon.ico
DefaultGroupName={#AppName} 

SolidCompression=true
Compression=lzma/ultra

OutputDir=installer
OutputBaseFilename=ffmpeg_install

WizardImageFile=iss/wizard.bmp
WizardSmallImageFile=iss/icon.bmp

SetupIconFile=iss/ffmpeg.ico
UninstallDisplayName=”далить {#AppName}

DisableWelcomePage=False
DisableReadyPage=true
DisableReadyMemo=true
DisableFinishedPage=false
FlatComponentsList=false
AlwaysShowComponentsList=false
ShowComponentSizes=false
WindowShowCaption=false
WindowResizable=false
UsePreviousAppDir=false
UsePreviousGroup=false
AppendDefaultDirName=false
BackSolid=true
WindowStartMaximized=false
DisableProgramGroupPage=true
DisableDirPage=true
ShowLanguageDialog=no

VersionInfoProductName={#AppName}
VersionInfoProductVersion={#AppVersion}
VersionInfoProductTextVersion={#AppName} v{#AppVersion}

ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

PrivilegesRequired=admin
ChangesEnvironment=yes

[Languages] 
Name: rus; MessagesFile: "compiler:Languages\Russian.isl"
Name: en; MessagesFile: "compiler:Default.isl"

[CustomMessages]
en.AddaPathMessage=Add the path to the application in the system variable PATH (recommended)
rus.AddaPathMessage=ƒобавьте путь к приложению в системную переменную PATH (рекомендуетс€)

[Files]
Source: iss\ffmpeg.ico; DestDir: {app}; DestName: ffmpeg.ico
Source: bin\win64\ffmpeg.exe; DestDir: {app}; DestName: ffmpeg.exe; Check: Is64BitInstallMode
Source: bin\win64\ffplay.exe; DestDir: {app}; DestName: ffplay.exe; Check: Is64BitInstallMode
Source: bin\win64\ffprobe.exe; DestDir: {app}; DestName: ffprobe.exe; Check: Is64BitInstallMode

[Tasks]
Name: add_ffmpeg_path; Description: "{cm:AddaPathMessage}"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"

[Icons]
Name: {group}\{cm:UninstallProgram, FFmpeg}; Filename: {uninstallexe}

[Run]
Filename: "{sys}\rundll32.exe"; WorkingDir: "{sys}"; Parameters: "user32.dll,UpdatePerUserSystemParameters"; StatusMsg: "Registering Module...";
[UninstallRun]
Filename: "{sys}\rundll32.exe"; WorkingDir: "{sys}"; Parameters: "user32.dll,UpdatePerUserSystemParameters"; StatusMsg: "Registering Module...";

[Code]

const
	ModPathName = 'add_ffmpeg_path';
	ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
	setArrayLength(Result, 1)
	Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"