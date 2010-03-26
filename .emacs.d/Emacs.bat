@echo off
set HOME=D:\
set EMACS_SERVER_FILE=D:\.emacs.d\server
set PATH=C:\green\unixUtils;%PATH%
start c:\green\emacs-23.1\bin\runemacs.exe %1 %2 %3 %4
REM start c:\green\emacs-23.1\bin\runemacs.exe --debug-init %1 %2 %3 %4
