::===========127.0.0.1:1521/orcl为本地的oracle数据库名称  CHENGUIXIN为所登陆的用户名 123456为登录密码=============

@ECHO OFF

set /p database=please input your database:

set /p username=please input your username:

set /p password=please input your password:
CALL main.bat 127.0.0.1:1521/%database% %username% %password%