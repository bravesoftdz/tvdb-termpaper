#define MyAppName "TV Database"
#define MyAppVerName "TV Database 2.0"
#define MyAppPublisher "Роман Рождественский"
#define MyAppURL "http://rozhdestvenskiy.ru"
#define MyAppExeName "TVDatabase.exe"

[Setup]
AppId={{9272F83A-A2FF-4282-A866-21FCCDDB3A7A}
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\TVDatabase
DefaultGroupName={#MyAppName}
AllowNoIcons=true
OutputDir=C:\Users\sbmaxx\Documents\Termpaper\install\output
OutputBaseFilename=TVDatabaseSetup
SetupIconFile=C:\Users\sbmaxx\Documents\Termpaper\TermPaper - TV Data\Apple-TV.ico
Compression=lzma/ultra64
SolidCompression=true
InternalCompressLevel=ultra64
SetupLogging=true
UninstallDisplayIcon={app}\TVDatabase.exe

[Languages]
Name: english; MessagesFile: compiler:Default.isl
Name: russian; MessagesFile: compiler:Languages\Russian.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: dsninstall; Description: {cm:InstallDSN}; Components: MySQL_ODBC; GroupDescription: {cm:MySQLGroup}
Name: startmysql; Description: {cm:StartMysql}; Components: MYSQL_PORTABLE; GroupDescription: {cm:MySQLGroup}

[Files]
Source: ..\binary\*; DestDir: {app}; Components: Binaries; Flags: recursesubdirs createallsubdirs
Source: ..\sources\*; DestDir: {app}\sources; Components: Sources; Flags: recursesubdirs createallsubdirs
Source: ..\sql\tvdatabase.sql.gz; DestDir: {app}\sql; Components: Sources
Source: ..\odbc\*; DestDir: {app}\odbc; Components: MySQL_ODBC
Source: ..\mysql\*; DestDir: {app}\mysql; Components: MySQL_Portable; Flags: recursesubdirs createallsubdirs
Source: ..\icons\*; DestDir: {app}\icons; Components: MySQL_Portable
Source: ..\odbc\myodbc5.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall; Components: MYSQL_ODBC
Source: ..\odbc\myodbc5S.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall; Components: MYSQL_ODBC


[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {group}\Справка; Filename: {app}\Help.chm
Name: {userdesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon
Name: {userdesktop}\MySQL Start; Filename: {app}\mysql\mysql_start.bat; IconFilename: {app}\icons\green.ico; WorkingDir: {app}\mysql; Components: MYSQL_PORTABLE
Name: {userdesktop}\MySQL Stop; Filename: {app}\mysql\mysql_stop.bat; IconFilename: {app}\icons\red.ico; WorkingDir: {app}\mysql; Components: " MySQL_Portable"

[Run]
Filename: {app}\odbc\install-tvdatabase.bat; Components: MySQL_ODBC; Tasks: dsninstall; Flags: waituntilidle; WorkingDir: {app}\odbc
Filename: {app}\mysql\mysql_start.bat; Components: MySQL_Portable; Tasks: startmysql; Languages: ; Flags: shellexec; WorkingDir: {app}\mysql
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent

[Dirs]
Name: {app}\odbc; Tasks: ; Languages: ; Components: MySQL_ODBC
Name: {app}\sources; Components: Sources; Tasks: 
Name: {app}\mysql; Components: " MySQL_Portable"; Tasks: 
Name: {app}\icons; Components: " MySQL_Portable"; Tasks: 
Name: {app}\sources; Components: Sources; Tasks: 

[Components]
Name: Binaries; Description: {cm:Binaries}; Flags: fixed; Types: compact custom full
Name: Sources; Description: {cm:Sources}; Types: full compact
Name: MySQL_ODBC; Description: {cm:ODBC}; Types: full
Name: MySQL_Portable; Description: {cm:MYSQL}; Types: full

[CustomMessages]
russian.InstallDSN=Прописать источник данных для базы данных MySQL
english.InstallDSN=Setup datasource for MySQL database

russian.Binaries=Исполняемые файлы программы и справочная система
english.Binaries=Execution files and help system

russian.Sources=Исходные файлы проекта Delphi и дамп базы MySQL
english.Sources=Delphi's source files and MySQL's database dump

russian.ODBC=Установить MySQL ODBC коннектор
english.ODBC=Install MySQL ODBC connector

russian.MySQL=Установить портативную версию MySQL
english.MySQL=Install MySQL portable

russian.StartMysql=Запустить портативную версию MySQL
english.StartMysql=Start MySQL portable
MySQLGroup=MySQL
[UninstallRun]
Filename: {app}\odbc\uinstall-tvdatabase.bat; WorkingDir: {app}\odbc\; Components: MySQL_ODBC; Tasks: 
