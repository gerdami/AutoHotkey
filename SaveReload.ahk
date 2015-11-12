;
; AutoHotkey Version: 1.0.48.5
; Language:			English
; Platform:			Win9x/NT
; Author:			gerdami	
; License:			CC-By-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
;
; Script Function:	
; Version:			0.00
;
; -----------------------------------------------------------------------
; Ctrl Win Alt R to save and reload this script
;
^#!r::
    Send, ^s			; Ctrl S to save a changed script
    Sleep, 300			; give it time to save the script
    Reload
    Return
