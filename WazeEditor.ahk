;
; AutoHotkey Version: 1.0.48.5
; Language:			English
; Platform:			Win9x/NT
; Author:			gerdami	
; License:			CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:	Waze editor.ahk 
; Features:		
;				Ctrl + / - 	Zoom in / out
;				PgUp / PgDn Zoom in / out 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -----------------------------------------------------------------------
;
SetTitleMatchMode 2 ;allow partial match to window titles                



(#IfWinActive,Carte Waze) OR (#IfWinActive,Waze Map Editor)
	^!c::MsgBox You pressed Control+Alt+C in Notepad.
	
	PgUp::			; Page Up}
		;MsgBox You pressed Page Up 
		Send +{Up}		; Waze zoom	in
		Return
	PgDn::		; Ctrl -
		;MsgBox You pressed Page Down  
		Send +{Down}		; Waze zoom	out
		Return
	
#IfWinActive

