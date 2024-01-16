;#IfWinActive, ahk_class SDL_app
; Initialize toggle variables
tc := false
th := false
ts := false
ta := false

; F1 to toggle click script: F1:: means when F1 is pressed, do the following until 'return'

F1::	; Press to click toggle
{
    tc := !tc	; Toggles the boolean
	th := false			; Turns other functions off
	ts := false			; Turns other functions off
	ta := false
	
	; Creates a tooltip window highlighting the current script status
	; Syntax: Tooltip % (boolean ? "state TRUE" : "state FALSE")
	
    Tooltip % (tc ? "click ON" : "click OFF")
    Sleep, 500 ; Display tooltip for 1 second
    Tooltip 	; Close tooltip
    return
}

F2::	; Press to click toggle
{
    tc := false	
	th := !th			
	ts := false			
	ta := false
	

	
    Tooltip % (th ? "hold ON" : "hold OFF")
    Sleep, 500 
    Tooltip 	
    return
}

F3::	; Press to click toggle
{
    tc := false
	th := false			
	ts := !ts			
	ta := false
	
    Tooltip % (ts ? "spam ON" : "spam OFF")
    Sleep, 500 ; Display tooltip for 1 second
    Tooltip 	; Close tooltip
    return
}

F4::
{
    tc := false
	th := false			
	ts := false			
	ta := !ta

    Tooltip % (ta ? "attack ON" : "attack OFF")
    Sleep, 500 ; Display tooltip for 1 second
    Tooltip 	; Close tooltip
    return

}

tclick(m)
{
	if(m == 1)
	{
		Click
	}
	if(m == 2)
	{
		Click, Right
	}
}

hclick(m)
{
	if(m == 1)
	{
		Click Down
		KeyWait, LShift
		Click Up
	}
	if(m == 2)
	{
		Click, Right, Down
		KeyWait, LCtrl
		Click, Right, Up
	}
}

sclick(m)
{
	delay := 0
	if(m == 1)
	{
		While GetKeyState("LShift", "P")
		{
			Click
			Sleep, delay
		}
	}
	if(m == 2)
	{
		While GetKeyState("LCtrl", "P")
		{
			Click, Right
			Sleep, delay
		}
	}
}

attack()
{
	Send, {blind}{9 down}
	Sleep, 10
	Send, {blind}{9 up}
	Sleep, 100
	Click, Right
	Loop, 13
	{
		Click
	}
	Sleep, 500
	Send, {blind}{1 down}
	Sleep, 10
	Send, {blind}{1 up}
}

test()
{
	Send {Blind}{9 Down}
	Sleep, 10
	Send {Blind}{9 Up}
}

LShift::
{
    if (tc)
	{
		tclick(1)
	} 
	if (th)
	{
		hclick(1)
	}
	if (ts)
	{
		sclick(1)
	}
	if (ta)
	{
		hclick(1)
	}
	if (!tc && !th && !ts && !ta)
	{
		Send, {LShift Down}
	}
    return
}

LShift Up::
{
	if (!tc && !th && !ts && !ta)
	{
		Send, {Lshift Up}
	}
	return
}

LCtrl::
{
    if (tc)
	{
		tclick(2)
	} 
	if (th)
	{
		hclick(2)
	}
	if (ts)
	{
		sclick(2)
	}
	if (ta)
	{
		attack()
	}

	if (!tc && !th && !ts && !ta)
	{
		Send, {LCtrl Down}
	}
    return	
}

LCtrl Up::
{
	if (!tc && !th && !ts && !ta)
	{
		Send, {Lctrl Up}
	}
	return
}


esc::
{
	;tc := 0
	;th := 0
	;ts := 0
	;ta := 0
	Send, {Esc Down}
    ;ExitApp
}

esc Up::
{
	Send, {Esc Up}
}

;#IfWinActive