@echo off
@Rem setlocal EnableDelayedExpansion


for /D  %%i in (*) do (
    echo dir "%%i"
    cd %%i
    d:\opt\bin\renumber.bat
    @rem d:\opt\bin\jpg-strip.bat
    d:\opt\bin\jpg-shrink.bat
    cd ..
)
:done
