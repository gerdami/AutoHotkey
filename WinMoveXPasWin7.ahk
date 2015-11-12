;
; AutoHotkey Version:	1.0.48.5
; Language:       		English
; Platform:       		Windows XP
; Author:         		gerdami
; License:				CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:		WinMoveXPasWin7.ahk
; Version				1.1
; Date					14 October 2015	

; NEEDS GlobalVariables.ahk !!!

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ----------------------------------------------------------------------------
; Windows 7 keyboard shortcuts emulation
; Windows + Left arrow
; Windows + Right arrow
; Windows + Up arrow
; Windows + Down arrow
; ----------------------------------------------------------------------------
 
#Left:: 
	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			NewWidth := (A_ScreenWidth / 2)
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewXpos := 0
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					;MsgBox TaskBar bottom
					NewXpos := 0
					NewYpos := 0
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewHeight := A_ScreenHeight
			if	TaskBarXpos <= 0		; TaskBar left
				{
					;MsgBox TaskBar left
					NewXpos := (TaskBarWidth + TaskBarXpos)
					NewYpos := 0
					NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					;MsgBox TaskBar right
					NewXpos := 0
					NewYpos := 0
					NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

#Right::
	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom
		{
			;MsgBox TaskBar on top or bottom
			NewWidth := (A_ScreenWidth / 2)
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewXpos := (A_ScreenWidth / 2)
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					;MsgBox TaskBar bottom
					NewXpos := (A_ScreenWidth / 2)
					NewYpos := 0
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewHeight := A_ScreenHeight
			if	TaskBarXpos <= 0		; TaskBar left
				{
					;MsgBox TaskBar left
					NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
					NewXpos := ((TaskBarWidth + TaskBarXpos) + NewWidth)
					NewYpos := 0
				}
			else						; TaskBar right
				{
					;MsgBox TaskBar right
					NewXpos := (TaskBarXpos / 2)
					NewYpos := 0
					NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

#Up::			; maximize window
	{
	WinRestore, A		; if windows is in a false maximized mode 
	WinMaximize, A
	Return
	}

#Down::			; minimize window
	{
	WinMinimize, A
	Return
	}
