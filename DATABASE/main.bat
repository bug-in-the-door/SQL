@ECHO OFF
SET SHINESQLPLUS_PATH=%CD%
set "flag="
REM
REM %1:���ݿ�ʵ����
REM %2:�û�
REM %3:SYSTEM�û�������
REM ���þ���:MAIN.BAT 10.168.0.93:1521/orcl ES_SYSTEM ES_SYSTEM
REM

   @REM ==========================================================
   @REM BEGIN OF �����ű� 

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

   @REM END OF �����ű�
   @REM ==========================================================
@ECHO OFF

@ECHO �밴������˳�. . . & PAUSE>nul
@ECHO ON

REM flag �����ж��Ƿ񴴽��ɹ�  Ҫ���±�����ֵ��ʱ�� ʹ��  set "������="  ���¸�ֵ--> "������=�µı���ֵ"
REM setlocal EnableDelayedExpansion ���������ӳٵ�����
REM findstr �����ļ����Ƿ����ָ���ַ���