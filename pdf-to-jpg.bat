@echo off


echo Input=[%~1]
d:\opt\art\ghostScript\bin\gswin64c.exe -dNOPAUSE -sDEVICE=jpeg -r200 -dJPEGQ=60 -dBATCH -sOutputFile=foo-%%03d.jpg "%~1"
