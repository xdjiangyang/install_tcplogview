@echo off  
  
set OsVersion=0  
set OsProcessor=0  
  
echo 操作系统版本:  
ver|findstr /r /i " [版本 5.1.*]" > NUL && goto WindowsXP  
ver|findstr /r /i " [版本 6.1.*]" > NUL && goto Windows7  
ver|findstr /r /i " [版本 10.0.*]" > NUL && goto Windows10
goto UnknownVersion  
  
:WindowsXP  
set OsVersion="WindowsXP"  
goto GetProcessor  
  
:Windows7  
set OsVersion="Windows7"  
goto GetProcessor  
  
:Windows10  
set OsVersion="Windows10"  
goto GetProcessor 
 
:UnknownVersion  
set OsVersion="UnknownVersion"  
goto GetProcessor  
  
:GetProcessor  
if /i "%processor_architecture%" equ "x86" (  
set OsProcessor="X86"  
) else (  
if /i "%processor_architecture%" equ "amd64" (  
set OsProcessor="X64"  
) else (  
set OsProcessor="UnknownProcessor"  
)  
)  
  
echo %OsVersion% %OsProcessor%  
  
pause  