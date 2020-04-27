@echo off
setlocal enableextensions enabledelayedexpansion
:getstuffready
if not exist "%temp%\fastfap" mkdir "%temp%\fastfap"&goto :getstuffready
set path=%path%;%temp%\fastfap
where curl > nul
if "%errorlevel%"=="1" echo Incompatible windows version&pause&exit
where tar > nul
if "%errorlevel%"=="1" echo Incompatible windows version&pause&exit
rem BY BAT-TEAM
if not exist "%temp%\fastfap\cmdbkg.exe" echo Downloading cmdbkg.exe...&curl -s -o "%temp%\fastfap\cmdbkg.exe" https://vaguiner.eu.org/basegames/tools/cmdbkg.exe
if not exist "%temp%\fastfap\GetInput.exe" echo Downloading GetInput.exe...&curl -s -o "%temp%\fastfap\GetInput.exe" https://vaguiner.eu.org/basegames/tools/GetInput.exe
if not exist "%temp%\fastfap\fart.exe" echo Downloading fart.exe...&curl -s -o "%temp%\fastfap\fart.exe" https://vaguiner.eu.org/basegames/tools/fart.exe
if not exist "%temp%\fastfap\Gates.Motel.bmp" echo Downloading Gates.Motel.bmp...&curl -s -o "%temp%\fastfap\Gates.Motel.bmp" https://vaguiner.eu.org/basegames/Gates.Motel.bmp
if not exist "%temp%\fastfap\Tamas.Awakening.bmp" echo Downloading Tamas.Awakening.bmp...&curl -s -o "%temp%\fastfap\Tamas.Awakening.bmp" https://vaguiner.eu.org/basegames/Tamas.Awakening.bmp
if not exist "%temp%\fastfap\Something.Special.bmp" echo Downloading Something.Special.bmp...&curl -s -o "%temp%\fastfap\Something.Special.bmp" https://vaguiner.eu.org/basegames/Something.Special.bmp
if not exist "%temp%\fastfap\Insexual.Awakening.bmp" echo Downloading Insexual.Awakening.bmp...&curl -s -o "%temp%\fastfap\Insexual.Awakening.bmp" https://vaguiner.eu.org/basegames/Insexual.Awakening.bmp
if not exist "%temp%\fastfap\Dreams.of.Desire.bmp" echo Downloading Dreams.of.Desire.bmp...&curl -s -o "%temp%\fastfap\Dreams.of.Desire.bmp" https://vaguiner.eu.org/basegames/Dreams.of.Desire.bmp
:start
mode 110,31
set fastdl=
set seed=%random%%random%%random%
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
:GameList
cls
echo Gates.Motel
echo Tamas.Awakening
echo Something.Special
echo Insexual.Awakening
echo Dreams.of.Desire
GetInput /M  0 0 10 0  0 1 14 1  0 2 16 2  0 3 17 3  0 4 15 4 /H
if %errorlevel%==1  call :GameInfo Gates.Motel
if %errorlevel%==2  call :GameInfo Tamas.Awakening
if %errorlevel%==3  call :GameInfo Something.Special
if %errorlevel%==4  call :GameInfo Insexual.Awakening
if %errorlevel%==5  call :GameInfo Dreams.of.Desire
goto :GameList
:GameInfo
cls
echo Install [F]
echo Back
set game=%1
rem Start /b "" cmdbkg %game%.bmp 20 includeborders
GetInput /M  0 0 6 0  0 1 3 1  8 0 10 0/H
if %errorlevel%==1  goto :install
if %errorlevel%==2  goto :GameList
if %errorlevel%==3  set fastdl=start /B &goto :install
goto :GameList
:install
mkdir games
cd games
mkdir %game%
cd %game%
cls
start /B curl -s -O https://vaguiner.eu.org/basegames/%game%.zip.tar > %seed%
set size=0
:repeat
<nul set /p"=Downloading base game...%size%                        !CR!"
FOR /F "usebackq" %%A IN ('%game%.zip.tar') DO set size=%%~zA
copy /Y NUL %seed% >nul 2>nul||set randomshit=
if "%errorlevel%"=="1" goto :repeat
<nul set /p"=Downloading base game...OK                        !CR!"
del %seed%
set size=0
start /B curl -s -O https://vaguiner.eu.org/basegames/%game%.Links.txt > %seed%
echo.
:repeat2
<nul set /p"=Downloading list of links...%size%                        !CR!"
FOR /F "usebackq" %%A IN ('%game%.Links.txt') DO set size=%%~zA
copy /Y NUL %seed% >nul 2>nul||set randomshit=
if "%errorlevel%"=="1" goto :repeat2
<nul set /p"=Downloading list of links...OK                        !CR!"
del %seed%
echo.
start /B tar -xf %game%.zip.tar > %seed%
:repeat3
<nul set /p"=Extracting base game...%cnt%                        !CR!"
for /f %%A in ('dir /s * ^| find "File(s)"') do set cnt=%%A
copy /Y NUL %seed% >nul 2>nul||set randomshit=
if "%errorlevel%"=="1" goto :repeat3
<nul set /p"=Extracting base game...OK                        !CR!"
echo.
del %game%.zip.tar
del %seed%
set baixados=0
set created=0
:loophere
rem This fucking space on file name kills me
fart -q %game%.Links.txt "%%2B" "FuckingSpaceHere"
fart -q %game%.Links.txt "%%2526" "&"
for /f "tokens=* delims=/" %%a in (%game%.Links.txt) do call :CreateBlankFiles %%a
if "%created%"=="1" (
del %game%.Links.txt
cd ..\..\
goto :start
)
set created=1
goto :loophere
:CreateBlankFiles
set link=%1
FOR /F "tokens=8 delims=/" %%a IN ("echo %link%") DO set arquivo=%%a
set arquivo=%arquivo:7lsW=\%
set arquivo=%arquivo:FuckingSpaceHere= %
rem set link=%link:/s5000/=/s1279/% for future compression option
rem set link=%link:/s5080/=/s1919/% 1080p games have 5080 link
set statuss=%baixados%/%arquivos% %arquivo%                                                                                               
set status1=%statuss:~0,109%
<nul set /p"=%status1%!CR!"
if "%created%"=="0" (
copy /Y NUL "%arquivo%" > nul
set /a arquivos+=1
) else (
%fastdl%curl -s "%link%" -o "%arquivo%"
set /a baixados+=1
)
goto :eof
