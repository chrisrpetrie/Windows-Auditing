@ECHO OFF

REM Get Current path
SET "LOC=%~dp0"

REM If folder does not exist create one.
if not exist "%LOC%OUTPUT" mkdir "%LOC%OUTPUT"
if not exist "%LOC%OUTPUT\%COMPUTERNAME%" mkdir "%LOC%OUTPUT\%COMPUTERNAME%"

REM Store current date time as variable
SET FILENAME=%COMPUTERNAME%_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

REM //Begin with capturing system information
Echo -----------------------------------------------
Echo CAPTURE SYSTEM INFORMATION
Echo -----------------------------------------------

cscript.exe "%LOC%"Scripts\sydi-server.vbs -tlocalhost -ex -o"%LOC%"OUTPUT\%COMPUTERNAME%\%FILENAME%_INVENTORY.xml
net accounts > %LOC%OUTPUT\%COMPUTERNAME%\%FILENAME%_SECPOL.inf
gpresult.exe /H %LOC%OUTPUT\%COMPUTERNAME%\%FILENAME%_GPRESULT.html
