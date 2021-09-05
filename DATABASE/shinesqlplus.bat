::===========以下为执行每个sql文件并记录到对应日志文件的内容=============
ECHO 执行文件:%CD%\%4

echo %3

echo set echo on >tmp_exec_sql_file.sql

echo @%4 >>tmp_exec_sql_file.sql

sqlplus %1/%2@%3 @tmp_exec_sql_file.sql %5 %6 <nul 

REM IF %ERRORLEVEL%==0 ECHO 2

del tmp_exec_sql_file.sql




