@echo off
REM Setlocal EnableDelayedExpansion
rem set timeout min value and max value
SET /A maxval = 5 * 60
SET /A minval = 5

set loopcount=0
:loop
set /a loopcount=loopcount+1

REM =============== Actual commands goes here ============================
echo %time% [%loopcount%]---------- Restart NGP service... ----------
net stop ngp_host_service
echo %time% Stop is done!
timeout /T 3
echo %time% Starting service
net start ngp_host_service
echo %time% -----------------------------------------------
REM ======================================================================

SET /A time_to_wait=%RANDOM% * (%maxval% - %minval% + 1) / 32768 + %minval%
timeout /T %time_to_wait%
goto loop