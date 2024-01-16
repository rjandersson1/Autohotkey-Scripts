; Script to automate swapping accounts from credit card import to main account on Web App for Wallet by Budgetbakers 
; Ensure display is at 1920x1200 @ 100% scaling
; Ensure web app is fullscreen display and scrolled to top

F2:: ;hotkey to run script
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
{
	Click
    Click, 1029, 730 ;click on label dropdown
    Click, 900, 830 ;click on unpaid uni
	Click, 785, 870 ;save
	return
}

F4:: ;hotkey to set to unpaid other
{
	Click
    Click, 1029, 730 ;click on label dropdown
    Click, 900, 875 ;click on unpaid other
	Click, 785, 870 ;save
	return
}

F5:: ;hotkey to set label to me
{
	Click
    Click, 1029, 730 ;click on label dropdown
    Click, 900, 982 ;click on me
	Click, 785, 870 ;save
	return
}