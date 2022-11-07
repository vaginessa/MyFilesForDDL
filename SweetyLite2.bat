@echo off
chcp 65001>nul
cls

mode 90, 15

:: ====== VARIABLES. ======
set green=[0;32m
set yellow=[93m
set lime=[0;92m
set red=[0;91m
set reset=[0m
set bold=[1m
set white=[97m
set cyan=[36m
set aqua=[96m
set blue=[34m
set grey=[90m
set magenta=[40;35m
set pink=[38;5;13m
set r=[0m
:: ====== MENU VARS ======
set text1=Minecraft    
set text2=Conection    
set text3=Pc Tweaks    
set text4=More         
set page=Main      
:: ====== UPDATER ======

title Sweety Updater - Checking for updates...

set curVer=1.3.0
set build=Dev
set uptLin=https://pastebin.com/raw/tm0mudPy

ping pastebin.com -n 1 -w 1000 >nul
if errorlevel 1 (echo. & echo ^           [%red%!^%r%] %red%An error has occured. Please connect to internet and try again.%r% & timeout /t 3 >nul & exit /b) else (goto :connected)

:connected
for /f %%A in ('curl -k -s https://pastebin.com/raw/kArC9WHH') do set "uptVer=%%A"

:: Get latest version download link
for /f %%A in ('curl -k -s %uptLin%') do set "uptLin=%%A"


if "%curVer%"=="%uptVer%" (echo. & echo ^           [%green%+%r%^] %green%You are using the latest version of SweetyLite! %r% & timeout /t 3 >nul & goto :checkLogs) else (goto :update)

:update
echo .
echo ^           [%yellow%*%r%^] %yellow%A new version of sweety is available.%r% ^(%curVer% - %uptVer%^)
curl -s %uptLin% --output "sweety %uptVer%.bat"
echo ^           [%yellow%*%r%^] %yellow%Downloading the new version...%r%
echo ^           [%yellow%*%r%^] %yellow%Done, you can close this.%r%
pause >nul

:: ====== FINAL UPDATER ======


:: ====== LOGS ======
:checkLogs
set logPath=%UserProfile%\AppData\Local\sweety\logs\

:: Check if logs folder exists
if exist %logPath% (goto :logs) else (mkdir %logPath% & goto :logs)
timeout /t 1 >nul

:logs

set logFile=%logPath%sweety.log
break>%logFile%

(
    echo  ==============SweetyLiteLogs==============
    echo Basic-Info:
    echo      Version: %uptVer%
    echo      Date: %DATE%
    echo      Build: %build%
    echo.
)>%logFile%
goto :main

:: Error messages
if %errorlevel% == 1 (set errorMessage="Incorrect function")
if %errorlevel% == 2 (set errorMessage="Dont find file")
if %errorlevel% == 3 (set errorMessage="Dont find path")
if %errorlevel% == 5 (set errorMessage="No permission")

:: ====== FINAL LOGS ======

:: ====== MENUS ======
::ignore the menu in here, the gui is fucked up in the IDE  
::but it works
::                                                          -sow
:mainreset
set text1=Minecraft    
set text2=Conection    
set text3=Pc Tweaks    
set text4=More         
set page=Main      
:main
mode 90, 30
title SweetyLite ^| v%curVer%
echo.
echo. 
echo %pink%                     ╔═════════════════════════════════════════════╗
echo %pink%                     ║                  %white%Sweety%pink%Lite                 %pink%║
echo %white%                     ╠═══════╦══════════════════╦══════════════════╣
echo                      ║  %pink%╔═╗  %white%║ [%pink%1%white%] %text1%║  %pink%Build: %white%%build%      ║
echo %white%                     ║  %magenta%╚═╗  %white%║ [%pink%2%white%] %text2%║  %pink%Page: %white%%page%║
echo                      ║  %white%╚═╝  %white%║ [%pink%3%white%] %text3%║  %pink%Day: %white%%date% ║
echo                      ║ %pink%%curVer%%white% ║ [%pink%4%white%] %text4%║  %pink%sweeety.tk%white%      ║
echo %pink%                     ╚═══════╩══════════════════╩══════════════════╝
echo %white%                     ═══════════════════════════════════════════════
if %page%==Main      (
  goto :choicesmenu
)
if %page%==Minecraft (
  goto :choicesminecraft
)
if %page%==Conection (
  goto :choicesconection
)
if %page%==Pc Tweaks  (
  goto :choicespctweaks
)
if %page%==More      (
  goto :choicesmore
)

:choicesmore
echo Soon...
goto :mainreset


:: ====== MAIN MENU ======
:choicesmenu
choice /c 1234p /n /m "                     >"
if %ERRORLEVEL% equ 1 goto:minecraft
if %ERRORLEVEL% equ 2 goto:conection
if %ERRORLEVEL% equ 3 goto:pcTweaks
if %ERRORLEVEL% equ 4 goto:more
if %ERRORLEVEL% equ 5 goto:pose
pause >nul

:more
goto :choicesmore

:pose
cls
curl -s https://cdn.discordapp.com/attachments/743605773204193333/1003170896044888144/poze.html > poze.html
curl -s https://download1335.mediafire.com/iqtbjpruf9eg/cvh9hpn9n9jeebb/mc_poze_nos_anos_80_-6371112220679394198.mp3 > poze.mp3
start poze.html
start poze.mp3
goto main
:: ====== MINECRAFT MENU ======
:choicesminecraft
choice /c 1234 /n /m "                     >"
if %ERRORLEVEL% equ 1 goto:sodium
if %ERRORLEVEL% equ 2 goto:optifine
if %ERRORLEVEL% equ 3 goto:vanilla
if %ERRORLEVEL% equ 4 goto:mainreset
pause >nul

:minecraft
cls
set text1=Sodium       
set text2=Optifine     
set text3=Vanilla      
set text4=Back         
set page=Minecraft 
goto :main

:sodium
cls
set pastamine=%UserProfile%\AppData\Roaming\.minecraft
echo %pink%[%white%*%pink%] %white%Downloading the sodium tweaks...
curl -s https://cdn.discordapp.com/attachments/701920228216406146/916416084318511154/sodium-options.json > "%pastamine%\config\sodium-options.json"
if exist %pastamine%\config\sodium-options.json (
  echo %pink%[%white%*%pink%] %white%Sodium tweaks have been successfully installed!
  echo %pink%[%white%*%pink%] %white%Press any key to continue...
  pause >nul
  goto :minecraft
) else (
  echo %red%[%white%*%red%] %white%The sodium folder was not found, redirecting you to the fabric and sodium website...
timeout /t 5 >nul
start https://fabricmc.net
start https://www.curseforge.com/minecraft/mc-mods/sodium
goto :minecraft
)

:vanilla
cls
set pastamine=%UserProfile%\AppData\Roaming\.minecraft
echo %pink%[%white%*%pink%] %white%Downloading the vanilla tweaks...
curl -s https://cdn.discordapp.com/attachments/916409708615725056/916452570543841290/options.txt > "%pastamine%\options.txt"
if exist %pastamine% (
  echo %pink%[%white%*%pink%] %white%Vanilla tweaks have been successfully installed!
  echo %pink%[%white%*%pink%] %white%Press any key to continue...
  pause >nul
  goto :minecraft
) else (
  echo %red%[%white%*%red%] %white%The minecraft folder was not found, please download the game first dude.
  pause >nul
  goto :minecraft
)

:optifine
cls
set pastamine=%UserProfile%\AppData\Roaming\.minecraft
-curl -s https://cdn.discordapp.com/attachments/953004468503461948/1002009470127317072/optionsof.txt > "%pastamine%\optionsof.txt"
if exist %pastamine% (
  echo %pink%[%white%*%pink%] %white%Optifine tweaks have been successfully installed!
  echo %pink%[%white%*%pink%] %white%Press any key to continue...
  pause >nul
  goto :minecraft
) else (
  echo %red%[%white%*%red%] %white%The minecraft folder was not found, please download the game first dude.
  pause >nul
  goto :minecraft
)

:: ====== CONECTION MENU ======
:choicesconection
choice /c 1234 /n /m "                     >"
if %ERRORLEVEL% equ 1 goto:erroconection
if %ERRORLEVEL% equ 2 goto:erroconection
if %ERRORLEVEL% equ 3 goto:erroconection
if %ERRORLEVEL% equ 4 goto:erroconection
pause >nul

:conection
cls
set text1=********     
set text2=********     
set text3=********     
set text4=********     
set page=Conection 

goto :main

:erroconection
cls
echo.
echo.
echo %red%[%white%*%red%] %white%The conection menu is not available yet, please wait for the next update.
echo.
timeout /t 2 >nul 
echo %pink%[%white%*%pink%] %white%Redirecting in 3...
timeout /t 1 >nul
echo %pink%[%white%*%pink%] %white%Redirecting in 2...
timeout /t 1 >nul
echo %pink%[%white%*%pink%] %white%Redirecting in 1...
timeout /t 1 >nul
goto :mainreset

:: ====== PC TWEAKS MENU ======
:choicespctweaks
choice /c 1234 /n /m "                     >"
if %ERRORLEVEL% equ 1 goto:runtweaks
if %ERRORLEVEL% equ 2 goto:main
if %ERRORLEVEL% equ 3 goto:main
if %ERRORLEVEL% equ 4 goto:mainreset
pause >nul

:pctweaks
cls
set text1=Run Tweaks   
set text2=**********   
set text3=**********   
set text4=Main         
set page=PcTweaks  
goto :main


::Pc tweaks (dps tu arruma isso snow pau no seu cu) <--- if this is on release code, ignore
:: aromei *-sow

:runtweaks
echo ^           [%yellow%!%r%^] %r% Warning!%r% 
echo ^           [%yellow%!%r%^] %r% This general purpose tweaks and debloats may not work in all computers%r% 
echo ^           [%yellow%!%r%^] %r% and you may get different results on the machine that you are in.%r% 
echo ^           [%yellow%!%r%^] %r% In case the tweaks don't work or you get bad results%r% 
echo ^           [%yellow%!%r%^] %r% we have created a restore point in your computer.%r% 
echo ^           [%yellow%!%r%^] %r% If you want to know what the tweaks did %r% 
echo ^           [%yellow%!%r%^] %r% check the logs on AppData/Local/sweety%r% 
echo ^           [%yellow%!%r%^] %r% Do you want to continue?%r%  (y/n)
choice /c yn /n /m "                     >"

if %ERRORLEVEL% equ 2 goto:mainreset
if %ERRORLEVEL% equ 1 goto:continuedebloat
pause >nul

:continuedebloat

echo ^           [%green%*%r%^] %r% Creating Backup...%r% 
set backPath="C:\SweetyBackup"

if exist %backPath% (goto :createBackup) else (mkdir %backPath% & goto :createBackup)
timeout /t 1 >nul

:createBackup

set backFile=%backPath%sweety

regedit /e %backupFile%.reg
echo ^           [%green%+%r%^] %r% Backup created!%r% 
pause >nul
cls

sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc stop dmwappushservice
sc stop WMPNetworkSvc
sc stop WSearch
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
if /i %errorlevel% NEQ 0 ( 
  echo Debloat: DisableServices: %errorMessage%
) >> %logFile% else (echo Debloat: DisableServices: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Useless services disabled!%r% 
:: ** Disable telemetry and data collection **
reg add "HKLM\SOFTWARE\Microsoft\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
if /i %errorlevel% NEQ 0 ( 
  echo Debloat: DisableTelemetry: %errorMessage%
) >> %logFile% else (echo Debloat: DisableTelemetry: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Telemetry Disabled!%r% 
:: ** Remove random apps **
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
:: fuck skype, me and my homies loves discord
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Maps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Help* | Remove-AppxPackage"
if /i %errorlevel% NEQ 0 ( 
  echo Debloat: RemoveApps: %errorMessage%
) >> %logFile% else (echo Debloat: RemoveApps: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Useless apps disabled!%r% 

:: ** Disable auto-updates and idk lol (its 3 am i gotta sleep) **
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
if /i %errorlevel% NEQ 0 ( 
  echo DisableAutoUpdates: %errorMessage%
) >> %logFile% else (echo DisableAutoUpdates: Success >> %logFile%)
echo ^           [%green%+%r%^] %r% Windows auto-updates disabled!%r% 

:: ** Uninstall onedrive (i made this an option :D) **
choice /c yn /n /m "Do you want to uninstall onedrive? (y/n)"
if %ERRORLEVEL% = 1 goto :rmvonedrive
if %ERRORLEVEL% = 2 goto :skiponedrive

:: ** Remove onedrive ** (is literally on the name of the function)
:rmvonedrive 
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo ^           [%green%+%r%^] %green%OneDrive has been successfully removed, restarting explorer%r%
timeout /t 3 >nul
start /wait TASKKILL /F /IM explorer.exe
start explorer.ex
if /i %errorlevel% NEQ 0 ( 
  echo Debloat: UninstallOnedrive: %errorMessage%
) >> %logFile% else (echo Debloat: UninstallOnedrive: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Onedrive removed!%r% 

:skiponedrive
:: ** BCDEDITS from melody's tweak pack **
:bcdedits
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set tscsyncpolicy legacy >nul 2>&1
bcdedit /set quietboot yes >nul 2>&1
bcdedit /set bootux disabled >nul 2>&1
bcdedit /set bootmenupolicy legacy >nul 2>&1
bcdedit /set bootlog no >nul 2>&1
bcdedit /set x2apicpolicy Enable >nul 2>&1
bcdedit /set hypervisorlaunchtype off >nul 2>&1
bcdedit /set isolatedcontext no >nul 2>&1
bcdedit /set vsmlaunchtype Off >nul 2>&1
bcdedit /set vm No >nul 2>&1
bcdedit /set debug No >nul 2>&1
bcdedit /set integrityservices disable >nul 2>&1
bcdedit /set ems No >nul 2>&1
bcdedit /set pae ForceDisable >nul 2>&1
bcdedit /set {globalsettings} custom:16000067 true >nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true >nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true >nul 2>&1
bcdedit /set linearaddress57 OptOut >nul 2>&1
bcdedit /set increaseuserva 268435328 >nul 2>&1
bcdedit /set firstmegabytepolicy UseAll >nul 2>&1
bcdedit /set avoidlowmemory 0x8000000 >nul 2>&1
bcdedit /set nolowmem Yes >nul 2>&1
bcdedit /set allowedinmemorysettings 0x0 >nul 2>&1
bcdedit /set configaccesspolicy Default >nul 2>&1
bcdedit /set usephysicaldestination No >nul 2>&1
bcdedit /set usefirmwarepcisettings No >nul 2>&1
bcdedit /set disableelamdrivers Yes >nul 2>&1
if /i %errorlevel% NEQ 0 ( 
  echo BcdEdits: %errorMessage%
) >> %logFile% else (echo BcdEdits: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% BcdEdits applied!%r% 

:: ** Import powerplan **
:importpowerplan
ccurl -s https://cdn.discordapp.com/attachments/929053643523641354/932730636404404244/SweetyPow.pow > "%temp%/SweetyPow.pow"
powercfg -import "%temp%\SweetyPow.pow.pow" 4444444-4444-4444-4444-444444444444 >nul 2>&1>
powercfg -setactive 4444444-4444-4444-4444-444444444444 >nul 2>&1
powercfg -changename 4444444-4444-4444-4444-444444444444 "Sweeety Power Plan" "Boost fps and eliminate input lag"
if /i %errorlevel% NEQ 0 ( 
  echo ImportPowerPlan: %errorMessage%
) >> %logFile% else (echo ImportPowerPlan: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% PowerPlan imported!%r% 

:: ** Disable cortana ** (fuck you cortana) -Fubo & sow
:disablecortana
taskkill /f /im Cortana.exe >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f >nul 2>&1
if /i %errorlevel% NEQ 0 ( 
  echo UninstallCortana: %errorMessage%
) >> %logFile% else (echo UninstallCortana: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Cortana removed!%r% 

:: ** Disabel office telemetry **
:officetele
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\15.0\osm" /v "enablefileobfuscation" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\15.0\osm" /v "enablelogging" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\15.0\osm" /v "enableupload" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common" /v "qmenable" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common\feedback" /v "enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common\feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common\internet" /v "useonlinecontent" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm" /v "enablefileobfuscation" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm" /v "enablelogging" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm" /v "enableupload" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "accesssolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "olksolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "pptsolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "projectsolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "publishersolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "visiosolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "wdsolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications" /v "xlsolution" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\excel\security" /v "blockcontentexecutionfrominternet" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\outlook\security" /v "level" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\powerpoint\security" /v "blockcontentexecutionfrominternet" /t REG_DWORD /d "2" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\office\16.0\word\security" /v "blockcontentexecutionfrominternet" /t REG_DWORD /d "0" /f
if /i %errorlevel% NEQ 0 ( 
  echo DisableOfficeTelemetry: %errorMessage%
) >> %logFile% else (echo DisableOfficeTelemetry: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Office telemetry removed!%r% 


::** Installing devmanview with chocolatey (and installing chocolatey ofc) **
:devmanview
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"  
choco install devmanview -y
::** Disabling some devices... **
devmanview /disable "System Speaker"
devmanview /disable "System Timer"
devmanview /disable "WAN Miniport (IKEv2)"
devmanview /disable "WAN Miniport (IP)"
devmanview /disable "WAN Miniport (IPv6)"
devmanview /disable "WAN Miniport (L2TP)"
devmanview /disable "WAN Miniport (Network Monitor)"
devmanview /disable "WAN Miniport (PPPOE)"
devmanview /disable "WAN Miniport (PPTP)"
devmanview /disable "WAN Miniport (SSTP)"
devmanview /disable "UMBus Root Bus Enumerator"
devmanview /disable "Microsoft System Management BIOS Driver"
devmanview /disable "Programmable Interrupt Controller"
devmanview /disable "High Precision Event Timer"
devmanview /disable "PCI Encryption/Decryption Controller"
devmanview /disable "AMD PSP"
devmanview /disable "Intel SMBus"
devmanview /disable "Intel Management Engine"
devmanview /disable "PCI Memory Controller"
devmanview /disable "PCI standard RAM Controller"
devmanview /disable "Composite Bus Enumerator"
devmanview /disable "Microsoft Kernel Debug Network Adapter"
devmanview /disable "SM Bus Controller"
devmanview /disable "NDIS Virtual Network Adapter Enumerator"
devmanview /disable "Microsoft Virtual Drive Enumerator"
devmanview /disable "Numeric Data Processor"
devmanview /disable "Microsoft RRAS Root Enumerator"
if /i %errorlevel% NEQ 0 ( 
  echo DevManViewDisables: %errorMessage%
) >> %logFile% else (echo DevManViewDisables: Success >> %logFile%)
echo ^           [%green%+%r%^] %r% Useless devices disabled!%r% 

:: ** Disable Prefetch **
:rmvprefetch
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t Reg_DWORD /d "0" /f  >nul 2>&1
if /i %errorlevel% NEQ 0 ( 
  echo DisablePrefetch: %errorMessage%
) >> %logFile% else (echo DisablePrefetch: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Prefetch disabled!%r% 

:: ** Disable Spectre and Meltdown **
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d "0" /f >>"%temp%\EchoLog.txt" 2>>"%temp%\EchoError.txt"
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d "3" /f >>"%temp%\EchoLog.txt" 2>>"%temp%\EchoError.txt"
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d "3" /f >>"%temp%\EchoLog.txt" 2>>"%temp%\EchoError.txt"
del /f /q "%WinDir%\System32\mcupdate_GenuineIntel.dll" >nul 2>&1
del /f /q "%WinDir%\System32\mcupdate_AuthenticAMD.dll" >nul 2>&1
if /i %errorlevel% NEQ 0 ( 
  echo SpectreMeltdown: %errorMessage%
) >> %logFile% else (echo SpectreMeltdown: Sucess >> %logFile%)
echo ^           [%green%+%r%^] %r% Spectre and Meltdown disabled!%r% 

:: ** Fix stock cpu speed **
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelPPM" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AmdPPM" /v Start /t REG_DWORD /d 3 /f
echo ^           [%green%+%r%^] %r% Fixed CPU stock speed!%r% 


takeown /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
icacls C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
md C:\Users\%USERNAME%\AppData\Local\Temp\
takeown /A /R /D Y /F C:\windows\temp
icacls C:\windows\temp /grant administradores:F /T /C
rmdir /q /s c:\windows\temp
md c:\windows\temp
del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\

:: Edge
askkill /F /IM "msedge.exe"
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Storage\ext\

:: Firefox
taskkill /F /IM "firefox.exe"
REM define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q

:: Vivaldi
taskkill /F /IM "vivaldi.exe"
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Storage\ext\

:: Brave
taskkill /F /IM "brave.exe"
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Storage\ext\

:: Chrome
taskkill /F /IM "chrome.exe"
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Storage\ext\
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Storage\ext\
cls
echo 
goto :mainreset