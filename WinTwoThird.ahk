;
; AutoHotkey Version:	1.1.26.01
; Language:       		English
; Platform:       		Windows 10
; Author:         		gerdami
; License:				CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:		WinCentered.ahk
; Version				1.1
; Date					29 March 2018	

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ----------------------------------------------------------------------------
; Control + Windows + Up  to resize to 1280px and center current window
; In addition to Windows 7 keyboard 
; Windows + Left arrow
; Windows + Right arrow
; Windows + Up arrow
; Windows + Down arrow
; ----------------------------------------------------------------------------
; GetTaskBarDetails()
;	{
;	    Global	; If a function needs to access or create a large number of global variables, it can be defined to assume that all its variables are global 
;		WinGetPos, TaskBarXpos, TaskBarYpos, TaskBarWidth, TaskBarHeight, ahk_class Shell_TrayWnd
;		;MsgBox, TaskBar details`nXpos:`t`t%TaskBarXpos%`nYpos:`t`t%TaskBarYpos%`nWidth:`t`t%TaskBarWidth%`nHeight:`t`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
;		TaskBarXpos *=1
;		TaskBarYpos *=1
;		TaskBarWidth *=1
;		TaskBarHeight *=1
;	}	

^#Numpad6:: 	;	Control + Windows + Numpad6  ->   2/3 window aligned right 

	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	
		
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			;NewWidth := (A_ScreenWidth / 2)
			NewWidth := Round(TaskBarWidth / 3 * 2)

			NewXpos := (A_ScreenWidth / 3)
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					NewYpos := 0
					;MsgBox TaskBar bottom
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewWidth := Round((A_ScreenWidth - TaskBarWidth ) / 3 * 2)
			NewHeight := A_ScreenHeight
			
			NewYpos := 0
			if	TaskBarXpos <= 0		; TaskBar left
				{
					NewXpos := (A_ScreenWidth - NewWidth)
					;MsgBox TaskBar left
					;NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					NewXpos := (A_ScreenWidth - NewWidth - TaskBarWidth)
					;MsgBox TaskBar right
					;NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

^#Numpad3:: 	;	Control + Windows + Numpad3  ->   1/3 window aligned right 

	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	
		
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			;NewWidth := (A_ScreenWidth / 2)
			NewWidth := Round(TaskBarWidth / 3 )

			NewXpos := (A_ScreenWidth / 3 * 2)
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					NewYpos := 0
					;MsgBox TaskBar bottom
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewWidth := Round((A_ScreenWidth - TaskBarWidth ) / 3 )
			NewHeight := A_ScreenHeight
			
			NewYpos := 0
			if	TaskBarXpos <= 0		; TaskBar left
				{
					NewXpos := (A_ScreenWidth - NewWidth)
					;MsgBox TaskBar left
					;NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					NewXpos := (A_ScreenWidth - NewWidth - TaskBarWidth)
					;MsgBox TaskBar right
					;NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

^#Numpad4:: 	;	Control + Windows + Numpad4  ->   2/3 window aligned left 

	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	
		
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			;NewWidth := (A_ScreenWidth / 2)
			NewWidth := Round(TaskBarWidth / 3 * 2)

			NewXpos := 0
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					NewYpos := 0
					;MsgBox TaskBar bottom
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewWidth := Round((A_ScreenWidth - TaskBarWidth ) / 3 * 2)
			NewHeight := A_ScreenHeight
			
			NewYpos := 0
			if	TaskBarXpos <= 0		; TaskBar left
				{
					NewXpos := TaskBarWidth
					;MsgBox TaskBar left
					;NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					NewXpos := 0
					;MsgBox TaskBar right
					;NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

^#Numpad1:: 	;	Control + Windows + Numpad1  ->   1/3 window aligned left 

	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	
		
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			;NewWidth := (A_ScreenWidth / 2)
			NewWidth := Round(TaskBarWidth / 3 )

			NewXpos := 0
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					NewYpos := 0
					;MsgBox TaskBar bottom
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewWidth := Round((A_ScreenWidth - TaskBarWidth ) / 3 )
			NewHeight := A_ScreenHeight
			
			NewYpos := 0
			if	TaskBarXpos <= 0		; TaskBar left
				{
					NewXpos := TaskBarWidth
					;MsgBox TaskBar left
					;NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					NewXpos := 0
					;MsgBox TaskBar right
					;NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

^#Numpad2:: 	;	Control + Windows + Numpad1  ->   1/3 window centered 

	{
	GetTaskBarDetails()
	;MsgBox, TaskBarXpos:`t%TaskBarXpos%`nTaskBarYpos:`t%TaskBarYpos%`nTaskBarWidth:`t%TaskBarWidth%`nTaskBarHeight:`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
	
		
	If	(TaskBarWidth * 1) >= (A_ScreenWidth * 1)		; TaskBar on top or bottom - I had to force to numbers for comparison
		{
			;MsgBox TaskBar on top or bottom
			;NewWidth := (A_ScreenWidth / 2)
			NewWidth := Round(TaskBarWidth / 3 )

			NewXpos := (0 + NewWidth)
			if	TaskBarYpos <= 0			; TaskBar top
				{
					;MsgBox TaskBar top
					NewYpos := (TaskBarHeight + TaskBarYpos)
					NewHeight := (A_ScreenHeight - (TaskBarHeight + TaskBarYpos))
				}	
			else							; TaskBar bottom
				{
					NewYpos := 0
					;MsgBox TaskBar bottom
					NewHeight := TaskBarYpos
				}
		}
	else								; TaskBar left or right
		{
			;MsgBox TaskBar TaskBar left or right
			NewWidth := Round((A_ScreenWidth - TaskBarWidth ) / 3 )
			NewHeight := A_ScreenHeight
			
			NewYpos := 0
			if	TaskBarXpos <= 0		; TaskBar left
				{
					NewXpos := (TaskBarWidth + NewWidth)
					;MsgBox TaskBar left
					;NewWidth := ((A_ScreenWidth - (TaskBarWidth + TaskBarXpos)) / 2)
				}
			else						; TaskBar right
				{
					NewXpos := (0 + NewWidth)
					;MsgBox TaskBar right
					;NewWidth := (TaskBarXpos / 2)
				}
		}
	;MsgBox WinMove, A,, %NewXpos%, %NewYpos%, %NewWidth%, %NewHeight%
	WinRestore, A		; if windows was maximized mode 
	WinMove, A,, NewXpos, NewYpos, NewWidth, NewHeight
	Return
	}

^#Numpad7:: 	;	Control + Windows + Numpad7
	{
	SendInput ^#Numpad1
	SendInput !{Tab}
	SendInput ^#Numpad6
	SendInput !{Tab}
	Return
	}
^#Numpad9:: 	;	Control + Windows + Numpad7
	{
	SendInput ^#Numpad4
	SendInput !{Tab}
	SendInput ^#Numpad3
	SendInput !{Tab}
	Return
	}
