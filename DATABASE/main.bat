@ECHO OFF
SET SHINESQLPLUS_PATH=%CD%
set "flag="
REM
REM %1:数据库实例名
REM %2:用户
REM %3:SYSTEM用户的密码
REM 调用举例:MAIN.BAT 10.168.0.93:1521/orcl ES_SYSTEM ES_SYSTEM
REM

   @REM ==========================================================
   @REM BEGIN OF 升级脚本 

   :MAIN   		 
       CD %SHINESQLPLUS_PATH%
       CALL CREATE_ALL_OBJECT.BAT %2 %3 %1 >CREATE.LOG 
	   set "flag=1"
	   rem setlocal EnableDelayedExpansion
	   findstr "ORA-12514" CREATE.LOG >nul && echo your datebase is error && set "flag=2"
	   findstr "ORA-01017" CREATE.LOG >nul && echo your username or password is error  && set "flag=2"
	   if %flag%==1 echo create success
	   rem if !errorlevel!==1 echo create success
   :END
	   
   CD ..

   @REM END OF 升级脚本
   @REM ==========================================================
@ECHO OFF

@ECHO 请按任意键退出. . . & PAUSE>nul
@ECHO ON

REM flag 用来判断是否创建成功  要更新变量的值的时候 使用  set "变量名="  重新赋值--> "变量名=新的变量值"
REM setlocal EnableDelayedExpansion 开启变量延迟的设置
REM findstr 查找文件中是否包含指定字符串