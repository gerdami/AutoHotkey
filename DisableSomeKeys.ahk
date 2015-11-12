;
; AutoHotkey Version:	1.0.48.5
; Language:       		English
; Platform:       		Win9x/NT
; Author:         		gerdami
; License:				CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:		DisableSomeKeys.ahk
;						Disable some keys


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Windows + Numpad + is an accessibilty key "magnifier"  
#NumpadAdd:: 
	; MsgBox You pressed Win + Numpad Plus
	Return
