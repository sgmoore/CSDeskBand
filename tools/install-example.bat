@echo OFF
title Install DeskBand
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
  regsvr32 "%%F" 
)

pause

:EXIT