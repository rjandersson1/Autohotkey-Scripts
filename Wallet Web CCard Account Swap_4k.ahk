; Script to automate swapping accounts from credit card import to main account on Web App for Wallet by Budgetbakers 
; Ensure display is at 1920x1200 @ 100% scaling
; Ensure web app is fullscreen display and scrolled to top

; GUI Setup

Gui, New, +AlwaysOnTop, Readme
Gui, Add, Text,, List of hotkeys and corresponding functions:
Gui, Add, Text,, F2: Transfers expense from import --> account. Click and hold to continously perform action.
Gui, Add, Text,, F3: Sets expense label to "unpaid uni"
Gui, Add, Text,, F4: Sets expense label to "unpaid other"
Gui, Add, Text,, F5: Sets expense label to "me"
Gui, Add, Text,, Set Mouse Delay:
Gui, Add, Button, Default gMDelayInstant, Instant
Gui, Add, Button, Default gMDelayFast, Fast
Gui, Add, Button, Default gMDelaySlow, Slow
Gui, Show, w500 h250, Readme

Return

Global mdelay

MDelayInstant:
{
	mdelay := 0
	Gui, Destroy
	Return
}

MDelayFast:
{
	mdelay := 1
	Gui, Destroy
	Return
}

MDelaySlow:
{
	mdelay := 15
	Gui, Destroy
	Return
}

saveLabel() {
	Loop, 4             ; Press tab 4x to select 'apply'
    {
        Send, {tab}
    }
	Send, {enter}
}

F2:: ;hotkey to run script
SetMouseDelay, mdelay
While GetKeyState("F2", "P") ; Check if F2 is being held down
{
    Click, 850, 400 ;click on top expense
    Sleep, 0
    Click, 850, 550 ;click on account dropdown
	Sleep, 0
	Click, 850, 580 ;select main account
	Sleep, 0
	Click, 850, 856 ;click save
}
return ; end the hotkey when F2 is released

;Click, 850, 580 ;select main account
;Click, 850, 630 ;select savings account
;Click, 800, 830 ;select credit card account

F3:: ;hotkey to set label to unpaid uni
SetMouseDelay, mdelay
{
	MouseGetPos, x, y
	Click
    	Click, 1029, 730 ;click on label dropdown
    	Click, 900, 830 ;click on unpaid uni
	;Click, 790, 865 ;save
	;Click, 785, 867 ;save
	saveLabel()
	MouseMove, x, y
	return
}

F4:: ;hotkey to set to unpaid other
SetMouseDelay, mdelay
{
	MouseGetPos, x, y
	Click
    	Click, 1029, 730 ;click on label dropdown
    	Click, 900, 875 ;click on unpaid other
	;Click, 790, 865 ;save
	;Click, 785, 867 ;save
	saveLabel()
	MouseMove, x, y
	return
}

F5:: ;hotkey to set label to me
SetMouseDelay, mdelay
{
	MouseGetPos, x, y
	Click
    Click, 1029, 730 ;click on label dropdown
    Click, 900, 982 ;click on me
	;Click, 790, 865 ;save
	;Click, 785, 867 ;save
	saveLabel()
	MouseMove, x, y
	return
}

F6:: ; Hotkey to remove all labels
SetMouseDelay, mdelay
{
	MouseGetPos, x, y
	Click
    Click, 1020, 722 ;click on label dropdown
	Loop, 4             ; Press backspace 4x to remove labels
    {
        Send, {BackSpace}
    }
	saveLabel()
	MouseMove, x, y
	return
}

F7:: ; Shift Up
{
	MouseGetPos, x, y
	MouseMove, x, y-73
	return
}