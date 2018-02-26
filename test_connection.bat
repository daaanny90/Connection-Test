@echo off
setlocal enableextensions enabledelayedexpansion
mode con: cols=82 lines=20
TITLE CONNECTION TEST
echo "                                              _   _                             "
echo "               ___ ___  _ __  _ __   ___  ___| |_(_) ___  _ __                  "
echo "              / __/ _ \| '_ \| '_ \ / _ \/ __| __| |/ _ \| '_ \                 "
echo "             | (_| (_) | | | | | | |  __/ (__| |_| | (_) | | | |                "
echo "              \___\___/|_| |_|_| |_|\___|\___|\__|_|\___/|_| |_|                "
echo "                                                                                "
echo "                                _            _                                  "
echo "                               | |_ ___  ___| |_                                "
echo "                               | __/ _ \/ __| __|                               "
echo "                               | ||  __/\__ \ |_                                "
echo "                                \__\___||___/\__|                               "
echo "                                                                                "
echo. 
echo             This test will check every 3 seconds the connection status 
echo                      and will show it with intuitives colors.
echo    It will write also a log file. You can find it where this .bat file is.
echo       The program will check and log the connection status until you decide 
echo                 to stop it with ctrl+C (or closing the terminal).
echo.
:choice
set /P c=Do you want to start the connection test[Y/N]?
if /I "%c%" EQU "Y" goto :test
if /I "%c%" EQU "N" goto :exit

:test
echo.
echo :) Starting test...
echo Connection test started at %time% of the %date% >> connection_log_%date%.txt
timeout /t 3 > NUL
cls

:loop
rem formatting time that will be printed and saved into the log file
set hour=%time:~0,2%
rem Remove leading space if single digit
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
rem Remove leading space
if "%min:~0,1%" == " " set min=0%min:~1,1%
rem Seconds
set secs=%time:~6,2%
rem Remove leading space
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%

ping 8.8.8.8 -n 1  >NUL
if errorlevel 1 (
echo.
echo.
echo.
echo.
echo.
echo.
echo                 [91m ############################################### [0m
echo                 [91m ##  CONNECTION STATUS: INTERRUPTED %hour%:%min%:%secs%  ## [0m
echo                 [91m ############################################### [0m
echo The connection was INTERRUPTED at %hour%:%min%:%secs% >> connection_log_%date%.txt
)else (
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                [92m ############################################### [0m
echo                [92m ##        CONNECTION STATUS: OK %hour%:%min%:%secs%     ## [0m
echo                [92m ############################################### [0m
echo The connection was OK at %hour%:%min%:%secs% >> connection_log_%date%.txt
)
timeout /t 2 > NUL
cls
goto loop

:exit
echo :( Exit from connection test...
timeout /t 3 > NUL
exit
