@echo off

rem ��ɾ� ���� �� ��µǴ� ���ڿ� ����
set "getclip=wmic process where "name = 'java.exe' and commandline like '%%webtlv%%'" get CommandLine"

rem ��µ� ���ڿ��� 1�پ� ���Ͽ� ���ϴ� ���ڿ��� �ִ��� �˻�
for /f "delims=" %%l in ('%getclip% ^| findstr /n "^"') do (
	setlocal enabledelayedexpansion

	rem ��µ� ���ڿ� 1���� ����
	set "line=%%l" & set "line=!line:*:=!"
	rem echo(!line!
	
	rem ���ڿ� �˻�
	echo "!line!" | find "java  -jar ./webtlv-0.0.1-SNAPSHOT.war" > nul
	if errorlevel 1 (
		echo not found > nul
	) else (
		rem ã����  for�� ����
		rem echo found
		goto EXIT
	)
	endlocal
)

call startWebTlv.bat
goto EXIT

:EXIT
