@echo off


if "%1" == "" (
  echo Missing git command to execute
) else (
  for /D %%d in (ll*) do (
    cd %%d
    echo "=== %%d ==="
    %*
    echo . 
    cd ..
  )
)

echo [Done]