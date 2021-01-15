#NoEnv						; AutoHotKey boilerplate
SendMode Input
#SingleInstance force


NumpadDiv::  					; I use the numpad divide key for this feature, choose your own macro key accordingly
SetTitleMatchMode, 1
{
if !WinExist("ahk_exe firefox.exe")
	{					
	Run, firefox.exe  			; if Firefox isn't open, open it 
	WinWait, SUSSED ; Wait for homepage to load. Page title "Mozilla Firefox" loads before the page does, but sometimes this isn't caught in time
	}
if !WinActive("ahk_exe firefox.exe") 		; Firefox may not be opened to the foreground, or may be minimised, so activate if necessary
	{
	WinActivatebottom ahk_exe firefox.exe   ; bring Firefox to the foreground 
						; Use "bottom" to activate main window rather than any foreground notifications / popups
						; Sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
						; The below code should fix that.
	WinGet, hWnd, ID, ahk_class MozillaWindowClass
	DllCall("SetForegroundWindow", UInt, hWnd) 	
	}
Send, ^t					; open a new tab
Send, synonym{Space}				; send the characters "synonym" then a space
}
return						; quit gracefully

