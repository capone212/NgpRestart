
@echo off

set loopcount=0
:loop
set /a loopcount=loopcount+1

REM =============== Actual commands goes here ============================
echo %time% [%loopcount%] ----------- Rung Notification test... -------------------

del test.log
C:\work\ngp-sdk\boost_1_55_0\lib\console_test_runner.exe --test "C:\work\ngp.axxon.fastload.ii\Notification\CommonNotificationCpp\bin\CommonNotificationCppTest.dll"  --log_level=message --report_level=detailed 1> test.log 2>&1
echo %errorlevel%
if %errorlevel% neq 0 goto error
echo "test ended!"
REM ======================================================================

goto loop

:error
echo "Test failed!"
