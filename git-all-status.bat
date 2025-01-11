@echo off

for /D %%d in (ll*) do (
  cd %%d
  echo === Git status for %%d
  git status
  echo . 
  cd ..
)

echo [Done]