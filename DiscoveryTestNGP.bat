@echo off
rem Setlocal EnableDelayedExpansion
rem set timeout min value and max value
SET /A maxval = 20
SET /A minval = 5

set loopcount=0
:loop
set /a loopcount=loopcount+1

REM =============== Actual commands goes here ============================
rem echo %time% Starting service
net start ngp_host_service

set /a discover_count =  %RANDOM% * 5 / 32769
set /a time_to_wait = %RANDOM% * (%maxval% - %minval% + 1) / 32768 + %minval% 

for /l %%x in (1, 1, %discover_count%) do (
	echo %time% [test #%loopcount% attempt %%x of %discover_count%]---------- Start discover ipint devices... ----------
	
	"C:\Program Files (x86)\AxxonSoft\AxxonSmart\bin\ngpsh.exe" --command discovery discover IPINT30_IP_MMSS_Device

	echo Lets wait a bit...
	timeout /T %time_to_wait%
)
echo "Check if we can stop NGP..."
net stop ngp_host_service
echo %time% Stop is done!
echo %time% -----------------------------------------------

timeout /T 1
REM ======================================================================
goto loop