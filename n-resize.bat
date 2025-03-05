@echo off
setlocal EnableDelayedExpansion

set filename=img
set num="50%"
if "%1" NEQ "" (
   set num="%1"
)

mkdir test
for %%f in (*) do (
   echo d:\opt\art\imagemagick\magick "%%f" -resize %num% "test\%%~nf.jpg"
   d:\opt\art\imagemagick\magick "%%f" -resize %num% "test\%%~nf.jpg"
)
