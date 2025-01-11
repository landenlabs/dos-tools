@echo off

echo === Status
git status

git add . 

set mayhavequotes=%*
set noquotes=%mayhavequotes:"=%

if "%noquotes%" == "" (
  echo Missing git commit comment 
) else (
  git commit -m "%noquotes%"
  echo === Push
  git push
  
  echo === Status
  git status
)

echo [Done]