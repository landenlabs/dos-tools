#Requires AutoHotkey v2.0

/*
Autohotkey configuration 
*/

; Ctrl (^), Alt (!), Shift (+) and Win (#). 
#c::Send "^c"		; opy to Clipboard (Send: Ctrl + C keys)
#v::Send "^v"		; Paste from Clipboard (Send: Ctrl + V keys)
#a::Send "^a"		; Select All (Send: Ctrl + A keys)
^1::Send "c:\Users\dlang_local\Downloads\"
