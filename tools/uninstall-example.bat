@echo OFF
title UnInstall DeskBand
@setlocal enableextensions
@cd /d "%~dp0"
rem Check permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative permissions confirmed.
) else (
    echo Please run this script with administrator permissions.
	pause
    goto EXIT
)
 FOR %%F IN (*.comhost.dll) DO (
  regsvr32  /unregister "%%F" 
)

echo.
echo If the DeskBand has been loaded you need to restart Explorer.
Echo Press Control-C and terminate this batch file if you do not wish to do this now, otherwise
pause

taskkill /im explorer.exe /f
start explorer.exe



:EXIT