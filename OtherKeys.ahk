﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

SetTitleMatchMode 2		;partial match for Windows title

^d::	;Ctrl d
	
	IfWinActive, gerdami@gmail.com - Gmail
	{
		;MsgBox You pressed Ctrl d key in Gmail
		Send, {#}
		Return
	}
	IfWinActive, - Yahoo Mail -
	{
		;MsgBox You pressed Ctrl d key in Yahoo Mail
		Send, {Delete}
		Return
	}
	;MsgBox You pressed the Delete key elsewhere
	Send ^d
Return
