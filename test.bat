@echo off 

if "%1" == "" (
  echo no argument provided
) else if "%2" != "" (
  echo got argument #2 
) else (
  echo arg1 = %1
  set foo=%1
  echo arg1 = %foo%  
) exit
 
 
if not exist file1 (
  echo missing file1 
) else if exist "file2" (
  echo got file2
)

:: Remove quotes
set mayhavequotes=%*
set noquotes=%mayhavequotes:"=%
set noquotesSingleArg = %~1

echo stdout to nul > nul
echo stderr to nul 2> nul

:: https://www.robvanderwoude.com/comments.php
@rem comments is ignore but kept in parsed buffer
:: this is also a comment, gets removed and ignore
set value=1 &::comment end of line
set value=1 &rem comment end of line
set value=1 %= inline comment =%

@rem setlocal limits scope of "set" variables to this session
@rem enabledelayedexpansion enables delayed expansion which is accessed using the !variableName! syntax
setlocal enabledelayedexpansion 

echo Show counting
set /a cnt = 0
:_loop0
if %cnt% LEQ 4 (
  echo    Counting %cnt%
  set /a cnt += 1
  goto _loop0
)
echo:

echo "test this is a long line ^
more data ^
more data ^
more data ^
more data ^
more data ^
continued on 2nd line"

  
:: https://www.tutorialspoint.com/batch_script/batch_script_arrays.htm
set topic[0]=0-comments 
set topic[1]=1-variables 
set topic[2]=2-Arrays 
set topic[3]=3-Decision making 
set topic[4]=4-Time and date 
set topic[5]=5-Operators 


:: Create empty file
echo -----
echo Create empty file
(copy /y nul tmp.tmp) > nul

::  ######## FOR LOOPS ############
:: files in current dir:               for %f in (.\*) do @echo %f
:: subdirs in current dir:             for /D %s in (.\*) do @echo %s
:: files in current and all subdirs:   for /R %f in (.\*) do @echo %f
:: subdirs in current and all subdirs: for /R /D %s in (.\*) do @echo %s
::  
::  In addition, substitution of FOR variable references has been enhanced.
::  You can now use the following optional syntax:
::  
::      %~I         - expands %I removing any surrounding quotes (")
::      %~fI        - expands %I to a fully qualified path name
::      %~dI        - expands %I to a drive letter only
::      %~pI        - expands %I to a path only
::      %~nI        - expands %I to a file name only
::      %~xI        - expands %I to a file extension only
::      %~sI        - expanded path contains short names only
::      %~aI        - expands %I to file attributes of file
::      %~tI        - expands %I to date/time of file
::      %~zI        - expands %I to size of file
::      %~$PATH:I   - searches the directories listed in the PATH
::                     environment variable and expands %I to the
::                     fully qualified name of the first one found.
::                     If the environment variable name is not
::                     defined or the file is not found by the
::                     search, then this modifier expands to the
::                     empty string
::  
::  The modifiers can be combined to get compound results:
::  
::      %~dpI       - expands %I to a drive letter and path only
::      %~nxI       - expands %I to a file name and extension only
::      %~fsI       - expands %I to a full path name with short names only
::      %~dp$PATH:I - searches the directories listed in the PATH
::                     environment variable for %I and expands to the
::                     drive letter and path of the first one found.
::      %~ftzaI     - expands %I to a DIR like output line

 
setlocal enabledelayedexpansion
for %%f in (directory\path\*.txt) do (
  :: val<=%%f will only get the first line of the file.
  set /p val=<%%f
  echo "fullname: %%f"
  echo "name: %%~nf"
  echo "contents: !val!"
)

:: Read from a file
for /f "tokens=*" %%a in (input.txt) do (
  echo line=%%a
)


echo -----
echo Iterate over array and append to file.
:: numeric step from 0 to less than 5 in steps of 1
::  start, step, lessThan
for /l %%n in (0,1,5) do ( 
   echo    Array %%n !topic[%%n]! 
   echo !topic[%%n]! >> tmp.tmp
)

echo -----
echo Read from file
set /a devIdx = 0
for /f "tokens=*" %%a in (tmp.tmp) do (
   set /a "devIdx += 1"
    echo    !devIdx!  %%a
   set devices[!devIdx!]=%%a
)

echo -----
echo Show array %devIdx% read from file
for /l %%n in (1,1,%devIdx%) do ( 
   echo    %%n: !devices[%%n]! 
)

echo:
set /p idx=Please pick from list (1..%devIdx%): 
echo   Choice made was %idx% value is: !devices[%idx%]!
echo:
  
echo -----
:: The /a sets a numeric value
echo Show accessing variable c=2
set /a c=2
echo    %%c = %c
echo    %%%%c = %%c
echo    %%c%% = %c%

echo -----
set /a c=2
echo Show accessing array index at %c%
 echo    1 %topic[2]%
 echo    2 !topic[2]!  
 echo    3 !topic[%c%]! 
  
set /a idx=3
echo   Array index = %idx%
 echo    3 !topic[%idx%]! 



echo -----
echo Array Length
set Arr[0]=a-at-0 
set Arr[1]=b-at-1 
set Arr[2]=c-at-2 
set Arr[3]=d-at-3 
set /a x = 0 

:_loop1 
if defined Arr[%x%] ( 
   echo    %x% is !Arr[%x%]!
   call echo    %x% is %%Arr[%x%]%%
   set /a "x+=1"
   GOTO :_loop1 
)
echo "The length of the array is" %x%


echo -----
echo Show array of structures
set obj[0].Name=Joe 
set obj[0].ID=1 
set obj[1].Name=Mark 
set obj[1].ID=2 
set obj[2].Name=Mohan 
set obj[2].ID=3 
FOR /L %%i IN (0 1 2) DO  (
   call gecho -n -e   \tName = %%obj[%%i].Name%%\t
   call echo  Value = %%obj[%%i].ID%% 
)

echo ---
echo Show variable which is a newline. 
(set \n=^

)
echo   First line..!\n!..Second line
echo   Works also with quotes.."!\n!..line2"

:: If operators
:: https://www.tutorialspoint.com/batch_script/batch_script_operators.htm


:: https://ss64.com/nt/if.html
::    NOT         Perform the command if the condition is false. 
::  
::     ==          Perform the command if the two strings are equal. 
::  
::     /I          Do a case Insensitive string comparison.
::  
::     compare-op  Can be one of:
::                   EQU : Equal
::                   NEQ : Not equal
::  
::                   LSS : Less than <
::                   LEQ : Less than or Equal <=
::  
::                   GTR : Greater than >
::                   GEQ : Greater than or equal >=
::  
::  


::  Command exit status
run-some-command
if %errorlevel% GEQ 1 (
  echo %errorlevel% 
)


:: blank line
@echo. 
:: prompt
set /p ans=extract files (y/[n])?
:: Trim spaces
set "ans=!ans: =!"
if /i not "!ans!" == "Y" goto done
:: do work if answer is y

:done
:: else done

