@echo off
setlocal EnableDelayedExpansion

set filename=img
set Num=100
set INC=2
set doit=yes

if "%1" EQU "-h" (
   echo Renumber files
   echo    [startingNum=100] [incr=2] [fileprefix=img] [dryrun]
   goto done
)
if "%1" NEQ "" (
   set Num=%1
)
if "%2" NEQ "" (
   set INC=%2
)
if "%3" NEQ "" (
   set filename="%3"
)
if "%4" NEQ "" (
   set doit=no
)

for /f "tokens=*" %%i in ('dir/b *.jpg *.gif *.png ^| sort') do (
@rem for /r %%i in (*.jpg *.png *.gif) do (
    echo move "%%i" "%filename%_!Num!%%~xi"
    if "%doit%" EQU "yes" (
      move "%%i" "%filename%_!Num!%%~xi"
    )
    set /a Num+=%INC%
)
:done
