;
; AutoHotkey Version:	1.0.48.5
; Language:       		English
; Platform:       		Win9x/NT
; Author:         		gerdami
; License:				CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:		CapsLockOff.ahk
;						Disable CapsLock key aka ShiftLock key


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Capslock:: SetCapslockState AlwaysOFF	; CAPSLOCK OFF. Needs #InstallKeybdHook
;SetCapslockState AlwaysOFF				; Does NOT work as an #Include



;Capslock::
;		SetCapslockState AlwaysOFF	; CAPSLOCK OFF. Needs #InstallKeybdHook
;		;Send {RCtrl}
;		Return
		
;Capslock::RCtrl						;CapsLock remapped to RightCtrl to work with SymWin (symbol entry tool)
;		Return

;    CAPSLOCK OFF alternate method
;    This toggles Capslock on and off when you hold down the shift key and press Capslock
;+Capslock::Capslock	; Shift + Capslock to force Capslock - must be declared before the other
;Capslock::Shift		; Capslock becomes a Shit key
