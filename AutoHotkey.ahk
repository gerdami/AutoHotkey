APPVIRT = "C:\Program Files (x86)\Microsoft Application Virtualization Client\sfttray.exe"
AUTOHOTKEY = "AutoHotkey [V] 104805bd001"
NOTEPADPLUSPLUS = "Notepad++ [V] 6.2.3bd001"

#SingleInstance Force    ;The word FORCE skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command
#InstallKeybdHook    ;The keyboard hook monitors keystrokes for the purpose of activating hotstrings and any keyboard hotkeys not supported by the built-in RegisterHotkey 
#Persistent        ;Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).

; Any lines you want to execute immediately when the script starts should appear at the top of the script, prior to the first hotkey, hotstring, or Return. For details, see auto-execute section.

#Include %A_ScriptDir%\TrayTipAutoHotkeyStartedReloaded.ahk
SetWorkingDir %A_ScriptDir%		; since AutoHotKey.ahk is within a custom directory, not My Documents
;MsgBox A_WorkingDir:`t%A_WorkingDir%
;MsgBox A_ScriptDir:`t%A_ScriptDir%

;SetCapslockState AlwaysOFF

Run %APPVIRT% /launch %AUTOHOTKEY% /f "%A_ScriptDir%\AHKVersion.ahk"

; The script sees incoming parameters as the variables %1%, %2%, and so on. In addition, %0% contains the number of parameters passed (0 if none).

; ---------------------------------------------------------------------------
; CALLING DIToolBarClose
;

Run %APPVIRT% /launch %AUTOHOTKEY% /f "%A_ScriptDir%\DIToolbarClose.ahk" Yes	; Passing Yes as parameter to script: Yes to keep DataInsight open
;Run DIToolbarClose.ahk 	; This works but only without parameters

; -----------------------------------------------------------------------
; HOTKEYS
; -----------------------------------------------------------------------
#Include %A_ScriptDir%\AutoReplace.ahk	; AutoReplace mistyped words
#Include %A_ScriptDir%\CapsLockOff.ahk	; CAPSLOCK OFF
#Include %A_ScriptDir%\DisableSomeKeys.ahk	; Of which Windows Numpad Plus (magnifier) 
;#Include %A_ScriptDir%\FDMS+.ahk	; FDMS+ SHORTCUTS
#Include %A_ScriptDir%\OutlookShortcuts.ahk	; OUTLOOK SHORTCUTS
#Include %A_ScriptDir%\TaskbarMove.ahk	; TASKBAR MOVE
#Include %A_ScriptDir%\WinCentered.ahk	;  CENTER CURRENT WINDOW
;#Include *i WinMoveXPasWin7.ahk		; TEST	

#Include %A_ScriptDir%\SaveReload.ahk	; Ctrl Win Alt R to save and reload script

; ------------------------------------------------------------------------
; EDIT this script
; Ctrl Win Alt E 

^!#e::				; opens the script for editing    
	;Edit			; edit the script with NotePad or the active editor
	;Run Notepad++.exe %A_ScriptFullPath% 	; edit the current script with Notepad++	
	;Run "C:\Program Files (x86)\Microsoft Application Virtualization Client\sfttray.exe" /launch "Notepad++ [V] 6.2.3bd001" %A_ScriptFullPath%
	Run %APPVIRT% /launch %NOTEPADPLUSPLUS% %A_ScriptFullPath%
	Return

