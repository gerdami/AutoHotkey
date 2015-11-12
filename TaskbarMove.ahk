;
; AutoHotkey Version: 1.0.48.5
/*
** TaskbarMove.ahk - Move the taskbar (startbar) around the screen with Hotkeys
**
**   Updated: Sat, Nov 19, 2011 --- 11/19/11, 4:19:19pm EST
**  Keywords: move taskbar, move startbar, move task bar, move start bar
**  Location: r.secsrv.net/AutoHotkey/Scripts/TaskbarMove
**
**    Author: JSLover - r.secsrv.net/JSLover - r.secsrv.net/JSLoverAHK
**		 Web: http://jslover.secsrv.net/AutoHotkey/Scripts/TaskbarMove.ahk
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#SingleInstance force

#Numpad8::TaskbarMove("Top")
#Numpad2::TaskbarMove("Bottom")
#Numpad4::TaskbarMove("Left")
#Numpad6::TaskbarMove("Right")

TaskbarMove(p_pos) {
	label:="TaskbarMove_" p_pos

	WinExist("ahk_class Shell_TrayWnd")
	SysGet, s, Monitor

	if (IsLabel(label)) {
		Goto, %label%
	}
	return

	TaskbarMove_Top:
	TaskbarMove_Bottom:
	WinMove(sLeft, s%p_pos%, sRight, 0)
	return

	TaskbarMove_Left:
	TaskbarMove_Right:
	WinMove(s%p_pos%, sTop, 0, sBottom)
	return
}

WinMove(p_x, p_y, p_w="", p_h="", p_hwnd="") {
	WM_ENTERSIZEMOVE:=0x0231
	WM_EXITSIZEMOVE :=0x0232

	if (p_hwnd!="") {
		WinExist("ahk_id " p_hwnd)
	}

	SendMessage, WM_ENTERSIZEMOVE
	;//Tooltip WinMove(%p_x%`, %p_y%`, %p_w%`, %p_h%)
	WinMove, , , p_x, p_y, p_w, p_h
	SendMessage, WM_EXITSIZEMOVE
}

/* ;// **************************** Changelog / Version History ****************************
**
**   Created: Sat, Nov 19, 2011 --- 11/19/11, 4:19:19pm EST
**  Modified: Sat, Nov 19, 2011 --- 11/19/11, 4:19:19pm EST
**
*/ ;// **************************** /Changelog / Version History ****************************
