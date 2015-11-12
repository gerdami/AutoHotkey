;
; AutoHotkey Version:	1.0.48.5
; Language:       		English
; Platform:       		Windows 7
; Author:         		gerdami
; License:				CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:		GlobalVariables.ahk
; Version				1.0
; Date					14 October 2015	


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


GetTaskBarDetails()
	{
	    Global	; If a function needs to access or create a large number of global variables, it can be defined to assume that all its variables are global 
		WinGetPos, TaskBarXpos, TaskBarYpos, TaskBarWidth, TaskBarHeight, ahk_class Shell_TrayWnd
		;MsgBox, TaskBar details`nXpos:`t`t%TaskBarXpos%`nYpos:`t`t%TaskBarYpos%`nWidth:`t`t%TaskBarWidth%`nHeight:`t`t%TaskBarHeight%`nA_ScreenWidth:`t%A_ScreenWidth%`nA_ScreenHeight:`t%A_ScreenHeight%
		TaskBarXpos *=1
		TaskBarYpos *=1
		TaskBarWidth *=1
		TaskBarHeight *=1
	}	
