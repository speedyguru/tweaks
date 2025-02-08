_@echo off
set version=2022 Server V1.0.0
TITLE SpeedyOS - User Script %version%
wscript "C:\Windows\system32\new folder\FullscreenCMD.vbs"
set QC=32 

reg.exe add "HKCU\Environment" /f /t REG_SZ /v "Path" /d "C:\Windows\SpeedyOS"
reg.exe add "HKCU\Environment" /f /t REG_SZ /v "Temp" /d "C:\Users\Administrator\AppData\Local\Temp"
reg.exe add "HKCU\Environment" /f /t REG_SZ /v "Tmp" /d "C:\Users\Administrator\AppData\Local\Temp"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /t REG_SZ /v "Temp" /d "C:\Users\Administrator\AppData\Local\Temp"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /t REG_SZ /v "Tmp" /d "C:\Users\Administrator\AppData\Local\Temp"

if exist "C:\Windows\System32\winrm\winrm.txt" (
	cls & goto Tweakcheck
) else (
	cls & goto STOP
)

:Tweakcheck
if exist "C:\mikkel.txt" (
	cls & goto REMOTE
) else (
	cls & goto SELECT_OPTIONS
)

:REMOTE
start "C:\Users\Administrator\Desktop\Anydesk, Teamviewer & Rustdesk\anydesk.exe"
start "C:\Users\Administrator\Desktop\Anydesk, Teamviewer & Rustdesk\rustdesk.exe"
cls & goto SELECT_OPTIONS

