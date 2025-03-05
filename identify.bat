@echo off
d:\opt\art\imagemagick\magick.exe identify -format "%%w %%h %%r %%m %%C %%B %%d %%f\n"  %*
