mkdir test
for %%f in (*.jpg) do (
 d:\opt\art\imagemagick\magick.exe "%%f" -strip -resize "1920>"  "test\%%f"
)
