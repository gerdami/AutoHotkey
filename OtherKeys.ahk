#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

SetTitleMatchMode 2		;partial match for Windows title
	
#IfWinActive,ahk_exe brave.exe
^d::
#IfWinActive, - Gmail -
^d::#					; Ctrl d : #  to delete message
#IfWinActive, - Yahoo Mail -
^d::Send,{Delete}		; Ctrl d : {delete}  to delete message
