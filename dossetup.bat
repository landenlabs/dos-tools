@echo off
:: echo %PATH%
@echo ----[BEGIN] d:\opt\bin\DosSetup.bat 

@rem
@rem How  to get batch to run on startup - 
@rem    Run regedit,  HKCU/software/microsoft/CommandProcessor
@rem                 string AutoRun = d:\opt\bin\dossetup.bat
@rem    Ex - oneliner
@rem        reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "d:\opt\bin\dossetup.bat" /f

@rem
@rem windows terminal preview
@rem   enable clink,   settings-> Command Prmopt -> Command Line
@rem            cmd.exe /s /k "d:\opt\bin\clink\clink_x64.exe inject --profile PROFILE_DIR"
 
@rem Cygwin - disable warning message
set CYGWIN=nodosfilewarning

@rem xterm keeps git commands happy
set TERM=xterm

set doscommands=d:\opt\bin\doscommands.bat
call %doscommands%

if exist d:\opt\bin\doskey-macros.txt (
  doskey /macrofile=d:\opt\bin\doskey-macros.txt
)


:: echo --- Macros ---
:: doskey /macros
set nodosfilewarning=yes

@echo ----[END] d:\opt\bin\DosSetup.bat 
