#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
SetTitleMatchMode 2		;partial match for Windows title

; # 	:: Win logo
; ! 	:: Alt
; ^ 	:: Ctrl
; + 	:: Shift
; Fn 	:: but Send, {Fn}


; DELETE EMAILS

#IfWinActive, - Yahoo Mail -
^d::Send,{Delete}	; Ctrl d : {delete}  to delete message
#IfWinActive,ahk_exe chrome.exe
^d::
#IfWinActive,ahk_exe brave.exe
^d::
#IfWinActive, - Gmail - 
^d::#					; Ctrl d : #  to delete message
#IfWinActive

; EXCEL
	
#IfWinActive, ahk_class XLMAIN 
	F3::Send, +{F4}					; F3 		: Shift F4 for find next
	^F3::Send, {F3}					; Ctrl F3	: F3 to select name
#IfWinActive

; PRINT CURRENT PAGE

; Ctrl Win Alt P - Print current page
^#!p::
	{
	Send,^p
	Sleep 2000
	Send,!u
	Sleep 1000
	Send, {Enter}
	Return
	}

; WINDOWS MEDIA PLAYER
	
#IfWinActive, ahk_exe wmplayer.exe			; Windows Media Player
esc::Send,!{F4}								; Close the program !!!
