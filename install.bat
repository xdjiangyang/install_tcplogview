@echo off  

set ProgramFilesDir="C:\Program Files"
set RegPath="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
if /i %processor_architecture% equ amd64 (  
set TcpLogViewFile=TcpLogView-x64.exe
set TcpLogViewDir=tcplogview-x64
) else (  
set TcpLogViewFile=TcpLogView.exe
set TcpLogViewDir=tcplogview
)
set TcpLogViewFullPath=%ProgramFilesDir%\%TcpLogViewDir%
md %TcpLogViewFullPath%
xcopy %~dp0%TcpLogViewDir% %TcpLogViewFullPath%
reg add %RegPath% /v %TcpLogViewDir% /t REG_SZ /d \"%TcpLogViewFullPath%\%TcpLogViewFile%\"
