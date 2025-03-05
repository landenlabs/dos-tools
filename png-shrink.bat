mkdir test
for %%f in (*.png) do (
 d:\opt\art\imageMagick\magick.exe convert "%%f" foo.jpg
 jpeg-recompress -s -m smallfry "foo.jpg" "test\%%~nf.jpg"
)
del foo.jpg
