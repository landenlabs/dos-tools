mkdir test
for %%f in (*.jpg) do (
 d:\opt\art\ImageMagick-7011\magick.exe "%%f" -strip   "test\%%f"
)
