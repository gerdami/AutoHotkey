;
; AutoHotkey Version: 1.0.48.5
; Language:			English
; Platform:			Win XP
; Author:			gerdami	
; License:			CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
; Version:			0.01
;
; Script Function:	Close DIToolbar update
;
#SingleInstance Force	; The word FORCE skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command
#Persistent				; Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input			; Recommended for new scripts due to its superior speed and reliability.
;#Include %A_ScriptDir%\TrayTipAutoHotkeyStartedReloaded.ahk

DITOOLBARTITLE = "DIToolbar ahk_class #32770"

MyFlag = %1%

;MsgBox MyFlag:`t>%MyFlag%<
;MsgBox % "The length of MyFlag is " . StrLen(MyFlag)
;If StrLen(MyFlag) = 0, MyFlag := "Yes"
If MyFlag =				;Thus, to check if a variable is blank with a traditional-if, use = or <> with nothing on the right side as in this example: if Var =
	MyFlag := "Yes"	

;MsgBox MyFlag:`t%MyFlag%


Repeat:

SetTitleMatchMode, 2	; partial title match
WinWait, DIToolbar ahk_class #32770, , ; wait until exit !      120	; wait 120 sec
WinActivate

if ErrorLevel
	{
	MsgBox, WinWait timed out `nMyFlag was %MyFlag%
	ExitApp
	}

WinGetText, DIToolbarWindowText, DIToolbar ahk_class #32770
;MsgBox DIToolbarWindowText:`t%DIToolbarWindowText%

IfInString, DIToolbarWindowText, OK
	{
	Send {Enter}
	WinWaitClose, DIToolbar ahk_class #32770
	GoSub Repeat
	}
IfInString, DIToolbarWindowText, Yes
	{
	If MyFlag = No			; We don't want DataInsight interface
		{
		Send {Tab}{Enter}	; tab to No button
		WinWaitClose, DIToolbar ahk_class #32770
		}
	else					; We need DataInsight for better peformance
		{
		Send {Enter}
		WinWaitClose, DIToolbar ahk_class #32770
		WinWait, DataInsight
		if ErrorLevel
			{
			MsgBox, WinWait timed out.
			return
			}
		else
			Sleep 10000	; in milliseconds
			WinMinimize, DataInsight  ; Minimize the window found by WinWait.
		}
	GoSub Repeat
	}
MsgBox DIToolbar: Unforeseen event 
	
ExitApp

#Include %A_ScriptDir%\SaveReload.ahk	; Ctrl Win Alt R to save and reload script

