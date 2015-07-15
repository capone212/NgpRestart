@echo off
REM Setlocal EnableDelayedExpansion
rem set timeout min value and max value
SET /A maxval = 10
SET /A minval = 0

set loopcount=0
:loop
set /a loopcount=loopcount+1

REM =============== Actual commands goes here ============================
echo %time% [%loopcount%]---------- Start discover ipint devices... ----------
"C:\Program Files (x86)\AxxonSoft\AxxonSmart\bin\ngpsh.exe" --command discovery discover IPINT30_IP_MMSS_Device
echo "Lets wait a bit..."
SET /A time_to_wait=%RANDOM% * (%maxval% - %minval% + 1) / 32768 + %minval%
timeout /T %time_to_wait%
echo %time% -----------------------------------------------
REM ======================================================================
goto loop