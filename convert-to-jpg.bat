mkdir test
for %%f in (*) do (
 d:\opt\art\imagemagick\magick "%%f" "test\%%~nf.jpg"
)
