@echo off

if exist "C:\Windows\System32\new folder\Inspector.exe" (
	cls & goto START
) else (
	cls & goto STOP
)

:STOP
exit /b

:START
taskkill /f /im explorer.exe
start explorer.exe
if exist "C:\Windows\System32\New folder\2022-Server.bat" (
	call "C:\Windows\System32\New folder\2022-Server.bat")

if exist "C:\Windows\System32\New folder\1709.bat" (
	call "C:\Windows\System32\New folder\1709.bat")

exit /b