:STOP
cls & echo OLD 2022 SERVER RELEASE DETECTED, PLEASE UPDATE TO LATEST WINDOWS AND RE-DO THE INSTALL!
cd "C:\Browser\Chrome"
ChromeSetup.exe /silent /install
taskkill /f /im explorer
cls & echo OLD 2022 SERVER RELEASE DETECTED, PLEASE UPDATE TO LATEST WINDOWS AND RE-DO THE INSTALL!
echo(
echo(
echo(
echo(
echo(
timeout /t 10
del /s /q "C:\Windows\System32\2022-Script.bat"
C:\Windows\end.bat

:SELECT_OPTIONS
cls
echo DISCLAIMER
echo(
echo This is a selective user-script, it's meant to be helping setup the Windows as to how the user(You) pleases to use it
echo(
echo Try to align the stuff selected as to how you would want the OS to permanently operate.
echo(
echo By continuing, you agree to have read the following disclaimer aswell as the unsupported channels! 
echo(
echo THE WINDOWS IS FREE USE, IF YOU HAVE PAID FOR THE WINDOWS DEMAND A REFUND. 
echo(
echo If you need support, join the discord! :)
pause

cls
:CHANGE-Language
echo CHANGE THE LANGUAGE OF THE KEYBOARD NOW AND CLOSE THE SETTINGS TAB AFTER (THIS ESPECIALLY APPLIES AZERTY LAYOUTS)
timeout /t 30
start ms-settings:regionlanguage
timeout /t 30
cls & goto VALID_INTERNET

:VALID_INTERNET
echo Checking for a valid internet connection, script will continue once stable internet connection has been found.
ping 1.1.1.1 | find "bytes="
IF %ERRORLEVEL% EQU 0 (   
	goto GRAPHICS
) ELSE (
	goto INVALID_CONNECTION_ETHERNET
)

:INVALID_CONNECTION_ETHERNET
cls
echo ERROR: You are not connected to the internet, check your connection details and try again.
timeout /t 15 /nobreak
cls
goto VALID_INTERNET

:GRAPHICS
cls
echo Select what GPU you have in your system!
echo(
echo [1] AMD GPU
echo( 
echo [2] NVIDIA GPU
echo(
echo [3] DO NOT INSTALL DRIVER
echo(
choice /c:123 /n > NUL 2>&1
if errorlevel 3 (
	cls & goto WEBCAM
)
if errorlevel 2 (
	cls & goto NVIDIADRIVER
)
if errorlevel 1 (
	cls & goto AMDDRIVER
)

:NVIDIADRIVER
echo What type of GPU Series
echo(
echo(EXAMPLE - 900 Series = 980, 10 Series = 1080. 
echo(
echo [1] Geforce 900 Series
echo(
echo [2] Geforce 10 Series
echo(
echo [3] Geforce 16 Series
echo(
echo [4] Geforce RTX 20 Series
echo(
echo [5] Geforce RTX 30 Series
echo(
echo [6] Geforce RTX 40 Series
choice /c:123456 /n > NUL 2>&1
if errorlevel 6 (
	cls & goto 40Series
)
if errorlevel 5 (
	cls & goto 30Series
)
if errorlevel 4 (
	cls & goto 20Series
)
if errorlevel 3 (
	cls & goto 16Series
)
if errorlevel 2 (
	cls & goto 10Series
)
if errorlevel 1 (
	cls & goto 10Series
)

:40Series
echo Available NVIDIA Drivers for 40-Series GPU's:
echo(
echo 535.98
echo(
echo 536.09     536.23     536.40     536.67     536.99
echo(
echo 537.09     537.13     537.34     537.42     537.58
echo(
echo 545.84
echo(
echo 546.01     546.08     546.17     546.29     546.31     546.33     546.34     546.65
echo(
echo 551.23     551.52     551.61     551.76     551.86
echo(
echo 552.12     552.22     552.44
echo(
echo 555.85     555.99
echo(
echo 556.12
echo(
echo 560.70     560.81
echo(
echo(
echo NOTE: 551.23 and above has compatability with every 40-Series GPU, some 40-Series GPU works on some slightly older drivers.
echo(
echo(
set /p NVIDIADRIVER="enter what driver you would like to use: "
set NVIDIADRIVER=%NVIDIADRIVER: =%

if "%NVIDIADRIVER%" EQU " =" cls & goto INVALID_NVIDIA-40
if "%NVIDIADRIVER%" EQU "=" cls & goto INVALID_NVIDIA-40

for %%i in (skip SKIP 419.35 425.31 441.41 442.74 457.30 457.51 461.92 466.11 466.77 472.12 522.25 526.47 526.98 527.56 528.24 531.41 536.09 536.23 536.40 536.67 536.99 537.09 537.13 537.34 537.42 537.58 545.84 546.01 546.08 546.12 546.29 546.31 546.33 546.34 546.65 551.23 551.52 551.61 551.76 551.86 552.12 552.22 552.44 555.85 555.99 556.12 560.70 560.81) do (
    if %NVIDIADRIVER% EQU %%i (
		cls & goto NVIDIA
	)
)

:INVALID_NVIDIA-40
cls
echo Invalid input of a 40-Series GPU driver, press enter to continue and re-enter the desired driver.
echo(
echo(
echo(
pause
echo(
echo(
echo(
cls & goto 40Series

:30Series
echo Available NVIDIA Drivers for 30-Series GPU's:
echo(
echo 466.77
echo(
echo 472.12
echo(
echo 522.25
echo(
echo 526.47     526.98
echo(
echo 527.56
echo(
echo 528.24
echo(
echo 531.41
echo(
echo 536.09     536.23     536.40     536.67     536.99
echo(
echo 537.09     537.13     537.34     537.42     537.58
echo(
echo 545.84
echo(
echo 546.01     546.08     546.17     546.29     546.31     546.33     546.34     546.65
echo(
echo 551.23     551.52     551.61     551.76     551.86
echo(
echo 552.12     552.22     552.44
echo(
echo 555.85     555.99
echo(
echo 556.12
echo(
echo 560.70     560.81
echo(
set /p NVIDIADRIVER="enter what driver you would like to use: "
set NVIDIADRIVER=%NVIDIADRIVER: =%

if "%NVIDIADRIVER%" EQU " =" cls & goto INVALID_NVIDIA-30
if "%NVIDIADRIVER%" EQU "=" cls & goto INVALID_NVIDIA-30

for %%i in (skip SKIP 419.35 425.31 441.41 442.74 457.30 457.51 461.92 466.11 466.77 472.12 522.25 526.47 526.98 527.56 528.24 531.41 536.09 536.23 536.40 536.67 536.99 537.09 537.13 537.34 537.42 537.58 545.84 546.01 546.08 546.12 546.29 546.31 546.33 546.34 546.65 551.23 551.52 551.61 551.76 551.86 552.12 552.22 552.44 555.85 555.99 556.12 560.70 560.81) do (
    if %NVIDIADRIVER% EQU %%i (
		cls & goto NVIDIA
	)
)

:INVALID_NVIDIA-30
cls
echo Invalid input of a 30-Series GPU driver, press enter to continue and re-enter the desired driver.
echo(
echo(
echo(
pause
echo(
echo(
echo(
cls & goto 30Series

:20Series
echo Available NVIDIA Drivers for 30-Series GPU's:
echo(
echo 441.41
echo(
echo 442.74
echo(
echo 457.30     457.51
echo(
echo 461.92
echo(
echo 466.11     466.77
echo(
echo 472.12
echo(
echo 522.25
echo(
echo 526.47     526.98
echo(
echo 527.56
echo(
echo 528.24
echo(
echo 531.41
echo(
echo 536.09     536.23     536.40     536.67     536.99
echo(
echo 537.09     537.13     537.34     537.42     537.58
echo(
echo 545.84
echo(
echo 546.01     546.08     546.17     546.29     546.31     546.33     546.34     546.65
echo(
echo 551.23     551.52     551.61     551.76     551.86
echo(
echo 552.12     552.22     552.44
echo(
echo 555.85     555.99
echo(
echo 556.12
echo(
echo 560.70     560.81
echo(
set /p NVIDIADRIVER="enter what driver you would like to use: "
set NVIDIADRIVER=%NVIDIADRIVER: =%

if "%NVIDIADRIVER%" EQU " =" cls & goto INVALID_NVIDIA-20
if "%NVIDIADRIVER%" EQU "=" cls & goto INVALID_NVIDIA-20

for %%i in (skip SKIP 419.35 425.31 441.41 442.74 457.30 457.51 461.92 466.11 466.77 472.12 522.25 526.47 526.98 527.56 528.24 531.41 536.09 536.23 536.40 536.67 536.99 537.09 537.13 537.34 537.42 537.58 545.84 546.01 546.08 546.12 546.29 546.31 546.33 546.34 546.65 551.23 551.52 551.61 551.76 551.86 552.12 552.22 552.44 555.85 555.99 556.12 560.70 560.81) do (
    if %NVIDIADRIVER% EQU %%i (
		cls & goto NVIDIA
	)
)

:INVALID_NVIDIA-20
cls
echo Invalid input of a 20-Series GPU driver, press enter to continue and re-enter the desired driver.
echo(
echo(
echo(
pause
echo(
echo(
echo(
cls & goto 20Series

:16Series
echo Available NVIDIA Drivers for 30-Series GPU's:
echo(
echo 441.41
echo(
echo 442.74
echo(
echo 457.30     457.51
echo(
echo 461.92
echo(
echo 466.11     466.77
echo(
echo 472.12
echo(
echo 522.25
echo(
echo 526.47     526.98
echo(
echo 527.56
echo(
echo 528.24
echo(
echo 531.41
echo(
echo 536.09     536.23     536.40     536.67     536.99
echo(
echo 537.09     537.13     537.34     537.42     537.58
echo(
echo 545.84
echo(
echo 546.01     546.08     546.17     546.29     546.31     546.33     546.34     546.65
echo(
echo 551.23     551.52     551.61     551.76     551.86
echo(
echo 552.12     552.22     552.44
echo(
echo 555.85     555.99
echo(
echo 556.12
echo(
echo 560.70     560.81
echo(
set /p NVIDIADRIVER="enter what driver you would like to use: "
set NVIDIADRIVER=%NVIDIADRIVER: =%

if "%NVIDIADRIVER%" EQU " =" cls & goto INVALID_NVIDIA-16
if "%NVIDIADRIVER%" EQU "=" cls & goto INVALID_NVIDIA-16

for %%i in (skip SKIP 419.35 425.31 441.41 442.74 457.30 457.51 461.92 466.11 466.77 472.12 522.25 526.47 526.98 527.56 528.24 531.41 536.09 536.23 536.40 536.67 536.99 537.09 537.13 537.34 537.42 537.58 545.84 546.01 546.08 546.12 546.29 546.31 546.33 546.34 546.65 551.23 551.52 551.61 551.76 551.86 552.12 552.22 552.44 555.85 555.99 556.12 560.70 560.81) do (
    if %NVIDIADRIVER% EQU %%i (
		cls & goto NVIDIA
	)
)

:INVALID_NVIDIA-16
cls
echo Invalid input of a 16-Series GPU driver, press enter to continue and re-enter the desired driver.
echo(
echo(
echo(
pause
echo(
echo(
echo(
cls & goto 16Series

:10Series
echo Available NVIDIA Drivers for 30-Series GPU's:
echo(
echo 419.35
echo(
echo 425.31
echo(
echo 441.41
echo(
echo 442.74
echo(
echo 457.30     457.51
echo(
echo 461.92
echo(
echo 466.11     466.77
echo(
echo 472.12
echo(
echo 522.25
echo(
echo 526.47     526.98
echo(
echo 527.56
echo(
echo 528.24
echo(
echo 531.41
echo(
echo 536.09     536.23     536.40     536.67     536.99
echo(
echo 537.09     537.13     537.34     537.42     537.58
echo(
echo 545.84
echo(
echo 546.01     546.08     546.17     546.29     546.31     546.33     546.34     546.65
echo(
echo 551.23     551.52     551.61     551.76     551.86
echo(
echo 552.12     552.22     552.44
echo(
echo 555.85     555.99
echo(
echo 556.12
echo(
echo 560.70     560.81
echo(
set /p NVIDIADRIVER="enter what driver you would like to use: "
set NVIDIADRIVER=%NVIDIADRIVER: =%

if "%NVIDIADRIVER%" EQU " =" cls & goto INVALID_NVIDIA-10
if "%NVIDIADRIVER%" EQU "=" cls & goto INVALID_NVIDIA-10

for %%i in (skip SKIP 419.35 425.31 441.41 442.74 457.30 457.51 461.92 466.11 466.77 472.12 522.25 526.47 526.98 527.56 528.24 531.41 536.09 536.23 536.40 536.67 536.99 537.09 537.13 537.34 537.42 537.58 545.84 546.01 546.08 546.12 546.29 546.31 546.33 546.34 546.65 551.23 551.52 551.61 551.76 551.86 552.12 552.22 552.44 555.85 555.99 556.12 560.70 560.81) do (
    if %NVIDIADRIVER% EQU %%i (
		cls & goto NVIDIA
	)
)

:INVALID_NVIDIA-10
cls
echo Invalid input of a 10-Series GPU driver, press enter to continue and re-enter the desired driver.
echo(
echo(
echo(
pause
echo(
echo(
echo(
cls & goto 10Series

:NVIDIA
cls
if %NVIDIADRIVER% EQU SKIP goto DIRECTX
cls & echo Downloading %NVIDIADRIVER%
echo(
if "%NVIDIADRIVER%" EQU "419.35" (
	curl -L "https://us.download.nvidia.com/Windows/419.35/419.35-desktop-win10-64bit-international-whql-rp.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "425.31" (
	curl -L "https://us.download.nvidia.com/Windows/425.31/425.31-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "441.41" (
	curl -L "https://us.download.nvidia.com/Windows/441.41/441.41-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "442.74" (
	curl -L "https://us.download.nvidia.com/Windows/442.74/442.74-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "456.71" (
	curl -L "https://us.download.nvidia.com/Windows/456.71/456.71-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "457.30" (
	curl -L "https://us.download.nvidia.com/Windows/457.30/457.30-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "457.51" (
	curl -L "https://us.download.nvidia.com/Windows/457.51/457.51-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "461.92" (
	curl -L "https://us.download.nvidia.com/Windows/461.92/461.92-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "466.11" (
	curl -L "https://us.download.nvidia.com/Windows/466.11/466.11-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "466.77" (
	curl -L "https://us.download.nvidia.com/Windows/466.77/466.77-desktop-win10-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "472.12" (
	curl -L "https://us.download.nvidia.com/Windows/472.12/472.12-desktop-win10-win11-64bit-international-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "522.25" (
	curl -L "https://us.download.nvidia.com/Windows/522.25/522.25-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "526.47" (
	curl -L "https://us.download.nvidia.com/Windows/526.47/526.47-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "526.98" (
	curl -L "https://us.download.nvidia.com/Windows/526.98/526.98-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "527.56" (
	curl -L "https://us.download.nvidia.com/Windows/527.56/527.56-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "528.24" (
	curl -L "https://us.download.nvidia.com/Windows/528.24/528.24-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "531.41" (
	curl -L "https://us.download.nvidia.com/Windows/531.41/531.41-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "535.98" (
	curl -L "https://us.download.nvidia.com/Windows/535.98/535.98-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "536.09" (
	curl -L "https://us.download.nvidia.com/Windows/536.09/536.09-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "536.23" (
	curl -L "https://us.download.nvidia.com/Windows/536.23/536.23-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "536.40" (
	curl -L "https://us.download.nvidia.com/Windows/536.40/536.40-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "536.67" (
	curl -L "https://us.download.nvidia.com/Windows/536.67/536.67-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "536.99" (
	curl -L "https://us.download.nvidia.com/Windows/536.99/536.99-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "537.09" (
	curl -L "https://us.download.nvidia.com/Windows/537.09/537.09-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "537.13" (
	curl -L "https://us.download.nvidia.com/Windows/537.13/537.13-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "537.34" (
	curl -L "https://us.download.nvidia.com/Windows/537.34/537.34-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "537.42" (
	curl -L "https://us.download.nvidia.com/Windows/537.42/537.42-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "537.58" (
	curl -L "https://us.download.nvidia.com/Windows/537.58/537.58-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "545.84" (
	curl -L "https://us.download.nvidia.com/Windows/545.84/545.84-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.01" (
	curl -L "https://us.download.nvidia.com/Windows/546.01/546.01-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.08" (
	curl -L "https://us.download.nvidia.com/Windows/546.08/546.08-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.17" (
	curl -L "https://us.download.nvidia.com/Windows/546.17/546.17-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.29" (
	curl -L "https://us.download.nvidia.com/Windows/546.29/546.29-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.31" (
	curl -L "https://us.download.nvidia.com/Windows/546.31/546.31-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.33" (
	curl -L "https://us.download.nvidia.com/Windows/546.33/546.33-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.34" (
	curl -L "https://us.download.nvidia.com/Windows/546.34/546.34-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "546.65" (
	curl -L "https://us.download.nvidia.com/Windows/546.65/546.65-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "551.23" (
	curl -L "https://us.download.nvidia.com/Windows/551.23/551.23-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "551.52" (
	curl -L "https://us.download.nvidia.com/Windows/551.52/551.52-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "551.61" (
	curl -L "https://us.download.nvidia.com/Windows/551.61/551.61-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "551.76" (
	curl -L "https://us.download.nvidia.com/Windows/551.76/551.76-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "551.86" (
	curl -L "https://us.download.nvidia.com/Windows/551.86/551.86-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "552.12" (
	curl -L "https://us.download.nvidia.com/Windows/552.12/552.12-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "552.22" (
	curl -L "https://us.download.nvidia.com/Windows/552.22/552.22-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "552.44" (
	curl -L "https://us.download.nvidia.com/Windows/552.44/552.44-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "555.85" (
	curl -L "https://us.download.nvidia.com/Windows/555.85/555.85-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "555.99" (
	curl -L "https://us.download.nvidia.com/Windows/555.99/555.99-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "556.12" (
	curl -L "https://us.download.nvidia.com/Windows/556.12/556.12-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "560.70" (
	curl -L "https://us.download.nvidia.com/Windows/560.70/560.70-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
if "%NVIDIADRIVER%" EQU "560.81" (
	curl -L "https://us.download.nvidia.com/Windows/560.81/560.81-desktop-win10-win11-64bit-international-dch-whql.exe" -o "%temp%\%NVIDIADRIVER%.zip" --progress-bar
)
cls & echo Extracting driver...
7z.exe x -y -o"%temp%\%NVIDIADRIVER%" "%temp%\%NVIDIADRIVER%.zip" > NUL 2>&1
cd %temp%\%NVIDIADRIVER%
copy setup.exe %temp%
cls & echo Debloating driver...
for /f %%a in ('dir "%temp%\%NVIDIADRIVER%" /b') do (
	if "%%a" NEQ "Display.Driver" if "%%a" NEQ "NVI2" if "%%a" NEQ "EULA.txt" if "%%a" NEQ "ListDevices.txt" if "%%a" NEQ "setup.cfg" if "%%a" NEQ "setup.exe" (
		rd /s /q "%temp%\%NVIDIADRIVER%\%%a" > NUL 2>&1
		del /f /q "%temp%\%NVIDIADRIVER%\%%a" > NUL 2>&1
	)
)

"%windir%\system32\new folder\strip_nvsetup.exe" "%temp%\%NVIDIADRIVER%\setup.cfg" "%temp%\%NVIDIADRIVER%\m_setup.cfg"
del /f /q "%temp%\%NVIDIADRIVER%\setup.cfg" > NUL 2>&1
REN "%temp%\%NVIDIADRIVER%\m_setup.cfg" "setup.cfg" > NUL 2>&1
cd %temp%
copy setup.exe %temp%\%NVIDIADRIVER%
cls & echo Installing %NVIDIADRIVER%... This may take some time so wait for the installer to finish installing the debloated driver!
"%temp%\%NVIDIADRIVER%\setup.exe" /s
timeout /t 2
cls & goto NVCHECK

:NVCHECK
cls & echo Checking if a driver is present after installing, if unable to find will go back to driver selection tab
set ServiceName=NVDisplay.ContainerLocalSystem

sc query %ServiceName% | find "does not exist" >nul
if %ERRORLEVEL% EQU 0 cls & goto NVIDIADRIVER
if %ERRORLEVEL% EQU 1 cls & goto NVSETTINGS


:NVSETTINGS
Reg.exe add "HKCR\DesktopBackground\Shell\NVIDIA ControlPanel" /v "Icon" /t REG_SZ /d "C:\Windows\nvidia\nvidialogo.ico,0" /f
Reg.exe add "HKCR\DesktopBackground\shell\NVIDIA ControlPanel\command" /ve /t REG_SZ /d "C:\Windows\nvidia\nvcplui.exe" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Directory\background\shellex\ContextMenuHandlers\NvCplDesktopContext" /va /f

del "%programdata%\NVIDIA Corporation\Drs\nvdrsdb0.bin"
del "%programdata%\NVIDIA Corporation\Drs\nvdrsdb1.bin"
del "%programdata%\NVIDIA Corporation\Drs\nvdrssel.bin"

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
			%= VIDEO =%
				%= ADJUST VIDEO IMAGE SETTINGS =%
					%= EDGE ENHANCEMENT - USE THE NVIDIA SETTING =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Edge_Enhance" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XEN_Edge_Enhance" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					%= EDGE ENHANCEMENT 0 =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_VAL_Edge_Enhance" /t REG_DWORD /d "0" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_VAL_Edge_Enhance" /t REG_DWORD /d "0" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XALG_Edge_Enhance" /t REG_BINARY /d "0000000000000000" /f > NUL 2>&1
					%= NOISE REDUCTION - USE THE NVIDIA SETTING =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Noise_Reduce" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XEN_Noise_Reduce" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					%= NOISE REDUCTION - 0 =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_VAL_Noise_Reduce" /t REG_DWORD /d "0" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_VAL_Noise_Reduce" /t REG_DWORD /d "0" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XALG_Noise_Reduce" /t REG_BINARY /d "0000000000000000" /f > NUL 2>&1
					%= DEINTERLACING - DISABLE "USE INVERSE TELECINE" =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XALG_Cadence" /t REG_BINARY /d "0000000000000000" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XALG_Cadence" /t REG_BINARY /d "0000000000000000" /f > NUL 2>&1

				%= ADJUST VIDEO COLOR SETTINGS =%
					%= COLOR ADJUSTMENTS - WITH THE NVIDIA SETTINGS =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Contrast" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_RGB_Gamma_G" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_RGB_Gamma_R" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_RGB_Gamma_B" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Hue" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Saturation" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Brightness" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XEN_Color_Range" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP4_XEN_Color_Range" /t REG_DWORD /d "2147483649" /f > NUL 2>&1
					%= DYNAMIC RANGE - FULL =%
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XALG_Color_Range" /t REG_BINARY /d "0100000000000000" /f > NUL 2>&1
					Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "_User_SUB0_DFP2_XALG_Color_Range" /t REG_BINARY /d "0100000000000000" /f > NUL 2>&1
					
				%= DISABLE HDCP =%
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMHdcpKeyglobZero" /t REG_DWORD /d 1 /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableHdcp22" /t REG_DWORD /d 1 /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmSkipHdcp22Init" /t REG_DWORD /d 1 /f > NUL 2>&1
				%= DEVELOPER - MANAGE GPU PERFORMANCE COUNTERS - "ALLOW ACCESS TO THE GPU PERFORMANCE COUNTERS TO ALL USERS" =%
				Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%i" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f > NUL 2>&1
		)
	)
)
:: DESKTOP > ENABLE DEVELOPER SETTINGS 
Reg.exe add "HKLM\System\ControlSet001\Services\nvlddmkm\Global\NVTweak" /v "NvDevToolsVisible" /t REG_DWORD /d "1" /f > NUL 2>&1
:: ADJUST IMAGE SETTINGS WITH PREVIEW - "USE THE ADVANCED 3D IMAGE SETTINGS"
Reg.exe add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "Gestalt" /t REG_DWORD /d "513" /f > NUL 2>&1
:: CONFIGURE SURROUND, PHYSX - PROCESSOR: GPU
Reg.exe add "HKLM\System\ControlSet001\Services\nvlddmkm\Global\NVTweak" /v "NvCplPhysxAuto" /t REG_DWORD /d "0" /f > NUL 2>&1
:: MANAGE 3D SETTINGS - UNHIDE SILK SMOOTHNESS OPTION
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f > NUL 2>&1
:: DEVELOPER - MANAGE GPU PERFORMANCE COUNTERS - "ALLOW ACCESS TO THE GPU PERFORMANCE COUNTERS TO ALL USERS"
Reg.exe add "HKLM\System\ControlSet001\Services\nvlddmkm\Global\NVTweak" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f > NUL 2>&1
:: TELEMETRY - OPT OUT OF TELEMETRY
reg add "HKLM\Software\Nvidia Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /D 0 /f
:: TELEMETRY - TELEMETRY DATA TO 0
reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /D 0 /f
:: REMOVING STORE MISSING NVCPL NOTIFICATION
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisableStoreNvCplNotifications" /t REG_DWORD /D 1 /f

curl -L "https://github.com/mikkel123754/Downloaded-file/releases/download/windows/NV-DRIVERS.zip" -o "%temp%\NV-DRIVERS.zip"
curl -L "https://github.com/mikkel123754/Downloaded-file/releases/download/windows/NVIDIA_INSTALLER.zip" -o "%temp%\NVIDIA_INSTALLER.zip"
7z.exe x -y -o"C:\Windows\" "%temp%\NV-DRIVERS.zip" > NUL 2>&1
7z.exe x -y -o"C:\" "%temp%\NVIDIA_INSTALLER.zip" > NUL 2>&1

:: TRUE NO SCALING
for %%i in (Scaling) do (
    for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /s /f "%%i"^| findstr "HKEY"') do (
		reg add "%%a" /v "Scaling" /t REG_DWORD /d "1" /f  > NUL 2>&1
    )
)

cls & goto NVIDIA_PSTATES

:NVIDIA_PSTATES
wscript "C:\Windows\system32\new folder\FullscreenCMD.vbs"
wscript "C:\Windows\system32\new folder\FullscreenCMD.vbs"
cls
echo Would you like to disable p-states within the NVIDIA GPU Driver? This forces you GPU to run at it's highest performing state (P0)
echo(
echo It is not advised to Disable P-State if the temperatures of your GPU is on the higher end. Improve airflow in the entire case and or setup Fanspeed levels through MSI Afterburner
echo(
echo Performance does come at a cost of higher eletrical usage, while also increasing the temperatures. In that case it's recommended to download MSI Afterburner
echo(
echo [1] Yes : DISABLE
echo( 
echo [2] No  : KEEP IT ENABLED
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto GFE
)
if errorlevel 1 (
	cls & goto DISABLE_PSTATE
)

:DISABLE_PSTATE
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
		     Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f > nul 2>&1	 
                   )
                )
             )

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v  "RMElcg" /t REG_DWORD /d 0x55555555 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v  "RMBlcg" /t REG_DWORD /d 0x11111111 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v  "RMElpg" /t REG_DWORD /d 0xFFF /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v  "RMSlcg" /t REG_DWORD /d 0x3FFFF /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v  "RMFspg" /t REG_DWORD /d 0xF /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /V  "RMDisableGpuASPMFlags" /t REG_DWORD /D 0x3 /f
cls & goto GFE

:GFE
cls
echo Wish to download GFE? GFE is required in order to use NVIDIA Shadowplay to clip with.
echo(
echo [1] Yes
echo(
echo [2] No
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto NVIDIASETTINGS
)
if errorlevel 1 (
	cls & goto GFEDOWNLOAD
)

:GFEDOWNLOAD
curl -L "https://uk.download.nvidia.com/GFE/GFEClient/3.28.0.417/GeForce_Experience_v3.28.0.417.exe" -o "%temp%\GFE.exe" --progress-bar
cls & echo Installing Geforce-Experience...
"%temp%\GFE.exe" /s
DevManView /disable "NVIDIA Virtual Audio Device (Wave Extensible) (WDM)" >nul 2>&1
DevManView /disable "NvModuleTracker Device" >nul 2>&1
DevManView /disable "NVVHCI Enumerator" >nul 2>&1
sc delete NvModuleTracker
sc delete nvvad_WaveExtensible
sc delete nvvhci

cls & goto NVIDIASETTINGS

:NVIDIASETTINGS
cls
echo Do you wish to setup the NVIDIA Settings automatically or instead manually dial them in?
echo(
echo [1] Automatically
echo(
echo [2] Manual
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto WEBCAM
)
if errorlevel 1 (
	cls & goto NVYES
)

:NVYES
"C:\Windows\system32\new folder\Inspector.exe" "C:\Windows\system32\new folder\nvprofile.nip"
taskkill /f /im inspector.exe
cls & goto WEBCAM

:AMDDRIVER
echo The install method does not work on 2022 Server, a fix will come once figured out. If ur on AMD GPU please list drivers in #feedback that should be included so they can be pre-stripped.
echo(
echo Please install the drivers like you previously would and the fix will come once figured out.
pause
cls & goto WEBCAM

:AMDDRIVER-OLD
echo Available AMD Drivers:
echo(
echo 20.4.2 
echo 20.8.3
echo 21.10.2
echo 22.2.2
echo 22.6.1
echo Another driver that is not listed (Press 0)
echo
set /p AMDDRIVER="Enter what driver you would like to use: "
set AMDDRIVER=%AMDDRIVER: =%

if "%AMDDRIVER%" EQU " =" cls & goto INVALID_AMD
if "%AMDDRIVER%" EQU "=" cls & goto INVALID_AMD

for %%i in (skip SKIP 20.4.2 20.8.3 21.10.2 22.2.2 22.6.1 0) do (
    if %AMDDRIVER% EQU %%i (
		cls & goto RADEON_SOFTWARE
	)
)

:INVALID_AMD
cls
echo Invalid input
echo(
goto AMDDRIVER

:RADEON_SOFTWARE
cls
echo Would you like to install the Radeon Software (control panel)?
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto AMD_NOPANEL
)
if errorlevel 1 (
	cls & goto AMD_PANEL
)

:AMD_NOPANEL
cls
echo Downloading %AMDDRIVER%
echo(
if %AMDDRIVER% EQU 20.4.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-20-4-2" https://drivers.amd.com/drivers/win10-radeon-software-adrenalin-2020-edition-20.4.2-may25.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 20.8.3 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-20-8-3" https://drivers.amd.com/drivers/beta/win10-radeon-software-adrenalin-2020-edition-20.8.3-sep8.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 21.10.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-21-10-2" https://drivers.amd.com/drivers/radeon-software-adrenalin-2020-21.10.2-win10-win11-64bit-oct25.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 22.2.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-22-2-2"  https://drivers.amd.com/drivers/non-whql-radeon-software-adrenalin-2020-22.2.2-win10-win11-64bit-feb.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 22.6.1 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-22-6-1"  https://drivers.amd.com/drivers/WHQL-AMD-Software-Adrenalin-Edition-22.6.1-Win10-Win11-June29.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% 0 (
	cls & goto WEBCAM
)
cls
cls & echo Extracting driver...
7z.exe x -y -o"%temp%\%AMDDRIVER%" "%temp%\%AMDDRIVER%.zip" > NUL 2>&1
cls & echo Debloating driver...
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdlog" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdfendr" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdxe" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdafd" > NUL 2>&1
:: INSTALL DRIVER
cls & echo Installing %AMDDRIVER%... This may take a few minutes be patient.
echo(
pnputil /add-driver "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\*.inf" /install

cls & goto AMD_TWEAK

:AMD_PANEL
cls
echo Downloading %AMDDRIVER%
echo(
if %AMDDRIVER% EQU 20.4.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-20-4-2" https://drivers.amd.com/drivers/win10-radeon-software-adrenalin-2020-edition-20.4.2-may25.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 20.8.3 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-20-8-3" https://drivers.amd.com/drivers/beta/win10-radeon-software-adrenalin-2020-edition-20.8.3-sep8.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 21.10.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-21-10-2" https://drivers.amd.com/drivers/radeon-software-adrenalin-2020-21.10.2-win10-win11-64bit-oct25.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 22.2.2 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-22-2-2"  https://drivers.amd.com/drivers/non-whql-radeon-software-adrenalin-2020-22.2.2-win10-win11-64bit-feb.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
if %AMDDRIVER% EQU 22.6.1 (
	curl -L -H "Referer: https://www.amd.com/en/support/kb/release-notes/rn-rad-win-22-6-1"  https://drivers.amd.com/drivers/WHQL-AMD-Software-Adrenalin-Edition-22.6.1-Win10-Win11-June29.exe -o "%temp%\%AMDDRIVER%.zip" --progress-bar
)
cls
cls & echo Extracting driver...
7z.exe x -y -o"%temp%\%AMDDRIVER%" "%temp%\%AMDDRIVER%.zip" > NUL 2>&1
cls & echo Debloating driver...
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdlog" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdfendr" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdxe" > NUL 2>&1
rd /s /q "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\amdafd" > NUL 2>&1
:: INSTALL DRIVER
cls & echo Installing %AMDDRIVER%... This may take a few minutes be patient.
echo(
pnputil /add-driver "%temp%\%AMDDRIVER%\Packages\Drivers\Display\WT6A_INF\*.inf" /install

if %RADEON_SOFTWARE% EQU TRUE (
	for /f %%a in ('dir /b "!temp!\!AMDDRIVER!\Packages\Drivers\Display\WT6A_INF\B3*"') do (
		if exist "!temp!\!AMDDRIVER!\Packages\Drivers\Display\WT6A_INF\%%a\ccc2_install.exe" (
			7z.exe x -y -o"!temp!\!AMDDRIVER!_RADEONPANEL" "!temp!\!AMDDRIVER!\Packages\Drivers\Display\WT6A_INF\%%a\ccc2_install.exe" > NUL 2>&1
			"!temp!\!AMDDRIVER!_RADEONPANEL\CN\cnext\cnext64\ccc-next64.msi" /quiet /norestart
		) ELSE (
			>> !log! echo(
			>> !log! echo !date! !time! - AMD Contol panel installation failed.
		)
	)
)
cls & goto AMD_TWEAK

:AMD_TWEAK
cls
echo Would you like to disable powersaving , force max boost core clock frequency and disable thermal throttling within the AMD GPU driver?
echo
echo WARNING: Temperatures may increase and your GPU will not throttle if it exceeds a set temperature (Download either MSI Afterburner to setup a fancurve and or use MorePowerTool to force a specific fanspeed)
echo
echo [1] Yes (highly recommended but ensure you have sufficient cooling/airflow in your case)
echo 
echo [2] No
echo
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto AMD_PRE
)
if errorlevel 1 (
	cls & goto AMD_TWEAK1
)

:AMD_TWEAK1
if exist "C:\Program Files\AMD\CNext\CNext\Radeonsoftware.exe" start "" "C:\Program Files\AMD\CNext\CNext\Radeonsoftware.exe" atlogon
timeout 3 > NUL 2>&1
taskkill /F /IM RadeonSoftware.exe > NUL 2>&1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do ( 
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /t REG_DWORD /d "1" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostHotkey" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_ChillHotkey" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagHotKey" /t REG_DWORD /d "0" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "3200" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Tessellation" /t REG_BINARY /d "3100" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl" /t REG_BINARY /d "3000" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f > NUL 2>&1
			Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableComputePreemption" /t REG_DWORD /d "0" /f > NUL 2>&1
)
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "PrevInstantReplayEnable" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "PrevInGameReplayEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "PrevInstantGifEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "ToggleRsPerfRecordingHotkey" /t REG_SZ /d "None" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "SystemTray" /t REG_SZ /d "false" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "UA_Pref" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\AMD\CN\Performance" /v "HideMetricswhileRecordingMetrics" /t REG_DWORD /d "0" /f > NUL 2>&1
cls & goto AMD_PRERENDERED_FRAMES

:AMD_PRERENDERED_FRAMES
cls
echo How high should the amount of pre-rendered frames be set to?
echo
echo WARNING: This setting requires testing, the recommended value for most people is 1~ however it can also negatively impact performance, even if you have a high end system you might still occur into some stutters, it can be changed in the POST-Setup folder incase needed.
echo
echo [press 1] 0
echo 
echo [press 2] 1
echo 
echo [press 3] 2
echo 
echo [press 4] 3 (default)
echo
choice /c:1234 /n > NUL 2>&1
if errorlevel 4 (
	cls & goto AMD_PRERENDERED_FRAMES_4
)
if errorlevel 3 (
	cls & goto AMD_PRERENDERED_FRAMES_3
)
if errorlevel 2 (
	cls & goto AMD_PRERENDERED_FRAMES_2
)
if errorlevel 1 (
	cls & goto AMD_PRERENDERED_FRAMES_1
)

:AMD_PRERENDERED_FRAMES_1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "0" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3000" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3000" /f > NUL 2>&1
			)
cls & goto WEBCAM
:AMD_PRERENDERED_FRAMES_2
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f > NUL 2>&1
			)
cls & goto WEBCAM
:AMD_PRERENDERED_FRAMES_3
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "2" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3200" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3200" /f > NUL 2>&1
			)
cls & goto WEBCAM
:AMD_PRERENDERED_FRAMES_4
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "3" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3300" /f > NUL 2>&1
				Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3300" /f > NUL 2>&1
			)
cls & goto WEBCAM

:WEBCAM
cls & echo Will you be using a webcam?
echo(
echo [1] Yes  - Enabled 
echo( 
echo [2] No   - Disabled
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto WEBCAM-DISABLE
)
if errorlevel 1 (
	cls & goto MSSMBIOS
)

:WEBCAM-DISABLE
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\swenum" /v "Start" /t REG_DWORD /d "4" /f
"%windir%\Modules\devmanview.exe" /disable "Plug and Play Software Device Enumerator" > NUL 2>&1
cls & goto MSSMBIOS

:MSSMBIOS
echo Does your game require the mssmbios driver to be enabled? It can be enabled later on if needed through the EXTRA Tab in Services.
echo(
echo Games that uses MSSMBIOS:
echo(
echo GTA
echo(
echo [1] Yes  - Enabled
echo( 
echo [2] No   - Disabled
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto MSSMBIOS-DISABLE
)
if errorlevel 1 (
	cls & goto MSSMBIOS-ENABLE
)

:MSSMBIOS-ENABLE
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mssmbios" /v "Start" /t REG_DWORD /d "1" /f > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "Microsoft System Management BIOS Driver" > NUL 2>&1
cls & goto EPICGAMES

:MSSMBIOS-DISABLE
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mssmbios" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
"%windir%\Modules\devmanview.exe" /disable "Microsoft System Management BIOS Driver" > NUL 2>&1
cls & goto EPICGAMES

:EPICGAMES
echo Install Epicgames?
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto STEAM
)
if errorlevel 1 (
	cls & goto INSTALL_EPICGAMES
)

:INSTALL_EPICGAMES
echo Installing EpicGames
echo(
curl -L "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi" -o "%temp%\EpicGames.msi" --progress-bar
"%temp%\EpicGames.msi" /qn /norestart ALLUSERS=2 /L* "%temp%\Epic Games Launcher 1.1.195.0.log"
del /f /q "%temp%\EpicGames.msi" > NUL 2>&1
Reg.exe delete "HKLM\System\ControlSet001\Services\EpicOnlineServices" /f > NUL 2>&1
echo(
cls & goto STEAM

:STEAM
echo Install Steam?
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto RIOTGAMES
)
if errorlevel 1 (
	cls & goto INSTALL_STEAM
)

:INSTALL_STEAM
echo Installing Steam
echo(
curl -L "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -o "%temp%\Steam.exe" --progress-bar
"%temp%\Steam.exe" /S
del /f /q "%temp%\Steam.exe" > NUL 2>&1
Reg.exe DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Steam" /f >NUL 2>&1
echo(
cls & goto RIOTGAMES

:RIOTGAMES
echo Install Valorant. This will also install the RiotGames client where you can install all other Riotgames'
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto SPOTIFY
)
if errorlevel 1 (
	cls & goto INSTALL_RIOTGAMES
	
:INSTALL_RIOTGAMES
echo Installing Valorant (Shortcut on desktop will be made to install Valorant after)
echo(
curl -L "https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe" -o "%userprofile%\Desktop\Valorant.exe" --progress-bar
echo(
cls & goto SPOTIFY

:SPOTIFY
echo Install Spotify? This is a old spotify version, some newer features might be lacking however it is to ensure that the spotify is useable
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto MSIAFTERBURNER
)
if errorlevel 1 (
	cls & goto INSTALL_SPOTIFY
)

:INSTALL_SPOTIFY
echo Installing Spotify
echo(
curl -L "https://github.com/mikkel123754/Downloaded-file/releases/download/windows/spotify-1-1-66-580.exe" -o "%temp%\Spotify.exe" --progress-bar
"%temp%\Spotify.exe" /S
del /f /q "%temp%\Spotify.exe" > NUL 2>&1
taskkill /f /im spotify.exe
echo(
echo Removing automatic updates from spotify
icacls "%localappdata%\Spotify\Update" /reset /T > NUL 2>&1
del /s /q "%localappdata%\Spotify\Update" > NUL 2>&1
mkdir "%localappdata%\Spotify\Update" > NUL 2>&1
icacls "%localappdata%\Spotify\Update" /deny "%username%":W > NUL 2>&1
del "%appdata%\Spotify\SpotifyMigrator.exe" > NUL
del "%appdata%\Spotify\SpotifyStartupTask.exe" > NUL
powershell -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%userprofile%\Desktop\Spotify.lnk'); $S.TargetPath = '%appdata%\Spotify\Spotify.exe'; $S.Save()" > NUL 2>&1
cls & goto MSIAFTERBURNER

:MSIAFTERBURNER
echo Install MSIAfterburner?
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto OBS
)
if errorlevel 1 (
	cls & goto INSTALL_MSIAFTERBURNER
)

:INSTALL_MSIAFTERBURNER
echo Installing MSIAfterburner
echo(
curl -L "https://github.com/mikkel123754/Downloaded-file/releases/download/windows/MSI.Afterburner.zip" -o "%temp%\MSIAfterburner.zip" --progress-bar
7z.exe x -y -o"C:\" "%temp%\MSIAfterburner.zip" > NUL 2>&1
set TARGET='C:\MSI Afterburner\MSIAfterburner.exe'
set SHORTCUT='%userprofile%\Desktop\MSIAfterburner.lnk'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.Save()"
echo(
cls & goto OBS

:OBS
echo Install OBS?
echo(
echo [1] Download Old-OBS Version  - v27.0.1
echo( 
echo [2] Download New-OBS Version  - Latest version of OBS
echo(
echo [3] NONE
choice /c:123 /n > NUL 2>&1
if errorlevel 3 (
	cls & goto DISCORD
)
if errorlevel 2 (
	cls & goto OBS-NEW
)
if errorlevel 1 (
	cls & goto OBS-OLD
)

:OBS-OLD
echo Installing OBS
curl -L "https://t.co/gUay5oSmFb" -o "%temp%\OBS.exe" --progress-bar
"%temp%\OBS.exe" /S
cls & goto DISCORD

:OBS-NEW
echo Installing Latest OBS
curl -L "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.1.2-Full-Installer-x64.exe" -o "%temp%\OBS.exe" --progress-bar
"%temp%\OBS.exe" /S
cls & goto DISCORD

:DISCORD
echo Download Discord?
echo(
echo [1] Yes
echo( 
echo [2] No
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto SOFTWARES
)
if errorlevel 1 (
	cls & goto INSTALL_DISCORD
)

:INSTALL_DISCORD
echo Downloading Discord
curl -L "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64" -o "%userprofile%\Desktop\DiscordSetup.exe" --progress-bar
cls & goto SOFTWARES

:SOFTWARES
cls & echo Is there any mouse / keyboard softwares thats required for your personal use. (Keep in mind, try to keep the install the least bloated that it can be)
echo(
echo [1] Logitech
echo( 
echo [2] Steelseries GG
echo(
echo [3] Razer
echo(
echo [4] Wootility
echo(
echo [5] Continue without downloading any softwares
choice /c:12345 /n > NUL 2>&1
if errorlevel 5 (
	cls & goto BROWSER
)
if errorlevel 4 (
	cls & goto Wootility
)
if errorlevel 3 (
	cls & goto Razer
)
if errorlevel 2 (
	cls & goto Steelseries-GG
)
if errorlevel 1 (
	cls & goto Logitech
)

:LOGITECH
echo It's recommended to download Logitech Onboard Memory Manager if the devices is kept at a minimum with only Mouse being the device that needs adjusted.
echo(
echo The idea is to keep the OS as minimal bloated as possible. GHub is recommended if you have extra perhipherals
echo(
echo [1] Logitech G Hub - Mouse / Keyboard and Headset.
echo( 
echo [2] Logitech Onboard Memory Manager  - Mouse only!
echo(
choice /c:12 /n > NUL 2>&1
)
if errorlevel 2 (
cls & goto LOMM
)
if errorlevel 1 (
cls & goto LGHUB
)

:LOMM
echo Installing Logitech Onboard Memory Manager
echo(
curl -L "https://download01.logi.com/web/ftp/pub/techsupport/gaming/OnboardMemoryManager_2.1.7479.exe" -o "%userprofile%\Desktop\OnboardMemoryManager.exe" --progress-bar
echo(
cls & goto SOFTWARES2

:LGHUB
echo Installing Logitech G-Hub
echo(
curl -L "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe" -o "%userprofile%\Desktop\LGHubSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\LGHubSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto LGHUB-Reinstall
)

:LGHUB-Reinstall
echo Installing Logitech G-Hub
echo(
curl -L "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe" -o "%userprofile%\Desktop\LGHubSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\LGHubSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto LGHUB-Fail
)

:LGHUB-Fail
echo Download of Logitech G-Hub failed, go to their website yourself and install it manually.
cls & goto SOFTWARES2

:Steelseries-GG
echo Installing Steelseries GG
echo(
curl -L https://steelseries.com/gg/downloads/gg/latest/windows -o "%userprofile%\Desktop\SteelseriesSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\SteelseriesSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto Steelseries-GG-Reinstall
)

:Steelseries-GG-Reinstall
echo Installing Steelseries GG
echo(
curl -L https://steelseries.com/gg/downloads/gg/latest/windows -o "%userprofile%\Desktop\SteelseriesSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\SteelseriesSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto Steelseries-GG-Fail
)

:Steelseries-GG-Fail
echo Download of Steelseries-GG failed, go to their website yourself and install it manually.
cls & goto SOFTWARES2

:Wootility
echo Installing Wootility
echo(
curl -L "https://api.wooting.io/public/wootility/download?os=win&branch=lekker" -o "%userprofile%\Desktop\WootilitySetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\WootilitySetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto Wootility-Fail
)

:Wootility-Reinstall
echo Installing Wootility
echo(
curl -L "https://api.wooting.io/public/wootility/download?os=win&branch=lekker" -o "%userprofile%\Desktop\WootilitySetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\WootilitySetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto Wootility-Fail
)

:Wootility-Fail
echo Download of Wootility failed, go to their website yourself and install it manually.
cls & goto SOFTWARES2

:RAZER
echo Installing Razer Synapse 3.0
echo(
curl -L "https://github.com/mikkel123754/Downloaded-file/releases/edit/windows/RazerSynapseInstaller_v1.17.0.597.exe" -o "%userprofile%\Desktop\RazerSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\RAZERSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto RAZER-Reinstall
)

:RAZER-Reinstall
echo Installing Razer Synapse 3.0
echo(
curl -L "https://rzr.to/synapse-3-pc-download" -o "%userprofile%\Desktop\RazerSetup.exe" --progress-bar
echo(
if exist "%userprofile%\Desktop\RazerSetup.exe" (
	cls & goto SOFTWARES2
) else (
	cls & goto RAZER-Fail
)

:RAZER-Fail
echo Download of Razer Synapse failed, go to their website yourself and install it manually.
cls & goto SOFTWARES2

:SOFTWARES2
echo Do you wish to download further more softwares, i.e go back to the software tab or continue. 
echo(
echo [1] Back to software tab  [ Software download tab ]
echo( 
echo [2] Continue  [ No more softwares needed, can continue in the script ]
echo(
choice /c:12 /n > NUL 2>&1
if errorlevel 2 (
	cls & goto BROWSER
)
if errorlevel 1 (
	cls & goto SOFTWARES
)

:BROWSER
cls
echo What browser should be installed?
echo(
echo [1] Google Chrome
echo(
echo [2] Firefox
echo(
echo [3] Brave
echo(
echo [4] OperaGX
choice /c:1234 /n > NUL 2>&1
if errorlevel 4 (
	cls & goto OPERAGX
)
if errorlevel 3 (
	cls & goto BRAVE
)
if errorlevel 2 (
	cls & goto FIREFOX
)
if errorlevel 1 (
	cls & goto GOOGLECHROME
)

:GOOGLECHROME
cd "C:\Browser\Chrome"
ChromeSetup.exe /silent /install

net stop gupdate
sc delete gupdate
net stop googlechromeelevationservice
sc delete googlechromeelevationservice
net stop gupdatem
sc delete gupdatem
rmdir /s /q "C:\Program Files (x86)\Google\Temp"
C:\Program Files (x86)\Google
taskkill /f /im "GoogleUpdate.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateSetup.exe" >nul 2>&1
taskkill /f /im "GoogleCrashHandler.exe" >nul 2>&1
taskkill /f /im "GoogleCrashHandler64.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateBroker.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateCore.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateOnDemand.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateComRegisterShell64.exe" >nul 2>&1 
rmdir "C:\Program Files (x86)\Google\Update" /s /q
rmdir /s /q "C:\Program Files\Google\GoogleUpdater" /s /q
cd /d "C:\Program Files\Google\Chrome\Application\"
if exist C:\Program Files\Google\Chrome\Application\chrmstp.exe takeown /F C:\Program Files\Google\Chrome\Application\chrmstp.exe /R /A & icacls C:\Program Files\Google\Chrome\Application\chrmstp.exe /grant Administrators:(F) /T
dir chrmstp.exe /a /b /s
del chrmstp.exe /a /s
schtasks /delete /f /tn GoogleUpdateTaskMachineUA{179D918B-9BE9-4D1B-9FA2-D0B2D2491030} >nul 2>&1
schtasks /delete /f /tn GoogleUpdateTaskMachineCore{A0256FF4-D45E-420B-90B3-7D05AF116614} >nul 2>&1
reg delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{8A69D345-D564-463c-AFF1-A69D9E530F96}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{950E9395-8BFF-4D96-8731-A3BD3F3C3ABD}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{8EB03C8D-6422-494A-A237-B87232D89A24}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{8EB03C8D-6422-494A-A237-B87232D89A24}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{950E9395-8BFF-4D96-8731-A3BD3F3C3ABD}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineCore" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineUA" /f >nul 2>&1
cls & goto TWEAK

:FIREFOX
curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-GB" -o "%temp%\Firefox Setup.exe" --progress-bar
cls & echo Debloating firefox...
7z.exe x -y -o"%temp%\Firefox Setup" "%temp%\Firefox Setup.exe" > NUL 2>&1
for %%a in (crashreporter.exe crashreporter.ini maintenanceservice.exe maintenanceservice_installer.exe minidump-analyzer.exe pingsender.exe updater.exe) do (
	del /f /q "%temp%\Firefox Setup\core\%%a" > NUL 2>&1
)
cls & echo Installing firefox...
if exist "C:\Program Files\Mozilla Firefox" rd /s /q "C:\Program Files\Mozilla Firefox" > NUL 2>&1
move /y "%temp%\Firefox Setup\core" "C:\Program Files" & ren "C:\Program Files\core" "Mozilla Firefox"
Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d "1" /f > NUL 2>&1
"C:\Program Files\Mozilla Firefox\uninstall\helper.exe" /SetAsDefaultAppGlobal
rd /s /q "C:\Program Files\Mozilla Firefox\uninstall" > NUL 2>&1

taskkill /f /im maintenanceservice.exe
taskkill /f /im uninstall.exe
net stop MozillaMaintenance
sc delete MozillaMaintenance
rmdir "C:\Program Files (x86)\Mozilla Maintenance Service" /s /q
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice_installer.exe"
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice.exe"
del /f "C:\Program Files\Mozilla Firefox\updater.exe"
del /f "C:\Program Files\Mozilla Firefox\crashreporter.exe"
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice.exe"
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice_installer.exe"
del /f "C:\Program Files\Mozilla Firefox\minidump-analyzer.exe"
del /f "C:\Program Files\Mozilla Firefox\pingsender.exe"
cls & goto TWEAK

:BRAVE
cd "C:\Browser\Brave"
brave_installer-x64.exe --install --silent

taskkill /f /im "brave.exe" >nul 2>&1
taskkill /f /im "BraveUpdate.exe" >nul 2>&1
taskkill /f /im "brave_installer-x64.exe" >nul 2>&1
taskkill /f /im "BraveCrashHandler.exe" >nul 2>&1
taskkill /f /im "BraveCrashHandler64.exe" >nul 2>&1
taskkill /f /im "BraveCrashHandlerArm64.exe" >nul 2>&1
taskkill /f /im "BraveUpdateBroker.exe" >nul 2>&1
taskkill /f /im "BraveUpdateCore.exe" >nul 2>&1
taskkill /f /im "BraveUpdateOnDemand.exe" >nul 2>&1
taskkill /f /im "BraveUpdateSetup.exe" >nul 2>&1
taskkill /f /im "BraveUpdateComRegisterShell64" >nul 2>&1
taskkill /f /im "BraveUpdateComRegisterShellArm64" >nul 2>&1
sc stop brave
sc stop bravem
sc delete brave >nul 2>&1
sc delete bravem >nul 2>&1
sc delete BraveElevationService >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\BraveSoftware\Update" /s /q >nul 2>&1

schtasks /delete /f /tn BraveSoftwareUpdateTaskMachineCore{2320C90E-9617-4C25-88E0-CC10B8F3B6BB} >nul 2>&1
schtasks /delete /f /tn BraveSoftwareUpdateTaskMachineUA{FD1FD78D-BD51-4A16-9F47-EE6518C2D038} >nul 2>&1
reg delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{AFE6A462-C574-4B8A-AF43-4CC60DF4563B}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{56CA197F-543C-40DC-953C-B9C6196C92A5}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{0948A341-8E1E-479F-A667-6169E4D5CB2A}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{0948A341-8E1E-479F-A667-6169E4D5CB2A}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{56CA197F-543C-40DC-953C-B9C6196C92A5}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\BraveSoftwareUpdateTaskMachineCore" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\BraveSoftwareUpdateTaskMachineUA" /f >nul 2>&1
cls & goto TWEAK

:OPERAGX
curl -L "https://net.geo.opera.com/opera_gx/stable/windows" -o "%temp%\OperaGXSetup.exe" --progress-bar
OperaGXSetup.exe /silent /allusers=1 /launchopera=0 /setdefaultbrowser=0
cls & goto TWEAK


:CHROME-Check
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
	cls & goto TWEAK
) else (
	cls & goto FIREFOX-Check
)

:FIREFOX-Check
if exist "C:\Program Files\Mozilla Firefox\Firefox.exe" (
	cls & goto TWEAK
) else (
	cls & goto BRAVE-Check
)

:BRAVE-Check
if exist "C:\Users\Administrator\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe" (
	cls & goto TWEAK
) else (
	cls & goto OperaGX-Check
)

:OperaGX-Check
if exist "C:\Users\Administrator\AppData\Local\Programs\Opera GX\opera.exe" (
	cls & goto TWEAK
) else (
	cls & goto BROWSER-Fail
)

:BROWSER-FAIL
echo No browser has been detected, press any key to continue and Google Chrome will be auto installed!
pause
cls & goto CHROME2

:CHROME2
cd "C:\Browser\Chrome"
ChromeSetup.exe /silent /install

net stop gupdate
sc delete gupdate
net stop googlechromeelevationservice
sc delete googlechromeelevationservice
net stop gupdatem
sc delete gupdatem
rmdir /s /q "C:\Program Files (x86)\Google\Temp"
C:\Program Files (x86)\Google
taskkill /f /im "GoogleUpdate.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateSetup.exe" >nul 2>&1
taskkill /f /im "GoogleCrashHandler.exe" >nul 2>&1
taskkill /f /im "GoogleCrashHandler64.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateBroker.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateCore.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateOnDemand.exe" >nul 2>&1
taskkill /f /im "GoogleUpdateComRegisterShell64.exe" >nul 2>&1 
rmdir "C:\Program Files (x86)\Google\Update" /s /q
rmdir /s /q "C:\Program Files\Google\GoogleUpdater" /s /q
cd /d "C:\Program Files\Google\Chrome\Application\"
if exist C:\Program Files\Google\Chrome\Application\chrmstp.exe takeown /F C:\Program Files\Google\Chrome\Application\chrmstp.exe /R /A & icacls C:\Program Files\Google\Chrome\Application\chrmstp.exe /grant Administrators:(F) /T
dir chrmstp.exe /a /b /s
del chrmstp.exe /a /s
schtasks /delete /f /tn GoogleUpdateTaskMachineUA{179D918B-9BE9-4D1B-9FA2-D0B2D2491030} >nul 2>&1
schtasks /delete /f /tn GoogleUpdateTaskMachineCore{A0256FF4-D45E-420B-90B3-7D05AF116614} >nul 2>&1
reg delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{8A69D345-D564-463c-AFF1-A69D9E530F96}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{950E9395-8BFF-4D96-8731-A3BD3F3C3ABD}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{8EB03C8D-6422-494A-A237-B87232D89A24}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{8EB03C8D-6422-494A-A237-B87232D89A24}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{950E9395-8BFF-4D96-8731-A3BD3F3C3ABD}" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineCore" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineUA" /f >nul 2>&1
cls & goto TWEAK

:TWEAK
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f

for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /format:value') do set /a RAM=%%i + 100000
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%RAM%" /f > NUL 2>&1

echo(
cls & echo Setting all device's priority to undefined...
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\PCI"^| findstr "HKEY"') do (
			for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do Reg.exe delete "%%a\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > NUL 2>&1
		)
	)
	
cls & echo "DISABLING HIPM, DIPM, HDDPARKING"
for %%a in (EnableHIPM EnableDIPM EnableHDDParking) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "%%a" ^| findstr "HKEY"') do reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f > NUL 2>&1

cls & echo "DISABLE INTEL DRIVERS ON AMD SYSTEMS AND VICE VERSA"
for /F "tokens=* skip=1" %%n in ('wmic cpu get Manufacturer ^| findstr "."') do set CPUManufacturer=%%n
if %CPUManufacturer% EQU AuthenticAMD (
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iagpio" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iai2c" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSS2i_GPIO2" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSS2i_GPIO2_BXT_P" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSS2i_I2C" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSS2i_I2C_BXT_P" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSSi_GPIO" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaLPSSi_I2C" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaStorAVC" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\iaStorV" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\intelide" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\intelpep" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\intelppm" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
)

if %CPUManufacturer% EQU GenuineIntel (
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\AmdK8" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\AmdPPM" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\amdsata" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\amdsbs" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
	PowerRun.exe /SW:0 reg.exe add "HKLM\System\CurrentControlSet\Services\amdxata" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
)

cls & echo "Enabling MSI mode & Setting all devices to undefined"
::
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_SoundDevice get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI"^| findstr "HKEY"') do (
			for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do Reg.exe delete "%%a\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > NUL 2>&1
		)
)

cls & echo "Removing Rivatuner"
RD /s /q "C:\Program Files (x86)\RivaTuner Statistics Server" > NUL 2>&1
RD /s /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\RivaTuner Statistics Server"  > NUL 2>&1

cls & echo "CONFIGURING AUTORUNS"
Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{8A69D345-D564-463c-AFF1-A69D9E530F96}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{AFE6A462-C574-4B8A-AF43-4CC60DF4563B}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{29D03007-F8B1-4E12-ACAF-5C16C640D894}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{834F4B4B-2375-46D7-AB12-546EF47FC46F}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{8B76D8B3-FDFD-4A7D-B89A-C0787A05BE76}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{CFDB528C-406A-4C14-9533-64C65AA183BB}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{06C2AEAE-A87D-43BA-B84E-AE7E4A11C897}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{06C2AEAE-A87D-43BA-B84E-AE7E4A11C897}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{29D03007-F8B1-4E12-ACAF-5C16C640D894}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{834F4B4B-2375-46D7-AB12-546EF47FC46F}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{8B76D8B3-FDFD-4A7D-B89A-C0787A05BE76}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{CFDB528C-406A-4C14-9533-64C65AA183BB}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\AMDInstallUEP" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineCore" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineUA" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\StartCN" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\StartDVR" /f > NUL 2>&1
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "StartupPrograms" /f > NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "DeleteFlag" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Open-Shell Start Menu" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{0E76D7E3-DA81-46BD-A750-C06B6B660CB4}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{0E76D7E3-DA81-46BD-A750-C06B6B660CB4}" /f > NUL 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Mozilla\Firefox Background Update 308046B0AF4A39CB" /f > NUL 2>&1
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64win" /f > NUL 2>&1
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wowarmhw" /f > NUL 2>&1
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64" /f > NUL 2>&1
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64cpu" /f > NUL 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f > NUL 2>&1
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}" /f > NUL 2>&1
schtasks /delete /tn * /f
sc delete FvSvc
sc delete "Steam Client Service"

cls & echo "CONFIGURING AUTORUNS WITH TRUSTEDINSTALLER"
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{8A69D345-D564-463c-AFF1-A69D9E530F96}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{AFE6A462-C574-4B8A-AF43-4CC60DF4563B}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{29D03007-F8B1-4E12-ACAF-5C16C640D894}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{834F4B4B-2375-46D7-AB12-546EF47FC46F}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{8B76D8B3-FDFD-4A7D-B89A-C0787A05BE76}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Logon\{CFDB528C-406A-4C14-9533-64C65AA183BB}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{06C2AEAE-A87D-43BA-B84E-AE7E4A11C897}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{06C2AEAE-A87D-43BA-B84E-AE7E4A11C897}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{29D03007-F8B1-4E12-ACAF-5C16C640D894}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{834F4B4B-2375-46D7-AB12-546EF47FC46F}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{8B76D8B3-FDFD-4A7D-B89A-C0787A05BE76}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{CFDB528C-406A-4C14-9533-64C65AA183BB}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\AMDInstallUEP" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineCore" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\GoogleUpdateTaskMachineUA" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\StartCN" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\StartDVR" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\System\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "StartupPrograms" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "DeleteFlag" /t REG_DWORD /d "1" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Open-Shell Start Menu" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Plain\{0E76D7E3-DA81-46BD-A750-C06B6B660CB4}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{0E76D7E3-DA81-46BD-A750-C06B6B660CB4}" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Mozilla\Firefox Background Update 308046B0AF4A39CB" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64win" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wowarmhw" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\System\CurrentControlSet\Control\Session Manager\KnownDLLs" /v "_wow64cpu" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f > NUL 2>&1
PowerRun.exe /SW:0 Reg.exe delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}" /f > NUL 2>&1

cls & echo "Disabling the rest of devices that can't be disabled before driver installed"
"%windir%\Modules\devmanview.exe" /disable "@System32\drivers\usbxhci.sys,#1073807361;%1 USB %2 eXtensible Host Controller - %3 (Microsoft);(NVIDIA,3.10,1.10)" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /disable "PCI standard ISA bridge" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /disable "HID-compliant consumer control device" > NUL 2>&1

cls & echo "Disabling scheduled tasks"
for %%i in (
	"\Microsoft\Windows\Application Experience\StartupAppTask"
	"\Microsoft\Windows\Autochk\Proxy"
	"\Microsoft\Windows\BrokerInfrastructure\BgTaskRegistrationMaintenanceTask"
	"\Microsoft\Windows\Chkdsk\ProactiveScan"
	"\Microsoft\Windows\Chkdsk\SyspartRepair"
	"\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan"
	"\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery"
	"\Microsoft\Windows\Defrag\ScheduledDefrag"
	"\Microsoft\Windows\DiskCleanup\SilentCleanup"
	"\Microsoft\Windows\DiskFootPrint\Diagnostics"
	"\Microsoft\Windows\DiskFootPrint\StorageSense"
	"\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation"
	"\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
	"\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
	"\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
	"\Microsoft\Windows\Registry\RegIdleBackup"
	"\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime"
	"\Microsoft\Windows\Time Synchronization\SynchronizeTime"
	"\Microsoft\Windows\Time Zone\SynchronizeTimeZone"
	"\Microsoft\Windows\UpdateOrchestrator\Reboot"
	"\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
	"\Microsoft\Windows\UpdateOrchestrator\USO_Broker_Display"
	"\Microsoft\Windows\UPnP\UPnPHostConfig"
	"\Microsoft\Windows\User Profile Service\HiveUploadTask"
	"\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange"
	"\Microsoft\Windows\WindowsUpdate\Scheduled Start"
	"\Microsoft\Windows\WindowsUpdate\sih"
	"\Microsoft\Windows\Wininet\CacheTask"
) do (
	Schtasks.exe /Change /Disable /TN %%i > NUL 2>&1
	Powerrun.exe /SW:0 schtasks.exe /Change /Disable /TN %%i
)

cls & echo "Disabling write cache buffer on all drives"
	for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
		for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg.exe add "%%a\Device Parameters\Disk" /v "CacheIsPowerProtected" /t REG_DWORD /d "1" /f > NUL 2>&1
	)
	for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
		for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg.exe add "%%a\Device Parameters\Disk" /v "UserWriteCacheSetting" /t REG_DWORD /d "1" /f > NUL 2>&1
	)
)

cls & echo "Removing the rest of nvidia bloat"
reg add "HKLM\Software\Nvidia Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /D 0 /f
reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /D 0 /f
reg add "HKCU\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /v "NotifyNewDisplayUpdates" /t REG_DWORD /D 0 /f

if exist C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS takeown /F C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS /R /A & icacls C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS /grant Administrators:(F) /T

if exist "C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS" takeown /F "C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS" /R /A & icacls "C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS" /grant Administrators:(F) /T

rd /s /q "C:\Program Files\Nvidia Corporation\Display.NvContainer\Plugins\LocalSystem\DisplayDriverRAS"

if exist C:\Program Files\Nvidia Corporation\DisplayDriverRAS takeown /F C:\Program Files\Nvidia Corporation\DisplayDriverRAS /R /A & icacls C:\Program Files\Nvidia Corporation\DisplayDriverRAS /grant Administrators:(F) /T

if exist "C:\Program Files\Nvidia Corporation\DisplayDriverRAS" takeown /F "C:\Program Files\Nvidia Corporation\DisplayDriverRAS" /R /A & icacls "C:\Program Files\Nvidia Corporation\DisplayDriverRAS" /grant Administrators:(F) /T

rd /s /q "C:\Program Files\Nvidia Corporation\DisplayDriverRAS"

if exist C:\ProgramData\Nvidia Corporation\DisplayDriverRAS takeown /F C:\ProgramData\Nvidia Corporation\DisplayDriverRAS /R /A & icacls C:\ProgramData\Nvidia Corporation\DisplayDriverRAS /grant Administrators:(F) /T

if exist "C:\ProgramData\Nvidia Corporation\DisplayDriverRAS" takeown /F "C:\ProgramData\Nvidia Corporation\DisplayDriverRAS" /R /A & icacls "C:\ProgramData\Nvidia Corporation\DisplayDriverRAS" /grant Administrators:(F) /T

rd /s /q "C:\ProgramData\Nvidia Corporation\DisplayDriverRAS"

if exist "C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll" takeown /F "C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll" /A & icacls "C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll" /grant Administrators:(F)

if exist C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll takeown /F C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll /A & icacls C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll /grant Administrators:(F)

del /s /q "C:\Program Files\NVIDIA Corporation\NvTopps\_NvTopps.dll"

"%windir%\devmanview.exe" /disable "@System32\drivers\usbxhci.sys,#1073807361;%1 USB %2 eXtensible Host Controller - %3 (Microsoft);(NVIDIA,3.10,1.10)"

cls & echo "Configuring FSE/FSO"
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "ShowGameModeNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f

cls & echo "Installing VLC"
start /b /wait "" "C:\Windows\Modules\VLC 3.0.16.exe" /L=1033 /S /NCRC >nul 2>&1

cls & echo "Disabling USB Powersavings 1 extra time"
for %%a in (
	EnhancedPowerManagementEnabled
	AllowIdleIrpInD3
	EnableSelectiveSuspend
	DeviceSelectiveSuspended
	SelectiveSuspendEnabled
	SelectiveSuspendOn
	EnumerationRetryCount
	ExtPropDescSemaphore
	WaitWakeEnabled
	D3ColdSupported
	WdfDirectedPowerTransitionEnable
	EnableIdlePowerManagement
	IdleInWorkingState
) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" ^| findstr "HKEY"') do reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f > NUL 2>&1

cls & echo "Disabling preemption"
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f > NUL 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f

cls & echo "Spectre and meltdown configured"

wmic cpu get name | findstr "Intel" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
)
wmic cpu get name | findstr "AMD" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 64 /f
)

reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v "InactivityShutdownDelay" /t REG_DWORD /d "4294967295" /f

rd /s /q "%temp%" & mkdir "%userprofile%\AppData\Local\Temp"

bcdedit -deletevalue testsigning

cls & Echo Upgrading Windows Server to full version. Mouse and keyboard is disabled to not interrupt the process
"%windir%\Modules\devmanview.exe" /disable "HID-compliant mouse" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /disable "HID Keyboard Device" > NUL 2>&1
cd "C:\Windows\system32\new folder"
wscript sendNo.vbs
cd "C:\Windows\system32\new folder"
Powershell -file "C:\Windows\system32\new folder\Upgrade.ps1
timeout /t 20 /nobreak
"%windir%\Modules\devmanview.exe" /enable "HID-compliant mouse" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "HID Keyboard Device" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "HID-compliant mouse" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "HID Keyboard Device" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "HID-compliant mouse" > NUL 2>&1
"%windir%\Modules\devmanview.exe" /enable "HID Keyboard Device" > NUL 2>&1
cd C:\Windows
start end.bat
start /b "" cmd /c del "%~f0"&exit /b