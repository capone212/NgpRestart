@echo off
REM Setlocal EnableDelayedExpansion
rem set timeout min value and max value
SET /A maxval = 5 * 60
SET /A minval = 5

set loopcount=0
:loop
set /a loopcount=loopcount+1

REM =============== Actual commands goes here ============================
echo %time% [%loopcount%] ----------- Restart NGP applications... -------------------
"C:\Program Files (x86)\AxxonSoft\AxxonSmart\bin\ngpsh.exe" --command execmgr restart
echo %time% Restart is done! 
echo ----------------------------------------------------------------------------

REM ======================================================================

SET /A time_to_wait=%RANDOM% * (%maxval% - %minval% + 1) / 32768 + %minval%
timeout /T %time_to_wait%
goto loop