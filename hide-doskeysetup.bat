@echo off
@rem DosKey alias

@rem NOT USING THIS File
@rem 
@rem SEE dossetup.bat

@rem File auto loaded
@rem Run regedit,  HKCU/software/microsoft/CommandProcessor
@rem    string AutoRun = d:\opt\bin\doskey-macros.txt

echo "initializing doskey alias"

doskey winmerge=d:\opt\util\WinMerge\WinMergeU.exe $*
doskey xnview=d:\opt\art\XnViewMP\xnviewmp.exe $*
doskey magick=d:\opt\art\ImageMagick\magick.exe $*
doskey convert=d:\opt\art\ImageMagick\magick.exe $*
@rem doskey vc=d:\opt\dev\vscode\bin\code $*
doskey ne=D:\opt\util\Notepad++\notepad++.exe $*
doskey pe=D:\opt\devel\phoenix\pe.exe $*
doskey 7z=d:\opt\disk\7zip\7z.exe $*

doskey find=d:\opt\dev\gnu\bin\find $*
@rem doskey ls=ld $*
@rem doskey mv=lm $*
@rem doskey cp=lc $*
@rem doskey rm=lr $*
doskey cat=type $*
doskey tcsh=c:\opt\dev\cygwin\bin\tcsh.exe
doskey hist=doskey /history
doskey h=doskey /history
doskey alias=doskey /macros


@rem  Special locations  d/opt/bin/doskey-macros.txt
doskey go-web=cd /d D:\opt\soft\dlang-website
doskey go-dev=cd /d "r:\software\soft2\soft14\c-c++\dlang14c++\All"


doskey go-notes=cd \opt\notes22
doskey go-bin=cd \opt\bin
doskey go-opt=cd \opt
doskey go-home=cd %USERPROFILE%
doskey go-download=cd %USERPROFILE%\Downloads


doskey cd2=cd ..\..
doskey cd3=cd ..\..\..
doskey cd4=cd ..\..\..\..


@rem GIT
doskey gitadd        =git add $*
doskey gitbranch     =git branch $*
doskey gitcomit      =git commit $*
doskey gitcheckout   =git checkout $*
doskey gitmerge      =git merge $*
doskey gitpush       =git push $*
doskey gitstatus     =git status $*
doskey gitlog   =git log --pretty=format:'%h%x09%an%x09%ad%x09%s'
doskey gitlog   =git log --pretty=format:'%%h%%x09%%an%%x09%%ad%%x09%%s'
doskey gitloggraph   =git log --graph --all
@rem doskey gitdif   = git difftool -x filemerge
@rem doskey gitdif   = git difftool --tool=diffmerge
@rem doskey gitdif   = git difftool --tool=meld
doskey gitdifX       =git difftool -x xxdiff $*
doskey gitdifO       =git difftool -x opendiff $*
doskey gitdifV       =git difftool -x codeDiff $*
doskey gitdif        =git difftool -y -x winmerge.bat $*
doskey git1dayDiff   =git diff --name-only "'@{1 day ago}'" $*
doskey gitshowpend   =git show --name-only HEAD $*
doskey git-branches  =git for-each-ref --format="%%(committerdate) : %%(authorname) : %%(refname)" --sort=committerdate ^| grep refs/remotes ^| tr ":" "\t"
doskey gitlistCommit =git show --stat $*                                # list files in commit
doskey gitlistRange  =git show --stat --oneline $*      # beforeFirstCommit..LastCommit or   firstCommit firstCommit..LastCommit
doskey gitshow       =git remote show origin
doskey gitshow-br-color =git for-each-ref --sort=committerdate refs/heads/ --format="%%(HEAD) %%(color:yellow)%%(refname:short) : %%(color:red)%%(objectname:short) : %%(authorname) : %%(color:green)%%(committerdate:relative)%%(color:reset)  : %%(contents:subject)"
doskey gitshow-br-table =git for-each-ref --sort=committerdate refs/heads/ --format="%%(HEAD) %%(refname:short) : %%(objectname:short) : %%(authorname) : %%(committerdate:relative): %%(contents:subject)" ^| column.exe -t -s ":"
doskey gitclean      =git gc --aggressive
doskey gitclean-branch =git fetch --prune


@rem
doskey listapk         = lf -s -tm -~ -R -F=*apk -F=*.aab
doskey listaar         = lf -s -tm -~ -R -F=*aar
doskey listexe         = lf -s -tm -~ -R -F=*exe
doskey list            = lf -s -tm -~ -R -F=*$*

doskey hex=powershell Format-Hex -Path $*
