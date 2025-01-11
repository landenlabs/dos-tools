@echo off

for /D %%d in (ll*) do (
  cd %%d
  echo === Git status for %%d
  git pull
  git status
  echo . 
  cd ..
)

echo [Done]