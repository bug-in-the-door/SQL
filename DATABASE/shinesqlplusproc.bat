::===========以下为执行每个sql文件并记录到对应日志文件的内容=============
ECHO 执行文件:%CD%\%4

echo set echo off >tmp_exec_sql_file.sql
echo @%4 >>tmp_exec_sql_file.sql

sqlplus %1/%2@%3 @tmp_exec_sql_file.sql <nul

del tmp_exec_sql_file.sql




