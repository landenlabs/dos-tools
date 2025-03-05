mkdir test
for %%f in (*.jpg) do (
 jpeg-recompress -c -s -m smallfry "%%f" "test\%%f"
)
