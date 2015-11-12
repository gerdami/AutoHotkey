;
; AutoHotkey Version: 1.0.48.5
; Language:			English
; Platform:			Win9x/NT
; Author:			gerdami	
; License:			CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:	OutlookShortcuts.ahk 
; Features:		
;				Ctrl + / - 	Zoom in / out
;				Ctrl F:	Find and Replace
;				Ctrl W:	Close window 
;				Ctrl Alt i	Display images in incoming messages
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -----------------------------------------------------------------------
; OutlookShortcuts
;
SetTitleMatchMode 2 ;allow partial match to window titles                
#IfWinActive, ahk_class rctrl_renwnd32		; ANY Outlook windows
	^!i::								; Ctrl Alt i 		To show images in the preview window / message window
		Send ^+wp						; Show the menu to download pictures, change automatic download settings, or add a sender to the Safe Senders List. Download pictures.
		Return
#IfWinActive

; Outlook MAIN window
#IfWinActive, ahk_class rctrl_renwnd32, NUIDocumentWindow	; 
	;Find out which control in Outlook has focus
	ControlGetFocus, currentCtrl
	;MsgBox, Control with focus = %currentCtrl%	
	; ^f::MsgBox You pressed Ctrl F

	^f::Send ^+f						; CTRLF F		Advanced find
	
	
	^w::MsgBox You pressed Ctrl W in option 1
#IfWinActive

; Outlook MEETING window
#IfWinActive, - Meeting ahk_class rctrl_renwnd32
	^w::
	;	MsgBox You pressed Ctrl W in a Meeting window
	Send !{F4} 						; Ctrl w to close window
	Return
#IfWinActive


; Outlook MESSAGE window
#IfWinActive, ahk_class rctrl_renwnd32, Attachments		
	^f::Send !hfd						; CTRL F			Find and Replace
	^+f::Send !hfw						; CTRL SHIFT F 	Forward Message
/*  									Note that the ribbon for forwarded message do not have the
										Find button. It must be added beforehand with Customize the Ribbon
*/

	^w::
	;MsgBox You pressed Ctrl W in a Message window
	Send !{F4}  ;Ctrl w to close window
	Return

	F3::
	;MsgBox You pressed F3
	Send +{F4}  						; Shift F4		Next find match
	Return
	
	^NumpadAdd::
	;MsgBox Your pressed Ctrl +
	Send ^{WheelUp}						; Zoom in
	Return

	^NumpadSub::
	;MsgBox Your pressed Ctrl -
	Send ^{WheelDown}					; Zoom out
	Return

	^Numpad0::
	;MsgBox Your pressed Ctrl 0
	Send !hq11{Enter}					; Zoom 100%
	Return
#IfWinActive

; -----------------------------------------------------------------------
; HOTKEYS
; -----------------------------------------------------------------------
#Include %A_ScriptDir%\SaveReload.ahk	; Ctrl Win Alt R to save and reload script
