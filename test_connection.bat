@echo off
TITLE CONNECTION TEST
echo #####################
echo ## CONNECTION TEST ##
echo #####################
echo.
echo. 
echo This test will check the connection continuosly, showing in real time your connection status, 
echo until you decide to stop it with ctrl+C.
echo.
:choice
set /P c=Do you want to start the connection test[Y/N]?
if /I "%c%" EQU "Y" goto :test
if /I "%c%" EQU "N" goto :exit

:test
echo :) Starting test...
timeout /t 3 > NUL
cls
echo #######################
echo ## CONNECTION STATUS ##
echo #######################
echo.

:loop
ping 8.8.8.8 -n 1 -w 5000 >NUL
if errorlevel 1 (
echo|set /p="[91m#[0m"
timeout /t 1 > NUL
echo|set /p="[91m#[0m"
timeout /t 1 > NUL
echo|set /p="[91m#[0m"
timeout /t 1 > NUL
echo|set /p=" [91m No connection![0m"
echo [91m %time%[0m
)else (
echo|set /p="[92m#[0m"
timeout /t 1 > NUL
echo|set /p="[92m#[0m"
timeout /t 1 > NUL
echo|set /p="[92m#[0m"
timeout /t 1 > NUL
echo|set /p=" [92m You are connected![0m"
echo [92m %time%[0m
)
goto loop

:exit
echo :( Exit from connection test...
timeout /t 3 > NUL
exit