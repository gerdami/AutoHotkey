#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force    ;The word FORCE skips the dialog box and replaces the old instance automatically, which is similar in effect to the 

/**
 * Advanced Window Snap
 * Snaps the Active Window to one of nine different window positions.
 *
 * @author Andrew Moore <andrew+github@awmoore.com>
 * @version 1.0
 */
/**
 * SnapActiveWindow resizes and moves (snaps) the active window to a given position.
 * @param {string} winPlaceVertical   The vertical placement of the active window.
 *                                    Expecting "bottom" or "middle", otherwise assumes
 *                                    "top" placement.
 * @param {string} winPlaceHorizontal The horizontal placement of the active window.
 *                                    Expecting "left" or "right", otherwise assumes
 *                                    window should span the "full" width of the monitor.
 * @param {string} winSizeHeight      The height of the active window in relation to
 *                                    the active monitor's height. Expecting "half" size,
 *                                    otherwise will resize window to a "third".
 * @param {string} winSizeWidth       The width of the active window in relation to
 *                                    the active monitor's width. Expecting "oneFourth", "threeFourth",
 *                                    "oneThird", "twoThird", "half", otherwise "full".
 */

SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight, winSizeWidth) {
    WinGet activeWin, ID, A
    activeMon := GetMonitorIndexFromWindow(activeWin)
    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
    if (winSizeHeight == "half") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/2
    } else {	; "full"
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)
    }
	
	if (winSizeWidth == "oneFourth") {
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/4
    } else if (winSizeWidth == "threeFourth") {
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)*3/4
    } else if (winSizeWidth == "oneThird") {
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
    } else if (winSizeWidth == "twoThird") {
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)*2/3
    } else if (winSizeWidth == "half") {
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/2
    } else {	; "full"
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)
    }
		
    if (winPlaceHorizontal == "left") {
        posX  := MonitorWorkAreaLeft
    } else if (winPlaceHorizontal == "right") {
        posX  := MonitorWorkAreaLeft + (MonitorWorkAreaRight - MonitorWorkAreaLeft) - width
    } else if (winPlaceHorizontal == "center") {
        posX  := MonitorWorkAreaLeft + (MonitorWorkAreaRight - MonitorWorkAreaLeft - width )/2
    } else {	; "full"
        posX  := MonitorWorkAreaLeft
    }
    if (winPlaceVertical == "bottom") {
        posY := MonitorWorkAreaBottom - height
    } else if (winPlaceVertical == "middle") {
        posY := MonitorWorkAreaTop + height
    } else {	; "top"
        posY := MonitorWorkAreaTop
    }
	
	;	If Window is maximised, it should be first restored
	WinGetActiveTitle, ActiveTitle
	WinGet, Win_Status, MinMax, ActiveTitle
	; msgbox ActiveTitle = %ActiveTitle%,Win_Status = %Win_Status%
	; Win_Status remins blank :-( 
	If (Win_Status = 1) {
		WinRestore, A
	}
	
	;	Dealing with win10 invisible frames - 03.12.2021 Disabled
    ;   07.12.2021
    WinGet, ahk_exe, ProcessName, A
    ; MsgBox %  "`nahk_exe = " ahk_exe
    Switch  ahk_exe
    {
        Case "chrome.exe","edge.exe","iexplore.exe","explorer.exe" :
            SysGet, borderX, 32
            SysGet, borderY, 33
            posX := posX - borderX
            width := width + (borderX * 2)
            height := height + borderY
        Default:
            ;   nothing
            ;   default Office applications, e.g. Outlook, Excel, Word, etc.
    }
		
    WinRestore, A
	WinMove,A,,%posX%,%posY%,%width%,%height%
}
/**
 * GetMonitorIndexFromWindow retrieves the HWND (unique ID) of a given window.
 * @param {Uint} windowHandle
 * @author shinywong
 * @link http://www.autohotkey.com/board/topic/69464-how-to-determine-a-window-is-in-which-monitor/?p=440355
 */
GetMonitorIndexFromWindow(windowHandle) {
    ; Starts with 1.
    monitorIndex := 1
    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)
    if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
        && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
        monitorLeft   := NumGet(monitorInfo,  4, "Int")
        monitorTop    := NumGet(monitorInfo,  8, "Int")
        monitorRight  := NumGet(monitorInfo, 12, "Int")
        monitorBottom := NumGet(monitorInfo, 16, "Int")
        workLeft      := NumGet(monitorInfo, 20, "Int")
        workTop       := NumGet(monitorInfo, 24, "Int")
        workRight     := NumGet(monitorInfo, 28, "Int")
        workBottom    := NumGet(monitorInfo, 32, "Int")
        isPrimary     := NumGet(monitorInfo, 36, "Int") & 1
        SysGet, monitorCount, MonitorCount
        Loop, %monitorCount% {
            SysGet, tempMon, Monitor, %A_Index%
            ; Compare location to determine the monitor index.
            if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
                and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom)) {
                monitorIndex := A_Index
                break
            }
        }
    }
    return %monitorIndex%
}
; SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight, winSizeWidth)
; Directional Arrow Hotkeys

#Left::SnapActiveWindow("top","left","full","half")
#Right::SnapActiveWindow("top","right","full","half")

#!Up::SnapActiveWindow("top","full","half","full")
#!Down::SnapActiveWindow("bottom","full","half","full")
^#!Up::SnapActiveWindow("top","full","third","full")
^#!Down::SnapActiveWindow("bottom","full","third","full")

^#Numpad7::SnapActiveWindow("top","left","half","half")
^#Numpad9::SnapActiveWindow("top","right","half","half")
^#Numpad1::SnapActiveWindow("bottom","left","half","half")
^#Numpad3::SnapActiveWindow("bottom","right","half","half")



; Numberpad Hotkeys (Landscape)
#!Numpad7::SnapActiveWindow("top","left","full","twoThird")
#!Numpad8::SnapActiveWindow("top","center","full","twoThird")
#!Numpad9::SnapActiveWindow("top","right","full","twoThird")

#!Numpad4::SnapActiveWindow("top","left","full","oneThird")
#!Numpad5::SnapActiveWindow("top","center","full","oneThird")
#!Numpad6::SnapActiveWindow("top","right","full","oneThird")

#!Numpad1::SnapActiveWindow("top","left","full","oneFourth")
#!Numpad2::SnapActiveWindow("top","center","full","half")
#!Numpad3::SnapActiveWindow("top","right","full","oneFourth")

^#!Numpad1::SnapActiveWindow("top","left","full","threeFourth")
^#!Numpad2::SnapActiveWindow("top","center","full","threeFourth")
^#!Numpad3::SnapActiveWindow("top","right","full","threeFourth")

; Numberpad Hotkeys (Portrait)
;^#!Numpad8::SnapActiveWindow("top","full","third")
;^#!Numpad5::SnapActiveWindow("middle","full","third")
;^#!Numpad2::SnapActiveWindow("bottom","full","third")
