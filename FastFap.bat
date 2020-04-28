@echo off
setlocal enableextensions enabledelayedexpansion
echo Special thanks to:
echo [34mTheBatTeam.org[0m ^& [91mStackOverflow.com[0m for code help
echo [31mMikael Sollenborn (misol101)[0m for cmdbkg.exe
echo [32mLionello Lunesu (soepy)[0m for fart.exe
echo [33mAntonio Perez Ayala (Aacini)[0m for GetInput.exe
echo [36mF95zone[0m for stealing games.
echo [35mWindows 10[0m for new features like coloring, curl and tar
echo.
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
if not exist "%temp%\fastfap\Dreams.of.Desire.Holiday.Special.bmp" echo Downloading Dreams.of.Desire.Holiday.Special.bmp...&curl -s -o "%temp%\fastfap\Dreams.of.Desire.Holiday.Special.bmp" https://vaguiner.eu.org/basegames/Dreams.of.Desire.Holiday.Special.bmp
if not exist "%temp%\fastfap\Dreams.of.Desire.The.Lost.Memories.bmp" echo Downloading Dreams.of.Desire.The.Lost.Memories.bmp...&curl -s -o "%temp%\fastfap\Dreams.of.Desire.The.Lost.Memories.bmp" https://vaguiner.eu.org/basegames/Dreams.of.Desire.The.Lost.Memories.bmp
:start
mode 110,31
set fastdl=
set seed=%random%%random%%random%
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
:GameList
cls
set game[0]=Gates.Motel
set game[1]=Tamas.Awakening
set game[2]=Something.Special
set game[3]=Insexual.Awakening
set game[4]=Dreams.of.Desire
set game[5]=Dreams.of.Desire.Holiday.Special
set game[6]=Dreams.of.Desire.The.Lost.Memories
set x=0
:NumberOfApps
if defined game[%x%] (
   set /a x+=1
   GOTO :NumberOfApps 
)
set /a x-=1
for /l %%n in (0,1,%x%) do ( 
   echo !game[%%n]! 
)
GetInput
set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set SelectetdGame=!game[%row%]!
if "%SelectetdGame%"=="" goto :GameList
:GameInfo
cls
echo Install [F]
echo Back
set game=%SelectetdGame%
Start /b "" cmdbkg %game%.bmp 20 includeborders
:ae
GetInput
set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
if %row%==0 (
	if %col% leq 6 (
		goto :install
	)
	if %col% geq 8 (
		if %col% leq 10 (
			set fastdl=start /B 
			goto :install
		)
	)
)
if %row%==1 (
	if %col% leq 3 (
		goto :GameList
	)
)
goto :ae
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
set arquivos=0
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
