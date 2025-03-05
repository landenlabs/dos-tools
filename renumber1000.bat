@echo off
setlocal EnableDelayedExpansion

set filename=img
set Num=1000

for /f "tokens=*" %%i in ('dir/b *.jpg ^| sort') do (
@rem for /r %%i in (*.jpg) do (
    echo move "%%i" "%filename%_!Num!.jpg"
    ren "%%i" "%filename%_!Num!.jpg"
    set /a Num+=2

)
