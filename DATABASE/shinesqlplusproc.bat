::===========����Ϊִ��ÿ��sql�ļ�����¼����Ӧ��־�ļ�������=============
ECHO ִ���ļ�:%CD%\%4

echo set echo off >tmp_exec_sql_file.sql
echo @%4 >>tmp_exec_sql_file.sql

sqlplus %1/%2@%3 @tmp_exec_sql_file.sql <nul

del tmp_exec_sql_file.sql




