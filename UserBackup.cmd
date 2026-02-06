@echo off
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
            echo Drive %%c is Removable (USB^)
			Set USB=%%c
			Goto :USB_OK
         ) else (
			echo no usb
			Set USB=NoUSB
		 )
		 
		 )
      )
   )
)

if %USB% equ NoUSB (
Echo.
Echo Insert USB and restart the job
Echo.
pause
Goto :EOF
)

:USB_OK
echo USB OK

if not exist %USB%Backup mkdir %USB%Backup

FOR /F "tokens=*" %%G IN ('dir c:\*.pst /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.doc /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.docx /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.xls /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.xlsx /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.vsd /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.vsdx /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.ppt /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.pptx /S /B') DO Call :copyfile %%G
FOR /F "tokens=*" %%G IN ('dir c:\*.pdf /S /B') DO Call :copyfile %%G

Exit /B 0

:copyfile
Set dest=%1
ECHO F|xcopy "%dest%" "%USB%Backup\%dest:~3%" /Y /C
goto :EOF