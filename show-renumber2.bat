@echo off
setlocal EnableDelayedExpansion

set filename=img
set Num=100
for /r %%i in (*.jpg) do (
    echo move "%%i" "%filename%_!Num!.jpg"
    set /a Num+=1
)
